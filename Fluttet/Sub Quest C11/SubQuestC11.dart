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

// 조정민 : 시간이 많이 부족해서 해결하지 못한게 그리고 gpt없으면 아무것도 못했을거같다는 사실이 너무 화가 났습니다. 이런식으로 진행되면 페어프로그래밍은 폐지하는게 어떤지 진지하게 생각합니다.
// 김지혜 : vs code를 여는 것도 익숙치 않은데 코드를 짜기가 막막한 면이 없지 않았습니다. 우선, 코딩 작업 자체는... 4번째 사이클에서 휴식시간을 늘려야 하는데, 해결하지 못했습니다. 조 짝꿍인 정민님과 고충을 공유하며 정신적으로 위로를 많이 받았습니다.