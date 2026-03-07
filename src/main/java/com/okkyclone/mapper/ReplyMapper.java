package com.okkyclone.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;
import com.okkyclone.domain.Criteria;
import com.okkyclone.domain.ReplyLikeVO;
import com.okkyclone.domain.ReplyVO;

public interface ReplyMapper {
    
    public int insert(ReplyVO vo);
    public List<ReplyVO> getList(Long bno);
    public int delete(Long rno);

    public List<ReplyVO> getListWithPaging(
            @Param("cri") Criteria cri, 
            @Param("bno") Long bno);
    
    public int update(ReplyVO vo);
    
    @Update("<script>" +
            "UPDATE tbl_reply " +
            "SET " +
            "  <choose>" +
            "    <when test='like_type == \"L\"'>likecnt = likecnt + 1</when>" +
            "    <when test='like_type == \"D\"'>dislikecnt = dislikecnt + 1</when>" +
            "  </choose>" +
            "WHERE rno = #{rno}" +
            "</script>")
    public int updateLikeCount(@Param("rno") Long rno, @Param("like_type") String like_type);

    @Update("<script>" +
            "UPDATE tbl_reply " +
            "SET " +
            "  <choose>" +
            "    <when test='like_type == \"L\"'>likecnt = likecnt - 1</when>" +
            "    <when test='like_type == \"D\"'>dislikecnt = dislikecnt - 1</when>" +
            "  </choose>" +
            "WHERE rno = #{rno}" +
            "</script>")
    public int updateLikeCountMinus(@Param("rno") Long rno, @Param("like_type") String like_type);

    @Select("SELECT like_type FROM tbl_reply_like WHERE rno = #{rno} AND userid = #{userid}")
    public String checkReplyLike(ReplyLikeVO vo);

    @Insert("INSERT INTO tbl_reply_like (rno, userid, like_type) VALUES (#{rno}, #{userid}, #{like_type})")
    public int insertReplyLike(ReplyLikeVO vo);
    
    @Delete("DELETE FROM tbl_reply_like WHERE rno = #{rno} AND userid = #{userid}")
    public int deleteReplyLike(ReplyLikeVO vo);
}