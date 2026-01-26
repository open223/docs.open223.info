# Makefile for building the Jupyter Book

.PHONY: all
all: html

# Create kernel, build book, and copy CNAME
.PHONY: html
html:
	@echo "--- Creating Jupyter Kernel ---"
	@uv run python -m ipykernel install --user --name open223-book --display-name "open223-book"
	@echo "\n--- Building Jupyter Book ---"
	@uv run jupyter book build --html
	@echo "\n--- Copying CNAME ---"
	@cp CNAME _build/site/public/
	@echo "\nBuild complete. The book is in _build/site/public/"

# Serve the book locally
.PHONY: serve
serve:
	@echo "\n--- Serving book on http://localhost:3000 ---"
	@echo "Navigate to http://localhost:3000 in your browser. Press Ctrl+C to stop."
	@uv run jupyter book start

# Remove build artifacts
.PHONY: clean
clean:
	@echo "--- Cleaning build artifacts ---"
	@rm -rf _build .jupyter_cache
