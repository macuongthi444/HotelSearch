/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Country;
import model.Hotel;

/**
 *
 * @author _DELL_
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Hotel> getAllHotel() {
        List<Hotel> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.hotels";
//        String query = "SELECT h.hotel_id, h.name, h.address, h.phone,"
//                + " h.description, h.rating, h.price_range, h.image_url,  c.cname AS country_id\n"
//                + "FROM hotels h\n"
//                + "JOIN countries c ON h.country_id = c.cid";
        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Hotel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getLong(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Hotel> getBestHotel() {
        List<Hotel> list = new ArrayList<>();
        String query = "SELECT TOP 3 h.hotel_id, h.name, h.address, h.phone, h.description, h.rating, h.price_range, h.image_url, c.name AS country_id\n"
                + "                 FROM hotels h\n"
                + "                 JOIN countries c ON h.country_id = c.country_id\n"
                + "                ORDER BY h.rating DESC";
        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Hotel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getLong(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Country> getAllCountry() {
        List<Country> list = new ArrayList<>();
        String query = "SELECT * FROM dbo.countries ";

        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Country(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Hotel> getHotelByCountry(String cid) {
        List<Hotel> list = new ArrayList<>();
        //String query = "SELECT * FROM dbo.hotels WHERE country_id = ?";
        String query = "SELECT h.hotel_id, h.name, h.address, h.phone, h.description, h.rating, h.price_range, h.image_url, c.cname AS country_id\n"
                + "FROM hotels h\n"
                + "JOIN countries c ON h.country_id = c.cid\n"
                + "WHERE h.country_id = ?";
        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Hotel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getLong(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Hotel getHotelById(String id) {
        String query = "SELECT * FROM dbo.hotels WHERE hotel_id = ?";
        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Hotel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getLong(7),
                        rs.getString(8),
                        rs.getString(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Hotel> searchByName(String txtSearch) {
        List<Hotel> list = new ArrayList<>();
        //String query = "SELECT * FROM dbo.hotels WHERE name LIKE ?";
        String query = "SELECT h.hotel_id, h.name, h.address, h.phone, h.description, h.rating, h.price_range, h.image_url, c.cname AS country_id\n"
                + "FROM hotels h JOIN countries c ON h.country_id = c.cid\n"
                + "WHERE h.name LIKE ?";
        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString(2));
                list.add(new Hotel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getLong(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
            System.out.println("searchbyName" + e.getMessage());
        }
        return list;
    }

    public List<Hotel> searchByCountryName(String txtSearch) {
        List<Hotel> list = new ArrayList<>();
        String query = "SELECT h.hotel_id, h.name, h.address, h.phone, h.description, h.rating, h.price_range, h.image_url, c.name \n"
                + "                FROM hotels h JOIN countries c ON h.country_id = c.country_id\n"
                + "                WHERE c.name LIKE ?";

        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString(2));
                list.add(new Hotel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getLong(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
            System.out.println("searchbyName" + e.getMessage());
        }
        return list;
    }

    public Account login(String username, String password) {
        String query = "SELECT * FROM dbo.users\n"
                + "WHERE username = ? AND password=?";
        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account chechAccountExist(String username) {
        String query = "SELECT * FROM dbo.users\n"
                + "WHERE username = ?";
        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signup(String user, String pass) {
        String query = "INSERT INTO dbo.users\n"
                + "VALUES(?,?,1,0)";
        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteHotel(String hid) {

        String query = "delete FROM dbo.hotels where hotel_id = ? ";
        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            ps.setString(1, hid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void AddHotel(String name, String address, String phone, String description, String star, String price,
            String image, String country) {
        String query = "INSERT INTO hotels ( name, address, phone, description, rating, price_range, image_url, country_id) \n"
                + "VALUES (?,?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, description);
            ps.setString(5, star);
            ps.setString(6, price);
            ps.setString(7, image);
            ps.setString(8, country);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editHotel(String name, String address, String phone, String description, String star, String price,
            String image, String country, String hid) {
        String query = "UPDATE dbo.hotels \n"
                + "SET name =?, [address] = ?, phone = ?, [description] = ?, rating = ?, price_range = ?, image_url = ?, country_id = ? \n"
                + "WHERE hotel_id = ?";
        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, description);
            ps.setString(5, star);
            ps.setString(6, price);
            ps.setString(7, image);
            ps.setString(8, country);
            ps.setString(9, hid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCountry(String cid) {

        String query = "delete FROM dbo.countries where cid = ? ";
        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void AddCountry(String name, String image) {
        String query = "INSERT INTO dbo.countries\n"
                + "(cname,cimage)VALUES(?,?)";
        try {
            conn = new DBContext().connection; //mở kết nối tới sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();

//        List<Hotel> listbest = dao.getBestHotel();
//        for (Hotel hotel : listbest) {
//            System.out.println(hotel);
//        }
//        String txtSearch = "Việt";
//        List<Hotel> search = dao.searchByCountryName(txtSearch);
        Account login = dao.login("bao", "123");
        if (login != null) {
            System.out.println("true");
        } else {
            System.out.println("false");
        }
    }

}
