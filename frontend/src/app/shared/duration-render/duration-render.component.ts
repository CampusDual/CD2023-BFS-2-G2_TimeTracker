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
    const hours = this.addZero(cellvalue["hours"]);
    const minutes = this.addZero(cellvalue["minutes"]);
    return `${hours}:${minutes}`;
  }

  addZero(num){
    if (num<10) {
      return "0"+num;
    }
    return num;
  }
}
