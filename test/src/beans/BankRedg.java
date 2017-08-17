package beans;

import java.util.Random;

public class BankRedg {

	private String firstname;
	private String lastname;
	private String email;
	private String password;
	private String phone;
	private String address;
	private String pincode;
	private String OpeningBalance;
	public String AccountNumber;
	public int amount;
	public String Acc_no;
	
	char x,y;
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getOpeningBalance() {
		return OpeningBalance;
	}
	public void setOpeningBalance(String OpeningBalance) {
		this.OpeningBalance = OpeningBalance;
	}
	public void setAccountNumber(String AccountNumber)
	{
		this.AccountNumber=AccountNumber;
	}
	public String getAccountNumber() {
		return AccountNumber;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount=amount;
	}
	public void setAcc_no(String Acc_no)
	{
		this.Acc_no=Acc_no;
	}
	public String getAcc_no() {
		return Acc_no;
	}
	
	}
