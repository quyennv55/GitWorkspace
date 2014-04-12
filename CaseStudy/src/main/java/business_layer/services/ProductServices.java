package business_layer.services;

import business_layer.models.ProductModel;
import persistent_layer.dao.ProductDao;
import persistent_layer.entities.ProductEntities;

import java.util.ArrayList;
import java.util.List;

public class ProductServices {
    // find all equipment by cutomer id
    public List<ProductModel> findAllEquipment(int customerId){
        ProductDao productDao = new ProductDao();
        ProductModel productModel = null;
        List<ProductModel> productModels = new ArrayList<ProductModel>();
        List<ProductEntities> productEntitieses = productDao.findEquipments(customerId);
        for(int i=0; i< productEntitieses.size(); i++){
            productModel = new ProductModel();
            productModel.setProductId(productEntitieses.get(i).getProductId());
            productModel.setModel(productEntitieses.get(i).getModel());
            productModel.setManufacturer(productEntitieses.get(i).getManufacturer());
            productModel.setPrice(productEntitieses.get(i).getPrice());
            productModel.setYear(productEntitieses.get(i).getYear());
            productModels.add(productModel);
        }
        return productModels;
    }
}
