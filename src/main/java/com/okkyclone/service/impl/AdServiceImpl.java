package com.okkyclone.service.impl;

import java.util.List; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.okkyclone.domain.AdVO;
import com.okkyclone.mapper.AdMapper;
import com.okkyclone.service.AdService; 

@Service
public class AdServiceImpl implements AdService {

    @Autowired
    private AdMapper mapper;

    @Override 
    public List<AdVO> getAds(String position) {
        return mapper.getAdsByPosition(position);
    }
}