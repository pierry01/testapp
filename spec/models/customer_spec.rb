require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name - sobrescrevendo atributo' do
    customer = build(:user, name:  'Jean Pierry') # ou build(:customer)
    expect(customer.full_name).to eq('Sr. Jean Pierry')
  end
  
  it 'Herança' do
    customer = build(:customer_vip)
    expect(customer.vip).to be_truthy
  end
  
  it 'Herança' do
    customer = build(:customer)
    expect(customer.vip).to be_falsy
  end
  
  it '#full_name' do
    customer = create(:customer)
    expect(customer.full_name).to start_with('Sr. ')
  end
  
  it 'Usando o attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with('Sr. ')
  end
  
  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }
end
