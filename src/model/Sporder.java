package model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the SPORDERS database table.
 * 
 */
@Entity
@Table(name="SPORDERS")
@NamedQuery(name="Sporder.findAll", query="SELECT s FROM Sporder s")
public class Sporder implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="SPORDERS_ORDERID_GENERATOR", sequenceName="SPORDERS_SEQ")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SPORDERS_ORDERID_GENERATOR")
	private long orderid;

	private BigDecimal quantity;

	private String status;

	//bi-directional many-to-one association to Spproduct
	@ManyToOne
	@JoinColumn(name="PRODUCTID")
	private Spproduct spproduct;

	//bi-directional many-to-one association to Spuser
	@ManyToOne
	@JoinColumn(name="USERID")
	private Spuser spuser;

	public Sporder() {
	}

	public long getOrderid() {
		return this.orderid;
	}

	public void setOrderid(long orderid) {
		this.orderid = orderid;
	}

	public BigDecimal getQuantity() {
		return this.quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Spproduct getSpproduct() {
		return this.spproduct;
	}

	public void setSpproduct(Spproduct spproduct) {
		this.spproduct = spproduct;
	}

	public Spuser getSpuser() {
		return this.spuser;
	}

	public void setSpuser(Spuser spuser) {
		this.spuser = spuser;
	}

}