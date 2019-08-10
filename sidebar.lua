-- https://github.com/jgm/pandoc/issues/2106#issuecomment-371355862
function Span(el)
  if el.classes:includes("todo") then
    return {
      pandoc.RawInline("latex", "\\textcolor{red}{\\textbf{TODO: }"),
      el,
      pandoc.RawInline("latex", "}")
    }
  end
end

function Div(el)
  if el.classes:includes("sidebar") then
    return {
      pandoc.RawBlock("latex", "\\begin{shaded}"),
      el,
      pandoc.RawBlock("latex", "\\end{shaded}")
    }
  end

  if el.classes:includes("base") then
    return {
      pandoc.RawBlock("latex", "\\begin{shaded} \\textbf{In Base R}"),
      el,
      pandoc.RawBlock("latex", "\\end{shaded}")
    }
  end

  if el.classes:includes("tidyverse") then
    return {
      pandoc.RawBlock("latex", "\\begin{shaded} \\textbf{In Tidyverse}"),
      el,
      pandoc.RawBlock("latex", "\\end{shaded}")
    }
  end

  if el.classes:includes("rmdnote") then
    return {
      pandoc.RawBlock("latex", "\\begin{shaded}\\textcolor[RGB]{251,188,5}{\\textbf{注意}}"),
      el,
      pandoc.RawBlock("latex", "\\end{shaded}")
    }
  end

  if el.classes:includes("warning") then
    return {
      pandoc.RawBlock("latex", "\\begin{shaded} \\textcolor{red}{\\textbf{警告}}"),
      el,
      pandoc.RawBlock("latex", "\\end{shaded}")
    }
  end
end
