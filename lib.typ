#let thesis = (
  title: str,
  author: str,
  id: str,
  superviser: str,
  year: str,
  abstract: none,
  bibliography-file: str,
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
  set text(
    font: "Times New Roman"
  )
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
