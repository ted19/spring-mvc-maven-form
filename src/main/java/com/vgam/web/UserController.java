package com.vgam.web;

import com.vgam.user.DataUtils;
import com.vgam.user.model.User;
import com.vgam.user.service.UserService;
import com.vgam.user.validator.UserFormValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.Arrays;

@Controller
public class UserController {

    private final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private UserFormValidator formValidator;

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.addValidators(formValidator);
    }

    @GetMapping(value = {"/", "/users"})
    public String listAllUsers(Model model) {
        logger.debug("listAllUsers()");
        model.addAttribute("users", userService.findAll());
        return "list";
    }

    @PostMapping("/users")
    public String saveOrUpdateUser(@ModelAttribute("userForm") @Validated User user,
                                   BindingResult bindingResult, Model model,
                                   final RedirectAttributes redirectAttributes) {

        //formValidator.validate(user, bindingResult);        
        logger.debug("saveOrUpdateUser() : {}", user);

        if (bindingResult.hasErrors()) {
            populateDefaultCheckBoxesAndRadios(model);
            return "userform";
        } else {
            redirectAttributes.addFlashAttribute("alert", "success");
            if (user.isNew()) {
                redirectAttributes.addFlashAttribute("msg", "User added successfully!");
            } else {
                redirectAttributes.addFlashAttribute("msg", "User updated successfully!");
            }

            userService.saveOrUpdate(user);

            return "redirect:/users/" + user.getId();
        }
    }

    @GetMapping("/users/{id}")
    public String showUser(@PathVariable("id") int userId, Model model) {

        logger.debug("showUser() userId: {}", userId);

        User user = userService.findById(userId);
        if (user == null) {
            model.addAttribute("alert", "danger");
            model.addAttribute("msg", "User not found!");
        }
        
        model.addAttribute("user", user);
        return "view";
    }

    @GetMapping("/users/add")
    public String showAddUserForm(Model model) {

        logger.debug("showAddUserForm()");

        User user = new User();
        user.setSex("M");
        user.setCountry("MY");
        user.setFramework(new ArrayList<String>(Arrays.asList("Spring", "Struts")));
        user.setSkill(new ArrayList<String>(Arrays.asList("Spring", "Struts", "Hibernate")));
        model.addAttribute("userForm", user);

        populateDefaultCheckBoxesAndRadios(model);
        return "userform";
    }

    @GetMapping("/users/{id}/update")
    public String showUpdateUserForm(@PathVariable("id") int id, Model model) {

        logger.debug("showUpdateUserForm() : {}", id);

        model.addAttribute("userForm", userService.findById(id));
        populateDefaultCheckBoxesAndRadios(model);
        return "userform";
    }

    @PostMapping("/users/{id}/delete")
    public String deleteUser(@PathVariable("id") int id,
                             final RedirectAttributes redirectAttributes) {

        logger.debug("deleteUser() : {}", id);

        userService.delete(id);
        redirectAttributes.addFlashAttribute("alert", "success");
        redirectAttributes.addFlashAttribute("msg", "User is deleted!");

        return "redirect:/";
    }

    private void populateDefaultCheckBoxesAndRadios(Model model) {
        model.addAttribute("frameworkList", DataUtils.FRAMEWORKS_LIST);
        model.addAttribute("javaSkillList", DataUtils.SKILLS);
        model.addAttribute("numberList", DataUtils.NUMBERS);
        model.addAttribute("countryList", DataUtils.COUNTRY);
    }
}