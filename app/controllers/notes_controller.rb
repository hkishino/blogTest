class NotesController < ApplicationController
  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
    @user = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @user = current_user
    @note = Note.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @user = current_user
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
    @user = current_user
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(params[:note])
    @user = current_user
    @note.user_id = @user.id

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @user = current_user
    @note = Note.find(params[:id])
    check = 'PARAM_OK'
 
    if @note.user_id == @user.id
      check = 'PARAM_OK'
    else
      check = 'PARAM_NG'
    end
 
    case check
      when 'PARAM_OK'
        respond_to do |format|
            if @note.update_attributes(params[:note])
              format.html { redirect_to @note, notice: 'Note was successfully updated.' }
              format.json { head :no_content }
            else
              format.html { render action: "edit" }
              format.json { render json: @note.errors, status: :unprocessable_entity }
            end
        end
      when 'PARAM_NG'
        respond_to do |format|        
            format.html { redirect_to notes_url , notice: 'You can not edit this item' }
            format.json { head :no_content }
        end
      else
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @user = current_user    
    check = 'PARAM_OK'
     
    if @note.user_id == @user.id
      check = 'PARAM_OK'
    else
      check = 'PARAM_NG'
    end
     
    case check
      when 'PARAM_OK'
        respond_to do |format|
            @note.destroy
            format.html { redirect_to notes_url }
            format.json { head :no_content }
        end
      when 'PARAM_NG'
        respond_to do |format|
            format.html { redirect_to notes_url , notice: 'You can not delete this item' }
            format.json { head :no_content }
        end
      else
    end
  end
end
