import {RouterModule, Routes} from '@angular/router';
import {NgModule} from '@angular/core';
import {MainPageComponent} from './main-page/main-page.component';
import {LoginPageComponent} from './login-page/login-page.component';
import {ManagePageComponent} from './manage-page/manage-page.component';
import {GenresContainerComponent} from './manage-page/genres-container/genres-container.component';

const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'login', component: LoginPageComponent },
  { path: 'overview', component: MainPageComponent },
  { path: 'manage', component: ManagePageComponent },
  { path: 'manage/genres', component: GenresContainerComponent }
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
