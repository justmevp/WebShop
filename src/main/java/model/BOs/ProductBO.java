package model.BOs;

import java.util.ArrayList;
import java.util.List;

import model.DAOs.ProductDAO;
import model.entities.Category;
import model.entities.Product;

public class ProductBO {
	public static ArrayList<Product> getProductFromData() {
		return ProductDAO.findAll();
	}

	public static Product getProductByID(int productID) {
		return ProductDAO.findByProductId(productID);
	}

	public static ArrayList<Product> getProductBySellID(int id) {
		return ProductDAO.getProductBySellID(id);
	}

	public static void addProductToData(Product product) {
		ProductDAO.insert(product.getName(), product.getImage(), product.getPrice(), product.getTitle(),
				product.getDescription(), product.getCateID(), product.getSellID());
	}

	public static void deleteProductInData(int productID) {
		ProductDAO.deleteByProductId(productID);
	}

	public static void updateProductInData(Product product) {
		ProductDAO.updateByProductId(product.getId(), product.getName(), product.getImage(), product.getPrice(),
				product.getDescription(), product.getCateID());
	}

	public static ArrayList<Product> getProductsByCategory(int categoryID) {
		return ProductDAO.findByCategoryId(categoryID);
	}

	public static ArrayList<Product> searchProducts(String key) {
		return ProductDAO.findLikeProduct(key);
	}

	public static List<Product> searchProducy(String key) {
		return ProductDAO.findLikeProduct(key);
	}

	public static ArrayList<Product> getProductsByCategoryAndPrice(int cateID, double maxPrice) {
		return ProductDAO.getProductsByCategoryAndPrice(cateID, maxPrice);
	}

	public static ArrayList<Product> getProductsByMemory(String memoryOption, int category) {
		return ProductDAO.getProductsByMemory(memoryOption, category);
	}

	public static ArrayList<Product> getNewestProductsByCategory(int categoryId) {
	    return ProductDAO.getNewestProductsByCategory(categoryId);
	}
	


}
