package model.DAOs;




import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import model.entities.Order;
import model.entities.Product;
import config.ConnectionSQL;


public class OrderDAO {
	
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    
    public OrderDAO() {
       
    }
	public OrderDAO(Connection con) {
		super();
		this.con = con;
	}
	
	 // Phương thức để lấy các sản phẩm bán chạy nhất theo cateID
    public static List<Product> getBestSellingProductsByCategory(int cateID) {
        List<Product> bestSellingProducts = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = ConnectionSQL.getConnection();
            String query = "SELECT p.*, SUM(o.o_quantity) AS total_quantity " +
                           "FROM orders o " +
                           "JOIN product p ON o.p_id = p.id " +
                           "WHERE p.cateID = ? " +
                           "GROUP BY p.id " +
                           "ORDER BY total_quantity DESC " +
                           "LIMIT 3";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, cateID);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getDouble("price"));
                product.setCateID(resultSet.getInt("cateID"));
                // Thêm các thuộc tính khác của sản phẩm nếu cần
                bestSellingProducts.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return bestSellingProducts;
    }

	
    public static List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = ConnectionSQL.getConnection();
            String query = "SELECT " +
                           "    o.o_id AS order_id, " +
                           "    o.o_date AS order_date, " +
                           "    p.name AS product_name, " +
                           "    p.price AS product_price, " +
                           "    o.o_quantity AS quantity, " +
                           "    (p.price * o.o_quantity) AS total_price, " +
                           "    c.fullname AS buyer_name, " +
                           "    o.address AS address, " +
                           "    o.phone AS phone " +
                           "FROM " +
                           "    orders o " +
                           "JOIN " +
                           "    product p ON o.p_id = p.id " +
                           "JOIN " +
                           "    client c ON o.u_id = c.clientID";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Order order = new Order();
                order.setOrderId(resultSet.getInt("order_id"));
                order.setDate(resultSet.getString("order_date"));
                order.setName(resultSet.getString("product_name"));
                order.setPrice(resultSet.getDouble("product_price"));
                order.setQunatity(resultSet.getInt("quantity"));
                order.setTotalPrice(resultSet.getDouble("total_price"));
                order.setBuyerName(resultSet.getString("buyer_name"));
                order.setAddress(resultSet.getString("address"));
                order.setPhone(resultSet.getString("phone"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return orders;
    }

	
	


	public boolean insertOrder(Order model) {
		boolean result = false;
		try {
			query = "insert into orders (p_id, u_id, o_quantity, o_date, address, phone) values(?,?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, model.getId());
			pst.setInt(2, model.getUid());
			pst.setInt(3, model.getQunatity());
			pst.setString(4, model.getDate());
			pst.setString(5, model.getAddress());
			pst.setString(6, model.getPhone());
			pst.executeUpdate();
			result = true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	

    public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from orders where u_id=? order by orders.o_id desc";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                ProductDAO productDao = new ProductDAO(this.con);
                int pId = rs.getInt("p_id");
                Product product = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getInt("o_id"));
                order.setId(pId);
                order.setName(product.getName());
                order.setCateID(product.getCateID());
                order.setPrice(product.getPrice()*rs.getInt("o_quantity"));
                order.setQunatity(rs.getInt("o_quantity"));
                order.setDate(rs.getString("o_date"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void cancelOrder(int id) {
        //boolean result = false;
        try {
            query = "delete from orders where o_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
}