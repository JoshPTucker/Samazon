package model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the SPREVIEWS database table.
 * 
 */
@Entity
@Table(name="SPREVIEWS")
@NamedQuery(name="Spreview.findAll", query="SELECT s FROM Spreview s")
public class Spreview implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="SPREVIEWS_REVIEWID_GENERATOR", sequenceName="SPREVIEWS_SEQ", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SPREVIEWS_REVIEWID_GENERATOR")
	private long reviewid;

	private String productreview;

	private BigDecimal sentiment;

	//bi-directional many-to-one association to Spproduct
	@ManyToOne
	@JoinColumn(name="PRODUCTID")
	private Spproduct spproduct;

	//bi-directional many-to-one association to Spuser
	@ManyToOne
	@JoinColumn(name="USERID")
	private Spuser spuser;

	public Spreview() {
	}

	public long getReviewid() {
		return this.reviewid;
	}

	public void setReviewid(long reviewid) {
		this.reviewid = reviewid;
	}

	public String getProductreview() {
		return this.productreview;
	}

	public void setProductreview(String productreview) {
		this.productreview = productreview;
	}

	public BigDecimal getSentiment() {
		return this.sentiment;
	}

	public void setSentiment(BigDecimal sentiment) {
		this.sentiment = sentiment;
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