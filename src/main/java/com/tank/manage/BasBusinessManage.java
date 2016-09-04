package com.tank.manage;

import com.tank.mapper.BusinessCollectMapper;
import com.tank.mapper.ex.BasBusinessExMapper;
import com.tank.mapper.ex.BusinessReplyExMapper;
import com.tank.model.*;
import com.tank.vo.BusinessReplyVo;
import com.tank.vo.BusinessType;
import com.tank.vo.BussinessVo;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
@Transactional(readOnly = true)
public class BasBusinessManage extends BaseManage {

    @Autowired
    SysDictionaryManage sysDictionaryManage;

    @Autowired
    BasBusinessExMapper basBusinessExMapper;

    @Autowired
    BusinessReplyExMapper businessReplyExMapper;

    @Autowired
    BusinessCollectMapper businessCollectMapper;

    @Autowired
    UserManage userManage;


    public BasBusiness getById(Long id) {
        return basBusinessExMapper.selectByPrimaryKey(id);
    }

    public int save(BasBusiness basRegion) {
        return basBusinessExMapper.insertSelective(basRegion);
    }

    public int update(BasBusiness basRegion) {
        return basBusinessExMapper.updateByPrimaryKeySelective(basRegion);
    }

    public int delete(Long id) {
        return basBusinessExMapper.deleteByPrimaryKey(id);
    }


    public List<BasBusiness> list(Integer pageNumber,
                                  Integer pageSize) {
        BasBusinessExample example = new BasBusinessExample();
        example.setOrderByClause(getPage(pageNumber, pageSize));

        return basBusinessExMapper.selectByExample(example);
    }

    public int count() {
        return basBusinessExMapper.countByExample(null);
    }


    public long insertBackId(BasBusiness basRegion) {
        if (basBusinessExMapper.insertBackId(basRegion) > 0) {
            return basRegion.getId();
        }
        return 0;
    }




    //api//

    /**
     * 得到一级目录下的商家
     *
     * @param typeid
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public List<BussinessVo> listByType(Long typeid, Long typeiid, Integer pageNumber,
                                        Integer pageSize) {
        BasBusinessExample example = new BasBusinessExample();
        BasBusinessExample.Criteria criteria = example.createCriteria();
        if (null != typeid && typeid > 0) {
            criteria.andTypeidEqualTo(typeid);
        }
        if (null != typeiid && typeiid > 0) {
            criteria.andTypeiidEqualTo(typeiid);
        }
        example.setOrderByClause(getPage(pageNumber, pageSize));
        List<BasBusiness> list = basBusinessExMapper.selectByExample(example);
        if (null != list && list.size() > 0) {
            return parser(list);
        }
        return null;
    }

    /**
     * 收藏的商家列表
     *
     * @param uid
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public List<BussinessVo> listByCollect(Long uid, Integer pageNumber,
                                           Integer pageSize) {
        BasBusinessExample example = new BasBusinessExample();
        BasBusinessExample.Criteria criteria = example.createCriteria();

        example.setOrderByClause(getPage(pageNumber, pageSize));
        List<BasBusiness> list = basBusinessExMapper.selectByExample(example);
        if (null != list && list.size() > 0) {
            return parser(list);
        }
        return null;
    }

    /**
     * 收藏的商家数
     *
     * @param uid
     * @return
     */
    public int countByCollect(Long uid) {
        BusinessCollectExample example = new BusinessCollectExample();
        BusinessCollectExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(uid);
        return businessCollectMapper.countByExample(example);
    }


    public List<BussinessVo> parser(List<BasBusiness> list) {
        List<BussinessVo> ls = new ArrayList<>();
        for (BasBusiness b : list) {
            BussinessVo bv = new BussinessVo();
            try {
                PropertyUtils.copyProperties(bv, b);
                ls.add(bv);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
        }
        return ls;
    }


    public List<BasBusiness> listByTypeId(Long typeid, Integer pageNumber,
                                          Integer pageSize) {
        BasBusinessExample example = new BasBusinessExample();
        BasBusinessExample.Criteria criteria = example.createCriteria();
        criteria.andTypeidEqualTo(typeid);
        example.setOrderByClause(getPage(pageNumber, pageSize));
        return basBusinessExMapper.selectByExample(example);
    }


    public List<BasBusiness> listByTypeIId(Long typeiid, Integer pageNumber,
                                           Integer pageSize) {
        BasBusinessExample example = new BasBusinessExample();
        BasBusinessExample.Criteria criteria = example.createCriteria();
        criteria.andTypeiidEqualTo(typeiid);
        example.setOrderByClause(getPage(pageNumber, pageSize));
        return basBusinessExMapper.selectByExample(example);
    }

    /**
     * 得到下级的所有的类别
     *
     * @param typeid
     * @return
     */
    public List<BusinessType> listType(Long typeid) {
        if (null != typeid && typeid > 0) {
            List<SysDictionary> list = sysDictionaryManage.querySysDictionaryByPId(typeid);
            if (null != list && list.size() > 0) {
                List<BusinessType> ls = new ArrayList<>();
                for (SysDictionary d : list) {
                    BusinessType b = new BusinessType();
                    b.setTitle(d.getTitle());
                    b.setId(d.getIid());
                    b.setPid(d.getPid());
                    ls.add(b);
                }
                return ls;
            }
        }
        return null;
    }


    /**
     * 收藏
     *
     * @param uid
     * @param bid
     * @return
     */
    public boolean collect(Long uid, Long bid) {
        BusinessCollect collect = new BusinessCollect();
        collect.setUid(uid);
        collect.setBid(bid);
        collect.setCreatedate(new Date());
        return businessCollectMapper.insertSelective(collect) > 0;
    }

    /**
     * 取消收藏
     *
     * @param uid
     * @param bid
     * @return
     */
    public boolean uncollect(Long uid, Long bid) {
        BusinessCollectExample example=new BusinessCollectExample();
        BusinessCollectExample.Criteria criteria=example.createCriteria();
        criteria.andBidEqualTo(bid);
        criteria.andUidEqualTo(uid);
        return businessCollectMapper.deleteByExample(example) > 0;
    }


    /**
     * 评论
     * @param record
     * @return
     */
    public Long reply(BusinessReply record) {
        if(businessReplyExMapper.insertBackId(record) > 0){
            return record.getId();
        }else{
            return 0l;
        }
    }

    public boolean unreply(Long id) {
        if(businessReplyExMapper.deleteByPrimaryKey(id) > 0){
            return true;
        }else{
            return false;
        }
    }


    /**
     * 是否收藏
     * @param uid
     * @param bid
     * @return
     */
    public boolean isCollect(Long uid,Long bid){
        BusinessCollectExample example=new BusinessCollectExample();
        BusinessCollectExample.Criteria criteria=example.createCriteria();
        criteria.andBidEqualTo(bid);
        criteria.andUidEqualTo(uid);
        List l=businessCollectMapper.selectByExample(example);
        if(null!=l&&l.size()>0){
            return true;
        }
        return false;
    }


    /**
     * 商家评论列表
     * @param bid
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public List<BusinessReplyVo> listReplyByBid(Long bid,Integer pageNumber,
                                                Integer pageSize){
        BusinessReplyExample example=new BusinessReplyExample();
        BusinessReplyExample.Criteria criteria=example.createCriteria();
        criteria.andBidEqualTo(bid);
        example.setOrderByClause(getPage(pageNumber, pageSize));
        List<BusinessReply> list=businessReplyExMapper.selectByExample(example);
        if(null!=list&&list.size()>0){
            List<BusinessReplyVo> ls=new ArrayList<>();
            User user = null;
            for(BusinessReply br:list){
                try {
                    BusinessReplyVo vo=new BusinessReplyVo();
                    PropertyUtils.copyProperties(vo, br);
                    user = userManage.getUserById(vo.getUid());
                    if (null != user) {
                        vo.setUserVo(getUserVo(user));
                    }
                    ls.add(vo);
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                }
            }
            return ls;
        }
        return null;
    }

}
