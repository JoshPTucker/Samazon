package tests;

import static org.junit.Assert.*;

import java.security.NoSuchAlgorithmException;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import customTools.PasswordUtil;

public class PasswordUtilTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void hashpassword_test() {

		String password = "x1yz2";

		String salt = PasswordUtil.getSalt();
		System.out.println("PasswordUtilTest: salt: " + salt + "password: " + password);
		String hashedpassword = "";
		try {
			hashedpassword = PasswordUtil.hashPasswordPlusSalt(password, salt);
			System.out.println("PasswordUtilTest: hash: " + hashedpassword);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		boolean compare = false;
		try {
			compare = PasswordUtil.compareSaltedHashWithUserEnteredPwd(salt, password, hashedpassword);
			//assertTrue(compare == true);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertTrue(compare == true);

	}

}
