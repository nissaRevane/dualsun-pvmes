import { Component, OnInit } from '@angular/core';
import { SharedInput } from '../../../models/shared-input.model';

@Component({
  selector: 'app-pvmes-form-installation-address',
  templateUrl: './address.component.html',
  styleUrls: ['./address.component.scss']
})
export class AddressComponent implements OnInit {
  addressNumberInput!: SharedInput;
  addressStreetInput!: SharedInput;
  addressZipCodeInput!: SharedInput;
  addressCityInput!: SharedInput;
  addressCountryInput!: SharedInput;

  constructor() { }

  ngOnInit(): void {
    this.addressNumberInput = new SharedInput(
      'text', 'Numéro', '124B', '*', 'address', 'number'
    );
    this.addressStreetInput = new SharedInput(
      'text', 'Rue', 'Route de Vaux', '*', 'address', 'street'
    );
    this.addressZipCodeInput = new SharedInput(
      'text', 'Code postal', '38000', '*', 'address', 'zipCode'
    );
    this.addressCityInput = new SharedInput(
      'text', 'Ville', 'Grenoble', '*', 'address', 'city'
    );
    this.addressCountryInput = new SharedInput(
      'text', 'Pays', 'France', '*', 'address', 'country'
    );
  }

}
