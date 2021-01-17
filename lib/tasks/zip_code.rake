namespace :zip_code do
    desc "For existing companies -> Update City & State"
    task :update_city_and_state => :environment do
        update_city_and_state
        puts "== Updated city and state for exisiting companies =="
    end

    def update_city_and_state
        Company.find_each do |company|
        if company.zip_code and !(company.city and company.state)
            company.update_city_state
            company.save!
        end
        end
    end
end