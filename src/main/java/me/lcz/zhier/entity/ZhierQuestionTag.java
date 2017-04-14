package me.lcz.zhier.entity;

import java.util.Date;

/**
 * Created by lcz on 2017/4/6.
 */
public class ZhierQuestionTag {

   private String questionTag;

    private Date createTime;

    public String getQuestionTag() {
        return questionTag;
    }

    public void setQuestionTag(String questionTag) {
        this.questionTag = questionTag;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
