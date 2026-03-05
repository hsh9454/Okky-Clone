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
        if (session.getAttribute("pinfo") == null) {
            System.out.println("로그인이 필요합니다.");
            return false;
        }

        try {
            Long bno = Long.parseLong(params.get("bno").toString());
            String userid = params.get("userid").toString(); 
            
            System.out.println("[추천 요청] BNO: " + bno + ", UserID: " + userid);
            return service.toggleLike(bno, userid); 
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @PostMapping("/disupdate")
    @ResponseBody
    public boolean updateDislike(@RequestBody Map<String, Object> params, HttpSession session) {
        if (session.getAttribute("pinfo") == null) {
            System.out.println("로그인이 필요합니다.");
            return false;
        }

        try {
            Long bno = Long.parseLong(params.get("bno").toString());
            String userid = params.get("userid").toString();
            
            System.out.println("[비추천 요청] BNO: " + bno + ", UserID: " + userid);
            return service.toggleDislike(bno, userid);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}