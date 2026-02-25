package com.okkyclone.mapper;

import java.util.List;
import com.okkyclone.domain.AdVO;

public interface AdMapper {
    public List<AdVO> getAdsByPosition(String position);
}