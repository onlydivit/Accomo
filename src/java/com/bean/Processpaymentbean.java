package com.bean;

public class Processpaymentbean {
    private String reservationId;
    private double amount;
    private String paymentMethod;
    private boolean paymentSuccess;

    // Getters and Setters
    public String getReservationId() { return reservationId; }
    public void setReservationId(String reservationId) { this.reservationId = reservationId; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public boolean isPaymentSuccess() { return paymentSuccess; }
    public void setPaymentSuccess(boolean paymentSuccess) { this.paymentSuccess = paymentSuccess; }
}