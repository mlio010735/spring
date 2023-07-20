package scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class LogScheduler {

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Scheduled(fixedRate = 5000) // 5초마다 실행
    public void logCurrentTime() {
        Date currentTime = new Date();
        String formattedTime = dateFormat.format(currentTime);

        System.out.println("현재 시간: " + formattedTime);

        // 로그 파일에 현재 시간 기록
        try (FileWriter writer = new FileWriter("log.txt", true)) {
            writer.write(formattedTime + "\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

