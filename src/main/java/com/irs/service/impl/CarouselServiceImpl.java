package com.irs.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.irs.mapper.TbCarouselMapper;
import com.irs.pojo.TbCarousel;
import com.irs.pojo.TbCarouselExample;
import com.irs.pojo.TbCarouselExample.Criteria;
import com.irs.service.CarouselService;
import com.irs.util.ResultUtil;
@Service
public class CarouselServiceImpl implements CarouselService {
	@Autowired
	private TbCarouselMapper tbCarouselMapper;

	@Override
	public ResultUtil selCarousels(Integer page, Integer limit) {
		PageHelper.startPage(page, limit);
		TbCarouselExample example=new TbCarouselExample();
		//排序
		example.setOrderByClause("sorting DESC");
		Criteria criteria = example.createCriteria();
		List<TbCarousel> list = tbCarouselMapper.selectByExample(example);
		PageInfo<TbCarousel> pageInfo = new PageInfo<TbCarousel>(list);
		ResultUtil resultUtil = new ResultUtil();
		resultUtil.setCode(0);
		resultUtil.setCount(pageInfo.getTotal());
		resultUtil.setData(pageInfo.getList());
		return resultUtil;
	}

	@Override
	public void insCarouselService(TbCarousel carousel) {
		Date date=new Date();
		carousel.setCreateTime(date);
		tbCarouselMapper.insert(carousel);
	}

	@Override
	public void updCarouselStatusById(Integer id, Integer status) {
		TbCarousel carousel = tbCarouselMapper.selectByPrimaryKey(id);
		carousel.setStatus(status);
		carousel.setUpdateTime(new Date());
		tbCarouselMapper.updateByPrimaryKey(carousel);
	}

	@Override
	public void delCarouselById(Integer id) {
		tbCarouselMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void delCarouselByIds(String carouselStr) {
		//StringUtils的isBlank()方法可以一次性校验这三种情况，返回值都是true
		//是否为 null，是否为 ""，是否为空字符串(引号中间有空格)
		if(!StringUtils.isBlank(carouselStr)){
			//将carouselStr这个字符串用","分割成数组
			String[] ids=carouselStr.split(",");
			for (String id : ids) {
				//将string类型的uid转化没Integer类型并根据主键id删除
				//Integer.parseInt(uid)返回Integer基本数据类型
				tbCarouselMapper.deleteByPrimaryKey(Integer.parseInt(id));
			}
		}
	}

	@Override
	public TbCarousel selCarouselById(Integer id) {
		return tbCarouselMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updCarouselService(TbCarousel carousel) {
		TbCarousel c = tbCarouselMapper.selectByPrimaryKey(carousel.getId());
		carousel.setCreateTime(c.getCreateTime());
		carousel.setUpdateTime(new Date());
		tbCarouselMapper.updateByPrimaryKey(carousel);
	}

}
