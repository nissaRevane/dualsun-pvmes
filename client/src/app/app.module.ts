import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import {
  NgbDateAdapter,
  NgbDateNativeUTCAdapter,
  NgbModule,
} from '@ng-bootstrap/ng-bootstrap';

import { AppComponent } from './app.component';
import { LogoHeaderComponent } from './logo-header/logo-header.component';
import { ContactFooterComponent } from './contact-footer/contact-footer.component';
import { PvmesFormComponent } from './pvmes-form/pvmes-form.component';

@NgModule({
  declarations: [
    AppComponent,
    LogoHeaderComponent,
    ContactFooterComponent,
    PvmesFormComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    NgbModule,
  ],
  providers: [{ provide: NgbDateAdapter, useClass: NgbDateNativeUTCAdapter }],
  bootstrap: [AppComponent],
})
export class AppModule {}
