class Newscore < ApplicationRecord
has_one :pic
accepts_nested_attributes_for :pic
def getmyscore
@score="

      <lilypond staffsize=26>

\\header { 

title = \\markup \"#{title}\"
composer = \\markup \"#{composer}\"

 }

dyn =
\#(make-dynamic-script \#{ \\markup \\text \"#{dynamictext}\" \#})

\\markup \\box \"#{toplevelmarkup}\"

\\score {
  <<
    \\new ChordNames
    \\with {
      majorSevenSymbol = \\markup \"#{cmajorsevensymbol}\"
    }
    \\chordmode { #{accord}1:maj7 }
    \\new Staff {
      \\key #{key_signature.split(" ")[0]} \\#{key_signature.split(" ")[1]}
      \\numericTimeSignature
      \\time 3/2
      \\tempo \\markup \"#{metronomemark}\"
      \\textMark \"#{textmark}\"
      \\once \\override TupletNumber.text =
        \\markup \"#{tuplenumber}\"
      \\tuplet 3/2 {
        \\once \\override NoteHead.stencil =
          \#ly:text-interface::print
        \\once \\override NoteHead.text =
          \\markup \\lower \#0.5 \"#{notehead}\"
        c''8^\\markup \\italic \"#{testscript}\"
        a'\\finger \\markup \\text \"#{fingering}\"
        \\once \\override Rest.stencil =
          \#(lambda (grob)
             (grob-interpret-markup grob \#{
               \\markup  \"#{rest}\"
               \#}))
        r
      }
    }
    \\new Lyrics \\lyricmode {
      \\markup \\smallCaps \"#{lyrictext}\" 1
    }
    \\new Dynamics { s1\\dyn }
  >>
}
      </lilypond>
      " 
      @score

end
end
