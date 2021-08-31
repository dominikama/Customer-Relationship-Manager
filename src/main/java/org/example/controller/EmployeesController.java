package org.example.controller;

import org.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class EmployeesController {
    @Autowired
    UserService service;

    @GetMapping("/list")
    public String showUsers(Model model) {
        model.addAttribute("userList",service.getUsers());
        return "list-users";
    }

    @GetMapping("/deleteUser")
    public String delete(@RequestParam("userId") int id) {
        service.deleteUser(id);
        return "redirect:/user/list";
    }

}
