import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';


import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { LoginPageComponent } from './login-page/login-page.component';
import {
  MatButtonModule,
  MatFormFieldModule,
  MatGridListModule,
  MatInputModule, MatPaginatorModule, MatProgressSpinnerModule, MatSortModule, MatTableModule,
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
import { AwardsContainerComponent } from './manage-page/awards-container/awards-container.component';
import { CountriesContainerComponent } from './manage-page/countries-container/countries-container.component';
import { FilmsContainerComponent } from './manage-page/films-container/films-container.component';
import { PeopleContainerComponent } from './manage-page/people-container/people-container.component';
import { AwardsControlComponent } from './manage-page/awards-container/awards-control/awards-control.component';
import { AwardsListComponent } from './manage-page/awards-container/awards-list/awards-list.component';
import { CountriesControlComponent } from './manage-page/countries-container/countries-control/countries-control.component';
import { CountriesListComponent } from './manage-page/countries-container/countries-list/countries-list.component';
import { FilmsControlComponent } from './manage-page/films-container/films-control/films-control.component';
import { FilmsListComponent } from './manage-page/films-container/films-list/films-list.component';
import { PeopleControlComponent } from './manage-page/people-container/people-control/people-control.component';
import { PeopleListComponent } from './manage-page/people-container/people-list/people-list.component';


@NgModule({
  declarations: [
    AppComponent,
    LoginPageComponent,
    MainPageComponent,
    AppNavbarComponent,
    ManagePageComponent,
    GenresContainerComponent,
    GenresControlComponent,
    GenresListComponent,
    AwardsContainerComponent,
    CountriesContainerComponent,
    FilmsContainerComponent,
    PeopleContainerComponent,
    AwardsControlComponent,
    AwardsListComponent,
    CountriesControlComponent,
    CountriesListComponent,
    FilmsControlComponent,
    FilmsListComponent,
    PeopleControlComponent,
    PeopleListComponent
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
    ToastrModule.forRoot(),
    MatTableModule,
    MatPaginatorModule,
    MatSortModule,
    MatProgressSpinnerModule
  ],
  providers: [],
  bootstrap: [AppComponent
  ]
})
export class AppModule { }
