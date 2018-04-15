package ouhk.comps380f.service;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import ouhk.comps380f.dao.ItemRepository;
import ouhk.comps380f.dao.PhotoRepository;
import ouhk.comps380f.exception.ItemNotFound;
import ouhk.comps380f.exception.PhotoNotFound;
import ouhk.comps380f.model.Item;
import ouhk.comps380f.model.Photo;

@Service
public class ItemServiceImpl implements ItemService {

    @Resource
    private ItemRepository itemRepo;
    @Resource
    private PhotoRepository photoRepo;

    @Override
    @Transactional
    public List<Item> getItems() {
        return itemRepo.findAll();
    }

    @Override
    @Transactional
    public Item getItem(long id) {
        return itemRepo.findOne(id);
    }

    @Override
    @Transactional(rollbackFor = ItemNotFound.class)
    public void delete(long id) throws ItemNotFound {
        Item deletedItem = itemRepo.findOne(id);
        if (deletedItem == null) {
            throw new ItemNotFound();
        }
        itemRepo.delete(deletedItem);
    }

    @Override
    @Transactional(rollbackFor = PhotoNotFound.class)
    public void deletePhoto(long itemId, String name) throws PhotoNotFound {
        Item item = itemRepo.findOne(itemId);
        for (Photo photo : item.getPhotos()) {
            if (photo.getName().equals(name)) {
                item.deletePhoto(photo);
                itemRepo.save(item);
                return;
            }
        }
        throw new PhotoNotFound();
    }

    @Override
    @Transactional
    public long createItem(String itemName, String description,
            List<MultipartFile> photos, int price, String owner) throws IOException {
        Item item = new Item();
        item.setItemName(itemName);
        item.setDescription(description);
        item.setPrice(price);
        item.setOwner(owner);

        for (MultipartFile filePart : photos) {
            Photo photo = new Photo();
            photo.setName(filePart.getOriginalFilename());
            photo.setMimeContentType(filePart.getContentType());
            photo.setContents(filePart.getBytes());
            photo.setItem(item);
            if (photo.getName() != null && photo.getName().length() > 0
                    && photo.getContents() != null
                    && photo.getContents().length > 0) {
                item.getPhotos().add(photo);
            }
        }
        Item savedItem = itemRepo.save(item);
        return savedItem.getId();
    }

}
