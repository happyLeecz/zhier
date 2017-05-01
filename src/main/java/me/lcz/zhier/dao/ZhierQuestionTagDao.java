package me.lcz.zhier.dao;

import java.util.List;

/**
 * Created by lcz on 2017/4/6.
 */
public interface ZhierQuestionTagDao {
    /**
     * 加入标签
     * @param tagName
     */
    int addQuestionTag(String tagName);

    /**
     * 查找标签
     * @param tagName
     * @return
     */
    String findQuestionTag(String tagName);

    /**
     * 根据关键字查找标签
     * @param keyword
     * @return
     */
    List<String> findTagByKeyword(String keyword);
}
