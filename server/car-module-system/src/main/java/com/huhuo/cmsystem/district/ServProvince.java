package com.huhuo.cmsystem.district;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.huhuo.carservicecore.db.GenericBaseExtenseServ;
import com.huhuo.carservicecore.sys.district.IDaoProvince;
import com.huhuo.carservicecore.sys.district.ModelProvince;
import com.huhuo.integration.base.IBaseExtenseDao;

@Service("cmsystemServProvince")
public class ServProvince extends GenericBaseExtenseServ<ModelProvince> implements IServProvince {

	@Resource(name = "carservicecoreDaoProvince")
	private IDaoProvince<ModelProvince> iDaoProvince;

	@Override
	public IBaseExtenseDao<ModelProvince> getDao() {
		// TODO Auto-generated method stub
		return iDaoProvince;
	}

	@Override
	public void inject(ModelProvince t) {
		// TODO Auto-generated method stub
		
	}

}
