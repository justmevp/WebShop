package model.DAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import config.ConnectionSQL;
import model.entities.Product;
import model.entities.Cart;

public class ProductDAO {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public ProductDAO(Connection con) {
		super();
		this.con = con;
	}

	
	// New method to get 3 random products with specific category ID
	  public static ArrayList<Product> findRandomByCategoryId(int categoryId, int limit) {
	    try {
	      ArrayList<Product> productList = new ArrayList<>();
	      Connection connection = ConnectionSQL.getConnection();

	      // Use LIMIT clause to get a random sample of products
	      String sql = "SELECT * FROM product WHERE cateID = ? ORDER BY RAND() LIMIT ?";
	      PreparedStatement stm = connection.prepareStatement(sql);
	      stm.setInt(1, categoryId);
	      stm.setInt(2, limit); // Set limit to 3

	      ResultSet rs = stm.executeQuery();
	      while (rs.next()) {
	        productList.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
	                rs.getDouble("price"), rs.getString("title"), rs.getString("description")));
	      }
	      System.out.println("Get random products by category database successed!");
	      connection.close();
	      return productList;
	    } catch (SQLException e) {
	      System.out.println("Get random products by category database failed!");
	      e.printStackTrace();
	    }

	    return null;
	  }
	
	public static List<Product> getSortedProducts(int cateID, String sortOrder, double maxPrice, String search, String memoryOption, String screenSize, String screenType) {
	    List<Product> productList = new ArrayList<>();
	    String query = "SELECT * FROM product WHERE cateID = ?";
	    
	    try (Connection connection = ConnectionSQL.getConnection()) {
	        StringBuilder queryBuilder = new StringBuilder(query);
	        
	        if (maxPrice > 0) {
	            queryBuilder.append(" AND price <= ?");
	        }
	        if (search != null && !search.isEmpty()) {
	            queryBuilder.append(" AND name LIKE ?");
	        }
	        if (memoryOption != null && !memoryOption.isEmpty()) {
	            switch (memoryOption) {
	                case "32-64":
	                    queryBuilder.append(" AND (name LIKE '%32GB%' OR name LIKE '%64GB%')");
	                    break;
	                case "128-256":
	                    queryBuilder.append(" AND (name LIKE '%128GB%' OR name LIKE '%256GB%')");
	                    break;
	                case "512+":
	                    queryBuilder.append(" AND (name LIKE '%512GB%' OR name LIKE '%1TB%')");
	                    break;
	            }
	        }
	        if (screenSize != null && !screenSize.isEmpty()) {
	            switch (screenSize) {
	                case "6+":
	                    queryBuilder.append(" AND specification LIKE '%<td>6.% inches</td>%'");
	                    break;
	                case "-6":
	                    queryBuilder.append(" AND specification LIKE '%<6 inch%'");
	                    break;
	            }
	        }
	        if (screenType != null && !screenType.isEmpty()) {
	            queryBuilder.append(" AND specification LIKE ?");
	        }
	        
	        switch (sortOrder) {
	            case "bestseller":
	                queryBuilder.append(" ORDER BY (SELECT SUM(o_quantity) FROM orders WHERE p_id = product.id) DESC");
	                break;
	            case "newest":
	                queryBuilder.append(" ORDER BY added_date DESC");
	                break;
	            case "priceLowToHigh":
	                queryBuilder.append(" ORDER BY price ASC");
	                break;
	            case "priceHighToLow":
	                queryBuilder.append(" ORDER BY price DESC");
	                break;
	        }

	        PreparedStatement preparedStatement = connection.prepareStatement(queryBuilder.toString());
	        preparedStatement.setInt(1, cateID);

	        int parameterIndex = 2;
	        if (maxPrice > 0) {
	            preparedStatement.setDouble(parameterIndex++, maxPrice);
	        }
	        if (search != null && !search.isEmpty()) {
	            preparedStatement.setString(parameterIndex++, "%" + search + "%");
	        }
	        if (screenType != null && !screenType.isEmpty()) {
	            preparedStatement.setString(parameterIndex++, "%" + screenType + "%");
	        }

	        ResultSet resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            Product product = new Product(
	                    resultSet.getInt("id"),
	                    resultSet.getString("name"),
	                    resultSet.getString("image"),
	                    resultSet.getDouble("price"),
	                    resultSet.getString("title"),
	                    resultSet.getString("description"),
	                    resultSet.getTimestamp("added_date"),
	                    resultSet.getString("specification")
	            );
	            productList.add(product);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return productList;
	}






	
	public static ArrayList<Product> filterProducts(int categoryId, double maxPrice, String search, String memoryOption, String screenSize, String screenType) {
	    try {
	        ArrayList<Product> productList = new ArrayList<>();
	        Connection connection = ConnectionSQL.getConnection();
	        StringBuilder queryBuilder = new StringBuilder("SELECT * FROM product WHERE cateID = ?");

	        // Xây dựng câu truy vấn dựa trên các điều kiện lọc
	        if (maxPrice > 0) {
	            queryBuilder.append(" AND price <= ?");
	        }
	        if (search != null && !search.isEmpty()) {
	            queryBuilder.append(" AND name LIKE ?");
	        }
	        if (memoryOption != null && !memoryOption.isEmpty()) {
	            // Thêm điều kiện lọc bộ nhớ vào câu truy vấn
	            switch (memoryOption) {
	                case "32-64":
	                    queryBuilder.append(" AND (name LIKE '%32GB%' OR name LIKE '%64GB%')");
	                    break;
	                case "128-256":
	                    queryBuilder.append(" AND (name LIKE '%128GB%' OR name LIKE '%256GB%')");
	                    break;
	                case "512+":
	                    queryBuilder.append(" AND (name LIKE '%512GB%' OR name LIKE '%1TB%')");
	                    break;
	            }
	        }
	        if (screenSize != null && !screenSize.isEmpty()) {
	            switch (screenSize) {
	                case "6+":
	                    queryBuilder.append(" AND specification LIKE '%<td>6.% inches</td>%'");
	                    break;
	                case "-6":
	                    queryBuilder.append(" AND (specification LIKE '%<td>5.% inches</td>%' OR specification LIKE '%<td>4.% inches</td>%')");
	                    break;
	            }
	        }
	        if (screenType != null && !screenType.isEmpty()) {
	            // Thêm điều kiện lọc kiểu màn hình vào câu truy vấn
	            queryBuilder.append(" AND specification LIKE ?");
	        }

	        PreparedStatement stm = connection.prepareStatement(queryBuilder.toString());
	        stm.setInt(1, categoryId);

	        // Thiết lập các tham số cho truy vấn
	        int parameterIndex = 2; // Bắt đầu từ vị trí tham số thứ 2 trong câu truy vấn
	        if (maxPrice > 0) {
	            stm.setDouble(parameterIndex++, maxPrice);
	        }
	        if (search != null && !search.isEmpty()) {
	            stm.setString(parameterIndex++, "%" + search + "%");
	        }
	        if (screenType != null && !screenType.isEmpty()) {
	            stm.setString(parameterIndex++, "%" + screenType + "%");
	        }

	        ResultSet rs = stm.executeQuery();

	        // Duyệt kết quả và thêm vào danh sách sản phẩm
	        while (rs.next()) {
	            productList.add(new Product(
	                rs.getInt("id"),
	                rs.getString("name"),
	                rs.getString("image"),
	                rs.getDouble("price"),
	                rs.getString("title"),
	                rs.getString("description")
	            ));
	        }

	        System.out.println("Get products by filter successed!");
	        connection.close();
	        return productList;
	    } catch (SQLException e) {
	        System.out.println("Get products by filter failed!");
	        e.printStackTrace();
	    }

	    return null;
	}





	public static ArrayList<Product> getDiscountedPhones(int categoryId) {
		ArrayList<Product> discountedPhones = new ArrayList<>();
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {
			connection = ConnectionSQL.getConnection();
			String query = "SELECT * FROM product WHERE cateID = ? AND salePrice > 0";
			statement = connection.prepareStatement(query);
			// Điền categoryId của iPhone vào đây nếu có
			statement.setInt(1, categoryId);
			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				String image = resultSet.getString("image");
				double price = resultSet.getDouble("price");
				double salePrice = resultSet.getDouble("salePrice");
				Product product = new Product(id, name, image, price, salePrice);
				discountedPhones.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (statement != null) {
					statement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return discountedPhones;
	}

	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		List<Cart> productList = new ArrayList<>();
		try {
			if (!cartList.isEmpty()) {
				for (Cart item : cartList) {
					query = "SELECT * FROM product WHERE id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {
						Cart cart = new Cart();
						cart.setId(rs.getInt("id"));
						cart.setName(rs.getString("name"));
						cart.setImage(rs.getString("image"));
						cart.setPrice(rs.getDouble("price") * item.getQuantity());
						cart.setQuantity(item.getQuantity());
						productList.add(cart);
					}

				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return productList;
	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "select price from product where id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {
						sum += rs.getDouble("price") * item.getQuantity();
					}

				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return sum;
	}

	public Product getSingleProduct(int id) {
		Product row = null;
		try {
			query = "select * from products where id=? ";

			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCateID(rs.getInt("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return row;
	}

	public static ArrayList<Product> getProductsByMemory(String memoryOption, int categoryID) {
		ArrayList<Product> allProducts = findByCategoryId(categoryID); // Giả sử là phương thức lấy sản phẩm theo
																		// categoryID
		ArrayList<Product> filteredProducts = new ArrayList<>();

		for (Product product : allProducts) {
			String productName = product.getName().toUpperCase(); // Chuyển tên sản phẩm thành chữ hoa để so sánh

			switch (memoryOption) {
			case "512+":
				if (productName.contains("512GB") || productName.contains("1TB")) {
					filteredProducts.add(product);
				}
				break;
			case "128-256":
				if (productName.contains("128GB") || productName.contains("256GB")) {
					filteredProducts.add(product);
				}
				break;
			case "32-64":
				if (productName.contains("32GB") || productName.contains("64GB")) {
					filteredProducts.add(product);
				}
				break;
			}
		}

		return filteredProducts;
	}

	public static ArrayList<Product> getNewestProductsByCategory(int categoryId) {
		// Lấy ra tất cả các sản phẩm từ cơ sở dữ liệu thuộc danh mục categoryId
		ArrayList<Product> allProductsInCategory = findByCategoryId(categoryId);

		// Sắp xếp danh sách sản phẩm theo thời gian thêm mới nhất
		allProductsInCategory.sort((p1, p2) -> p2.getId() - p1.getId()); // Sắp xếp giảm dần theo ID để lấy sản phẩm mới
																			// nhất đầu tiên

		// Tạo danh sách chứa 5 sản phẩm mới nhất trong danh mục đó
		ArrayList<Product> newestProducts = new ArrayList<>();
		int count = 0;
		for (Product product : allProductsInCategory) {
			if (count >= 5) {
				break; // Đã lấy đủ 5 sản phẩm mới nhất
			}
			newestProducts.add(product);
			count++;
		}

		return newestProducts;
	}

	public static ArrayList<Product> getProductsByCategoryAndPrice(int categoryId, double maxPrice) {
		try {
			ArrayList<Product> productList = new ArrayList<>();
			Connection connection = ConnectionSQL.getConnection();
			PreparedStatement stm = connection
					.prepareStatement("SELECT * FROM product WHERE cateID = ? and price <= ? ");
			stm.setInt(1, categoryId);
			stm.setDouble(2, maxPrice);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				productList.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
						rs.getDouble("price"), rs.getString("title"), rs.getString("description")));
			}
			System.out.println("Get products by category database successed!");
			connection.close();
			return productList;
		} catch (SQLException e) {
			System.out.println("Get products by category database failed!");
			e.printStackTrace();
		}

		return null;
	}

	// Phương thức truy vấn tất cả các sản phẩm từ cơ sở dữ liệu
	public static ArrayList<Product> findAll() {
		try {
			ArrayList<Product> productList = new ArrayList<>();
			Connection connection = ConnectionSQL.getConnection();
			Statement stm = connection.createStatement();
			ResultSet rs = stm.executeQuery("SELECT * FROM product");
			while (rs.next()) {
				productList.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
						rs.getDouble("price"), rs.getString("title"), rs.getString("description")));
			}

			System.out.println("Get product list database successed!");
			connection.close();
			return productList;
		} catch (SQLException e) {
			System.out.println("Get product list database failed!");
			e.printStackTrace();
		}

		return null;
	}

	// Phương thức truy vấn sản phẩm dựa trên ID cửa hàng
	public static ArrayList<Product> getProductBySellID(int id) {
		try {
			ArrayList<Product> productList = new ArrayList<>();
			Connection connection = ConnectionSQL.getConnection();
			PreparedStatement stm = connection.prepareStatement("SELECT * FROM product WHERE sell_ID = ?");
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				productList.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
						rs.getDouble("price"), rs.getString("title"), rs.getString("description")));
			}
			System.out.println("Get product list of shop database successed!");
			connection.close();
			return productList;
		} catch (SQLException e) {
			System.out.println("Get product list of shop database failed!");
			e.printStackTrace();
		}

		return null;
	}

	// Phương thức truy vấn sản phẩm dựa trên từ khóa tìm kiếm
	public static ArrayList<Product> findLikeProduct(String key) {
		try {
			// Khởi tạo danh sách sản phẩm
			ArrayList<Product> productList = new ArrayList<>();

			// Kết nối đến cơ sở dữ liệu
			Connection connection = ConnectionSQL.getConnection();

			// Tạo câu truy vấn SQL để lấy các sản phẩm có tên chứa từ khóa tìm kiếm
			PreparedStatement stm = connection.prepareStatement("SELECT * FROM product WHERE name LIKE ?");

			// Thiết lập tham số cho câu truy vấn SQL
			stm.setString(1, "%" + key + "%");

			// Thực thi câu truy vấn và lấy kết quả
			ResultSet rs = stm.executeQuery();

			// Duyệt qua kết quả và thêm các sản phẩm vào danh sách
			while (rs.next()) {
				productList.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
						rs.getDouble("price"), rs.getString("title"), rs.getString("description")));
			}

			// In ra thông báo thành công
			System.out.println("Get product list of shop database successed!");

			// Đóng kết nối đến cơ sở dữ liệu
			connection.close();

			// Trả về danh sách sản phẩm
			return productList;
		} catch (SQLException e) {
			// In ra thông báo lỗi nếu có lỗi xảy ra và in ra stack trace
			System.out.println("Get product list of shop database failed!");
			e.printStackTrace();
		}

		// Trả về null nếu có lỗi xảy ra
		return null;
	}

	// Phương thức truy vấn sản phẩm dựa trên ID sản phẩm
	public static Product findByProductId(int productId) {
		try {
			Product product = null;
			Connection connection = ConnectionSQL.getConnection();
			PreparedStatement stm = connection.prepareStatement("SELECT * FROM product WHERE id = ?");
			stm.setInt(1, productId);
			ResultSet rs = stm.executeQuery();
			if (rs.next()) {
				product = new Product(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
						rs.getDouble("price"), rs.getString("title"), rs.getString("description"),
						rs.getDouble("salePrice"), rs.getString("image1"), rs.getString("image2"),
						rs.getString("image3"), rs.getString("specification"));

			}
			System.out.println("Get a product database successed!");
			connection.close();
			return product;
		} catch (SQLException e) {
			System.out.println("Get a product database failed!");
			e.printStackTrace();
		}

		return null;
	}

	// Phương thức chèn mới một sản phẩm vào cơ sở dữ liệu
	public static void insert(String name, String image, double price, String title, String description, int cateID,
			int sellID) {
		try {
			Connection connection = ConnectionSQL.getConnection();
			PreparedStatement stm = connection.prepareStatement(
					"INSERT INTO product(name, image, price, title, description, cateID, sell_ID) VALUES (?, ?, ?, ?, ?, ?, ?)");
			stm.setString(1, name);
			stm.setString(2, image);
			stm.setDouble(3, price);
			stm.setString(4, title);
			stm.setString(5, description);
			stm.setInt(6, cateID);
			stm.setInt(7, sellID);

			stm.executeUpdate();
			stm.close();
			connection.close();
			System.out.println("Add product into database successed!");
		} catch (SQLException e) {
			System.out.println("Add product into database failed!");
			e.printStackTrace();
		}
	}

	// Phương thức xóa sản phẩm dựa trên ID sản phẩm
	public static void deleteByProductId(int productId) {
		try {
			Connection connection = ConnectionSQL.getConnection();
			PreparedStatement stm = connection.prepareStatement("DELETE FROM product WHERE id = ?");
			stm.setInt(1, productId);
			stm.executeUpdate();
			connection.close();
			System.out.println("Delete a product in database successed!");
		} catch (SQLException e) {
			System.out.println("Delete a product in database failed!");
			e.printStackTrace();
		}
	}

	// Phương thức cập nhật thông tin sản phẩm dựa trên ID sản phẩm
	public static void updateByProductId(int productId, String name, String image, double price, String description,
			int cateID) {
		try {
			Connection connection = ConnectionSQL.getConnection();
			PreparedStatement stm = connection.prepareStatement(
					"UPDATE product SET name = ?, image = ?, price = ?, description = ? , cateID = ? WHERE id = ?");
			stm.setString(1, name);
			stm.setString(2, image);
			stm.setDouble(3, price);
			stm.setString(4, description);
			stm.setInt(5, cateID); // Chuyển đổi vị trí của cateID
			stm.setInt(6, productId); // Chuyển đổi vị trí của productId

			stm.executeUpdate();
			connection.close();
			System.out.println("Update a product in database successed!");
		} catch (SQLException e) {
			System.out.println("Update a product in database failed!");
			e.printStackTrace();
		}
	}

	// Phương thức truy vấn sản phẩm dựa trên ID danh mục
	public static ArrayList<Product> findByCategoryId(int categoryId) {
		try {
			ArrayList<Product> productList = new ArrayList<>();
			Connection connection = ConnectionSQL.getConnection();
			PreparedStatement stm = connection.prepareStatement("SELECT * FROM product WHERE cateID = ?");
			stm.setInt(1, categoryId);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				productList.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
						rs.getDouble("price"), rs.getString("title"), rs.getString("description")));
			}
			System.out.println("Get products by category database successed!");
			connection.close();
			return productList;
		} catch (SQLException e) {
			System.out.println("Get products by category database failed!");
			e.printStackTrace();
		}

		return null;
	}

	public static ArrayList<Product> findProductByNameAndSellID(String name, int sellID) {
		try {
			ArrayList<Product> productList = new ArrayList<>();
			Connection connection = ConnectionSQL.getConnection();
			PreparedStatement stm = connection
					.prepareStatement("SELECT * FROM product WHERE name LIKE ? AND sell_ID = ?");
			stm.setString(1, "%" + name + "%");
			stm.setInt(2, sellID);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				productList.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
						rs.getDouble("price"), rs.getString("title"), rs.getString("description")));
			}
			System.out.println("Get product list by name and sellID from database successed!");
			connection.close();
			return productList;
		} catch (SQLException e) {
			System.out.println("Get product list by name and sellID from database failed!");
			e.printStackTrace();
		}

		return null;
	}

	public List<Product> searchByName(String term) {
		List<Product> list = new ArrayList<>();
		String query = "select * from product\n" + "where [name] like ?";
		try {
			Connection connection = ConnectionSQL.getConnection();// mo ket noi voi sql
			PreparedStatement stm = connection.prepareStatement(query);
			stm.setString(1, "%" + term + "%");
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
		}
		return list;
	}

	
}
