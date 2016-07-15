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
import model.Spuser;

public class DBFunctions {
	public static List<Sporder> getOrders(long id, int status){
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "Select o from Sporder o where o.status=:status and o.spuser.userid=:userid";
		TypedQuery<Sporder> q = em.createQuery(qString, Sporder.class);
		q.setParameter("userid",id);
		q.setParameter("status",status+ "");
		
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

	public static void addCart(List<Sporder> cart, Spuser user){
			for(Sporder order:cart){
				order.setSpuser(user);
				DBFunctions.insert(order);
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
	
	public static void update(Sporder o) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(o);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
	
	public static List<Spproduct> search(String search){
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "select p from Spproduct p "
                + "where p.productname like :search";
		TypedQuery<Spproduct> q = em.createQuery(qString, Spproduct.class);
		q.setParameter("search","%"+search+"%");
		
		List<Spproduct> r = null;
		try{
			r = q.getResultList();
		}catch(NoResultException e){
			System.out.println(e);
			em.close();
		}
		return r;
	}
	
	public static List<Spproduct> getProducts(){
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "select p from Spproduct p";
		TypedQuery<Spproduct> q = em.createQuery(qString, Spproduct.class);
		
		List<Spproduct> r = null;
		try{
			r = q.getResultList();
		}catch(NoResultException e){
			System.out.println(e);
			em.close();
		}
		return r;
	}
	
	public static Sporder getOrderByID(String id){
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "Select o from Sporder o where o.orderid=:oid";
		TypedQuery<Sporder> q = em.createQuery(qString, Sporder.class);
		q.setParameter("oid", new BigDecimal(id));
		Sporder r = null;
		try{
			r = q.getSingleResult();
		}catch(NoResultException e){
			System.out.println(e);
			em.close();
		}
		return r;
	}
	
	public static void insert(Spuser user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(user);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }
	
	public static List<Sporder> search(String search, long id){
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "select o from Sporder o "
                + "where o.spproduct.productname like :search and o.spuser.userid=:userid";
		TypedQuery<Sporder> q = em.createQuery(qString, Sporder.class);
		q.setParameter("search","%"+search+"%");
		q.setParameter("userid",id);
		
		List<Sporder> r = null;
		try{
			r = q.getResultList();
		}catch(NoResultException e){
			System.out.println(e);
			em.close();
		}
		return r;
	}
}
