ActiveAdmin.register User do
  permit_params :username, :age, :gender, :height, :weight, :profile, :target_weight, :target_body
end
