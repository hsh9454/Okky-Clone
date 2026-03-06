package com.okkyclone.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.ResponseEntity;
import com.okkyclone.domain.MemberVO;
import com.okkyclone.service.BoardService;

@Controller
@RequestMapping("/like/*")
public class LikeController {

    @Autowired
    private BoardService service;

    @PostMapping("/update")
    @ResponseBody
    public ResponseEntity<?> updateLike(@RequestBody Map<String, Object> params, HttpSession session) {
        if (session.getAttribute("pinfo") == null) {
            return ResponseEntity.status(401).body("로그인이 필요합니다.");
        }

        try {
            Long bno = Long.parseLong(params.get("bno").toString());
            String userid = params.get("userid").toString(); 
            
            boolean result = service.toggleLike(bno, userid);
            
            if (!result) {
               
                return ResponseEntity.badRequest().body("이미 리액션을 하였습니다.");
            }
            
            return ResponseEntity.ok(result); 
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("서버 오류");
        }
    }

    @PostMapping("/disupdate")
    @ResponseBody
    public ResponseEntity<?> updateDislike(@RequestBody Map<String, Object> params, HttpSession session) {
        if (session.getAttribute("pinfo") == null) {
            return ResponseEntity.status(401).body("로그인이 필요합니다.");
        }

        try {
            Long bno = Long.parseLong(params.get("bno").toString());
            String userid = params.get("userid").toString();
            
            boolean result = service.toggleDislike(bno, userid);
            
            if (!result) {
                // 이미 좋아요가 눌려있는 상태에서 싫어요를 누른 경우
                return ResponseEntity.badRequest().body("이미 리액션을 하였습니다.");
            }
            
            return ResponseEntity.ok(result);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("서버 오류");
        }
    }
}