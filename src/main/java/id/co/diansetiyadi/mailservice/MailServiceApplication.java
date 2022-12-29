package id.co.diansetiyadi.mailservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.kafka.annotation.EnableKafka;

import com.google.gson.Gson;

@SpringBootApplication
@EnableKafka
public class MailServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(MailServiceApplication.class, args);
	}

	@Bean
	public Gson gson() {
		return new Gson();
	}
}
