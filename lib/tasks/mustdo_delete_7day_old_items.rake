task delete_items: :environment do
  Mustdo.where("created_at <= ?", Time.now - 7.days).destroy_all
end