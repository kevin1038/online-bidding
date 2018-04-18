package ouhk.comps380f.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.comps380f.exception.CommentNotFound;
import ouhk.comps380f.exception.ItemNotFound;
import ouhk.comps380f.model.Item;
import ouhk.comps380f.service.ItemService;

@Controller
public class ItemController {

    @Autowired
    private ItemService itemService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap model) {
        model.addAttribute("itemDatabase", itemService.getItems());
        return "index";
    }

    public static class CommentForm {

        String content;

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }

    }

    @RequestMapping(value = "/item/{itemId}", method = RequestMethod.GET)
    public ModelAndView item(@PathVariable("itemId") long itemId) {
        Item item = itemService.getItem(itemId);
        if (item == null) {
            return new ModelAndView(new RedirectView("/", true));
        }

        ModelAndView modelAndView = new ModelAndView("item");
        modelAndView.addObject("item", item);
        modelAndView.addObject("comment", new CommentForm());
        return modelAndView;
    }

    @RequestMapping(value = "/user/post/{itemId}", method = RequestMethod.POST)
    public String post(@PathVariable("itemId") long itemId, CommentForm form,
            Principal principal) throws IOException {
        itemService.addComment(itemId, form.getContent(), principal.getName());
        return "redirect:/item/" + itemId;
    }

    @RequestMapping(value = "/admin/delete/{itemId}/{commentId}", method = RequestMethod.GET)
    public String delete(@PathVariable("itemId") long itemId, @PathVariable("commentId") long commentId)
            throws CommentNotFound {
        itemService.deleteComment(itemId, commentId);
        return "redirect:/item/" + itemId;
    }

    @RequestMapping(value = "/user/sell", method = RequestMethod.GET)
    public ModelAndView sell() {
        return new ModelAndView("sell", "sellForm", new Form());
    }

    public static class Form {

        private String itemName;
        private String description;
        private List<MultipartFile> photos;
        private int price;

        public int getPrice() {
            return price;
        }

        public void setPrice(int price) {
            this.price = price;
        }

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

    }

    @RequestMapping(value = "/user/sell", method = RequestMethod.POST)
    public String sell(Form form, Principal principal) throws IOException {
        long itemId = itemService.createItem(form.getItemName(), form.getDescription(),
                form.getPhotos(), form.getPrice(), principal.getName());
        return "redirect:/item/" + itemId;
    }

    @RequestMapping(value = "/admin/delete/{itemId}", method = RequestMethod.GET)
    public String delete(@PathVariable("itemId") long itemId)
            throws ItemNotFound {
        itemService.delete(itemId);
        return "redirect:/";
    }

}
