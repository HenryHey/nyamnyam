SHELL := /bin/sh

.PHONY: install serve draft build clean

install: ## Install Ruby dependencies
	bundle install

serve: ## Run local Jekyll server
	bundle exec jekyll serve --livereload

draft: ## Run local server with drafts and future posts
	bundle exec jekyll serve --livereload --drafts --future

build: ## Build the static site into _site/
	bundle exec jekyll build

clean: ## Remove generated build/cache artifacts
	bundle exec jekyll clean
