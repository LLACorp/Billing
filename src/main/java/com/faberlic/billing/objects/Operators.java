package com.faberlic.billing.objects;
// Generated 15.04.2017 16:33:29 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Operators generated by hbm2java
 */
public class Operators  implements java.io.Serializable {


     private Integer id;
     private String name;
     private Set<Detailes> detaileses = new HashSet<Detailes>(0);

    public Operators() {
    }

	
    public Operators(String name) {
        this.name = name;
    }
    public Operators(String name, Set<Detailes> detaileses) {
       this.name = name;
       this.detaileses = detaileses;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Set<Detailes> getDetaileses() {
        return this.detaileses;
    }
    
    public void setDetaileses(Set<Detailes> detaileses) {
        this.detaileses = detaileses;
    }




}


