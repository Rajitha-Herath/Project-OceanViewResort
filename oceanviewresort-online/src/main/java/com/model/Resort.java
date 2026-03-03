package com.model;

public class Resort {
    private int id;
    private String guestName;
    private String address;
    private String contactNo;
    private String roomType;
    private String checkInDate;
    private String checkOutDate;
    
    // Default constructor
    public Resort() {}
    
    // Constructor without ID (for new records)
    public Resort(String guestName, String address, String contactNo, 
                  String roomType, String checkInDate, String checkOutDate) {
        this.guestName = guestName;
        this.address = address;
        this.contactNo = contactNo;
        this.roomType = roomType;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
    }
    
    // Constructor with ID (for existing records)
    public Resort(int id, String guestName, String address, String contactNo, 
                  String roomType, String checkInDate, String checkOutDate) {
        this.id = id;
        this.guestName = guestName;
        this.address = address;
        this.contactNo = contactNo;
        this.roomType = roomType;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getGuestName() {
        return guestName;
    }
    
    public void setGuestName(String guestName) {
        this.guestName = guestName;
    }
    
    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getContactNo() {
        return contactNo;
    }
    
    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }
    
    public String getRoomType() {
        return roomType;
    }
    
    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }
    
    public String getCheckInDate() {
        return checkInDate;
    }
    
    public void setCheckInDate(String checkInDate) {
        this.checkInDate = checkInDate;
    }
    
    public String getCheckOutDate() {
        return checkOutDate;
    }
    
    public void setCheckOutDate(String checkOutDate) {
        this.checkOutDate = checkOutDate;
    }
    
    @Override
    public String toString() {
        return "Resort [id=" + id + ", guestName=" + guestName + ", address=" + address + 
               ", contactNo=" + contactNo + ", roomType=" + roomType + 
               ", checkInDate=" + checkInDate + ", checkOutDate=" + checkOutDate + "]";
    }
}