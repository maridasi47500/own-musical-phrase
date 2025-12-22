class NewscoresController < ApplicationController
  before_action :set_newscore, only: %i[ show edit update destroy createscore]

  def createscore
 @score="

      <lilypond staffsize=26>

\header { title = \markup "Header" }

dyn =
#(make-dynamic-script #{ \markup \text "DynamicText" #})

\markup \box "Top-level markup"

\score {
  <<
    \new ChordNames
    \with {
      majorSevenSymbol = \markup "majorSevenSymbol"
    }
    \chordmode { c1:maj7 }
    \new Staff {
      \tempo \markup "MetronomeMark"
      \textMark "textMark"
      \once \override TupletNumber.text =
        \markup "TupletNumber"
      \tuplet 3/2 {
        \once \override NoteHead.stencil =
          #ly:text-interface::print
        \once \override NoteHead.text =
          \markup \lower #0.5 "NoteHead"
        c''8^\markup \italic "TextScript"
        a'\finger \markup \text "Fingering"
        \once \override Rest.stencil =
          #(lambda (grob)
             (grob-interpret-markup grob #{
               \markup  "Rest"
               #}))
        r
      }
    }
    \new Lyrics \lyricmode {
      \markup \smallCaps "LyricText" 1
    }
    \new Dynamics { s1\dyn }
  >>
}
      </lilypond>
      " 

      p @score
      
      wow="./public/uploads/"
      hi=(@fragment.title+@fragment.id.to_s).parameterize
      @hi=hi
      p wow+hi
      File.write(wow+"hey"+hi+".html", @score)
      @hey=`(cd #{wow} && lilypond-book hey#{hi}.html -f html --output #{hi})`

  end
  # GET /newscores or /newscores.json
  def index
    @newscores = Newscore.all
  end

  # GET /newscores/1 or /newscores/1.json
  def show
  end

  # GET /newscores/new
  def new
    @newscore = Newscore.new
  end

  # GET /newscores/1/edit
  def edit
  end

  # POST /newscores or /newscores.json
  def create
    @newscore = Newscore.new(newscore_params)

    respond_to do |format|
      if @newscore.save
        format.html { redirect_to @newscore, notice: "Newscore was successfully created." }
        format.json { render :show, status: :created, location: @newscore }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @newscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newscores/1 or /newscores/1.json
  def update
    respond_to do |format|
      if @newscore.update(newscore_params)
        format.html { redirect_to @newscore, notice: "Newscore was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @newscore }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @newscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newscores/1 or /newscores/1.json
  def destroy
    @newscore.destroy!

    respond_to do |format|
      format.html { redirect_to newscores_path, notice: "Newscore was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newscore
      @newscore = Newscore.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def newscore_params
      params.expect(newscore: [ :title, :composer, :toplevelmarkup, :metronomemark, :textmark, :cmajorsevensymbol, :testscript, :notehead, :fingering, :notehead, :rest, :tuplenumber, :lyrictext, :dynamictext, :key_signature, :time_signature ])
    end
end
