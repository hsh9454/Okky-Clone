package com.okkyclone.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.okkyclone.domain.Criteria;
import com.okkyclone.domain.ReplyLikeVO;
import com.okkyclone.domain.ReplyVO;
import com.okkyclone.service.ReplyService;

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
        return new ResponseEntity<>(service.getList(new Criteria(page, 10), bno), HttpStatus.OK);
    }
    
    @DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE + ";charset=UTF-8" })
    public ResponseEntity<String> remove(@PathVariable("rno") Long rno, HttpSession session) {
        try {
            int result = service.remove(rno);
            return result == 1 
                ? new ResponseEntity<>("success", HttpStatus.OK) 
                : new ResponseEntity<>("fail", HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
            value = "/{rno}",
            consumes = "application/json",
            produces = { MediaType.TEXT_PLAIN_VALUE + ";charset=UTF-8" })
    public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno) { 
        vo.setRno(rno);
        try {
            int result = service.modify(vo);
            return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>("fail", HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @PostMapping(value = "/like", consumes = "application/json")
    public ResponseEntity<String> updateLike(@RequestBody ReplyLikeVO vo) {
        System.out.println("좋아요 클릭 RNO: " + vo.getRno());
        int result = service.updateLike(vo);
        return result == 1 
            ? new ResponseEntity<>("success", HttpStatus.OK)
            : new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }
}