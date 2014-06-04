package com.sister.service.brand.imp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.sister.dao.IBrandDAO;
import com.sister.pojo.Brand;
import com.sister.service.brand.IBrandService;
import com.sister.web.dto.BrandDTO;
import com.sister.web.util.CommonStaticConst;
import com.sister.web.util.LocalizationUtil;


@Service(value = "brandService")
public class BrandServiceImpl implements IBrandService {

	@Resource
	private IBrandDAO brandDAO;
	
	@Override
	public void saveOrUpdateBrand(Brand brand) {
		// TODO Auto-generated method stub
		brandDAO.saveOrUpdateBrand(brand);
	}

	@Override
	public Brand findBrandById(Long id) {
		// TODO Auto-generated method stub
		return brandDAO.findBrandById(id);
	}

	@Override
	public void deleteBrand(Long id) {
		// TODO Auto-generated method stub
		brandDAO.deleteBrand(id);
	}
	
	public  Map<String, Object> fullLogicallyDeleteBrandById(Long id, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		Brand brand = findBrandById(id);
		if (brand == null) {
			map.put(CommonStaticConst.RETURN_MESSAGE, LocalizationUtil.getClientString("Parameter.error", request));
			map.put(CommonStaticConst.RETURN_SUCCESS, false);
			return map;
		}
		//logically delete
		brand.setIsEnabledBrd(false);
		this.saveOrUpdateBrand(brand);
		
		map.put(CommonStaticConst.RETURN_MESSAGE, "");
		map.put(CommonStaticConst.RETURN_SUCCESS, true);
		return map;
	}
	
	public  Map<String, Object> fullDeleteBrandById(Long id, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		Brand brand = findBrandById(id);
		if (brand == null) {
			map.put(CommonStaticConst.RETURN_MESSAGE, LocalizationUtil.getClientString("Parameter.error", request));
			map.put(CommonStaticConst.RETURN_SUCCESS, false);
			return map;
		}
		this.deleteBrand(id);
		map.put(CommonStaticConst.RETURN_MESSAGE, "");
		map.put(CommonStaticConst.RETURN_SUCCESS, true);
		return map;
	}
	
	public List<BrandDTO> getBrandDTOList(){
		List<Brand> list = brandDAO.getBrandList();
		List<BrandDTO> dtoList = new ArrayList<BrandDTO>();
		for(Brand brand: list){
			dtoList.add(brand.toDTO());
		}
		return dtoList;
	}
	
}
