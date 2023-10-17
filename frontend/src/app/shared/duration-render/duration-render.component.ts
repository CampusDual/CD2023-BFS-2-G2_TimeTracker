import { Component, Injector, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { OBaseTableCellRenderer } from 'ontimize-web-ngx';

@Component({
  selector: 'app-duration-render',
  templateUrl: './duration-render.component.html',
  styleUrls: ['./duration-render.component.css']
})
export class DurationRenderComponent extends OBaseTableCellRenderer {

  @ViewChild('templateref', { read: TemplateRef, static: false }) public templateref: TemplateRef<any>;

  constructor(protected injector: Injector) {
    super(injector);
    }

  getCellData(cellvalue: any, rowvalue?: any): string{
    let hours;
    let minutes;
    if(cellvalue == null){
      hours =  "00";
      minutes =  "00";
    }else{
      hours = this.addZero(cellvalue["hours"]);
      minutes = this.addZero(cellvalue["minutes"]);
    }
    return `${hours}:${minutes}`;
  }

  addZero(num){
    if (num<10) {
      return "0"+num;
    }
    return num;
  }
}
