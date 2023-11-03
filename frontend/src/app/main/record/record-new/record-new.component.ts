import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, ValidationErrors, ValidatorFn } from '@angular/forms';
import { OTimeInputComponent } from 'ontimize-web-ngx';

@Component({
  selector: 'app-record-new',
  templateUrl: './record-new.component.html',
  styleUrls: ['./record-new.component.scss']
})
export class RecordNewComponent implements OnInit {
  
  @ViewChild('startInput', {static: true})startInput : OTimeInputComponent;
  @ViewChild('endInput', {static: true})endInput : OTimeInputComponent;

  validatorsArray: ValidatorFn[] = [];

  constructor() {
    let self = this;
    const dateValidator = (control: FormControl): ValidationErrors => {
      let result = {};
  
      if(self.endInput.getValue() < self.startInput.getValue()) {
        result['required'] = 'true';
      }
      
      return result;
    }
    this.validatorsArray.push(dateValidator);
  }

  ngOnInit() {
  }
}
