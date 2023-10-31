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
    let hours;
    let minutes;
    let days;
    if(cellvalue == null){
      hours =  "00";
      minutes =  "00";
    }else{
      days = cellvalue["days"]*24;
      hours = this.addZero(cellvalue["hours"]+days);
      minutes = this.addZero((cellvalue["minutes"]/60).toString().slice(2,4));
    }
    return `${String(hours).padStart(2, "0")}.${String(minutes).padEnd(2, "0")}`;
  }

  addZero(num){
    if (num<1) {
      return "0"+num;
    }
    return num;
  }
}
