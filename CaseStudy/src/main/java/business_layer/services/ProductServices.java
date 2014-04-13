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
        for(ProductEntities productEntities:productEntitieses){
            productModel = new ProductModel();
            productModel.setProductId(productEntities.getProductId());
            productModel.setModel(productEntities.getModel());
            productModel.setManufacturer(productEntities.getManufacturer());
            productModel.setPrice(productEntities.getPrice());
            productModel.setYear(productEntities.getYear());
            productModels.add(productModel);
        }
        return productModels;
    }
    // Find Products by order number
    public List<ProductModel> findProductsOrder(int orderNumber){
        ProductDao productDao = new ProductDao();
        ProductModel productModel = null;
        List<ProductModel> productModels = new ArrayList<ProductModel>();
        List<ProductEntities> productEntitieses = productDao.findProductsByOrder(orderNumber);
        for(ProductEntities productEntities: productEntitieses){
            productModel = new ProductModel();
            productModel.setProductId(productEntities.getProductId());
            productModel.setManufacturer(productEntities.getManufacturer());
            productModel.setModel(productEntities.getModel());
            productModel.setYear(productEntities.getYear());
            productModel.setPrice(productEntities.getPrice());
            productModels.add(productModel);
        }
        return productModels;
    }
}
