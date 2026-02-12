package com.okkyclone.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.okkyclone.domain.Criteria;
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
        
        System.out.println("컨트롤러 호출됨! BNO: " + bno + ", PAGE: " + page);
        
        return new ResponseEntity<>(service.getList(new Criteria(page, 10), bno), HttpStatus.OK);
    }
    
    @DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE + ";charset=UTF-8" })
    public ResponseEntity<String> remove(@PathVariable("rno") Long rno, HttpSession session) {
        
        Object userObj = session.getAttribute("user");
        
        System.out.println("삭제 시도 RNO: " + rno);
        System.out.println("세션 유저 객체 상태: " + userObj);

        if (userObj == null) {
            return new ResponseEntity<>("로그인이 만료되었습니다.", HttpStatus.UNAUTHORIZED);
        }
        try {
            int result = service.remove(rno);
            return result == 1 
                ? new ResponseEntity<>("success", HttpStatus.OK) 
                : new ResponseEntity<>("삭제할 댓글이 없습니다.", HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
            value = "/{rno}",
            consumes = "application/json",
            produces = { MediaType.TEXT_PLAIN_VALUE + ";charset=UTF-8" })
    public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno) { 

        vo.setRno(rno);

        System.out.println("댓글 수정 시도 RNO: " + rno);
        System.out.println("수정 내용: " + vo.getReply());
        
        try {
        	int result = service.modify(vo);
        	return result == 1
                    ? new ResponseEntity<>("success", HttpStatus.OK)
                    : new ResponseEntity<>("수정 실패 (해당 댓글 없음)", HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}   	
