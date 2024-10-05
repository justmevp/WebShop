package model.BOs;

import java.sql.PreparedStatement;
import java.util.ArrayList;

import model.DAOs.ClientDAO;
import model.entities.Client;

public class ClientBO {
	public static void addClientToData(Client client) {
		ClientDAO.insert(client.getUser(), client.getPassword(), client.getRepass(), client.getMoney(),
				client.getFullName(), client.getAddress(), client.getPhone(), client.getIsSell(), client.getIsAdmin());
	}

	public static ArrayList<Client> getClients() {
		return ClientDAO.findAll();
	}

	public static Client getClientById(int clientID) {
		return ClientDAO.findByClientId(clientID);
	}

	public static Client getAccesser(String user, String pass) {
		return ClientDAO.findByUserAndPass(user, pass);
	}

	public static void updateAccountInData(Client client) {
		ClientDAO.updateByClientId(client.getUser(), client.getPassword(), client.getRepass(), client.getMoney(),
				client.getFullName(), client.getAddress(), client.getPhone(), client.getIsAdmin(), client.getId());
	}
	public static boolean updatePassword(String username, String newPassword) {
        return ClientDAO.updatePasswordByUsername(username, newPassword);
    }
	public static String  getPassFromUser(String user, String pass) {
		return ClientDAO.findPassByUser(user);
	}
}

