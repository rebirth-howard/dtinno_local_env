# Makefile 사용 예시:
#
# 백그라운드로 Docker Compose 실행
# make up
#
# 컨테이너 유지 + 볼륨 유지
# make stop
#
# 컨테이너 유지 + 볼륨 삭제
# make stop-volumes
#
# 컨테이너 신규 + 볼륨 유지
# make recreate-containers
#
# 컨테이너 신규 + 볼륨 삭제
# make recreate-all
#
# Docker Compose 상태 확인
# make ps
#
# Docker Compose 로그 확인
# make logs
#
# Docker Compose 컨테이너 중지 및 삭제
# make down

# 기본 설정
COMPOSE_FILE=docker-compose.yml

# 백그라운드로 Docker Compose 실행
.PHONY: up
up:
	docker compose -f $(COMPOSE_FILE) up -d

# 1. 컨테이너 유지 + 볼륨 유지 (컨테이너만 중지)
.PHONY: stop
stop:
	docker compose -f $(COMPOSE_FILE) stop

# 2. 컨테이너 유지 + 볼륨 삭제 (컨테이너 중지 후 볼륨 삭제)
.PHONY: stop-volumes
stop-volumes:
	docker compose -f $(COMPOSE_FILE) down --volumes --remove-orphans

# 3. 컨테이너 신규 + 볼륨 유지 (컨테이너만 재생성)
.PHONY: recreate-containers
recreate-containers:
	docker compose -f $(COMPOSE_FILE) up -d --force-recreate

# 4. 컨테이너 신규 + 볼륨 삭제 (컨테이너와 볼륨 모두 재생성)
.PHONY: recreate-all
recreate-all:
	docker compose -f $(COMPOSE_FILE) down --volumes --remove-orphans
	docker compose -f $(COMPOSE_FILE) up -d --force-recreate

# Docker Compose 상태 확인
.PHONY: ps
ps:
	docker compose -f $(COMPOSE_FILE) ps

# Docker Compose 로그 확인
.PHONY: logs
logs:
	docker compose -f $(COMPOSE_FILE) logs

# Docker Compose 컨테이너 중지 및 삭제
.PHONY: down
down:
	docker compose -f $(COMPOSE_FILE) down
