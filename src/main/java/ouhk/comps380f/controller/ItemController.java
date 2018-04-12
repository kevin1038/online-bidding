package ouhk.comps380f.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.comps380f.model.Item;
import ouhk.comps380f.model.Photo;

@Controller
public class ItemController {

    private volatile long TICKET_ID_SEQUENCE = 1;
    private static Map<Long, Item> itemDatabase = new Hashtable<>();

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap model) {
        model.addAttribute("itemDatabase", itemDatabase);
        return "index";
    }

    @RequestMapping(value = "/item/{itemId}", method = RequestMethod.GET)
    public String item(@PathVariable("itemId") long itemId, ModelMap model) {
        Item item = this.itemDatabase.get(itemId);
        if (item == null) {
            return "redirect:/";
        }
        model.addAttribute("itemId", Long.toString(itemId));
        model.addAttribute("item", item);
        return "item";
    }

    @RequestMapping(value = "/user/sell", method = RequestMethod.GET)
    public ModelAndView sell() {
        return new ModelAndView("sell", "sellForm", new Form());
    }

    public static class Form {

        private String itemName;
        private String description;
        private List<MultipartFile> photos;
        private double price;

        public String getItemName() {
            return itemName;
        }

        public void setItemName(String itemName) {
            this.itemName = itemName;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public List<MultipartFile> getPhotos() {
            return photos;
        }

        public void setPhotos(List<MultipartFile> photos) {
            this.photos = photos;
        }

        public double getPrice() {
            return price;
        }

        public void setPrice(double price) {
            this.price = price;
        }

    }

    @RequestMapping(value = "/user/sell", method = RequestMethod.POST)
    public View sell(Form form, Principal principal) throws IOException {
        Item item = new Item();
        item.setItemId(this.getNextTicketId());
        item.setItemName(form.getItemName());
        item.setDescription(form.getDescription());
        item.setPrice(form.getPrice());
        item.setOwner(principal.getName());
        item.setBidCount(0);
        item.setStatus("available");

        for (MultipartFile filePart : form.getPhotos()) {
            Photo photo = new Photo();
            photo.setName(filePart.getOriginalFilename());
            photo.setMimeContentType(filePart.getContentType());
            photo.setContents(filePart.getBytes());
            if (photo.getName() != null && photo.getName().length() > 0
                    && photo.getContents() != null && photo.getContents().length > 0) {
                item.addPhoto(photo);
            }
        }
        this.itemDatabase.put(item.getItemId(), item);
        return new RedirectView("/item/" + item.getItemId(), true);
    }

    private synchronized long getNextTicketId() {
        return this.TICKET_ID_SEQUENCE++;
    }

}
