import { Component } from '@angular/core';
import { ErrorComponent } from './components/error/error.component';

import '../global.properties.scss';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'gif-page-angular';
}
