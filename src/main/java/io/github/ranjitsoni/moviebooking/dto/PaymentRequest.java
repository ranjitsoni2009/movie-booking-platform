package io.github.ranjitsoni.moviebooking.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@EqualsAndHashCode
public class PaymentRequest {

  private String bookingId;

  private Float amount;

  private String currency;

  private String paymentMethod;

  private PaymentRequestPaymentDetails paymentDetails;
}

