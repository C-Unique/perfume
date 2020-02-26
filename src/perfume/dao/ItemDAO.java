package perfume.dao;

import perfume.entity.Item;
import perfume.util.DBHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {

    public static void main(String[] args) {
        ItemDAO itemDAO = new ItemDAO();
        List<Item> allItems = itemDAO.getAllItems();
        for (Item allItem : allItems) {
            System.out.println(allItem.getName());
        }
    }

    //获得所有的商品信息
    public List<Item> getAllItems() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Item> items = new ArrayList<>(); // 商品集合
        try {
            connection = DBHelper.getConnection();
            String sql = "select * from perfume;";//SQL语句
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                items.add(dealItem(resultSet));
            }
            return items;//返回集合
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                //释放数据集对象
                finallyAction(resultSet,preparedStatement,connection);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

    }
    public void finallyAction(ResultSet resultSet,PreparedStatement preparedStatement,Connection connection) throws SQLException {
        if (resultSet != null) {

            resultSet.close();
            resultSet = null;
        }
        //释放语句对象
        if(preparedStatement != null){

            preparedStatement.close();
            preparedStatement = null;
        }
        if(connection!=null){
            connection.close();
            connection = null;
        }


    }

    public Item dealItem(ResultSet resultSet) throws SQLException {

            Item item = new Item();
            item.setId(resultSet.getInt("id"));
            item.setBrand(resultSet.getString("brand"));
            item.setDesc(resultSet.getString("desc"));
            item.setEngname(resultSet.getString("engname"));
            item.setName(resultSet.getString("name"));
            item.setPhoto(resultSet.getString("photo"));
            item.setPrice(resultSet.getDouble("price"));
            item.setStock(resultSet.getInt("stock"));
            return item;

    }

    //根据商品id获取商品资料
    public Item getItemById(int id){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DBHelper.getConnection();
            String sql = "select * from perfume  where id = ?;";//SQL语句
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {

                return dealItem(resultSet);
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                finallyAction(resultSet,preparedStatement,connection);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }
}
