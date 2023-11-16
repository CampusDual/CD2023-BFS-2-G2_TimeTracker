import { Component, Injector, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { OBaseTableCellRenderer } from 'ontimize-web-ngx';

@Component({
  selector: 'app-duration-decimal-render',
  templateUrl: './duration-decimal-render.component.html',
  styleUrls: ['./duration-decimal-render.component.scss']
})
export class DurationDecimalRenderComponent extends OBaseTableCellRenderer {

  @ViewChild('templateref', { read: TemplateRef, static: false }) public templateref: TemplateRef<any>;

  constructor(protected injector: Injector) {
    super(injector);
    }


  getCellData(cellvalue: any, rowvalue?: any): string{
    if (!cellvalue) {
      return '00:00';
    }

    let hours =  this.addZero((cellvalue / 60).toFixed(2));

    return `${String(hours).padStart(2, '0')}`;
  }

  addZero(num){
    if (num<10) {
      return "0"+num;
    }
    return num;
  }
}
