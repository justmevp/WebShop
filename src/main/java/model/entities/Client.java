package model.entities;

public class Client {
	private int id;
	private String user;
	private String password;
	private String repass;
	private String money;
	private String fullName;
	private String address;
	private String phone;
	private int isSell;
	private int isAdmin;

	public Client(int id, String user, String password, String repass, String money, String fullName, String address,
			String phone, int isSell, int isAdmin) {
		this.id = id;
		this.user = user;
		this.password = password;
		this.repass = repass;
		this.money = money;
		this.fullName = fullName;
		this.address = address;
		this.phone = phone;
		this.isSell = isSell;
		this.isAdmin = isAdmin;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepass() {
		return repass;
	}

	public void setRepass(String repass) {
		this.repass = repass;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getIsSell() {
		return isSell;
	}

	public void setIsSell(int isSell) {
		this.isSell = isSell;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

	@Override
	public String toString() {
		return "Client [id=" + id + ", user=" + user + ", password=" + password + ", repass=" + repass + ", money="
				+ money + ", fullName=" + fullName + ", address=" + address + ", phone=" + phone + "]";
	}
}
