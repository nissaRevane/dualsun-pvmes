import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ContactFooterComponent } from './contact-footer.component';

describe('ContactFooterComponent', () => {
  let component: ContactFooterComponent;
  let fixture: ComponentFixture<ContactFooterComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ContactFooterComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ContactFooterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('displays the contact email', () => {
    const compiled = fixture.debugElement.nativeElement;
    const contactEmail = compiled.querySelector('[data-test-id="contact-footer-email"]');
    expect(contactEmail.textContent).toContain('contact@dualsun.fr');
  });
});
