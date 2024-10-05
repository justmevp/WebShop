//package model.DAOs;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.util.ArrayList;
//
//import config.ConnectionSQL;
//import model.entities.Shop;
//
//public class OwnerShopDAO {
//	public static void insert(String user, String pass, String nameShop, String avatar) {
//		try {
//			Connection connection = ConnectionSQL.getConnection();
//			PreparedStatement stm = connection.prepareStatement(
//					"INSERT INTO shop (user, pass, nameShop, numFollower, urlAvatar, isSell, isAdmin) VALUES (?, ?, ?, ?, ?, ?, ?)");
//			stm.setString(1, user);
//			stm.setString(2, pass);
//			stm.setString(3, nameShop);
//			stm.setString(4, "0");
//			stm.setString(5, avatar);
//			stm.setInt(6, 1); // Set isSell = 1 for shop
//			stm.setInt(7, 0); // Set isAdmin = 0 for shop
//			stm.executeUpdate();
//			System.out.println("Create new shop into database successed!");
//			connection.close();
//			stm.close();
//		} catch (SQLException e) {
//			System.out.println("Create new shop into database failed!");
//			e.printStackTrace();
//		}
//	}
//
//	public static ArrayList<Shop> findAll() {
//		ArrayList<Shop> shopList = new ArrayList<>();
//		try {
//			Connection connection = ConnectionSQL.getConnection();
//			Statement stm = connection.createStatement();
//			ResultSet rs = stm.executeQuery("SELECT * FROM shop");
//			while (rs.next()) {
//				shopList.add(new Shop(rs.getInt("shopID"), rs.getString("user"), rs.getString("pass"),
//						rs.getString("nameShop"), rs.getString("numFollower"), rs.getString("urlAvatar"),
//						rs.getInt("isSell"), rs.getInt("isAdmin")));
//			}
//			System.out.println("Get shops from database successed!");
//			connection.close();
//			stm.close();
//		} catch (SQLException e) {
//			System.out.println("Get shops from database failed!");
//			e.printStackTrace();
//		}
//		return shopList;
//	}
//
//	public static Shop findByShopId(int shopID) {
//		Shop shop = null;
//		try {
//			Connection connection = ConnectionSQL.getConnection();
//			Statement stm = connection.createStatement();
//			ResultSet rs = stm.executeQuery(String.format("SELECT * FROM shop WHERE shopID=%d", shopID));
//			if (rs.next()) {
//				shop = new Shop(rs.getInt("shopID"), rs.getString("user"), rs.getString("pass"),
//						rs.getString("nameShop"), rs.getString("numFollower"), rs.getString("urlAvatar"),
//						rs.getInt("isSell"), rs.getInt("isAdmin"));
//			}
//			System.out.println("Get a shop from database successed!");
//			connection.close();
//			stm.close();
//		} catch (SQLException e) {
//			System.out.println("Get a shop from database failed!");
//			e.printStackTrace();
//		}
//		return shop;
//	}
//
//	public static Shop findByUserAndPass(String user, String pass) {
//		Shop shop = null;
//		try {
//			Connection connection = ConnectionSQL.getConnection();
//			Statement stm = connection.createStatement();
//			ResultSet rs = stm
//					.executeQuery(String.format("SELECT * FROM shop WHERE user=\"%s\" AND pass=\"%s\"", user, pass));
//			if (rs.next()) {
//				shop = new Shop(rs.getInt("shopID"), rs.getString("user"), rs.getString("pass"),
//						rs.getString("nameShop"), rs.getString("numFollower"), rs.getString("urlAvatar"),
//						rs.getInt("isSell"), rs.getInt("isAdmin"));
//			}
//			System.out.println("Get a shop from database successed!");
//			connection.close();
//			stm.close();
//		} catch (SQLException e) {
//			System.out.println("Get a shop from database failed!");
//			e.printStackTrace();
//		}
//		return shop;
//	}
//}
