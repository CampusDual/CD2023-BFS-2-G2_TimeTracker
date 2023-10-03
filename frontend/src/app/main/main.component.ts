import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.scss']
})
export class MainComponent {
  jornadaEstado: 'iniciar' | 'pausar' | 'reanudar' | 'finalizar' = 'iniciar';

  mostrarIniciarJornada: boolean = true;

  iniciarJornada(): void {
    this.jornadaEstado = 'pausar';
    this.mostrarIniciarJornada = false;
  }

  pausarJornada(): void {
    this.jornadaEstado = 'reanudar';
  }

  reanudarJornada(): void {
    this.jornadaEstado = 'pausar';
  }

  finalizarJornada(): void {
    this.jornadaEstado = 'iniciar';
    this.mostrarIniciarJornada = true;
  }
}
