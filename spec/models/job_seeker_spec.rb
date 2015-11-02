require 'rails_helper'

describe JobSeeker, type: :model do

         it 'should have a valid factory' do
            expect(FactoryGirl.build(:job_seeker)).to be_valid
         end

		it {is_expected.to have_db_column :year_of_birth} 
		it {is_expected.to have_db_column :job_seeker_status_id } 
		it {is_expected.to have_db_column :resume } 

	
		it {is_expected.to validate_presence_of(:year_of_birth)} 
		it {is_expected.to validate_presence_of(:resume)} 
        #it {is_expected.to have_and_belong_to_many :agency_people}
	    
		it  do 
			should have_and_belong_to_many(:agency_people).join_table('seekers_agency_people')
		end
		

		it{should allow_value('1987', '1916', '2000', '2014').for(:year_of_birth)} 
	    it{should_not allow_value('1911', '899', '1890', 'salem').for(:year_of_birth)}
       
		context "#acting_as?" do
		    it "returns true for supermodel class and name" do
		      expect(JobSeeker.acting_as? :user).to be true
		      expect(JobSeeker.acting_as? User).to  be true
		    end

		    it "returns false for anything other than supermodel" do
		      expect(JobSeeker.acting_as? :model).to be false
		      expect(JobSeeker.acting_as? String).to be false
		    end
	 	end


end
