require 'spec_helper'

describe 'Enumerable#map_h' do

  context 'on Array' do
    let(:array) { %w{john paul george ringo} }
    
    it 'requires a block to be passed' do
      expect { array.map_h }.to raise_error(LocalJumpError)
    end
    it 'generates a hash of x => block.(x)' do
      expect(array.map_h { |x| x.length }).to eq({'john' => 4, 'paul' => 4, 'george' => 6, 'ringo' => 5})
    end
    it 'works with Symbol#to_proc' do
      expect(array.map_h(&:length)).to eq({'john' => 4, 'paul' => 4, 'george' => 6, 'ringo' => 5})
    end
  end
  
  context 'on Hash' do
    let(:hash) { {forename: 'Rich', surname: 'Daley', location: 'Leeds'} }
    
    it 'receives key and value in the block, and uses the pair of them as the key' do
      expect(hash.map_h {|k,v| "#{k.to_s.upcase} #{v}"}).to eq({
        [:forename, 'Rich']  => "FORENAME Rich",
        [:surname, 'Daley']  => "SURNAME Daley",
        [:location, 'Leeds'] => "LOCATION Leeds"
      })
    end
  end
end
