package com.sister.service.brand;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sister.pojo.Brand;
import com.sister.web.dto.BrandDTO;

public interface IBrandService {


	public void saveOrUpdateBrand(Brand brand);
	
	public Brand findBrandById(Long id);
	
	public void deleteBrand(Long id);
	
	public  Map<String, Object> fullLogicallyDeleteBrandById(Long id, HttpServletRequest request);
	
	public  Map<String, Object> fullDeleteBrandById(Long id, HttpServletRequest request);
	
//	public List<BrandDTO> getBrandDTOList (int start, int limit);
	
	public List<BrandDTO> getBrandDTOList();
	
}
