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
  size: 22pt,
  lang: "en",
  fill: rgb("#1a2026"),
)

#let coal = rgb("#111820")
#let ink = rgb("#18232d")
#let navy = rgb("#1b2a3d")
#let paper = rgb("#f2efe8")
#let paper-soft = rgb("#e7e1d6")
#let mist = rgb("#6d7478")
#let hairline = rgb("#cfc6b8")
#let brass = rgb("#a98239")
#let rust = rgb("#7f302f")
#let olive = rgb("#40584e")
#let white-soft = rgb("#fbfaf6")

#let dim = coal.transparentize(18%)
#let veil = paper.transparentize(8%)
#let safe-x = 0.78in
#let safe-y = 0.58in

#let foot(source: none, dark: false) = {
  if source != none {
    place(
      bottom + left,
      dx: safe-x,
      dy: -0.34in,
      text(size: 9.5pt, fill: if dark { white-soft.transparentize(28%) } else { mist })[
        Source: #source
      ],
    )
  }
}

#let rule(width: 0.88in, color: brass) = line(length: width, stroke: 1.2pt + color)

#let kicker(body, dark: false, color: brass) = text(
  size: 10.5pt,
  weight: "bold",
  fill: if dark { color.lighten(18%) } else { color },
  tracking: 0.7pt,
)[#upper(body)]

#let title-text(body, dark: false, size: 48pt) = text(
  size: size,
  weight: "bold",
  fill: if dark { white-soft } else { ink },
)[#body]

#let lead(body, dark: false, size: 25pt) = text(
  size: size,
  fill: if dark { white-soft.transparentize(10%) } else { rgb("#30383f") },
)[#body]

#let body-text(body, dark: false, size: 19pt) = text(
  size: size,
  fill: if dark { white-soft.transparentize(22%) } else { rgb("#394148") },
)[#body]

#let frame(fill: paper, body) = rect(
  width: 100%,
  height: 100%,
  fill: fill,
  inset: (x: safe-x, y: safe-y),
)[#body]

#let dark-frame(body, source: none) = rect(
  width: 100%,
  height: 100%,
  fill: coal,
  inset: (x: safe-x, y: safe-y),
)[
  #body
  #foot(source: source, dark: true)
]

#let image-stage(path, body, source: none, align-pos: left + bottom) = rect(
  width: 100%,
  height: 100%,
  inset: 0pt,
)[
  #image(path, width: 100%, height: 100%, fit: "cover")
  #place(top + left, rect(width: 100%, height: 100%, fill: dim))
  #place(
    align-pos,
    dx: safe-x,
    dy: -safe-y,
    block(width: 8.7in)[#body],
  )
  #foot(source: source, dark: true)
]

#let split-slide(k, title, left, right, source: none, accent: brass) = frame[
  #grid(
    columns: (4.65in, 1fr),
    gutter: 0.72in,
    align: top,
    [
      #kicker(k, color: accent)
      #v(0.14in)
      #title-text(title, size: 38pt)
      #v(-0.08in)
      #rule(color: accent)
      #v(0.28in)
      #left
    ],
    [
      #v(0.92in)
      #right
    ],
  )
  #foot(source: source)
]

#let statement(k, title, sub: none, accent: brass, dark: true, source: none) = {
  if dark {
    dark-frame(source: source)[
      #block(width: 10.2in)[
        #v(1.42in)
        #kicker(k, dark: true, color: accent)
        #v(0.16in)
        #title-text(title, dark: true, size: 54pt)
        #v(-0.1in)
        #rule(width: 1.2in, color: accent)
        #if sub != none {
          v(0.28in)
          lead(sub, dark: true, size: 25pt)
        }
      ]
    ]
  } else {
    frame[
      #block(width: 10.5in)[
        #v(1.45in)
        #kicker(k, color: accent)
        #v(0.16in)
        #title-text(title, size: 54pt)
        #v(-0.1in)
        #rule(width: 1.2in, color: accent)
        #if sub != none {
          v(0.28in)
          lead(sub, size: 25pt)
        }
      ]
      #foot(source: source)
    ]
  }
}

#let point(body, accent: brass, dark: false) = grid(
  columns: (0.26in, 1fr),
  gutter: 0.08in,
  align: top,
  text(size: 20pt, fill: accent)[—],
  body-text(body, dark: dark, size: 20pt),
)

#let points(items, accent: brass, dark: false, gap: 0.18in) = stack(
  dir: ttb,
  spacing: gap,
  ..items.map(it => point(it, accent: accent, dark: dark)),
)

#let stat(num, label, accent: rust) = block(width: 100%)[
  #text(size: 70pt, weight: "bold", fill: accent)[#num]
  #v(-0.22in)
  #rule(width: 0.7in, color: accent)
  #v(0.18in)
  #body-text(label, size: 18pt)
]

#let caption(body, dark: false) = text(
  size: 12pt,
  fill: if dark { white-soft.transparentize(35%) } else { mist },
)[#body]

#let photo-panel(path, height: 5.2in) = rect(
  width: 100%,
  height: height,
  fill: white-soft,
  inset: 0pt,
)[#image(path, width: 100%, height: 100%, fit: "cover")]

#let compare-col(title, items, accent) = block(width: 100%)[
  #text(size: 25pt, weight: "bold", fill: accent)[#title]
  #v(-0.06in)
  #rule(width: 0.64in, color: accent)
  #v(0.24in)
  #points(items, accent: accent, gap: 0.15in)
]

#let sep = pagebreak()

// Slide 1
#image-stage("assets/parliament.jpg", source: "Wikimedia Commons, A.Savin, CC BY-SA 3.0")[
  #kicker("COMM200 Persuasive Speech", dark: true)
  #v(0.16in)
  #title-text([Republic Is Not Democracy], dark: true, size: 57pt)
  #v(0.22in)
  #lead([Representation without participation is oligarchy.], dark: true, size: 27pt)
  #v(0.58in)
  #caption([A political system can look democratic while moving power away from citizens.], dark: true)
]

#sep

// Slide 2
#statement(
  [The Core Deception],
  [One vote is not the same as power.],
  sub: [Elections can authorize rulers without giving citizens command over law, agenda, or accountability.],
  source: [Freedom House, 2025],
)

#sep

// Slide 3
#split-slide(
  [Argument 1],
  [Elections Are Not Rule],
  [
    #points((
      [Res publica names a public interest.],
      [Officeholders define that interest from above.],
      [Citizens choose rulers, then disappear from command.],
      [No agenda power means no continuous sovereignty.],
    ))
    #v(0.48in)
    #caption([Aristotle · Rousseau · Dahl])
  ],
  [
    #photo-panel("assets/citizen-assembly.jpg", height: 5.55in)
  ],
)

#sep

// Slide 4
#dark-frame[
  #grid(
    columns: (1fr, 1.25fr),
    gutter: 0.7in,
    align: horizon,
    [
      #kicker([Argument 2], dark: true, color: rust)
      #v(0.16in)
      #title-text([Representation Replaces Participation], dark: true, size: 42pt)
      #v(0.3in)
      #lead([The direction of power is reversed.], dark: true, size: 25pt)
    ],
    [
      #v(0.7in)
      #rect(width: 100%, height: 4.35in, fill: rgb("#f2efe8"), inset: 0.38in)[
        #grid(
          columns: (1fr,),
          rows: (auto, auto, auto),
          gutter: 0.34in,
          [
            #text(size: 27pt, weight: "bold", fill: ink)[Citizens]
            #v(0.06in)
            #caption([source of legitimacy])
          ],
          [
            #text(size: 27pt, weight: "bold", fill: rust)[Parties]
            #v(0.06in)
            #caption([candidate filter · program filter · discipline])
          ],
          [
            #text(size: 27pt, weight: "bold", fill: rust)[Parliament]
            #v(0.06in)
            #caption([law after options are already managed])
          ],
        )
      ]
    ],
  )
]

#sep

// Slide 5
#split-slide(
  [Argument 3],
  [Oligarchy Reproduces Itself],
  [
    #lead([Oligarchy does not need secrecy. It needs access.], size: 25pt)
    #v(0.38in)
    #points((
      [Party machines control entry.],
      [Economic power controls influence.],
      [Media visibility controls attention.],
      [Appointments control enforcement.],
    ), accent: rust)
  ],
  [
    #stat([50/100], [Corruption perception score · Greece], accent: rust)
    #v(0.54in)
    #rect(width: 100%, height: 1pt, fill: hairline)
    #v(0.34in)
    #body-text([Access becomes the real constitution: who enters, who is heard, who is protected, and who is ignored.], size: 22pt)
  ],
  source: [Transparency International, 2026],
  accent: rust,
)

#sep

// Slide 6
#dark-frame(source: "Reporters Without Borders, 2026")[
  #grid(
    columns: (5.15in, 1fr),
    gutter: 0.74in,
    align: horizon,
    [
      #kicker([Institutional Crisis], dark: true, color: rust)
      #v(0.16in)
      #title-text([Accountability Breaks When Information Is Pressured], dark: true, size: 42pt)
      #v(-0.08in)
      #rule(width: 0.92in, color: rust.lighten(14%))
      #v(0.26in)
      #lead([Without independent information, citizens cannot judge power.], dark: true, size: 24pt)
    ],
    [
      #v(0.92in)
      #text(size: 82pt, weight: "bold", fill: rust.lighten(16%))[86/180]
      #v(-0.28in)
      #rule(width: 0.84in, color: rust.lighten(14%))
      #v(0.22in)
      #body-text([Press freedom rank · Greece], dark: true, size: 20pt)
      #v(0.48in)
      #rect(width: 100%, height: 1pt, fill: white-soft.transparentize(78%))
      #v(0.36in)
      #points((
        [Institutional pressure],
        [Wiretapping concerns],
        [SLAPP pressure],
        [Information control],
      ), accent: rust.lighten(16%), dark: true, gap: 0.13in)
    ],
  )
]

#sep

// Slide 7
#statement(
  [Satisfaction],
  [Democracy Requires Constitutional Tools, Not Just Democratic Language.],
  sub: [Referendum. Initiative. Recall. Audit. Independent justice.],
  accent: olive,
  dark: false,
)

#sep

// Slide 8
#frame[
  #kicker([Two Political Orders], color: brass)
  #v(0.18in)
  #title-text([The Choice Is Structural], size: 43pt)
  #v(0.46in)
  #grid(
    columns: (1fr, 1fr),
    gutter: 0.82in,
    [
      #compare-col([Republic as Oligarchy], (
        [Voting ritual],
        [Party command],
        [Elite bargaining],
        [Opaque decisions],
        [Managed people],
      ), rust)
    ],
    [
      #compare-col([Constitutional Democracy], (
        [Citizen rule],
        [Direct mandate],
        [Recall],
        [Public audit],
        [Accountable institutions],
      ), olive)
    ],
  )
]

#sep

// Slide 9
#split-slide(
  [Action],
  [Power to the People],
  [
    #points((
      [Reject voting-only democracy.],
      [Demand constitutional reform.],
      [Demand popular referenda.],
      [Demand recall powers.],
      [Demand legislative initiative.],
    ), accent: olive)
    #v(0.42in)
    #lead([Representation is not participation.], size: 24pt)
  ],
  [
    #photo-panel("assets/civic-checklist.jpg", height: 5.55in)
  ],
  accent: olive,
)

#sep

// Slide 10
#frame[
  #grid(
    columns: (4.35in, 1fr),
    gutter: 0.78in,
    align: top,
    [
      #kicker([Sources], color: brass)
      #v(0.16in)
      #title-text([References], size: 43pt)
      #v(-0.08in)
      #rule(width: 0.9in)
      #v(0.3in)
      #body-text([Works cited for the speech's historical, theoretical, and institutional claims.], size: 19pt)
    ],
    [
      #v(0.92in)
      #set text(size: 12.4pt, fill: rgb("#30383f"))
      #let ref-group(label, body) = block(width: 100%)[
        #text(size: 9.5pt, weight: "bold", fill: brass, tracking: 0.5pt)[#upper(label)]
        #v(0.08in)
        #body
      ]
      #let ref(body) = block(width: 100%)[#body]

      #ref-group([Democratic Theory])[
        #ref[Aristotle. (1998). _Politics_. Hackett Publishing.]
        #ref[Dahl, R. A. (1971). _Polyarchy_. Yale University Press.]
        #ref[Rousseau, J.-J. (2002). _The social contract_. Yale University Press.]
      ]
      #v(0.22in)
      #ref-group([Institutional Evidence])[
        #ref[Freedom House. (2025). _Greece: Freedom in the World 2025_.]
        #ref[Reporters Without Borders. (2026). _Greece_.]
        #ref[Transparency International. (2026). _Corruption Perceptions Index 2025_.]
      ]
      #v(0.22in)
      #ref-group([Contemporary Argument])[
        #ref[Kalenteridis, S. (2026). _This Is Greece's Only Way Out: A Democratic Party_. YouTube transcript.]
        #ref[Stathis, T. (2026). _Res publica instead of democracy proves to be oligarchy_. SLpress.]
      ]
    ],
  )
]
