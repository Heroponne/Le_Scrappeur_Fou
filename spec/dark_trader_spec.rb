require_relative '../lib/dark_trader'

describe 'the crypto_name_extract method' do
  it 'extracts the name of currencies' do
    expect(crypto_name_extract[0]).to eq('Bitcoin')
    expect(crypto_name_extract[3]).to eq('Bitcoin Cash')
    expect(crypto_name_extract[5]).to eq('Litecoin')
  end
  it 'has a size > 2000' do
    expect(crypto_name_extract.size).to be > 2000
  end
end

describe 'the crypto_value_extract method' do
  it 'extracts the value of currencies' do
    expect(crypto_value_extract.size).to be > 2000
  end
end

describe 'the array_of_hashes method' do
  it 'returns an array of hashes of names and values of currencies' do
    expect(array_of_hashes.size).to be > 2000
  end
end
