package persistent_layer.dao;

import Utils.DBUtils;
import persistent_layer.entities.OrderEntities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    // Find Order by Customer Id
    public List<OrderEntities> findOderById(int custormerId){
        List<OrderEntities> result = new ArrayList<OrderEntities>();
        OrderEntities orderEntities = null;
        String sql = "SELECT *  FROM orders o JOIN contacts c ON o.contact_id = c.contact_id WHERE c.customer_id =? ORDER BY o.update_date DESC";
        Connection con = null;
        try {
            con = DBUtils.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, custormerId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                orderEntities = new OrderEntities();
                orderEntities.setOrderNumber(rs.getInt("order_number"));
                orderEntities.setContactId(rs.getInt("contact_id"));
                orderEntities.setCreateDate(rs.getDate("create_date").toString());
                orderEntities.setUpdateDate(rs.getDate("update_date").toString());
                orderEntities.setStatus(rs.getString("status"));
                result.add(orderEntities);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    // Find equipment
    public List<OrderEntities> findEquipment(int custormerId){
        List<OrderEntities> result = new ArrayList<OrderEntities>();
        OrderEntities orderEntities = null;
        String sql = "SELECT *  FROM orders o JOIN contacts c ON o.contact_id = c.contact_id WHERE o.status = 'shipped' and c.customer_id = ? ORDER BY o.update_date DESC ";
        Connection con = null;
        try {
            con = DBUtils.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, custormerId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                orderEntities = new OrderEntities();
                orderEntities.setOrderNumber(rs.getInt("order_number"));
                orderEntities.setContactId(rs.getInt("contact_id"));
                orderEntities.setCreateDate(rs.getDate("create_date").toString());
                orderEntities.setUpdateDate(rs.getDate("update_date").toString());
                orderEntities.setStatus(rs.getString("status"));
                result.add(orderEntities);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
