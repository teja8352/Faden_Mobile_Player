import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';



@NgModule({
  declarations: [],
  imports: [
    CommonModule
  ],
  providers: [
    StatusBar,
    SplashScreen
  ],
})
export class NativeModule { }
