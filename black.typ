#set text(
  fill: white,
  font: "LXGW WenKai GB",
  size: 14pt,
  weight: 700,
)
#show raw: set text(
  font: "LXGW WenKai Mono GB",
  weight: 700,
)

#set raw(theme: "halcyon.tmTheme")

#set page(
  fill: rgb(0, 0, 0, 255),
  height: auto,
  width: 240mm,
  margin: (x: 3%, y: 5%),
)
#show raw.where(block: true): it => {
  block(it, fill: gray.darken(80%), inset: 0.5em, radius: 0.5em)
}

#set table(stroke: white)

#let under-heavy-line(it) = {
  underline(
    it,
    stroke: white.darken(75%) + 0.5em,
    evade: false,
    background: true,
    offset: -0.5pt,
  )
}
#let subtitle(it) = {
  set text(
    stroke: white + 0.01em,
    fill: white,
    size: 1.4em,
  )
  under-heavy-line(it)
}
#show heading.where(level: 2): it => {
  align(center, under-heavy-line(it))
}
#show heading.where(level: 3): it => {
  align(center, under-heavy-line(it))
}

#let sLaTeX = {
  set text(
    font: "New Computer Modern Sans",
    weight: 500,
  )
  box(
    width: 2.55em,
    {
      set align(left)
      [L]
      place(top, dx: 0.3em, text(size: 0.7em)[A])
      place(
        top,
        dx: 0.7em,
        box(
          width: 1.8em,
          {
            set align(left)
            [T]
            place(top, dx: 0.56em, dy: 0.22em)[E]
            place(top, dx: 1.1em)[X]
          },
        ),
      )
    },
  )
}

#let sample-code = ```typ
#set heading(numbering: "一、")   // 样式设置
= 滕王阁序
落霞与*孤鹜*齐飞，秋水共长天一色。// 标记语法
#{                                // 编程语言
 set text(size: 0.8em)
 let t(name, s, o) = table(
  inset: 0.3em, columns: s.len() + 1, align: center,
  strong(name), ..s,
  [*年份*],
  ..(range(o,s.len()) + range(o)).map(str)
 )
 t("天干", "甲乙丙丁戊己庚辛壬癸".clusters(), 4)
 t("地支", "子丑寅卯辰巳午未申酉戌亥".clusters(), 4)
}
$ cases(x equiv 3 (mod 10),       // 公式排版
        x equiv 5 (mod 12))
  => x equiv 53 (mod 60) $
$ 353 - floor(353 / 60) = 53 $
```

#v(1em)

#align(
  center,
  image(
    "banner.png",
    width: 102%,
  ),
)
#v(-1em)

#grid(
  columns: 100%,
  // stroke: black+1pt,
  inset: (x: 0.5em, y: 0.5em),
  [
    #grid(
      columns: (40%, 1fr),
      column-gutter: 2em,
      grid.cell(
        x: 0,
        y: 0,
      )[
        #subtitle[什么是 Typst?]

        #v(-0.6em)
        Typst 是一门用于文档排版的编程语言。通过 Typst，你可以用简洁语法编写出美观的文档。

        如果你使用过 Markdown 或者 #sLaTeX，你应该很熟悉“从带标记的文本生成文档”的流程。

      ],
      grid.cell(
        x: 0,
        y: 1,
      )[
        #v(1em)
        #subtitle[Typst 的优势]
        #v(-0.6em)

        - 公式排版、参考文献管理等基本功能
        - 语法简洁，容易上手
        - 现代的、增量编译的编程语言可以
          - 快速地生成文档，并实时预览
          - 有更好的代码提示和报错信息
          - 更方便地编程与编写模板
        - 环境搭建简单
        - 有包管理器，不需要像 TeX Live 那样在本地安装大量用不到的包
      ],
      grid.cell(
        x: 1,
        rowspan: 2,
      )[
        #subtitle[部分包效果展示]

        #grid(
          columns: (50%, 50%),
          rows: (11em, auto),
          grid.cell(align: center)[
            #import "@preview/cetz:0.4.2"
            == CeTZ
            #v(0.5em)
            #cetz.canvas(
              {
                import cetz.draw: *
                circle((0, 0), radius: 1, stroke: white)
                let A = (60deg, 1)
                let B = (120deg, 1)
                line(A, B, stroke: white)
                let C = (-80deg, 1)
                let D = (-110deg, 1)
                line(A, C, stroke: red)
                line(B, C, stroke: red)
                line(A, D, stroke: blue)
                line(B, D, stroke: blue)
                let angle = cetz.angle.angle
                angle(C, A, B, stroke: red, fill: red.transparentize(70%), radius: 0.4)
                angle(D, A, B, stroke: blue, fill: blue.transparentize(70%), radius: 0.4)

                line(C, D, stroke: (dash: "dashed", paint: white))

                let O = (0, 0)
                circle(O, radius: 1pt, fill: white, stroke: white)
                content(O, $O$, anchor: "south", padding: 3pt)
              },
              length: 1.8cm,
            )
          ],
          grid.cell(align: center)[
            #import "@preview/pinit:0.2.2": *
            == Pinit
            #v(0.5em)

            #box(width: 85%)[
              #align(left)[
                故列叙时人，录其所述，虽世殊事异，所以兴怀，其致一也。后之览者，亦将有感于#pin(1)斯#pin(2)文。

                #pinit-highlight(1, 2, fill: white.transparentize(78%))
                #pinit-point-from(2, [这], offset-dx: 35pt, offset-dy: 30pt, body-dx: 4pt, body-dy: 0pt, fill: white)
              ]
            ]
          ],
          grid.cell(align: center)[
            #import "@preview/showybox:2.0.4": showybox

            == Showybox

            #v(0.5em)
            #showybox(
              width: 90%,
              frame: (
                border-color: black.lighten(40%),
                title-color: black.lighten(35%),
                body-color: black.lighten(25%),
                inset: 0.7em,
              ),
              title-style: (
                boxed-style: (
                  fill: black.lighten(60%),
                  radius: (top-left: 10pt, bottom-right: 10pt),
                ),
                color: white,
              ),
              title: "通知",
              [#set text(fill: white);近日将有一股强冷空气来袭，请注意保暖。],
              [#set text(fill: white);秋季天干物燥，要时刻注意消防安全。],
            )
          ],
          grid.cell(align: center)[
            == Fletcher

            #v(0.5em)
            #import "@preview/fletcher:0.5.8" as fletcher: edge, node

            #fletcher.diagram(
              node-stroke: black.lighten(40%),
              node-fill: black.lighten(25%),
              spacing: 0.87em,
              edge-stroke: 1pt,
              node((0, 0), [A]),
              edge("~>", stroke: white),
              node((-1, 1), [B\ C], corner-radius: 5pt),
              edge("-->", stroke: white),
              node((1, 1), [D]),
              edge("->", stroke: white),
              node((0, 2), [E]),
              edge((0, 2), (0, 0), "->", stroke: blue),
              edge((0, 2), (-1, 1), "->", bend: 45deg, stroke: white),
              edge((1, 1), "dd,lll,uu,r", "=>", stroke: white),
            )
          ],
        )

      ],
    )
  ],

  grid.cell(
    align: center,
    inset: (right: 0pt),
  )[
    #subtitle[代码展示]
  ],

  grid.cell(
    inset: (right: 0pt),
  )[
    #v(0.4em)
    #grid(
      columns: (50%, 50%),
      grid.cell(align: center)[
        #sample-code
      ],
      grid.cell(
        align: center,
      )[
        #v(0.5em)
        #box[
          #align(left)[
            #set text(font: "Source Han Sans SC", weight: 500, size: 0.95em)
            #eval("[" + sample-code.text + "]")
          ]
        ]
      ],
    )
  ],
)

#v(2em)

#place(
  right + bottom,
  move(dy: -2.7em)[
    #set text(fill: gray, size: 11pt)
    created by Wallbreaker5th, modified by ParaN3xus\
    typst-introduction-in-one-page, marked with CC0 1.0.
  ],
)

