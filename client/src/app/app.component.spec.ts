import { ComponentFixture, TestBed } from '@angular/core/testing';
import { FormBuilder, FormsModule, ReactiveFormsModule } from '@angular/forms';

import {
  NgbDateAdapter,
  NgbDateNativeUTCAdapter,
  NgbModule,
} from '@ng-bootstrap/ng-bootstrap';

import { AppComponent } from './app.component';

describe('AppComponent', () => {
  let fixture: ComponentFixture<AppComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [NgbModule, FormsModule, ReactiveFormsModule],
      declarations: [AppComponent],
      providers: [
        FormBuilder,
        { provide: NgbDateAdapter, useClass: NgbDateNativeUTCAdapter },
      ],
    }).compileComponents();
  });

  it('should create the app', () => {
    fixture = TestBed.createComponent(AppComponent);
    const app = fixture.componentInstance;
    expect(app).toBeTruthy();
  });

  it('should display child components', () => {
    fixture = TestBed.createComponent(AppComponent);
    const compiled = fixture.nativeElement;
    expect(compiled.querySelector('app-logo-header')).toBeTruthy();
    expect(compiled.querySelector('app-pvmes-form')).toBeTruthy();
    expect(compiled.querySelector('app-contact-footer')).toBeTruthy();
  });
});
