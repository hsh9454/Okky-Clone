package com.okkyclone.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.okkyclone.domain.MemberVO;
import com.okkyclone.service.BoardService;

@Controller
@RequestMapping("/like/*")
public class LikeController {

    @Autowired
    private BoardService service;

    @PostMapping("/update")
    @ResponseBody
    public boolean updateLike(@RequestBody Map<String, Object> params, HttpSession session) {
        Long bno = Long.parseLong(params.get("bno").toString());
        MemberVO user = (MemberVO) session.getAttribute("user");
        if (user == null) return false;

        String userid = user.getUserId();
        
        return service.toggleLike(bno, userid); 
    }
    
    @PostMapping("/disupdate")
    @ResponseBody
    public boolean updateDislike(@RequestBody Map<String, Object> params, HttpSession session) {
        Long bno = Long.parseLong(params.get("bno").toString());
        MemberVO user = (MemberVO) session.getAttribute("user");
        if (user == null) return false;

        String userid = user.getUserId();        
        return service.toggleDislike(bno, userid);
    }
    
    
}