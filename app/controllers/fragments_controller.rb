class FragmentsController < ApplicationController
  before_action :set_fragment, only: %i[ show edit update destroy createscore seescore]

  def seescore
      hi=(@fragment.title+@fragment.id.to_s).parameterize
      @hi=hi

      render :createscore
  end

  # GET /fragments or /fragments.json
  def createscore
      @score="
      
      <lilypond fragment staffsize=26>
        \\key #{@fragment.key_signature.sub(" "," \\")}
        \\numericTimeSignature
        \\time #{@fragment.time_signature}
        \\tempo #{@fragment.tempo}
        
        c'4 \#(make-dynamic-script \#{ \\markup { \\dynamic #{@fragment.nuance} \\normal-text \\italic \\bold #{@fragment.caractere} } \#})  d' e' f' g'2 g'
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
  def index
    @fragments = Fragment.all
  end

  # GET /fragments/1 or /fragments/1.json
  def show
  end

  # GET /fragments/new
  def new
    @fragment = Fragment.new
  end

  # GET /fragments/1/edit
  def edit
  end

  # POST /fragments or /fragments.json
  def create
    @fragment = Fragment.new(fragment_params)

    respond_to do |format|
      if @fragment.save
        format.html { redirect_to @fragment, notice: "Fragment was successfully created." }
        format.json { render :show, status: :created, location: @fragment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fragment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fragments/1 or /fragments/1.json
  def update
    respond_to do |format|
      if @fragment.update(fragment_params)
        format.html { redirect_to @fragment, notice: "Fragment was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @fragment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fragment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fragments/1 or /fragments/1.json
  def destroy
    @fragment.destroy!

    respond_to do |format|
      format.html { redirect_to fragments_path, notice: "Fragment was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fragment
      @fragment = Fragment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def fragment_params
      params.expect(fragment: [ :clef, :nuance, :key_signature, :time_signature, :caractere, :tempo, :title, :myscore ])
    end
end
