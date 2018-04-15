package ouhk.comps380f.controller;

import java.io.IOException;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.comps380f.dao.ItemUserRepository;
import ouhk.comps380f.model.ItemUser;

@Controller
public class ItemUserController {

    @Resource
    ItemUserRepository itemUserRepo;

    @RequestMapping(value = "/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public ModelAndView signup() {
        return new ModelAndView("signup", "itemUser", new Form());
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public View signup(Form form) throws IOException {
        ItemUser itemUser = itemUserRepo.findOne(form.getUsername());
        if (itemUser != null) {
            return new RedirectView("/signup?error", true);
        }

        String[] roles = {"ROLE_USER"};
        ItemUser user = new ItemUser(form.getUsername(),
                form.getPassword(), roles
        );
        itemUserRepo.save(user);
        return new RedirectView("/login?signup", true);
    }

    @RequestMapping(value = "/admin/user", method = RequestMethod.GET)
    public String user(ModelMap model) {
        model.addAttribute("itemUsers", itemUserRepo.findAll());
        return "user";
    }

    public static class Form {

        private String username;
        private String password;
        private String[] roles;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String[] getRoles() {
            return roles;
        }

        public void setRoles(String[] roles) {
            this.roles = roles;
        }

    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.GET)
    public ModelAndView create() {
        return new ModelAndView("addUser", "itemUser", new Form());
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public View create(Form form) throws IOException {
        ItemUser user = new ItemUser(form.getUsername(),
                form.getPassword(), form.getRoles()
        );
        itemUserRepo.save(user);
        return new RedirectView("/admin/user", true);
    }

    @RequestMapping(value = "/admin/user/delete/{username}", method = RequestMethod.GET)
    public View delete(@PathVariable("username") String username) {
        itemUserRepo.delete(itemUserRepo.findOne(username));
        return new RedirectView("/admin/user", true);
    }

}
