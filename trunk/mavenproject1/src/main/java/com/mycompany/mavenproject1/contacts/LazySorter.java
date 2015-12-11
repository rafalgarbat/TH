/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.contacts;

/**
 *
 * @author Jaroslaw.Skrzydlo
 */
import java.util.Comparator;
import org.primefaces.model.SortOrder;

 
public class LazySorter implements Comparator<Contact> {
 
    private String sortField;
     
    private SortOrder sortOrder;
     
    public LazySorter(String sortField, SortOrder sortOrder) {
        this.sortField = sortField;
        this.sortOrder = sortOrder;
    }
 
    public int compare(Contact car1, Contact car2) {
        try {
            Object value1 = Contact.class.getField(this.sortField).get(car1);
            Object value2 = Contact.class.getField(this.sortField).get(car2);
 
            int value = ((Comparable)value1).compareTo(value2);
             
            return SortOrder.ASCENDING.equals(sortOrder) ? value : -1 * value;
        }
        catch(Exception e) {
            throw new RuntimeException();
        }
    }
}