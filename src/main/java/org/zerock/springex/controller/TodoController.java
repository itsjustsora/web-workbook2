package org.zerock.springex.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.zerock.springex.dto.TodoDTO;

import java.time.LocalDate;

@Controller
@RequestMapping("/todo")
@Log4j2
public class TodoController {

    @RequestMapping("/list")
    public void list() {
        log.info("todo list...");
    }

    @GetMapping("/register")
    public void registerGet() {
        log.info("GET todo register...");
    }

    @PostMapping("/register")
    public void registerPost(TodoDTO todoDTO) {
        log.info("POST todo register...");
        log.info("todoDto: {}", todoDTO);
    }


}
