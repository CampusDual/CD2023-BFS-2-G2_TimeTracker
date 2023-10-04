import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { TrackingHomeComponent } from './tracking-home/tracking-home.component';


const routes: Routes = [{
  path: '',
  component: TrackingHomeComponent
}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TrackingRoutingModule { }
