import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InstallationComponent } from './installation.component';

describe('InstallationComponent', () => {
  let component: InstallationComponent;
  let fixture: ComponentFixture<InstallationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InstallationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InstallationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should contain 1 date input', () => {
    const compiled = fixture.nativeElement;
    const simpleLines = compiled.querySelectorAll('app-shared-input');
    expect(simpleLines.length).toEqual(1);
  });
});
