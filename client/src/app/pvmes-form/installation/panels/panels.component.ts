import { Component, OnInit } from '@angular/core';
import { SharedInput } from '../../../models/shared-input.model';

@Component({
  selector: 'app-pvmes-form-installation-panels',
  templateUrl: './panels.component.html',
  styleUrls: ['./panels.component.scss']
})
export class PanelsComponent implements OnInit {
  panelsNumberOfPanelsInput!: SharedInput;

  constructor() { }

  ngOnInit(): void {
    this.panelsNumberOfPanelsInput = new SharedInput(
      'number', 'Nombre de panneaux', '', '*', 'installation', 'numberOfPanels'
    );
  }

}
