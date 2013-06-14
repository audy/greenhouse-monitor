require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'User Model' do
  
  let(:user) {
    User.create(
      name:     'Testy McTesterson',
      email:    'tester@testes.com',
      password: 'tebow'
  )}
  
  it 'can be created' do
    user.should_not be_nil
  end
  
  it 'has a name' do
    user.name.should_not be_nil
  end
  
  it 'has an email' do
    user.email.should_not be_nil
  end
  
  it 'has an encrypted password' do
    User.get(user.id).password.should be_nil
  end
  
  it 'can be authenticated' do
    User.authenticate(user.email, user.password).should_not be_nil
  end
  
  it 'cannot be authenticated with bad credentials' do
    User.authenticate(user.email, user.password).should_not be_nil
  end
end