import {RouterModule, Routes} from '@angular/router';
import {NgModule} from '@angular/core';
import {MainPageComponent} from './main-page/main-page.component';
import {LoginPageComponent} from './login-page/login-page.component';
import {ManagePageComponent} from './manage-page/manage-page.component';
import {GenresContainerComponent} from './manage-page/genres-container/genres-container.component';
import {FilmsContainerComponent} from "./manage-page/films-container/films-container.component";
import {CountriesContainerComponent} from "./manage-page/countries-container/countries-container.component";
import {PeopleContainerComponent} from "./manage-page/people-container/people-container.component";
import {AwardsContainerComponent} from "./manage-page/awards-container/awards-container.component";

const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'login', component: LoginPageComponent },
  { path: 'overview', component: MainPageComponent },
  { path: 'manage', component: ManagePageComponent },
  { path: 'manage/genres', component: GenresContainerComponent },
  { path: 'manage/films', component: FilmsContainerComponent },
  { path: 'manage/countries', component: CountriesContainerComponent },
  { path: 'manage/people', component: PeopleContainerComponent },
  { path: 'manage/awards', component: AwardsContainerComponent }
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
