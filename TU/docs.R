source("nvvm.R")

comments = sapply(r, getRawCommentText)
comments = sapply(comments, function(x) gsub("^ \\*[[:space:]]*", "", strsplit(x, "\\n")[[1]]))

comments = lapply(comments, function(x) x[ !( x == "/**" | x == "/" | x == "")])
names(comments) = sapply(gsub("^nvvm", "", names(comments)), uncapitalize)


function(x)
{

}

  

