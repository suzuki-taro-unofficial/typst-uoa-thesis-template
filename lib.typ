// MIT License
// 
// Copyright (c) 2024 pogyomo
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#let thesis = (
  title: str,
  author: str,
  id: str,
  superviser: str,
  year: str,
  abstract: none,
  bibliography-file: none,
  body,
) => {
  set page(
    paper: "a4",
    margin: (top: 40mm, right: 25mm, bottom: 40mm, left: 25mm),
    columns: 2,
    header: [
      #grid(
        columns: (4fr, 1fr, 1fr),
        align(left, text(10pt, style: "italic")[
          University of Aizu, Graduate Thesis, March, #year
        ]),
        align(center, text(10pt)[
          #id
        ]),
        align(right, text(10pt)[
          #context { counter(page).display() }
        ]),
      )
    ],
  )
  set text(size: 10pt, font: ("Times New Roman", "IPAMincho"))
  set par(first-line-indent: 1em, spacing: 0.65em)
  set heading(numbering: "1.1.")

  show heading.where(level: 1): set text(14pt)
  show heading.where(level: 2): set text(12pt)

  place(
    top + center,
    float: true,
    scope: "parent",
  )[
    #align(center, text(20.5pt)[
      #title
    ])
    #line(length: 100%)
    #grid(
      columns: (1fr, 1fr),
      align(left)[
        #text(14pt)[
          #author
        ]
        #h(20pt)
        #text(14pt)[
          #id
        ]
      ],
      align(right)[
        #text(10pt)[
          Supervised by
        ]
        #h(20pt)
        #text(14pt)[
          #superviser
        ]
      ]
    )
  ]

  if abstract != none {
    heading(numbering: none)[Abstract]
    abstract
  }

  body

  if bibliography-file != none {
    heading(numbering: none)[References]
    bibliography(bibliography-file, title: none, full: true)
  }
}
