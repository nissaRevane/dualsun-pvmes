import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';

@Component({
  selector: 'app-pvmes-form',
  templateUrl: './pvmes-form.component.html',
  styleUrls: ['./pvmes-form.component.scss']
})
export class PvmesFormComponent implements OnInit {

  constructor(private store: Store) { }

  ngOnInit(): void {
  }

  submitForm() {
    this.store.select((state: any) => state.pvmesForm).subscribe((response) => {
      fetch('http://localhost:3000/pvmes_forms', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(response)
      })
    });
  }
}
