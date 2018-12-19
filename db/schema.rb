# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181219153137) do

  create_table "administrators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
  end

  create_table "blogs", force: :cascade do |t|
    t.text "nombre"
    t.text "contenido"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rut"
    t.string "nit"
    t.string "nombre"
    t.string "telefono"
    t.string "direccion"
    t.boolean "terminos"
    t.float "salario"
    t.string "sector"
    t.string "nombre_representante"
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "folders", force: :cascade do |t|
    t.string "soporte_estudios"
    t.string "referencia_laboral"
    t.string "fotocopia_cedula"
    t.string "certificado_formacion"
    t.string "certificado_cuenta_bancaria"
    t.string "fondo_pension"
    t.string "cesantias"
    t.string "certificado_eps"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "formato_domiciliaria"
    t.string "formato_complemento"
    t.string "conflicto_intereses"
    t.string "oferta"
    t.boolean "acepta_contrato"
    t.string "arl"
    t.string "radicacion_eps"
    t.index ["user_id"], name: "index_folders_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "tipo"
    t.string "nombre_cargo"
    t.string "tipo_contrato"
    t.string "salario_float"
    t.string "objetivo"
    t.string "educacion_minima"
    t.integer "experiencia"
    t.string "idiomas"
    t.string "programas"
    t.string "conocimientos_especificos"
    t.boolean "disponibilidad_viajar"
    t.string "disponibilidad_residencia"
    t.integer "vacantes"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "salario"
    t.index ["company_id"], name: "index_offers_on_company_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cedula"
    t.string "celular"
    t.string "nombres"
    t.string "apellidos"
    t.string "situacion_sentimental"
    t.string "tipo_documento"
    t.string "numero_documento"
    t.date "fecha_nacimiento"
    t.string "direccion"
    t.string "departamento"
    t.string "ciudad"
    t.string "nivel_educativo"
    t.string "pregrado"
    t.string "experiencia_laboral"
    t.string "referencia_laboral"
    t.string "hoja_vida"
    t.string "carrera"
    t.string "celular_referencia"
    t.string "cv"
    t.integer "city_id"
    t.integer "department_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
