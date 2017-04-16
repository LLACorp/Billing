/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.faberlic.billing.views;

import com.faberlic.billing.getter.InfoGetter;
import com.faberlic.billing.objects.Users;
import com.faberlic.billing.utils.SessionUtils;
import java.io.IOException;
import java.io.Serializable;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringEscapeUtils;

/**
 *
 * @author LLAlive
 */
@Named(value = "authView")
@SessionScoped
public class AuthView implements Serializable {

    private String username;
    private String password;
    
    /**
     * Creates a new instance of AuthView
     */
    public AuthView() {
        
    }
    
    public void checkAuth() throws NoSuchAlgorithmException, IOException {
        String errMsg = null;
        Users user = null;
        if("".equals(getUsername())){
            errMsg = "Пользователь не указан";
        } else if("".equals(getPassword())){
            errMsg = "Пароль не указан";
        } else {
            this.setUsername(StringEscapeUtils.escapeSql(getUsername()));
            this.setPassword(StringEscapeUtils.escapeSql(getPassword()));
            InfoGetter getter = new InfoGetter();
            user = getter.getUser(getUsername());
            if(user == null){
                errMsg = "Пользователь не существует";
            } else {
                try {
                    if(!generateHash(getPassword()).equals(user.getPassword())){
                        errMsg = "Пароль указан неверно";
                    }
                } catch(NoSuchAlgorithmException nsaex) {
                    errMsg = "Ошибка при получении SHA512 хэша";
                }
            }
        }
        if(errMsg == null){
            addMessage("Аутентификация прошла успешно", FacesMessage.SEVERITY_INFO);
            HttpSession session = SessionUtils.getSession();
	    session.setAttribute("current_user", user);
            FacesContext.getCurrentInstance().getExternalContext().redirect("main");
        } else {
            addMessage(errMsg, FacesMessage.SEVERITY_ERROR);
        }
    }
    
    public String logout() {
        HttpSession session = SessionUtils.getSession();
        session.invalidate();
        return "login";
    }
    
    private void addMessage(String message, FacesMessage.Severity type){
        FacesMessage facesMessage = new FacesMessage(type, message,  null);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
    }
    
    public static String generateHash(String input) throws NoSuchAlgorithmException {
        MessageDigest objSHA = MessageDigest.getInstance("SHA-512");
        byte[] bytSHA = objSHA.digest(input.getBytes());
        BigInteger intNumber = new BigInteger(1, bytSHA);
        String strHashCode = intNumber.toString(16);
		
        // pad with 0 if the hexa digits are less then 128.
        while (strHashCode.length() < 128) {
            strHashCode = "0" + strHashCode;
        }
        return strHashCode;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
}
