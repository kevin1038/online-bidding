package ouhk.comps380f.controller;

import java.util.Hashtable;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ouhk.comps380f.model.Item;

@Controller
public class ItemController {

    private Map<Long, Item> itemDatabase = new Hashtable<>();
    
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap model) {
        long a = 1;
        Item item = new Item();
        item.setItemName("Test");
        this.itemDatabase.put(a, item);
        model.addAttribute("itemDatabase", itemDatabase);
        return "index";
    }

    @RequestMapping(value = "/item/{ItemId}", method = RequestMethod.GET)
    public String item() {
        return "item";
    }

}
