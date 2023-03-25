
# CV ----------------------------------------------------------------------

# * CV EN -----------------------------------------------------------------
# Knit the HTML version
rmarkdown::render("cv.rmd", output_file = "cv_resume/cv_en.html", params = list(pdf_mode = FALSE, lang = "en"))

# Knit the PDF version
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("cv.rmd", output_file = tmp_html_cv_loc, params = list(pdf_mode = TRUE, lang = "en"))
pagedown::chrome_print(input = tmp_html_cv_loc, output = "cv_resume/cv_en.pdf")

# * CV IT -----------------------------------------------------------------
# Knit the HTML version
rmarkdown::render("cv.rmd", output_file = "cv_resume/cv_it.html", params = list(pdf_mode = FALSE, lang = "it"))

# Knit the PDF version
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("cv.rmd", output_file = tmp_html_cv_loc, params = list(pdf_mode = TRUE, lang = "it"))
pagedown::chrome_print(input = tmp_html_cv_loc, output = "cv_resume/cv_it.pdf")


# Resume ------------------------------------------------------------------

# * Resume EN -------------------------------------------------------------
# Knit the HTML version
rmarkdown::render("resume.rmd", output_file = "cv_resume/resume_en.html", params = list(pdf_mode = FALSE, lang = "en"))

# Knit the PDF version
tmp_html_resume_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("resume.rmd", output_file = tmp_html_resume_loc, params = list(pdf_mode = TRUE, lang = "en"))
pagedown::chrome_print(input = tmp_html_resume_loc, output = "cv_resume/resume_en.pdf")

# * Resume IT -------------------------------------------------------------
# Knit the HTML version
rmarkdown::render("resume.rmd", output_file = "cv_resume/resume_it.html", params = list(pdf_mode = FALSE, lang = "it"))

# Knit the PDF version
tmp_html_resume_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("resume.rmd", output_file = tmp_html_resume_loc, params = list(pdf_mode = TRUE, lang = "it"))
pagedown::chrome_print(input = tmp_html_resume_loc, output = "cv_resume/resume_it.pdf")

