package me.lcz.zhier.enums;

/**
 * Created by lcz on 2017/4/11.
 */
public enum TableEnum {
    USERS("用户信息表"),
    ANSWERS("回答表"),
    QUESTIONS("问题表"),
    TAGS("问题标签表"),
    LIKES("回答的喜爱程度表");


    private String whichTable;

    TableEnum(String whichTable) {
        this.whichTable = whichTable;
    }

    public String getWhichTable() {
        return whichTable;
    }
}
