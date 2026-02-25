package com.okkyclone.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.okkyclone.domain.AdVO;
import com.okkyclone.service.AdService;

@RestController
@RequestMapping("/ads")
public class AdController {
    
    @Autowired
    private AdService adService;

    @GetMapping("/{position}")
    public List<AdVO> getAds(@PathVariable("position") String position) {
        return adService.getAds(position);
    }
}