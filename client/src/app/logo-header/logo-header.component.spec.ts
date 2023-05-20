import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LogoHeaderComponent } from './logo-header.component';

describe('LogoHeaderComponent', () => {
  let component: LogoHeaderComponent;
  let fixture: ComponentFixture<LogoHeaderComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LogoHeaderComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LogoHeaderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should have a logo', () => {
    const compiled = fixture.debugElement.nativeElement;
    const appHeaderLogo = compiled.querySelector('[data-test-id="app-header-logo"]');
    expect(appHeaderLogo.src).toContain('logo.png');
  });

  it('should have a title', () => {
    const compiled = fixture.debugElement.nativeElement;
    const appHeaderTitle = compiled.querySelector('[data-test-id="app-header-title"]');
    expect(appHeaderTitle.textContent).toContain('Procès Verbal de mise en service');
  });
});
