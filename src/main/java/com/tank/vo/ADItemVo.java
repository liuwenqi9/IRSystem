package com.tank.vo;

import java.io.Serializable;

/**
 * Created by Administrator on 2016/9/15.
 */
public class ADItemVo  implements Serializable {

    private Long id;

    private Long bid;

    private String title;

    private String tag;

    private String des;

    private String picurl;

    private String weburl;

    private BussinessVo bussinessVo;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getBid() {
        return bid;
    }

    public void setBid(Long bid) {
        this.bid = bid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getPicurl() {
        return picurl;
    }

    public void setPicurl(String picurl) {
        this.picurl = picurl;
    }

    public String getWeburl() {
        return weburl;
    }

    public void setWeburl(String weburl) {
        this.weburl = weburl;
    }

    public BussinessVo getBussinessVo() {
        return bussinessVo;
    }

    public void setBussinessVo(BussinessVo bussinessVo) {
        this.bussinessVo = bussinessVo;
    }
}
