package com.okkyclone.service;

import java.util.List;
import com.okkyclone.domain.AdVO;

public interface AdService {
    public List<AdVO> getAds(String position);
}