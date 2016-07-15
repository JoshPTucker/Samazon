package Functions;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import Functions.DBUtil;
import model.Sporder;
import model.Spproduct;

public class DBFunctions {
	public static List<Sporder> getOrders(long id, int status){
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "Select o from sporder o where o.status=:status and o.userid=:userid";
		TypedQuery<Sporder> q = em.createQuery(qString, Sporder.class);
		q.setParameter("userid",id);
		q.setParameter("status",status);
		
		List<Sporder> r = null;
		try{
			r = q.getResultList();
		}catch(NoResultException e){
			System.out.println(e);
			em.close();
		}
		return r;
	}
	
	public static Spproduct getProductByID(String id){
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "Select p from Spproduct p where p.productid=:pid";
		TypedQuery<Spproduct> q = em.createQuery(qString, Spproduct.class);
		q.setParameter("pid", new BigDecimal(id));
		Spproduct r = null;
		try{
			r = q.getSingleResult();
		}catch(NoResultException e){
			System.out.println(e);
			em.close();
		}
		return r;
	}

	public static void addCart(List<Sporder> cart){
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		EntityTransaction trans = null;
		try {
			for(Sporder order:cart){
				trans = em.getTransaction();
				trans.begin();
				em.persist(order);
				trans.commit();
			}
		} catch (Exception e) {
			trans.rollback();
		} finally {
			em.close();
		}
	}

	public static void insert(Sporder o) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(o);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
}
