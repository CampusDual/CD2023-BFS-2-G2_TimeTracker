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

    getCellData(cellvalue: any, rowvalue?: any): string {
      if (!cellvalue) {
        return '00:00';
      }
  
      const days = cellvalue.days ? cellvalue.days * 24 : 0;
      const hours = this.addZero(cellvalue.hours + days);
      const minutes = this.addZero(cellvalue.minutes);
  
      return `${hours}:${minutes}`;
    }

    addZero(num: number): string {
      return num < 10 ? '0' + num : num.toString();
    }
}
