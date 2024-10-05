package model.entities;

import java.sql.Timestamp;
import java.util.Random;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author trinh
 */
public class Product {

	private int id;
	private String name;
	private String image;
	private String image1;
	private String image2;
	private String image3;

	private double price;
	private String title;
	private String description;
	private int cateID;
	private int sellID;
	private double salePrice;
	private String specification;
	private Timestamp addedDate;

	public Product() {
	}

	public Product(int id, String name, String image, double price, String title, String description) {
		this.id = id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.title = title;
		this.description = description;
	}

	public Product(int id, String name, String image, double price, double salePrice) {
		this.id = id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.salePrice = salePrice;

	}

	public Product(int id, String name, String image, double price, String title, String description, double salePrice,
			String image1, String image2, String image3, String specification) {
		this.id = id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.salePrice = salePrice;
		this.title = title;
		this.description = description;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.specification = specification;

	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public Product(int id, String name, String image, double price, String title, String description, int cateID,
			int sellID) {
		this.id = id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.title = title;
		this.description = description;
		this.cateID = cateID;
		this.sellID = sellID;
	}

	public Product(int id, String name, String image, double price, String description, int cateID, int sellID) {
		this.id = id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.description = description;
		this.cateID = cateID;
		this.sellID = sellID;
	}

	public Product(int id, String name, String image, double price, String description, int cateID) {
		this.id = id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.description = description;
		this.cateID = cateID;
		this.sellID = sellID;
	}
	public Product(int id, String name, String image, double price,String title, String description, Timestamp addedDate, String specification)		 {
		this.id = id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.description = description;
		this.title=title;
		this.specification=specification;
		this.addedDate=addedDate;
	}

	public int getId() {
		return id;
	}

	public int getCateID() {
		return cateID;
	}

	public void setCateID(int cateID) {
		this.cateID = cateID;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSellID() {
		return sellID;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public void setSellID(int sellID) {
		this.sellID = sellID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(double salePrice) {
		this.salePrice = salePrice;
	}

	public Timestamp getAddedDate() {
		return addedDate;
	}

	public void setAddedDate(Timestamp addedDate) {
		this.addedDate = addedDate;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", image=" + image + ", price=" + price + ", title=" + title
				+ ", description=" + description + ", cateID=" + cateID + ", sellID=" + sellID + "]";
	}

}