import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from "./components/pages/home/home.component";
import {RouteEnum} from "./entity/enum/route-enum";
import {ContactComponent} from "./components/pages/contact/contact.component";
import {NewsComponent} from "./components/pages/news/news.component";

const routes: Routes = [
  {
    path: RouteEnum.HOME,
    component: HomeComponent,
  },
  {
    path: RouteEnum.CONTACT,
    component: ContactComponent,
  },
  {
    path: RouteEnum.NEWS,
    component: NewsComponent,
  },
  {
    path: '**',
    redirectTo: RouteEnum.HOME
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
