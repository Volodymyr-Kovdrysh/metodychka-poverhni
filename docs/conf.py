# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

import os

project = 'Методичка'
copyright = '2025, Руслана КОЛІСНИК, Вадими МИРОНИК, Володимир КОВДРИШ'
author = 'Руслана КОЛІСНИК, Вадими МИРОНИК, Володимир КОВДРИШ'
booktype = 'Методичні рекомендації'  # або 'custom', якщо використовуєш свій клас
booktitle = 'Поверхні другого порядку'
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
html_theme_options = {
    "repository_url": "https://github.com/Volodymyr-Kovdrysh/metodychka-poverhni",
    "repository_branch": "dev",
    "path_to_docs": "source",
    "use_source_button": True,
    # "use_repository_button": True,
    "use_issues_button": True,
    "use_edit_page_button": True,
    "home_page_in_toc": False,
    "show_navbar_depth": 2,
    "toc_title": "{your-title}",
    "show_toc_level": 2
}
html_title = booktitle
html_static_path = ['_static']



myst_enable_extensions = [
  "deflist",
  "dollarmath", 
  "amsmath", 
  "colon_fence", 
  "attrs_block", 
  "attrs_inline",
  "fieldlist"]


# -- Options for LaTeX output ------------------------------------------------
with open('_latex/title.tex', 'r') as f:
    TITLE = f.read()



latex_additional_files = ["_latex/fancybook.cls",]# "_latex/mystyle.sty"]

latex_documents = [
    ('index', 'project.tex', 'Назва Проекту', author, 'fancybook'),  # manual замініть на custom
]

latex_elements = {
    'fontenc': '',  # прибирає \usepackage[T1]{fontenc}
    'inputenc': r'\usepackage[utf8]{inputenc}',
    'babel': r'\usepackage[ukrainian]{babel}',
    'maketitle': r'\maketitle',  # замінює \sphinxmaketitle
    'tableofcontents': r'''\chapterstyle{FancyUnnumberedChap}
\tableofcontents*
\mainmatter
\pagestyle{headings}
    ''',  # замінює \sphinxtableofcontents
    'preamble': r'''
\newcommand{\booktitle}{'''+ booktitle + r'''}
\newcommand{\booktype}{'''+ booktype + r'''}
    ''',
}

# latex_elements = {
#     'papersize': 'a5paper',
#     'preamble': r'''\usepackage{mystyle}
#       \chapterstyle{FancyChap}
#       \pagestyle{empty}  % Це вимикає стандартну нумерацію Sphinx
#     ''',
#     'maketitle': ''
#     }

# # Додаємо додаткові файли для Latex-збірки (якщо треба)
# latex_additional_files = [
#     '_templates/latex/sphinxmanual.cls',
# ]

# # Якщо треба кастомний title.tex (можеш теж створити)
# if os.path.exists('_latex/title.tex'):
#     with open('_latex/title.tex', 'r', encoding='utf-8') as f:
#         TITLE = f.read()
# else:
#     TITLE = r'\maketitle'  # fallback

# # Основна магія — preamble
# latex_elements = {
#     'papersize': 'a5paper',
#     'pointsize': '12pt',
#     'preamble': r'''
# \usepackage{tikz}
# \usetikzlibrary{shapes,positioning}
# \usepackage{xcolor}

# % Якщо треба визначити кольори прямо тут
# \definecolor{Sienna}{rgb}{0.627, 0.322, 0.176}
# \definecolor{Cornsilk}{rgb}{1.0, 0.972, 0.862}
# \definecolor{LightGoldenrod}{rgb}{0.933, 0.867, 0.51}
# \definecolor{LightSalmon1}{rgb}{1.0, 0.627, 0.478}

# % Активуємо твій стиль розділів (важливо!)
# \AtBeginDocument{\chapterstyle{FancyChap}}
# ''',
#     'maketitle': TITLE,
# }
