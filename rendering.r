favicon_fix <- function() {
    # after rendering to tmp_html_cv_loc, inject a tiny inline favicon into the <head> to avoid a /favicon.ico 404
    favicon_link <- '<link rel="icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVQYV2NgYAAAAAMAAWgmWQ0AAAAASUVORK5CYII=">'
    html <- readLines(tmp_html_cv_loc, warn = FALSE)
    head_idx <- grep("(?i)<head[^>]*>", html, perl = TRUE)
    if (length(head_idx)) {
        html <- append(html, favicon_link, after = head_idx[1])
        writeLines(html, tmp_html_cv_loc, useBytes = TRUE)
    }
}

# CV ----------------------------------------------------------------------

# * CV EN -----------------------------------------------------------------
# Knit the HTML version
rmarkdown::render(
    "cv.rmd",
    output_file = "cv_resume/cv_en.html",
    params = list(pdf_mode = FALSE, lang = "en")
)

# Knit the PDF version
# tmp_html_cv_loc <- fs::file_temp(ext = ".html")
# rmarkdown::render(
#     "cv.rmd",
#     output_file = tmp_html_cv_loc,
#     params = list(pdf_mode = TRUE, lang = "en")
# )
# favicon_fix()
# pagedown::chrome_print(input = tmp_html_cv_loc, output = "cv_resume/cv_en.pdf")

# * CV IT -----------------------------------------------------------------
# Knit the HTML version
rmarkdown::render(
    "cv.rmd",
    output_file = "cv_resume/cv_it.html",
    params = list(pdf_mode = FALSE, lang = "it")
)

# Knit the PDF version
# tmp_html_cv_loc <- fs::file_temp(ext = ".html")
# rmarkdown::render(
#     "cv.rmd",
#     output_file = tmp_html_cv_loc,
#     params = list(pdf_mode = TRUE, lang = "it")
# )
# favicon_fix()
# pagedown::chrome_print(input = tmp_html_cv_loc, output = "cv_resume/cv_it.pdf")

# Resume ------------------------------------------------------------------

# * Resume EN -------------------------------------------------------------
# Knit the HTML version
rmarkdown::render(
    "resume.rmd",
    output_file = "cv_resume/resume_en.html",
    params = list(pdf_mode = FALSE, lang = "en")
)

# Knit the PDF version
# tmp_html_resume_loc <- fs::file_temp(ext = ".html")
# rmarkdown::render(
#     "resume.rmd",
#     output_file = tmp_html_resume_loc,
#     params = list(pdf_mode = TRUE, lang = "en")
# )
# favicon_fix()
# pagedown::chrome_print(
#     input = tmp_html_resume_loc,
#     output = "cv_resume/resume_en.pdf"
# )

# * Resume IT -------------------------------------------------------------
# Knit the HTML version
rmarkdown::render(
    "resume.rmd",
    output_file = "cv_resume/resume_it.html",
    params = list(pdf_mode = FALSE, lang = "it")
)

# Knit the PDF version
# tmp_html_resume_loc <- fs::file_temp(ext = ".html")
# rmarkdown::render(
#     "resume.rmd",
#     output_file = tmp_html_resume_loc,
#     params = list(pdf_mode = TRUE, lang = "it")
# )
# favicon_fix()
# pagedown::chrome_print(
#     input = tmp_html_resume_loc,
#     output = "cv_resume/resume_it.pdf"
# )

# CV UNIVERISTY -----------------------------------------------------------
rmarkdown::render(
    "cv_uni.rmd",
    output_file = "cv_resume/cv_uni_en.html",
    params = list(pdf_mode = FALSE, lang = "en")
)

tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render(
    "cv_uni.rmd",
    output_file = tmp_html_cv_loc,
    params = list(pdf_mode = TRUE, lang = "en")
)
favicon_fix()
pagedown::chrome_print(
    input = tmp_html_cv_loc,
    output = "cv_resume/cv_uni_en.pdf"
)


# README ------------------------------------------------------------------
rmarkdown::render("README.Rmd", output_file = "README.md")
