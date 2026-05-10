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
  size: 21pt,
  lang: "en",
  fill: rgb("#151a1f"),
)

#set par(spacing: 0.64em)

#let coal = rgb("#0e1318")
#let ink = rgb("#151a1f")
#let slate = rgb("#26323d")
#let navy = rgb("#152235")
#let ivory = rgb("#f4f1ea")
#let bone = rgb("#e8e1d6")
#let line-soft = rgb("#c9c0b3")
#let muted = rgb("#6d7377")
#let amber = rgb("#9a7b45")
#let red = rgb("#743332")
#let green = rgb("#3f5b4f")
#let white = rgb("#fbfaf6")

#let safe-x = 0.82in
#let safe-y = 0.62in
#let content-w = 14.36in

#let footer(source: none, dark: false) = {
  if source != none {
    place(
      bottom + left,
      dx: safe-x,
      dy: -0.32in,
      text(
        size: 8.8pt,
        fill: if dark { white.transparentize(36%) } else { muted },
      )[Source: #source],
    )
  }
}

#let hair(width: 0.9in, color: amber) = rect(width: width, height: 1.2pt, fill: color)

#let kicker(body, dark: false, color: amber) = text(
  size: 10.2pt,
  weight: "bold",
  fill: if dark { color.lighten(20%) } else { color },
  tracking: 0pt,
)[#upper(body)]

#let display(body, dark: false, size: 50pt, serif: false) = text(
  font: if serif { "Liberation Serif" } else { "Liberation Sans" },
  size: size,
  weight: "bold",
  fill: if dark { white } else { ink },
)[#body]

#let lead(body, dark: false, size: 24pt) = text(
  size: size,
  fill: if dark { white.transparentize(10%) } else { rgb("#30383f") },
)[#body]

#let copy(body, dark: false, size: 18.4pt) = text(
  size: size,
  fill: if dark { white.transparentize(24%) } else { rgb("#3b434a") },
)[#body]

#let small(body, dark: false) = text(
  size: 11.6pt,
  fill: if dark { white.transparentize(38%) } else { muted },
)[#body]

#let canvas(fill: ivory, body, source: none, dark: false) = rect(
  width: 100%,
  height: 100%,
  fill: fill,
  inset: (x: safe-x, y: safe-y),
)[
  #body
  #footer(source: source, dark: dark)
]

#let noir(body, source: none) = canvas(fill: coal, source: source, dark: true)[#body]

#let image-title(path, body, source: none, align-pos: left + bottom, width: 8.7in) = rect(
  width: 100%,
  height: 100%,
  inset: 0pt,
)[
  #image(path, width: 100%, height: 100%, fit: "cover")
  #place(top + left, rect(width: 100%, height: 100%, fill: coal.transparentize(24%)))
  #place(
    align-pos,
    dx: safe-x,
    dy: -safe-y,
    block(width: width)[#body],
  )
  #footer(source: source, dark: true)
]

#let section(k, title, sub: none, accent: amber, dark: true, source: none) = {
  if dark {
    noir(source: source)[
      #v(1.24in)
      #block(width: 10.8in)[
        #kicker(k, dark: true, color: accent)
        #v(0.16in)
        #display(title, dark: true, size: 54pt, serif: true)
        #v(0.04in)
        #hair(width: 1.24in, color: accent)
        #if sub != none {
          v(0.34in)
          lead(sub, dark: true, size: 24pt)
        }
      ]
    ]
  } else {
    canvas[
      #v(1.24in)
      #block(width: 10.8in)[
        #kicker(k, color: accent)
        #v(0.16in)
        #display(title, size: 54pt, serif: true)
        #v(0.04in)
        #hair(width: 1.24in, color: accent)
        #if sub != none {
          v(0.34in)
          lead(sub, size: 24pt)
        }
      ]
    ]
  }
}

#let item(body, accent: amber, dark: false) = grid(
  columns: (0.2in, 1fr),
  gutter: 0.14in,
  align: top,
  block[
    #v(0.105in)
    #rect(width: 0.1in, height: 1.15pt, fill: accent)
  ],
  copy(body, dark: dark, size: 18.7pt),
)

#let list(items, accent: amber, dark: false, gap: 0.18in) = stack(
  dir: ttb,
  spacing: gap,
  ..items.map(it => item(it, accent: accent, dark: dark)),
)

#let photo(path, height: 5.75in, radius: 0pt) = rect(
  width: 100%,
  height: height,
  radius: radius,
  fill: bone,
  inset: 0pt,
)[#image(path, width: 100%, height: 100%, fit: "cover")]

#let editorial-split(k, title, left, right, source: none, accent: amber) = canvas(source: source)[
  #grid(
    columns: (4.75in, 1fr),
    gutter: 0.78in,
    align: top,
    [
      #v(0.28in)
      #kicker(k, color: accent)
      #v(0.16in)
      #display(title, size: 39pt, serif: true)
      #v(0.02in)
      #hair(width: 0.86in, color: accent)
      #v(0.34in)
      #left
    ],
    [
      #v(0.72in)
      #right
    ],
  )
]

#let stat-block(num, label, accent: red, dark: false) = block(width: 100%)[
  #text(size: 72pt, weight: "bold", fill: accent)[#num]
  #v(-0.18in)
  #hair(width: 0.72in, color: accent)
  #v(0.2in)
  #copy(label, dark: dark, size: 18.5pt)
]

#let compare(title, items, accent) = block(width: 100%)[
  #text(size: 24pt, weight: "bold", fill: accent)[#title]
  #v(0.04in)
  #hair(width: 0.66in, color: accent)
  #v(0.26in)
  #list(items, accent: accent, gap: 0.16in)
]

#let sep = pagebreak()

// Slide 1
#image-title("assets/parliament.jpg", source: "Wikimedia Commons, A.Savin, CC BY-SA 3.0")[
  #kicker("COMM200 Persuasive Speech", dark: true)
  #v(0.18in)
  #display([Republic Is Not Democracy], dark: true, size: 58pt, serif: true)
  #v(0.22in)
  #lead([Representation without participation is oligarchy.], dark: true, size: 27pt)
  #v(0.54in)
  #small([A system can look democratic while moving power away from citizens.], dark: true)
]

#sep

// Slide 2
#section(
  [The Core Deception],
  [One vote is not the same as power.],
  sub: [Elections can authorize rulers without giving citizens command over law, agenda, or accountability.],
  source: [Freedom House, 2025],
)

#sep

// Slide 3
#editorial-split(
  [Argument 1],
  [Elections Are Not Rule],
  [
    #list((
      [Res publica names a public interest.],
      [Officeholders define that interest from above.],
      [Citizens choose rulers, then disappear from command.],
      [No agenda power means no continuous sovereignty.],
    ))
    #v(0.48in)
    #small([Aristotle / Rousseau / Dahl])
  ],
  [
    #photo("assets/citizen-assembly.jpg", height: 5.62in)
  ],
)

#sep

// Slide 4
#noir[
  #grid(
    columns: (5.15in, 1fr),
    gutter: 0.84in,
    align: horizon,
    [
      #kicker([Argument 2], dark: true, color: red)
      #v(0.16in)
      #display([Representation Replaces Participation], dark: true, size: 43pt, serif: true)
      #v(0.08in)
      #hair(width: 0.94in, color: red.lighten(12%))
      #v(0.32in)
      #lead([The direction of power is reversed.], dark: true, size: 24pt)
    ],
    [
      #v(0.56in)
      #block(width: 100%)[
        #text(size: 15pt, fill: white.transparentize(34%))[SOURCE OF LEGITIMACY]
        #v(0.18in)
        #text(size: 31pt, weight: "bold", fill: white)[Citizens]
        #v(0.44in)
        #rect(width: 100%, height: 1pt, fill: white.transparentize(78%))
        #v(0.44in)
        #text(size: 15pt, fill: red.lighten(22%))[FILTER OF CHOICE]
        #v(0.18in)
        #text(size: 31pt, weight: "bold", fill: red.lighten(16%))[Parties]
        #v(0.44in)
        #rect(width: 100%, height: 1pt, fill: white.transparentize(78%))
        #v(0.44in)
        #text(size: 15pt, fill: red.lighten(22%))[SITE OF DECISION]
        #v(0.18in)
        #text(size: 31pt, weight: "bold", fill: red.lighten(16%))[Parliament]
        #v(0.3in)
        #copy([Law appears after the options have already been managed.], dark: true, size: 17.5pt)
      ]
    ],
  )
]

#sep

// Slide 5
#editorial-split(
  [Argument 3],
  [Oligarchy Reproduces Itself],
  [
    #lead([Oligarchy does not need secrecy. It needs access.], size: 24pt)
    #v(0.38in)
    #list((
      [Party machines control entry.],
      [Economic power controls influence.],
      [Media visibility controls attention.],
      [Appointments control enforcement.],
    ), accent: red)
  ],
  [
    #v(0.18in)
    #stat-block([50/100], [Corruption perception score / Greece], accent: red)
    #v(0.56in)
    #rect(width: 100%, height: 1pt, fill: line-soft)
    #v(0.36in)
    #copy([Access becomes the real constitution: who enters, who is heard, who is protected, and who is ignored.], size: 21pt)
  ],
  source: [Transparency International, 2026],
  accent: red,
)

#sep

// Slide 6
#noir(source: "Reporters Without Borders, 2026")[
  #grid(
    columns: (5.2in, 1fr),
    gutter: 0.78in,
    align: horizon,
    [
      #kicker([Institutional Crisis], dark: true, color: red)
      #v(0.16in)
      #display([Accountability Breaks When Information Is Pressured], dark: true, size: 41pt, serif: true)
      #v(0.08in)
      #hair(width: 0.94in, color: red.lighten(14%))
      #v(0.3in)
      #lead([Without independent information, citizens cannot judge power.], dark: true, size: 23.5pt)
    ],
    [
      #v(0.64in)
      #stat-block([86/180], [Press freedom rank / Greece], accent: red.lighten(16%), dark: true)
      #v(0.54in)
      #rect(width: 100%, height: 1pt, fill: white.transparentize(78%))
      #v(0.36in)
      #list((
        [Institutional pressure],
        [Wiretapping concerns],
        [SLAPP pressure],
        [Information control],
      ), accent: red.lighten(16%), dark: true, gap: 0.14in)
    ],
  )
]

#sep

// Slide 7
#section(
  [Satisfaction],
  [Democracy Requires Constitutional Tools, Not Just Democratic Language.],
  sub: [Referendum. Initiative. Recall. Audit. Independent justice.],
  accent: green,
  dark: false,
)

#sep

// Slide 8
#canvas[
  #v(0.26in)
  #kicker([Two Political Orders], color: amber)
  #v(0.16in)
  #display([The Choice Is Structural], size: 43pt, serif: true)
  #v(0.42in)
  #grid(
    columns: (1fr, 1fr),
    gutter: 0.9in,
    [
      #compare([Republic as Oligarchy], (
        [Voting ritual],
        [Party command],
        [Elite bargaining],
        [Opaque decisions],
        [Managed people],
      ), red)
    ],
    [
      #compare([Constitutional Democracy], (
        [Citizen rule],
        [Direct mandate],
        [Recall],
        [Public audit],
        [Accountable institutions],
      ), green)
    ],
  )
]

#sep

// Slide 9
#editorial-split(
  [Action],
  [Power to the People],
  [
    #list((
      [Reject voting-only democracy.],
      [Demand constitutional reform.],
      [Demand popular referenda.],
      [Demand recall powers.],
      [Demand legislative initiative.],
    ), accent: green)
    #v(0.42in)
    #lead([Representation is not participation.], size: 24pt)
  ],
  [
    #photo("assets/civic-checklist.jpg", height: 5.62in)
  ],
  accent: green,
)

#sep

// Slide 10
#canvas[
  #grid(
    columns: (4.35in, 1fr),
    gutter: 0.82in,
    align: top,
    [
      #v(0.24in)
      #kicker([Sources], color: amber)
      #v(0.16in)
      #display([References], size: 43pt, serif: true)
      #v(0.04in)
      #hair(width: 0.86in)
      #v(0.32in)
      #copy([Works cited for the speech's historical, theoretical, and institutional claims.], size: 18.4pt)
    ],
    [
      #v(0.82in)
      #set text(size: 12.1pt, fill: rgb("#30383f"))
      #let ref-group(label, body) = block(width: 100%)[
        #text(size: 9.4pt, weight: "bold", fill: amber, tracking: 0pt)[#upper(label)]
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
