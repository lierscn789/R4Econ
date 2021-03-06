## ----global_options, include = FALSE-------------------------------------------------------------------------------------------------------------------
try(source("../../.Rprofile"))


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Load Data
dt <- mtcars[1:4, 1:6]
# Generate latex string variable
st_out_tex <- kable(dt, "latex")
print(st_out_tex)
# File out
# fileConn <- file("./../../_file/tex/tex_sample_a_tab.tex")
fileConn <- file("_file/tex/tex_sample_a_tab.tex")
writeLines(st_out_tex, fileConn)
close(fileConn)


## ------------------------------------------------------------------------------------------------------------------------------------------------------

st_file <- "\\documentclass[12pt,english]{article}
\\usepackage[bottom]{footmisc}
\\usepackage[urlcolor=blue]{hyperref}
\\begin{document}
\\title{A Latex Testing File}
\\author{\\href{http://fanwangecon.github.io/}{Fan Wang} \\thanks{See information \\href{https://fanwangecon.github.io/Tex4Econ/}{Tex4Econ} for more.}}
\\maketitle
Ipsum information dolor sit amet, consectetur adipiscing elit. Integer Latex placerat nunc orci.
\\paragraph{\\href{https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3140132}{Data}}
Village closure information is taken from a village head survey.\\footnote{Generally students went to schools.}
output:
  pdf_document:
    pandoc_args: '..//..//_output_kniti_pdf.yaml'
    includes:
      in_header: '..//..//preamble.tex'
  html_document:
    toc: true
    number_sections: true
    toc_float:
      collapsed: false
      smooth_scroll: false
      toc_depth: 3
    pandoc_args: '..//..//_output_kniti_html.yaml'
    includes:
      in_header: '..//..//hdga.html'
\\end{document}"

print(st_file)

fl_test_tex <- "_file/tex/test_fan.tex"
fileConn <- file(fl_test_tex)
writeLines(st_file, fileConn)
close(fileConn)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
fileConn <- file(fl_test_tex, "r")
st_file_read <- readLines(fileConn)
print(st_file_read)
close(fileConn)


## ------------------------------------------------------------------------------------------------------------------------------------------------------
# Read in Lines from existing file
fileConn <- file(fl_test_tex, "r")
st_file_read <- readLines(fileConn)
close(fileConn)

# Search and Replace String
st_search <- "html_document:
    toc: true
    number_sections: true
    toc_float:
      collapsed: false
      smooth_scroll: false
      toc_depth: 3"
st_replace <- paste0("html_document:
    toc: true
    number_sections: true
    toc_float:
      collapsed: false
      smooth_scroll: false
      toc_depth: 3\r\n",
                     "    toc: true\r\n",
                     "    number_sections: true\r\n",
                     "    toc_float:\r\n",
                     "      collapsed: false\r\n",
                     "      smooth_scroll: false\r\n",
                     "      toc_depth: 3")

# Search and Replace
st_file_updated <- gsub(x = st_file_read,
                        pattern = st_search,
                        replacement = st_replace)

# Print
print(st_file_updated)

# Save Updated File
fl_srcrep_tex <- "_file/tex/test_fan_search_replace.tex"
fileConn_sr <- file(fl_srcrep_tex)
writeLines(st_file_updated, fileConn_sr)
close(fileConn_sr)

