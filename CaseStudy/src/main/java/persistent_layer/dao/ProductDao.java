package persistent_layer.dao;


import Utils.DBUtils;
import persistent_layer.entities.ProductEntities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    // Find all equipmet by customer id
    public List<ProductEntities> findEquipments(int customerId){
        List<ProductEntities> productEntitieses = new ArrayList<ProductEntities>();
        ProductEntities productEntities = null;
        String sql = "SELECT p.* FROM products p JOIN order_detail od ON p.product_id = od.product_id JOIN orders o ON od.order_number = o.order_number JOIN contacts c ON o.contact_id = c.contact_id WHERE c.customer_id = "+ customerId +" and o.status ='shipped'"; ;
        Connection con = null;
        try {
            con = DBUtils.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                productEntities = new ProductEntities();
                productEntities.setProductId(rs.getInt("product_id"));
                productEntities.setProductName(rs.getString("product_name"));
                productEntities.setYear(rs.getString("year"));
                productEntities.setPrice(rs.getInt("price"));
                productEntities.setManufacturer(rs.getString("manufacturer"));
                productEntities.setModel(rs.getString("model"));
                productEntitieses.add(productEntities);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productEntitieses;
    }
    // find product by order Number
    public List<ProductEntities> findProductsByOrder(int orderNumber){
        List<ProductEntities> productEntitieses = new ArrayList<ProductEntities>();
        ProductEntities productEntities = null;
        String sql = "SELECT p.* FROM products p JOIN order_detail od ON p.product_id = od.product_id WHERE od.order_number = "+ orderNumber + " ORDER BY p.year DESC";
        Connection con = null;
        try {
            con = DBUtils.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                productEntities = new ProductEntities();
                productEntities.setModel(rs.getString("model"));
                productEntities.setManufacturer(rs.getString("manufacturer"));
                productEntities.setPrice(rs.getInt("price"));
                productEntities.setYear(rs.getString("year"));
                productEntities.setProductName(rs.getString("product_name"));
                productEntities.setProductId(rs.getInt("product_id"));
                productEntitieses.add(productEntities);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productEntitieses;
    }
}
