require 'spec_helper'

describe ApplicationController do
    describe 'logging on' do
        it 'should not crash if there are no users yet' do
            session[:user_id] = 1
            expect {
                @controller.current_user
            }.not_to raise_error
        end
    end
end