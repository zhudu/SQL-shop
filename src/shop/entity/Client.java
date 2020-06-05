package shop.entity;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="Client")
public class Client {
	@Id
	@GeneratedValue(generator="Client")
	@GenericGenerator(name="Client",strategy="assigned")
	@Column(name="Cli_no", unique=true)
	private String Cli_no;			//顾客编码
	@Column(name="Cli_name")
	private String Cli_name;		//姓名
	@Column(name="Cli_sex")
	private String Cli_sex;			//性别
	@Column(name="Cli_id")
	private String Cli_id;			//身份证号
	@Column(name="Cli_email")
	private String Cli_email;		//邮箱
	@Column(name="Cli_password")
	private String Cli_password;	//密码
	@Column(name="Cli_birthday")
	private String Cli_birthday;	//生日
	public String getCli_no() {
		return Cli_no;
	}
	public void setCli_no(String cli_no) {
		Cli_no = cli_no;
	}
	public String getCli_name() {
		return Cli_name;
	}
	public void setCli_name(String cli_name) {
		Cli_name = cli_name;
	}
	public String getCli_sex() {
		return Cli_sex;
	}
	public void setCli_sex(String cli_sex) {
		Cli_sex = cli_sex;
	}
	public String getCli_id() {
		return Cli_id;
	}
	public void setCli_id(String cli_id) {
		Cli_id = cli_id;
	}
	public String getCli_email() {
		return Cli_email;
	}
	public void setCli_email(String cli_email) {
		Cli_email = cli_email;
	}
	public String getCli_password() {
		return Cli_password;
	}
	public void setCli_password(String cli_password) {
		Cli_password = cli_password;
	}
	public String getCli_birthday() {
		return Cli_birthday;
	}
	public void setCli_birthday(String cli_birthday) {
		Cli_birthday = cli_birthday;
	}
}
