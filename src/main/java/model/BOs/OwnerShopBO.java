//package model.BOs;
//
//import java.util.ArrayList;
//
//import model.DAOs.ClientBO;
//import model.DAOs.ClientDAO;
//import model.entities.Client;
//
//public class OwnerShopBO {
//	public static void addShopToData(Client client) {
//		ClientDAO.insert(client.getUser(), client.getPass(), client.getNameShop(), client.getUrlAvatar());
//	}
//
//	public static ArrayList<Client> getShops() {
//		return ClientDAO.findAll();
//	}
//
//	public static Client getShopByID(int id) {
//
//		return ClientDAO.findByClientId(id);
//	}
//
//	public static Client getAccesser(String user, String pass) {
//		return ClientDAO.findByUserAndPass(user, pass);
//
//	}
//}
