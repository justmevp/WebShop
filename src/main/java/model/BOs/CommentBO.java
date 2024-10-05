package model.BOs;

import java.util.ArrayList;

import model.DAOs.ReviewDAO;

import model.entities.Review;

public class CommentBO {
	public static ArrayList<Review> getCommentsByProductID(int productID) {

		return ReviewDAO.findByProductID(productID);

	}

	public static void addCommentToData(Review comment) {
		ReviewDAO.insert(comment.getComment(), comment.getClientID(), comment.getProductID());
	}
}
