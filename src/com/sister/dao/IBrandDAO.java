package com.sister.dao;

import java.util.List;

import com.sister.pojo.Brand;

public interface IBrandDAO {

	
	public void saveOrUpdateBrand(Brand brand);
	
	public Brand findBrandById(Long id);
	
	public void deleteBrand(Long id);
	
	public List<Brand> getBrandList (int start, int limit); 
	
	public List<Brand> getBrandList ();
}
