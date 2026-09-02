.PHONY: run test lint demo

run:
	docker compose up --build

test:
	cd backend && pytest -q

lint:
	cd backend && python -m compileall -q zeus_core tests scripts
	cd mobile && npx tsc --noEmit

demo:
	cd backend && python scripts/demo_flow.py
