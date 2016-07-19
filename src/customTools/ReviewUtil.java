package customTools;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import Functions.DBUtil;
import model.Spproduct;
import model.Spreview;
import model.Spuser;

public class ReviewUtil {
	public static void insert(Spreview review) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(review);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
	public static List<Spreview> getProductReviews(long productid){
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "select r from Spreview r "
                + "where r.spproduct.productid = :productid";
		TypedQuery<Spreview> q = em.createQuery(qString, Spreview.class);
		q.setParameter("productid", productid);
		
		List<Spreview> r = null;
		try{
			r = q.getResultList();
		}catch(NoResultException e){
			System.out.println(e);
			em.close();
		}
		return r;
	}
}
