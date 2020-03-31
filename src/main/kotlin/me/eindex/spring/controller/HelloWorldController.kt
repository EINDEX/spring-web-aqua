package me.eindex.spring.controller

import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloWorldController {

    @GetMapping("/")
    fun helloWorld() : ResponseEntity<Any>{
        return ResponseEntity.status(200).body("Hello World")
    }
}
