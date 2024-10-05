package model.BOs;

import java.util.ArrayList;

import model.DAOs.CategoryDAO;
import model.entities.Category;

public class CategoryBO {
	public static String getCategory(int cid) {

		return CategoryDAO.findByCategoryId(cid);
	}

	public static ArrayList<Category> getCategorysInData() {

		return CategoryDAO.findAll();
	}
}
