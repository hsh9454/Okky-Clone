package com.okkyclone.domain;

public class ReplyLikeVO {
    private Long rno;
    private String userid;
    private String like_type;

    public ReplyLikeVO() { }
    
    public Long getRno() {
        return rno;
    }

    public void setRno(Long rno) {
        this.rno = rno;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getLike_type() {
        return like_type;
    }

    public void setLike_type(String like_type) {
        this.like_type = like_type;
    }

    @Override
    public String toString() {
        return "ReplyLikeVO [rno=" + rno + ", userid=" + userid + ", like_type=" + like_type + "]";
    }
}