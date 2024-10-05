	package model.DAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import config.ConnectionSQL;
import model.entities.Client;

public class ClientDAO {
	
	public static String getClientNameById(int clientId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String clientName = null;

        try {
            connection = ConnectionSQL.getConnection();
            String query = "SELECT fullname FROM client WHERE clientID = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, clientId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                clientName = resultSet.getString("fullname");
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

        return clientName;
    }
	
	
	public static void insert(String user, String password, String repass, String money, String fullname,
			String address, String phone, int isSell, int isAdmin) {
		try {
			Connection connection = ConnectionSQL.getConnection();
			PreparedStatement stm = connection.prepareStatement(
					"INSERT INTO client (user, pass, repass, money, fullname, address, phone, isSell, isAdmin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
			stm.setString(1, user);
			stm.setString(2, password);
			stm.setString(3, repass);
			stm.setString(4, money);
			stm.setString(5, fullname);
			stm.setString(6, address);
			stm.setString(7, phone);
			stm.setInt(8, isSell);
			stm.setInt(9, isAdmin);
			stm.executeUpdate();
			stm.close();
			connection.close();
			System.out.println("Add client into database succeeded!");
		} catch (SQLException e) {
			System.out.println("Add client into database failed!");
			e.printStackTrace();
		}
	}

	public static ArrayList<Client> findAll() {
		try {
			ArrayList<Client> clientList = new ArrayList<Client>();
			Connection connection = ConnectionSQL.getConnection();
			Statement stm = connection.createStatement();
			ResultSet rs = stm.executeQuery("SELECT * FROM client");
			while (rs.next()) {
				clientList.add(new Client(rs.getInt("clientID"), rs.getString("user"), rs.getString("pass"),
						rs.getString("repass"), rs.getString("money"), rs.getString("fullname"),
						rs.getString("address"), rs.getString("phone"), rs.getInt("isSell"), rs.getInt("isAdmin")));
			}
			System.out.println("Get client database succeeded!");
			connection.close();
			return clientList;
		} catch (SQLException e) {
			System.out.println("Get client database failed!");
			e.printStackTrace();
		}
		return null;
	}

	public static Client findByClientId(int clientID) {
		try {
			Connection connection = ConnectionSQL.getConnection();
			PreparedStatement stm = connection.prepareStatement("SELECT * FROM client WHERE clientID = ?");
			stm.setInt(1, clientID);
			ResultSet rs = stm.executeQuery();
			System.out.println("Get client database succeeded!");
			if (rs.next()) {
				return new Client(rs.getInt("clientID"), rs.getString("user"), rs.getString("pass"),
						rs.getString("repass"), rs.getString("money"), rs.getString("fullname"),
						rs.getString("address"), rs.getString("phone"), rs.getInt("isSell"), rs.getInt("isAdmin"));
			}
			connection.close();
		} catch (SQLException e) {
			System.out.println("Get client database failed!");
			e.printStackTrace();
		}
		return null;
	}

	public static Client findByUserAndPass(String user, String pass) {
		try {
			Connection connection = ConnectionSQL.getConnection();
			PreparedStatement stm = connection.prepareStatement("SELECT * FROM client WHERE user = ? AND pass = ?");
			stm.setString(1, user);
			stm.setString(2, pass);
			ResultSet rs = stm.executeQuery();
			if (rs.next()) {
				return new Client(rs.getInt("clientID"), rs.getString("user"), rs.getString("pass"),
						rs.getString("repass"), rs.getString("money"), rs.getString("fullname"),
						rs.getString("address"), rs.getString("phone"), rs.getInt("isSell"), rs.getInt("isAdmin"));
			}
			System.out.println("Get client database succeeded!");
			connection.close();
		} catch (SQLException e) {
			System.out.println("Get client database failed!");
			e.printStackTrace();
		}
		return null;
	}

	public static void updateByClientId(String user, String pass, String repass, String money, String fullname,
			String address, String phone, int isAdmin, int clientId) {
		try {
			Connection connection = ConnectionSQL.getConnection();
			PreparedStatement stm = connection.prepareStatement(
					"UPDATE client SET user = ?, pass = ?, repass = ?, money = ?, fullname = ?, address = ?, phone = ?, isAdmin = ? WHERE clientID = ?");
			stm.setString(1, user);
			stm.setString(2, pass);
			stm.setString(3, repass);
			stm.setString(4, money);
			stm.setString(5, fullname);
			stm.setString(6, address);
			stm.setString(7, phone);
			stm.setInt(8, isAdmin);
			stm.setInt(9, clientId);
			stm.executeUpdate();
			connection.close();
			System.out.println("Update account in database succeeded!");
		} catch (SQLException e) {
			System.out.println("Update account in database failed!");
			e.printStackTrace();
		}
	}

	public static void decreaseMoneyByClientId(long money, int clientID) {
		try {
			Connection connection = ConnectionSQL.getConnection();
			PreparedStatement stm = connection
					.prepareStatement("UPDATE client SET money = money - ? WHERE clientID = ?");
			stm.setLong(1, money);
			stm.setInt(2, clientID);
			stm.executeUpdate();
			connection.close();
			System.out.println("Delete cart in database succeeded!");
		} catch (SQLException e) {
			System.out.println("Delete cart in database failed!");
			e.printStackTrace();
		}
	}
	  
    public static boolean updatePasswordByUsername(String username, String newPassword) {
        try {
            Connection connection = ConnectionSQL.getConnection();
            PreparedStatement stm = connection.prepareStatement(
                    "UPDATE client SET pass = ? WHERE user = ?");
            stm.setString(1, newPassword);
            stm.setString(2, username);
            int rowsAffected = stm.executeUpdate();
            connection.close();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Update password in database failed!");
            e.printStackTrace();
            return false;
        }
    }
    
		public static String  findPassByUser(String user) {
			  try {
		            Connection connection = ConnectionSQL.getConnection();
		            PreparedStatement stm = connection.prepareStatement("SELECT pass FROM client WHERE user = ?");
		            stm.setString(1, user);
		            ResultSet rs = stm.executeQuery();
		            if (rs.next()) {
		                String password = rs.getString("pass");
		                connection.close();
		                return password;
		            }
		            connection.close();
		        } catch (SQLException e) {
		            System.out.println("Get password by username from database failed!");
		            e.printStackTrace();
		        }
		        return null;
		    }
}
