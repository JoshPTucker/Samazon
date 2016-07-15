package Functions;

import java.security.NoSuchAlgorithmException;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import Functions.DBUtil;
import customTools.PasswordUtil;
import model.Spuser;

public class DBUser {
	
	// if the email and hashed password matches a user, return the user	
	public static Spuser getValidUser(String email, String password) {
		
		EntityManager em = DBUtil.getEmFactory().createEntityManager();			
		String qString = "Select u from Spuser u " + "where u.useremail = :email";				

		TypedQuery<Spuser> q = em.createQuery(qString, Spuser.class);
		q.setParameter("useremail", email);		
		Spuser user = null;
		
		try {
			user = q.getSingleResult();
		} catch (NoResultException e) {
			System.out.println(e);
		} finally {
			em.close();
		}
		
		try {
			
			// get the expected Hash of the password + the salt stored in the database			
			String expectedHash = PasswordUtil.hashPasswordPlusSalt(password, user.getSalt());
			
			// if the expected hash does not match the user entered password + salt 
			// then set user to null
			if (!PasswordUtil.compareSaltedHashWithUserEnteredPwd(user.getSalt(), password, expectedHash)) {
				user = null;
			}
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return user;		
		
	}	
}
