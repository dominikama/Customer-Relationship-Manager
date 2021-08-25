package org.example.controller;

import org.example.entity.Customer;
import org.example.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @GetMapping("/list")
    public String getCustomerList(Model model) {
        model.addAttribute("customerList", customerService.getCustomers());
        return "list-customers";
    }

    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model model) {
        Customer customer = new Customer();
        model.addAttribute("customer", customer);
        return "customer-form";
    }

    @PostMapping("/saveCustomer")
    public String saveCustomer(@Valid @ModelAttribute("customer") Customer customer, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
                return "customer-form";
        } else {
            customerService.saveCustomer(customer);
            return "redirect:/customer/list";
        }
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("customerId") int id, Model model) {
        //get the customer
        Customer customer = customerService.getCustomer(id);

        //set the customer as a model attribute to pre-populate form
        model.addAttribute("customer", customer);

        //send it to the form
        return "customer-form";
    }

    @GetMapping("/deleteCustomer")
    public String deleteCustomer(@RequestParam("customerId") int id) {
        customerService.deleteCustomer(id);
        return "redirect:/customer/list";
    }

    @GetMapping("/search")
    public String search(@RequestParam("name") String name, Model model) {
        model.addAttribute("customerList", customerService.searchCustomer(name));
        return "list-customers";
    }

    @InitBinder
    public void removeWhitespace(WebDataBinder dataBinder) {

        //create a class to trim spaces - spring API
        StringTrimmerEditor editor = new StringTrimmerEditor(false);

        // register that object so every String will be processed like that
        dataBinder.registerCustomEditor(String.class, editor);
    }

}
