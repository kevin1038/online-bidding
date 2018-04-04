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

    private static Map<Long, Item> itemDatabase = new Hashtable<>();

    static {
        long a = 1;
        Item item1 = new Item();
        item1.setItemName("Test1");
        long b = 2;
        Item item2 = new Item();
        item2.setItemName("Test2");
        long c = 3;
        Item item3 = new Item();
        item3.setItemName("Test3");
        long d = 4;
        Item item4 = new Item();
        item4.setItemName("Test4");
        long e = 5;
        Item item5 = new Item();
        item5.setItemName("Test5");
        itemDatabase.put(a, item1);
        itemDatabase.put(b, item2);
        itemDatabase.put(c, item3);
        itemDatabase.put(d, item4);
        itemDatabase.put(e, item5);
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap model) {
        model.addAttribute("itemDatabase", itemDatabase);
        return "index";
    }

    @RequestMapping(value = "/item/{ItemId}", method = RequestMethod.GET)
    public String item() {
        return "item";
    }

}
