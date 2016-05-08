#define AIN1 8
#define AIN2 9
#define STBY 10
#define PWMOUT 11

void setup()
{
  pinMode(AIN1, OUTPUT);
  pinMode(AIN2, OUTPUT);
  pinMode(STBY, OUTPUT);
  pinMode(PWMOUT, OUTPUT);
}

void loop()
{
  digitalWrite(AIN1, LOW);
  digitalWrite(AIN2, HIGH);
  digitalWrite(STBY, HIGH);

    analogWrite(PWMOUT, 128);
  
}
