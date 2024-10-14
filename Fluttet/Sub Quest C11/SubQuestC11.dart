import 'dart:async';

void main() {
  // Pomodoro settings
  const int workDuration = 5; // 25 minutes in seconds
  const int shortBreakDuration = 2; // 5 minutes in seconds
  const int longBreakDuration = 4; // 15 minutes in seconds
  const int cyclesBeforeLongBreak = 3; // Number of cycles before long break

  int currentCycle = 1;
  bool isWorking = true;

  void startPomodoroCycle() {
    print('Pomodoro 타이머를 시작합니다.');

    void startTimer(int duration, String message) {
      int remainingTime = duration;
      Timer.periodic(Duration(seconds: 1), (timer) {
        int minutes = remainingTime ~/ 60;
        int seconds = remainingTime % 60;
        print(
            'flutter: ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}');

        remainingTime--;
        currentCycle++;
        if (remainingTime < 0) {
          timer.cancel();
          print(message);

          if (isWorking) {
            if (currentCycle == cyclesBeforeLongBreak) {
              isWorking = false;
              startTimer(
                  longBreakDuration, 'flutter: 긴 휴식 시간이 끝났습니다. 다음 작업을 시작합니다.');
              currentCycle = 0; // Reset cycle count
            } else {
              isWorking = false;
              startTimer(
                  shortBreakDuration, 'flutter: 휴식 시간이 끝났습니다. 다음 작업을 시작합니다.');
            }
          } else {
            isWorking = true;
            startTimer(workDuration, 'flutter: 작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.');
          }
        }
      });
    }

    // Start the first cycle with work time
    startTimer(workDuration, 'flutter: 작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.');
  }

  startPomodoroCycle();
}

// 4회차에 더 긴 휴식시간이 진행되어야하는데
// 일반 휴식 시간과 똑같이 진행되는 점을 해결하지 못했습니다.