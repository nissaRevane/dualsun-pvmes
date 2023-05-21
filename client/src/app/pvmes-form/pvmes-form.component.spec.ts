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

  it('should have the right child components', () => {
    const compiled = fixture.debugElement.nativeElement;
    const companyComponent = compiled.querySelector('app-pvmes-form-company');
    const companyCustomer = compiled.querySelector('app-pvmes-form-customer');
    const companyInstallation = compiled.querySelector('app-pvmes-form-installation');

    expect(companyComponent).toBeTruthy();
    expect(companyCustomer).toBeTruthy();
    expect(companyInstallation).toBeTruthy();
  });
});
