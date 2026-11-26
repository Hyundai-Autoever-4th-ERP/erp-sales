# ERP Sales

저장소를 클론한 뒤 루트에서 `docker compose up -d`를 실행하면 로컬 개발 DB가 시작됩니다.

| 접속 항목 | 값 |
| --- | --- |
| 주소 | `localhost:15435` |
| 데이터베이스 | `sales_db` |
| 사용자 | `sales_app` |
| 로컬 비밀번호 | `sales_local` |

`docker compose down`으로 종료해도 데이터는 볼륨에 남습니다. Jenkins는 빌드마다 별도 DB를 사용합니다.
