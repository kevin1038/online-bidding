package ouhk.comps380f.service;

import java.io.IOException;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import ouhk.comps380f.exception.CommentNotFound;
import ouhk.comps380f.exception.ItemNotFound;
import ouhk.comps380f.model.Item;

public interface ItemService {

    public long createItem(String itemName, String description,
            List<MultipartFile> photos, int price, String owner) throws IOException;

    public List<Item> getItems();

    public Item getItem(long id);

    public void delete(long id) throws ItemNotFound;

    public void addComment(long itemId, String content, String username);
    
    public void deleteComment(long itemId, long commentId) throws CommentNotFound;
    
}
