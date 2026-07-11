SHELL := /bin/sh

# Prefer Homebrew Ruby over macOS system Ruby (2.6), which is too old for this project.
export PATH := /opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/4.0.0/bin:$(PATH)

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
