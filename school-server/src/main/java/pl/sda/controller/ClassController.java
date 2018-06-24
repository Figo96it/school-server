package pl.sda.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import pl.sda.api.ClassApi;
import pl.sda.model.Class;

import java.util.List;

@RestController
public class ClassController implements ClassApi {


    @Override
    @PostMapping("class/create")
    public Class create() {
        return null;
    }

    @Override
    @PostMapping("class/delete")
    public Class delete() {
        return null;
    }

    @Override
    @PostMapping("class/edit")
    public Class edit() {
        return null;
    }

    @Override
    @GetMapping("class/findAll")
    public List<Class> findAll() {
        return null;
    }

    @Override
    @GetMapping("class/find")
    public Class find() {
        return null;
    }
}