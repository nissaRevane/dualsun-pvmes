import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CompanyComponent } from './company.component';

describe('CompanyComponent', () => {
  let component: CompanyComponent;
  let fixture: ComponentFixture<CompanyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CompanyComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CompanyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should have 2 input fields', () => {
    const compiled = fixture.debugElement.nativeElement;
    const simpleLines = compiled.querySelectorAll('.shared-form-simple-line');
    expect(simpleLines.length).toEqual(2);
  });
});
