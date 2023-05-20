import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PvmesFormComponent } from './pvmes-form.component';

describe('PvmesFormComponent', () => {
  let component: PvmesFormComponent;
  let fixture: ComponentFixture<PvmesFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PvmesFormComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PvmesFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
