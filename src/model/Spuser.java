package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the SPUSERS database table.
 * 
 */
@Entity
@Table(name="SPUSERS")
@NamedQuery(name="Spuser.findAll", query="SELECT s FROM Spuser s")
public class Spuser implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="SPUSERS_USERID_GENERATOR", sequenceName="SPUSERS_SEQ", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SPUSERS_USERID_GENERATOR")
	private long userid;

	private String hashedpassword;

	private String salt;

	private String useremail;

	private String username;

	//bi-directional many-to-one association to Sporder
	@OneToMany(mappedBy="spuser")
	private List<Sporder> sporders;

	//bi-directional many-to-one association to Spreview
	@OneToMany(mappedBy="spuser")
	private List<Spreview> spreviews;

	public Spuser() {
	}

	public long getUserid() {
		return this.userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}

	public String getHashedpassword() {
		return this.hashedpassword;
	}

	public void setHashedpassword(String hashedpassword) {
		this.hashedpassword = hashedpassword;
	}

	public String getSalt() {
		return this.salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getUseremail() {
		return this.useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Sporder> getSporders() {
		return this.sporders;
	}

	public void setSporders(List<Sporder> sporders) {
		this.sporders = sporders;
	}

	public Sporder addSporder(Sporder sporder) {
		getSporders().add(sporder);
		sporder.setSpuser(this);

		return sporder;
	}

	public Sporder removeSporder(Sporder sporder) {
		getSporders().remove(sporder);
		sporder.setSpuser(null);

		return sporder;
	}

	public List<Spreview> getSpreviews() {
		return this.spreviews;
	}

	public void setSpreviews(List<Spreview> spreviews) {
		this.spreviews = spreviews;
	}

	public Spreview addSpreview(Spreview spreview) {
		getSpreviews().add(spreview);
		spreview.setSpuser(this);

		return spreview;
	}

	public Spreview removeSpreview(Spreview spreview) {
		getSpreviews().remove(spreview);
		spreview.setSpuser(null);

		return spreview;
	}

}