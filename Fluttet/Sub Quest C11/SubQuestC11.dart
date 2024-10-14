import 'dart:async';

const int twofiveMinutes = 1500;
int totalSeconds = twofiveMinutes;
int totalPomodoros = 0;
bool isRunning = false;

late Timer timer;

void main() {
  print("flutter: Pomodoro 타이머를 시작합니다.");
  timer = Timer.periodic(const Duration(seconds: 1), (t) {
    print("flutter: ${DateTime.now()}");
    onTick(timer);
  });
  setState(() {
    isRunning = true;
  });
}

void onTick(Timer timer) {
  if (totalSeconds == 0) {
    setState(() {
      totalPomodoros = totalPomodoros + 1;
      isRunning = false;
      totalSeconds = twofiveMinutes;
    });
    timer.cancel();
  } else {
    setState(() {
      totalSeconds = totalSeconds - 1;
    });
  }
}
