# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Методичка'
copyright = '2025, Вадими МИРОНИК, Володимир КОВДРИШ'
author = 'Вадими МИРОНИК, Володимир КОВДРИШ'
release = '0.0.0'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration
master_doc = "index"
extensions = ["myst_parser",
              "sphinx.ext.autodoc"]

source_suffix = {
    '.rst': 'restructuredtext',
    '.md': 'markdown',
}

templates_path = ['_templates']
exclude_patterns = []

language = 'uk'

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_book_theme'
html_static_path = ['_static']
myst_enable_extensions = [
  "deflist",
  "dollarmath", 
  "amsmath", 
  "colon_fence", 
  "attrs_block", 
  "attrs_inline",
  "fieldlist"]
latex_additional_files = ["mystyle.sty", "_latex/custom.cls"]

latex_documents = [
    ('index', 'project.tex', 'Назва Проекту', 'Автори', 'custom'),  # manual замініть на custom
]

latex_elements = {
    'papersize': 'a5paper',
    'inputenc': r'\usepackage[utf8]{inputenc}',
    'preamble': r'\usepackage{mystyle}'      }
