import { Component, OnInit, Input } from '@angular/core';
import { SharedInput } from '../models/shared-input.model';
import { Store } from '@ngrx/store';

import { updateStore } from '../state/actions';

@Component({
  selector: 'app-shared-input',
  templateUrl: './shared-input.component.html',
  styleUrls: ['./shared-input.component.scss']
})
export class SharedInputComponent implements OnInit {
  @Input() sharedInput!: SharedInput;
  typeClass!: string;

  constructor(private store: Store) { }

  ngOnInit(): void {
    this.typeClass = `shared-${this.sharedInput.type}-input`;
  }

  updateStore(event: any) {
    this.store.dispatch(
      updateStore({
        category: this.sharedInput.category,
        key: this.sharedInput.key,
        value: event.target.value
      })
    );
    console.log(`updateStore called with ${event.target.value}`);
  }
}
