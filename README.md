# ERP Sales

## 로컬 실행

JDK 25와 Docker가 필요합니다. 클론한 저장소에서 커밋 훅을 한 번 설정하세요.

```sh
git config --local core.hooksPath .githooks
```

로컬 DB를 켜고 앱을 실행하세요.

```sh
docker compose up -d
./gradlew bootRun
```

IntelliJ에서는 프로젝트 SDK와 Gradle JVM을 25로 설정하고 `SalesApplication`을 실행합니다. Windows 터미널에서는 `.\gradlew.bat bootRun`을 사용합니다.

- 상태 확인 [Actuator Health](http://localhost:8085/actuator/health)
- API 문서 [Swagger UI](http://localhost:8085/swagger-ui/index.html)
- 테스트는 로컬 DB를 실행한 상태에서 `./gradlew test`로 확인합니다.

## 로컬 DB 접속

| 접속 항목 | 값 |
| --- | --- |
| 주소 | `localhost:15435` |
| 데이터베이스 | `sales_db` |
| 사용자 | `sales_app` |
| 로컬 비밀번호 | `sales_local` |

`docker compose down`으로 종료해도 데이터는 볼륨에 남습니다.
