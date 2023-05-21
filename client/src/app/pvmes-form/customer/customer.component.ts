import { Component, OnInit } from '@angular/core';
import { SharedInput } from '../../models/shared-input.model';

@Component({
  selector: 'app-pvmes-form-customer',
  templateUrl: './customer.component.html',
  styleUrls: ['./customer.component.scss']
})
export class CustomerComponent implements OnInit {
  customerNameInput!: SharedInput;
  customerEmailInput!: SharedInput;
  customerPhoneNumberInput!: SharedInput;

  constructor() { }

  ngOnInit(): void {
    this.customerNameInput = new SharedInput(
      'text', 'Nom', 'Prénom Nom', '*', 'customer', 'name'
    );
    this.customerEmailInput = new SharedInput(
      'text', 'Email', 'prenom@gmail.com', '*', 'customer', 'email'
    );
    this.customerPhoneNumberInput = new SharedInput(
      'text', 'Téléphone', '0603040507', '', 'customer', 'phone_number'
    );
  }
}
