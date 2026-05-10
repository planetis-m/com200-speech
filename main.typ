// COMM200 Persuasive Speech Presentation
// Topic: The republic presented as democracy proves to be oligarchy
// Compile with: typst compile presentation/main.typ presentation/res-publica-democracy.pdf

#set page(
  width: 16in,
  height: 9in,
  margin: 0pt,
)

#set text(
  font: "Liberation Sans",
  size: 24pt,
  lang: "en",
  fill: rgb("#1f2933"),
)

#let navy = rgb("#1f2933")
#let blue = rgb("#315c72")
#let gold = rgb("#b68b2e")
#let pale = rgb("#f7f8f6")
#let border = rgb("#d8ddd8")
#let muted = rgb("#64707d")
#let red = rgb("#8f3d38")
#let green = rgb("#2f6f5e")

#let footer(source: none) = {
  if source != none {
    place(
      bottom + left,
      dx: 0.65in,
      dy: -0.35in,
      text(size: 10pt, fill: muted)[Source: #source]
    )
  }
}

#let img-fit(path, height: 2.4in) = {
  rect(
    width: 100%,
    height: height,
    radius: 8pt,
    stroke: 1pt + border,
    fill: white,
  )[
    #image(path, width: 100%, height: 100%, fit: "cover")
  ]
}

#let image-box(label) = rect(
  width: 100%,
  height: 2.4in,
  radius: 8pt,
  stroke: 1pt + border,
  fill: rgb("#ffffff"),
  inset: 16pt,
)[
  #align(center + horizon)[
    #text(size: 18pt, fill: muted)[#label]
  ]
]

#let slide(title, body, source: none) = {
  rect(
    width: 100%,
    height: 100%,
    fill: pale,
    inset: (x: 0.7in, y: 0.55in),
  )[
    #grid(
      columns: (1fr,),
      rows: (auto, 1fr),
      gutter: 0.28in,
      [
        #text(size: 34pt, weight: "bold", fill: navy)[#title]
        #line(length: 100%, stroke: 1.2pt + gold)
      ],
      [
        #body
      ],
    )
    #footer(source: source)
  ]
}

#let slide-sep = pagebreak()

#let bullets(items) = {
  set list(indent: 0.28in, body-indent: 0.18in)
  list(..items)
}

#let two-col(left, right) = grid(
  columns: (1fr, 1fr),
  gutter: 0.45in,
  left,
  right,
)

#let stat-card(num, label, color: blue) = rect(
  width: 100%,
  radius: 8pt,
  stroke: 1pt + border,
  fill: white,
  inset: 18pt,
)[
  #text(size: 42pt, weight: "bold", fill: color)[#num]
  #v(6pt)
  #text(size: 16pt, fill: muted)[#label]
]

// Slide 1
#slide[
  Republic Disguised as Democracy
][
  #v(0.35in)
  #text(size: 30pt, weight: "bold", fill: blue)[The Oligarchic Structure of Parliamentarism]
  #v(0.22in)
  #text(size: 22pt)[From electoral permission to citizen sovereignty]
  #v(0.55in)
  #img-fit("assets/parliament.jpg", height: 2.6in)
  #v(0.28in)
  #text(size: 16pt, fill: muted)[COMM200 Persuasive Speech · Monroe's Motivated Sequence]
]

#slide-sep

// Slide 2
#slide(source: "Freedom House, 2025")[
  The Core Deception
][
  #two-col[
    #bullets((
      [Elections without rule],
      [Representation without mandate],
      [Public interest defined from above],
      [Citizens as spectators],
      [Oligarchy with democratic branding],
    ))
  ][
    #stat-card("1 vote", "Political equality is necessary, not sufficient", color: blue)
    #v(0.2in)
    #img-fit("assets/democracy-dashboard.png", height: 2.2in)
  ]
]

// Slide 3
#slide[
  Argument 1 · Elections Are Not Rule
][
  #two-col[
    #bullets((
      [Res publica],
      [Managed public interest],
      [Officeholder interpretation],
      [No citizen agenda-setting],
      [No continuous sovereignty],
    ))
  ][
    #img-fit("assets/citizen-assembly.jpg", height: 2.9in)
    #v(0.18in)
    #text(size: 18pt, fill: muted)[Aristotle · Rousseau · Dahl]
  ]
]

// Speaker cue: Pause after "Elections are necessary, but not sufficient."

// Slide 4
#slide[
  Argument 2 · Parliamentarism Inverts Power
][
  #two-col[
    #bullets((
      [Parties select candidates],
      [Voters ratify options],
      [Representatives obey party line],
      [Government dominates parliament],
      [Citizens lose command],
    ))
  ][
    #rect(width: 100%, height: 3.5in, radius: 8pt, stroke: 1pt + border, fill: white, inset: 18pt)[
      #align(center)[
        #text(size: 20pt, weight: "bold", fill: navy)[Citizens]
        #v(10pt)
        #text(size: 28pt, fill: gold)[↓]
        #v(10pt)
        #text(size: 20pt, weight: "bold", fill: navy)[Parties]
        #v(10pt)
        #text(size: 28pt, fill: gold)[↓]
        #v(10pt)
        #text(size: 20pt, weight: "bold", fill: navy)[Parliament]
        #v(10pt)
        #text(size: 28pt, fill: gold)[↓]
        #v(10pt)
        #text(size: 20pt, weight: "bold", fill: navy)[Policy]
      ]
    ]
  ]
]

// Slide 5
#slide(source: "Transparency International, 2026")[
  Argument 3 · Oligarchy Reproduces Itself
][
  #two-col[
    #bullets((
      [Party machines],
      [Economic oligarchy],
      [Media influence],
      [State appointments],
      [Weak accountability],
    ))
  ][
    #stat-card("50/100", "Corruption perception score · Greece", color: red)
    #v(0.2in)
    #img-fit("assets/power-network.svg", height: 2.2in)
  ]
]

// Slide 6
#slide(source: "Reporters Without Borders, 2026")[
  Accountability Breakdown
][
  #two-col[
    #stat-card("86/180", "Press freedom rank · Greece", color: red)
    #v(0.18in)
    #stat-card("55.05", "Press freedom score", color: blue)
  ][
    #bullets((
      [Institutional pressure],
      [Wiretapping concerns],
      [SLAPP pressure],
      [Information control],
      [Accountability deficit],
    ))
    #v(0.2in)
    #rect(width: 100%, height: 1.35in, radius: 8pt, stroke: 1pt + border, fill: white, inset: 12pt)[
      #text(size: 16pt, fill: muted)[Chart placeholder: Greece vs selected EU press freedom ranks]
    ]
  ]
]

// Slide 7
#slide[
  Satisfaction · Constitutional Makeover
][
  #two-col[
    #bullets((
      [Citizen-initiated referenda],
      [Citizen legislative power],
      [Recall of officials],
      [Independent justice],
      [Transparent public finance],
      [Anti-corruption prosecution],
    ))
  ][
    #rect(width: 100%, height: 3.4in, radius: 8pt, stroke: 1pt + border, fill: white, inset: 18pt)[
      #align(center + horizon)[
        #text(size: 22pt, weight: "bold", fill: navy)[Citizen Body]
        #v(8pt)
        #text(size: 28pt, fill: gold)[↔]
        #v(8pt)
        #text(size: 22pt, weight: "bold", fill: blue)[Constitution]
        #v(8pt)
        #text(size: 28pt, fill: gold)[↔]
        #v(8pt)
        #text(size: 22pt, weight: "bold", fill: green)[Institutions]
      ]
    ]
  ]
]

// Speaker cue: Present solution as practical, not utopian.

// Slide 8
#slide[
  Visualization · Two Political Orders
][
  #two-col[
    #text(size: 24pt, weight: "bold", fill: red)[Republic as Oligarchy]
    #v(0.18in)
    #bullets((
      [Voting ritual],
      [Party command],
      [Elite bargaining],
      [Opaque decisions],
      [Managed citizens],
    ))
  ][
    #text(size: 24pt, weight: "bold", fill: green)[Constitutional Democracy]
    #v(0.18in)
    #bullets((
      [Citizen rule],
      [Direct mandate],
      [Recall],
      [Public audit],
      [Accountable institutions],
    ))
  ]
]

// Slide 9
#slide[
  Action · Demand Citizen Sovereignty
][
  #two-col[
    #bullets((
      [Reject electoral minimalism],
      [Demand constitutional reform],
      [Support citizen referenda],
      [Support recall powers],
      [Organize beyond parties],
    ))
  ][
    #img-fit("assets/civic-checklist.jpg", height: 3.2in)
    #v(0.18in)
    #text(size: 20pt, weight: "bold", fill: navy)[Citizens must become an institution.]
  ]
]

// Slide 10
#slide[
  APA Bibliography
][
  #set text(size: 13pt)
  #bullets((
    [Aristotle. (1998). _Politics_. Hackett Publishing.],
    [Dahl, R. A. (1971). _Polyarchy_. Yale University Press.],
    [Freedom House. (2025). _Greece: Freedom in the World 2025_.],
    [Kalenteridis, S. (2026). _This Is Greece's Only Way Out: A Democratic Party_. YouTube transcript.],
    [Reporters Without Borders. (2026). _Greece_.],
    [Rousseau, J.-J. (2002). _The social contract_. Yale University Press.],
    [Stathis, T. (2026). _Res publica instead of democracy proves to be oligarchy_. SLpress.],
    [Transparency International. (2026). _Corruption Perceptions Index 2025_.],
  ))
]
