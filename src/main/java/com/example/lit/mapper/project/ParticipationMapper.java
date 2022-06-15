package com.example.lit.mapper.project;

import com.example.lit.domain.vo.project.ParticipationVO;
import com.example.lit.domain.vo.review.LikeVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ParticipationMapper {
    // 참여하기
    public void insert(ParticipationVO participationVO);
}
