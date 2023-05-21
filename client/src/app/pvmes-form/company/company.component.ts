import { Component, OnInit } from '@angular/core';
import { SharedInput } from '../../models/shared-input.model';

@Component({
  selector: 'app-pvmes-form-company',
  templateUrl: './company.component.html',
  styleUrls: ['./company.component.scss']
})
export class CompanyComponent implements OnInit {
  companyNameInput!: SharedInput;
  companyImmatriculationInput!: SharedInput;

  constructor() { }

  ngOnInit(): void {
    this.companyNameInput = new SharedInput(
      'text', 'Nom', 'Nom de la société', '*', 'company', 'name'
    );
    this.companyImmatriculationInput = new SharedInput(
      'text', 'SIREN', '123456789', '*', 'company', 'immatriculation'
    );
  }
}
