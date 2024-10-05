//package model.entities;
//
//public class Shop {
//	private int id;
//	private String user;
//	private String pass;
//	private String nameShop;
//	private String numFollower;
//	private String urlAvatar;
//	private int isSell;
//	private int isAdmin;
//
//	public Shop(int id, String user, String pass, String nameShop, String numFollower, String urlAvatar, int isSell,
//			int isAdmin) {
//		this.id = id;
//		this.user = user;
//		this.pass = pass;
//		this.nameShop = nameShop;
//		this.numFollower = numFollower;
//		this.urlAvatar = urlAvatar;
//		this.isSell = isSell;
//		this.isAdmin = isAdmin;
//	}
//
//	public Shop(int id, String user, String pass, String nameShop, String urlAvatar, int isSell, int isAdmin) {
//		this.id = id;
//		this.user = user;
//		this.pass = pass;
//		this.nameShop = nameShop;
//		this.urlAvatar = urlAvatar;
//		this.isSell = isSell;
//		this.isAdmin = isAdmin;
//	}
//
//	public int getId() {
//		return id;
//	}
//
//	public void setId(int id) {
//		this.id = id;
//	}
//
//	public String getUser() {
//		return user;
//	}
//
//	public void setUser(String user) {
//		this.user = user;
//	}
//
//	public String getPass() {
//		return pass;
//	}
//
//	public void setPass(String pass) {
//		this.pass = pass;
//	}
//
//	public String getNameShop() {
//		return nameShop;
//	}
//
//	public void setNameShop(String nameShop) {
//		this.nameShop = nameShop;
//	}
//
//	public String getNumFollower() {
//		return formNumFollower(Long.parseLong(numFollower));
//	}
//
//	public void setNumFollower(String numFollower) {
//		this.numFollower = numFollower;
//	}
//
//	public String getUrlAvatar() {
//		return urlAvatar;
//	}
//
//	public void setUrlAvatar(String urlAvatar) {
//		this.urlAvatar = urlAvatar;
//	}
//
//	public int getIsSell() {
//		return isSell;
//	}
//
//	public void setIsSell(int isSell) {
//		this.isSell = isSell;
//	}
//
//	public int getIsAdmin() {
//		return isAdmin;
//	}
//
//	public void setIsAdmin(int isAdmin) {
//		this.isAdmin = isAdmin;
//	}
//
//	public String formNumFollower(long amount) {
//		return (amount >= 1000 ? (amount / 100 / 10.0) + "k" : "" + amount).replace('.', ',');
//	}
//}
