/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author _DELL_
 */
public class Hotel  {
    private int hotel_id;
    private String name;
    private String address;
    private String phone;
    private String description;
    private double rate;
    private long price_range;
    private String image_url;
    private String country_id;

    public Hotel() {
    }

    public Hotel(int hotel_id, String name, String address, String phone, String description, double rate, long price_range, String image_url, String country_id) {
        this.hotel_id = hotel_id;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.description = description;
        this.rate = rate;
        this.price_range = price_range;
        this.image_url = image_url;
        this.country_id = country_id;
    }

    public int getHotel_id() {
        return hotel_id;
    }

    public void setHotel_id(int hotel_id) {
        this.hotel_id = hotel_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public long getPrice_range() {
        return price_range;
    }

    public void setPrice_range(long price_range) {
        this.price_range = price_range;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getCountry_id() {
        return country_id;
    }

    public void setCountry_id(String country_id) {
        this.country_id = country_id;
    }

    @Override
    public String toString() {
        return "Hotel{" + "hotel_id=" + hotel_id + ", name=" + name + ", address=" + address + ", phone=" + phone + ", description=" + description + ", rate=" + rate + ", price_range=" + price_range + ", image_url=" + image_url + ", country_id=" + country_id + '}';
    }

   

    
}
