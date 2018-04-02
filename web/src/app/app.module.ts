import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';


import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { LoginPageComponent } from './login-page/login-page.component';
import {
  MatButtonModule,
  MatFormFieldModule,
  MatGridListModule,
  MatInputModule,
  MatToolbarModule
} from '@angular/material';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MainPageComponent } from './main-page/main-page.component';
import { AppRoutingModule} from './app-routing.module';
import { AppNavbarComponent } from './app-navbar/app-navbar.component';
import { ManagePageComponent } from './manage-page/manage-page.component';
import { GenresContainerComponent } from './manage-page/genres-container/genres-container.component';
import { GenresControlComponent } from './manage-page/genres-container/genres-control/genres-control.component';
import { GenresListComponent } from './manage-page/genres-container/genres-list/genres-list.component';
import { FormsModule } from '@angular/forms';
import { ToastrModule } from 'ngx-toastr';


@NgModule({
  declarations: [
    AppComponent,
    LoginPageComponent,
    MainPageComponent,
    AppNavbarComponent,
    ManagePageComponent,
    GenresContainerComponent,
    GenresControlComponent,
    GenresListComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    MatToolbarModule,
    MatButtonModule,
    MatFormFieldModule,
    MatInputModule,
    BrowserAnimationsModule,
    MatToolbarModule,
    MatGridListModule,
    FormsModule,
    ToastrModule.forRoot()
  ],
  providers: [],
  bootstrap: [AppComponent
  ]
})
export class AppModule { }
