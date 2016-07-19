package model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the SPPRODUCTS database table.
 * 
 */
@Entity
@Table(name="SPPRODUCTS")
@NamedQuery(name="Spproduct.findAll", query="SELECT s FROM Spproduct s")
public class Spproduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="SPPRODUCTS_PRODUCTID_GENERATOR", sequenceName="SPPRODUCTS_SEQ", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SPPRODUCTS_PRODUCTID_GENERATOR")
	private long productid;

	private String productdescription;

	private String productname;

	private String productpicture;

	private BigDecimal productprice;

	private BigDecimal tax;

	//bi-directional many-to-one association to Sporder
	@OneToMany(mappedBy="spproduct")
	private List<Sporder> sporders;

	//bi-directional many-to-one association to Spreview
	@OneToMany(mappedBy="spproduct")
	private List<Spreview> spreviews;

	public Spproduct() {
	}

	public long getProductid() {
		return this.productid;
	}

	public void setProductid(long productid) {
		this.productid = productid;
	}

	public String getProductdescription() {
		return this.productdescription;
	}

	public void setProductdescription(String productdescription) {
		this.productdescription = productdescription;
	}

	public String getProductname() {
		return this.productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductpicture() {
		return this.productpicture;
	}

	public void setProductpicture(String productpicture) {
		this.productpicture = productpicture;
	}

	public BigDecimal getProductprice() {
		return this.productprice;
	}

	public void setProductprice(BigDecimal productprice) {
		this.productprice = productprice;
	}

	public BigDecimal getTax() {
		return this.tax;
	}

	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}

	public List<Sporder> getSporders() {
		return this.sporders;
	}

	public void setSporders(List<Sporder> sporders) {
		this.sporders = sporders;
	}

	public Sporder addSporder(Sporder sporder) {
		getSporders().add(sporder);
		sporder.setSpproduct(this);

		return sporder;
	}

	public Sporder removeSporder(Sporder sporder) {
		getSporders().remove(sporder);
		sporder.setSpproduct(null);

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
		spreview.setSpproduct(this);

		return spreview;
	}

	public Spreview removeSpreview(Spreview spreview) {
		getSpreviews().remove(spreview);
		spreview.setSpproduct(null);

		return spreview;
	}

}