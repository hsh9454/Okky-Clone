package com.okkyclone.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.okkyclone.domain.ReplyVO;
import com.okkyclone.service.ReplyService;
import com.okkyclone.domain.Criteria;

@RestController
@RequestMapping("/replies/")
public class ReplyController {

    @Autowired
    private ReplyService service;

    @PostMapping(value = "/new", 
                 consumes = "application/json", 
                 produces = { MediaType.TEXT_PLAIN_VALUE + ";charset=UTF-8" })
    public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
        return service.register(vo) == 1 
            ? new ResponseEntity<>("댓글이 등록되었습니다.", HttpStatus.OK)
            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @GetMapping(value = "/pages/{bno}/{page}", 
                produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<List<ReplyVO>> getList(
            @PathVariable("page") int page, 
            @PathVariable("bno") Long bno) {
        
        System.out.println("컨트롤러 호출됨! BNO: " + bno + ", PAGE: " + page);
        
        return new ResponseEntity<>(service.getList(new Criteria(page, 10), bno), HttpStatus.OK);
    }
}