import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';

import { updateCompanyName } from '../../state/actions';

@Component({
  selector: 'app-pvmes-form-company',
  templateUrl: './company.component.html',
  styleUrls: ['./company.component.scss']
})
export class CompanyComponent implements OnInit {

  constructor(private store: Store) { }

  ngOnInit(): void {
  }

  updateStore(event: any) {
    this.store.dispatch(
      updateCompanyName( { name: event.target.value } )
    );
    console.log(`updateStore called with ${event.target.value}`);
  }
}
