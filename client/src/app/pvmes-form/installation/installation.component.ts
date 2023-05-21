import { Component, OnInit } from '@angular/core';
import { SharedInput } from '../../models/shared-input.model';

@Component({
  selector: 'app-pvmes-form-installation',
  templateUrl: './installation.component.html',
  styleUrls: ['./installation.component.scss']
})
export class InstallationComponent implements OnInit {
  installationStartDateInput!: SharedInput;

  constructor() { }

  ngOnInit(): void {
    this.installationStartDateInput = new SharedInput(
      'date', 'Date de début des travaux', '', '*', 'installation', 'start_date'
    );
  }
}
