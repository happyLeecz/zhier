package me.lcz.zhier.entity;

import java.util.Date;

/**
 * Created by lcz on 2017/4/6.
 */
public class ZhierQuestion {

    private long questionId;

    private Date createTime;

    private long createByWho;

    private String questionTag;

    private String questionText;

    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public long getCreateByWho() {
        return createByWho;
    }

    public void setCreateByWho(long createByWho) {
        this.createByWho = createByWho;
    }

    public String getQuestionTag() {
        return questionTag;
    }

    public void setQuestionTag(String questionTag) {
        this.questionTag = questionTag;
    }

    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }
}
