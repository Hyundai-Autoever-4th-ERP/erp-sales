# ERP Sales

## AWS 공용 개발 DB

VPC 안에서 실행하는 서비스는 공용 PostgreSQL RDS의 `sales_db`에 TLS로 연결합니다. 하루 검증 환경은 **2026년 11월 27일 15:03 KST**에 삭제를 시작할 예정입니다.

| Spring 환경변수 | 서버 설정 |
| --- | --- |
| `SPRING_DATASOURCE_URL` | `jdbc:postgresql://<RDS 엔드포인트>:5432/sales_db?sslmode=require` |
| `SPRING_DATASOURCE_USERNAME` | `sales_app` |
| `SPRING_DATASOURCE_PASSWORD` | 인프라 담당자가 별도로 전달하는 서비스 전용 비밀번호 |

현재 Jenkins EC2에서 RDS로 연결되는 경로를 확인했습니다. 개발자 PC에서 공용 DB를 조회할 때는 이 EC2를 경유하는 SSM 포트 포워딩을 사용합니다.

## 내 PC에서 개발할 때

저장소를 클론한 뒤 루트에서 `docker compose up -d`를 실행하면 로컬 개발 DB가 시작됩니다.

| 접속 항목 | 값 |
| --- | --- |
| 주소 | `localhost:15435` |
| 데이터베이스 | `sales_db` |
| 사용자 | `sales_app` |
| 로컬 비밀번호 | `sales_local` |

`docker compose down`으로 종료해도 데이터는 볼륨에 남습니다.

## Jenkins CI

`main`과 `develop` 빌드는 임시 PostgreSQL 컨테이너에서 DB 연결을 검사합니다. Gradle 프로젝트가 있으면 같은 임시 DB로 테스트를 실행하고 빌드가 끝나면 정리합니다.
