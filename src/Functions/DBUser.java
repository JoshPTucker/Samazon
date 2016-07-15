package Functions;

import java.security.NoSuchAlgorithmException;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import Functions.DBUtil;
import customTools.PasswordUtil;
import model.Spuser;

public class DBUser {
	
	public static Spuser addNewUser(String name, String email, String password) {		
		
		// if the user is already in the database, return null
		if (getValidUser(email, password) != null) {			
			return null;
		}	
		
		// get the salt and hash the password with the salt
		String salt = PasswordUtil.getSalt();		
		String hashedpassword = "";
		try {
			hashedpassword = PasswordUtil.hashPasswordPlusSalt(password, salt);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Spuser user = new Spuser();		
		user.setSalt(salt);
		user.setHashedpassword(hashedpassword);	
		user.setUsername(name);
		user.setUseremail(email);
		
		DBFunctions.insert(user);
		
		return user;		
			
	}
	
	// if the email and hashed password matches a user, return the user	
	public static Spuser getValidUser(String email, String password) {
		
		EntityManager em = DBUtil.getEmFactory().createEntityManager();			
		String qString = "Select u from Spuser u " + "where u.useremail = :email";				

		TypedQuery<Spuser> q = em.createQuery(qString, Spuser.class);
		q.setParameter("email", email);		
		Spuser user = null;
		
		try {
			user = q.getSingleResult();
		} catch (NoResultException e) {
			System.out.println(e);
			return null;
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
