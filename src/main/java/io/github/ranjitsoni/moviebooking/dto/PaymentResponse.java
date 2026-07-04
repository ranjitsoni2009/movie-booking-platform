package io.github.ranjitsoni.moviebooking.dto;

import java.time.OffsetDateTime;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@EqualsAndHashCode
public class PaymentResponse {

  private String paymentId;

  private String bookingId;

  private Float amount;

  private String currency;

  private String status;

  private String transactionReference;

  private OffsetDateTime timestamp;
}

