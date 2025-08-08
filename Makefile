# BobaTalkie Makefile
# Common development commands for Phoenix/Elixir project

.PHONY: help setup server test lint format deps clean build deploy doctor

# Colors for output
BLUE := \033[36m
GREEN := \033[32m
YELLOW := \033[33m
RED := \033[31m
NC := \033[0m # No Color

## help: Show available commands
help:
	@echo "$(BLUE)BobaTalkie Development Commands$(NC)"
	@echo ""
	@echo "$(GREEN)Setup & Dependencies:$(NC)"
	@echo "  make setup     - Initial project setup"
	@echo "  make deps      - Install/update dependencies"
	@echo ""
	@echo "$(GREEN)Development:$(NC)"
	@echo "  make server    - Start Phoenix development server"
	@echo "  make test      - Run all tests"
	@echo "  make test-watch - Run tests in watch mode"
	@echo "  make lint      - Run code linter"
	@echo "  make format    - Format code"
	@echo ""
	@echo "$(GREEN)Build & Deploy:$(NC)"
	@echo "  make build     - Build production assets"
	@echo "  make deploy    - Deploy to production"
	@echo ""
	@echo "$(GREEN)Utilities:$(NC)"
	@echo "  make clean     - Clean build artifacts"
	@echo "  make doctor    - Check project health"
	@echo "  make shell     - Start IEx shell with project loaded"

## setup: Initial project setup (run once after cloning)
setup:
	@echo "$(BLUE)Setting up BobaTalkie...$(NC)"
	mix deps.get
	mix deps.compile
	cd assets && npm install
	mix assets.setup
	@echo "$(GREEN)✅ Setup complete! Run 'make server' to start development$(NC)"

## deps: Install and update dependencies
deps:
	@echo "$(BLUE)Updating dependencies...$(NC)"
	mix deps.get
	mix deps.compile
	cd assets && npm install
	@echo "$(GREEN)✅ Dependencies updated$(NC)"

## server: Start Phoenix development server
server:
	@echo "$(BLUE)Starting BobaTalkie development server...$(NC)"
	@echo "$(YELLOW)📍 Access at: http://localhost:4000$(NC)"
	@echo "$(YELLOW)📍 Game at: http://localhost:4000/game$(NC)"
	mix phx.server

## test: Run all tests
test:
	@echo "$(BLUE)Running tests...$(NC)"
	mix test

## test-watch: Run tests in watch mode
test-watch:
	@echo "$(BLUE)Running tests in watch mode...$(NC)"
	mix test.watch

## lint: Run code linter and static analysis
lint:
	@echo "$(BLUE)Running linter...$(NC)"
	mix credo --strict
	mix dialyzer

## format: Format Elixir code
format:
	@echo "$(BLUE)Formatting code...$(NC)"
	mix format
	@echo "$(GREEN)✅ Code formatted$(NC)"

## build: Build production assets
build:
	@echo "$(BLUE)Building production assets...$(NC)"
	mix assets.deploy
	mix compile
	@echo "$(GREEN)✅ Production build complete$(NC)"

## deploy: Deploy to production (Fly.io)
deploy:
	@echo "$(BLUE)Deploying to production...$(NC)"
	fly deploy
	@echo "$(GREEN)✅ Deployed successfully$(NC)"

## clean: Clean build artifacts
clean:
	@echo "$(BLUE)Cleaning build artifacts...$(NC)"
	mix clean
	rm -rf _build
	rm -rf deps
	cd assets && rm -rf node_modules
	@echo "$(GREEN)✅ Clean complete$(NC)"

## doctor: Check project health
doctor:
	@echo "$(BLUE)Checking project health...$(NC)"
	@echo "$(YELLOW)Elixir version:$(NC)"
	elixir --version
	@echo "$(YELLOW)Mix version:$(NC)"
	mix --version
	@echo "$(YELLOW)Node.js version:$(NC)"
	node --version
	@echo "$(YELLOW)Dependencies status:$(NC)"
	mix deps
	@echo "$(YELLOW)Compilation status:$(NC)"
	mix compile --warnings-as-errors
	@echo "$(GREEN)✅ Health check complete$(NC)"

## shell: Start IEx shell with project loaded
shell:
	@echo "$(BLUE)Starting IEx shell...$(NC)"
	iex -S mix

# Development shortcuts
dev: server
start: server
run: server

# Testing shortcuts  
t: test
tw: test-watch

# Formatting shortcuts
fmt: format
f: format

# Default target
.DEFAULT_GOAL := help