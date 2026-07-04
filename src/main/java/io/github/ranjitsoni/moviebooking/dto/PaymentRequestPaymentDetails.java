package io.github.ranjitsoni.moviebooking.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@EqualsAndHashCode
public class PaymentRequestPaymentDetails {

  private String transactionReference;
}

