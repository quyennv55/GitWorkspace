package persistent_layer.dao;

import Utils.DBUtils;
import persistent_layer.entities.CustomerEntities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class CustomerDao {
    public List<CustomerEntities> findCustomers(){
        List<CustomerEntities> result = new ArrayList<CustomerEntities>();
        CustomerEntities customerEntities = null;
        String sql = "SELECT * FROM customers";
        Connection con = null;
        try {
            con = DBUtils.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                customerEntities = new CustomerEntities();
                customerEntities.setCustomerId(rs.getInt("customer_id"));
                customerEntities.setCustomerName(rs.getString("customer_name"));
                customerEntities.setAddress(rs.getString("address"));
                customerEntities.setTel(rs.getString("tel"));
                customerEntities.setFax(rs.getString("fax"));
                result.add(customerEntities);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    // Find customer with customer's id
    public CustomerEntities findCustomerById(int customerId){
        CustomerEntities customerEntities = null;
        String sql = "SELECT * FROM customers WHERE customer_id = "+ customerId;
        Connection con = null;
        try {
            con = DBUtils.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                customerEntities = new CustomerEntities();
                customerEntities.setCustomerId(rs.getInt("customer_id"));
                customerEntities.setCustomerName(rs.getString("customer_name"));
                customerEntities.setAddress(rs.getString("address"));
                customerEntities.setTel(rs.getString("tel"));
                customerEntities.setFax(rs.getString("fax"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customerEntities;
    }
}
