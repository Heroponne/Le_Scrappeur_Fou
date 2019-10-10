require_relative '../lib/mairie_christmas'

describe 'the townhall_name_get method' do
  it 'returns the name of townhalls' do
    expect(townhall_name_get[0]).to eq('ABLEIGES')
    expect(townhall_name_get.size).to eq(185)
  end
end

describe 'the townhall_urls_get method' do
  it 'returns the urls of townhalls' do
    expect(townhall_urls_get.size).to eq(185)
    expect(townhall_urls_get[0]).to eq('/95/ableiges.html')
  end
end

describe 'the townhall_email_get method' do
  it 'returns the email of the url' do
    a = 'mairie.ableiges95@wanadoo.fr'
    expect(townhall_email_get('/95/ableiges.html')).to eq(a)
    expect(townhall_email_get('/95/chatenay-en-france')).to eq('')
  end
end

describe 'the each_townhall_email_get method' do
  it 'returns all emails of each townhall' do
    expect(each_townhall_email_get.size).to eq(185)
    expect(each_townhall_email_get[0]).to eq('mairie.ableiges95@wanadoo.fr')
  end
end

describe 'the array_of_hashes method' do
  it 'returns an array of each hash of townhall and email' do
    expect(array_of_hashes.size).to eq(185)
    expect(array_of_hashes[0]).to eq('ABLEIGES => mairie.ableiges95@wanadoo.fr')
    expect(array_of_hashes[171]).to eq('VAUDHERLAND => ')
  end
end
