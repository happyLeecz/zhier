package me.lcz.zhier.entity;

import java.util.Date;

/**
 * Created by lcz on 2017/5/18.
 */
public class AnswerComment {

   private long commentId;

    private long answerId;

    private long commentUserId;

    private String commentUserName;

    private long commenttoUserId;

    private String commenttoUserName;

    private String commentText;

    private Date createTime;

    public long getCommentId() {
        return commentId;
    }

    public void setCommentId(long commentId) {
        this.commentId = commentId;
    }

    public long getAnswerId() {
        return answerId;
    }

    public void setAnswerId(long answerId) {
        this.answerId = answerId;
    }

    public long getCommentUserId() {
        return commentUserId;
    }

    public void setCommentUserId(long commentUserId) {
        this.commentUserId = commentUserId;
    }

    public String getCommentUserName() {
        return commentUserName;
    }

    public void setCommentUserName(String commentUserName) {
        this.commentUserName = commentUserName;
    }

    public long getCommenttoUserId() {
        return commenttoUserId;
    }

    public void setCommenttoUserId(long commenttoUserId) {
        this.commenttoUserId = commenttoUserId;
    }

    public String getCommenttoUserName() {
        return commenttoUserName;
    }

    public void setCommenttoUserName(String commenttoUserName) {
        this.commenttoUserName = commenttoUserName;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "AnswerComment{" +
                "commentId=" + commentId +
                ", answerId=" + answerId +
                ", commentUserId=" + commentUserId +
                ", commentUserName=" + commentUserName +
                ", commenttoUserId=" + commenttoUserId +
                ", commenttoUserName=" + commenttoUserName +
                ", commentText='" + commentText + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
