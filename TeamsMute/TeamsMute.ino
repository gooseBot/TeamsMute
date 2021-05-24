#include <Keyboard.h>
#include <ezButton.h>

//Global variables
ezButton MuteButton(4);
ezButton VideoButton(5);

void setup()
{
 Keyboard.begin();
 //Serial.begin(9600); // open the serial port at 9600 bps:
 MuteButton.setDebounceTime(50); // set debounce time to 100 milliseconds
 VideoButton.setDebounceTime(50); // set debounce time to 100 milliseconds
}

void loop()
{
  MuteButton.loop(); // MUST call the loop() function first
  VideoButton.loop();
  
  if(MuteButton.isReleased())
  {
    //Serial.println("Mute On");
    sendMuteShortcut();
  }

  if(VideoButton.isReleased())
  {
    //Serial.println("Video On");
    sendVideoShortcut();
  }

}

void sendMuteShortcut()
{
  //Send Team's keyboard shortcut to mute
  Keyboard.press(KEY_LEFT_CTRL);    //Press left control
  delay(100);
  Keyboard.press(KEY_LEFT_SHIFT);   //Press left shift
  delay(100);
  Keyboard.press('2');              //And press '0' to run script
  delay(300);                       //Wait 100ms
  Keyboard.releaseAll();            //Release all keys
}

void sendVideoShortcut()
{
  //Send Team's keyboard shortcut to mute
  Keyboard.press(KEY_LEFT_CTRL);    //Press left control
  delay(100);
  Keyboard.press(KEY_LEFT_SHIFT);   //Press left shift
  delay(100);
  Keyboard.press('1');              //And press '1' to run script
  delay(300);                       //Wait 100ms
  Keyboard.releaseAll();            //Release all keys
}
