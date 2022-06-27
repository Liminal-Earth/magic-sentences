ActiveAdmin.register TextSynth do
  actions :all, except: [:destroy]
  batch_action :destroy, false
  config.sort_order = "created_at_desc"

  permit_params :text
end
