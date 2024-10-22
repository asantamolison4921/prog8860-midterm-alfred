package com.alfred.midterm;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloWorldController {
    @GetMapping("/")
    public String hello(Model model) {
        model.addAttribute("message", "Sample Java web application for mid-term evaluation");
        return "hello";
    }
}
