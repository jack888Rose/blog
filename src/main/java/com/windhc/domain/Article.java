package com.windhc.domain;

import com.windhc.config.Constants;

import java.time.Instant;
import java.util.List;

/**
 * Created by HC on 2016/6/18.
 */
public class Article {

  private long articleId;
  private String title;
  private String summary;
  private String content;
  private Constants.ArticleStatus status;
  private long createTime = Instant.now().toEpochMilli();
  private boolean deleted = false;

  private Category category;
  private User user;
  private List<Comment> comments;

  public long getArticleId() {
    return articleId;
  }

  public void setArticleId(long articleId) {
    this.articleId = articleId;
  }

  public Constants.ArticleStatus getStatus() {
    return status;
  }

  public void setStatus(Constants.ArticleStatus status) {
    this.status = status;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getSummary() {
    return summary;
  }

  public void setSummary(String summary) {
    this.summary = summary;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public long getCreateTime() {
    return createTime;
  }

  public void setCreateTime(long createTime) {
    this.createTime = createTime;
  }

  public boolean isDeleted() {
    return deleted;
  }

  public void setDeleted(boolean deleted) {
    this.deleted = deleted;
  }

  public Category getCategory() {
    return category;
  }

  public void setCategory(Category category) {
    this.category = category;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public List<Comment> getComments() {
    return comments;
  }

  public void setComments(List<Comment> comments) {
    this.comments = comments;
  }
}
