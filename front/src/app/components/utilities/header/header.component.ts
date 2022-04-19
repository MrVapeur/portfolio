import { Component, OnInit } from '@angular/core';
import {Route, RouteEnum} from "../../../entity/enum/route-enum";

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  routes = Object.entries(RouteEnum).map(([key, value]) => {
    let route: Route = {
      key: key,
      value: value,
    };
    return route;
  });

  constructor() { }

  ngOnInit(): void {
  }

}
