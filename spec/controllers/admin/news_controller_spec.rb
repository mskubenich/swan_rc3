require 'rails_helper'
describe 'CRUD actions' do
  before {@news = News.create(title: 'Example Example',body: 'Example body')}

  it 'should have link_to news index from admin_page' do
    visit 'admin'
    click_link('News')
    expect(current_path).to eq('/admin/news')
  end

  it 'should list each news' do
    visit '/admin/news'
    expect(page).to have_selector('table tbody td',text: @news.id && @news.updated_at.strftime("%y.%m.%d") && @news.created_at.strftime("%y.%m.%d" && @news.title &&  @news.body))
    expect(page).to have_selector('table tbody td',text: 'Show' && 'Edit' && 'Delete' )
  end

  it 'should have show action' do
    visit '/admin/news'
    click_link('Show')
    expect(current_path).to eq("/admin/news/#{@news.id}")
    expect(page).to have_content(@news.title && @news.body)
  end

  it 'should have edit action' do
    visit '/admin/news'
    click_link('Edit')
    expect(current_path).to eq("/admin/news/#{@news.id}/edit")
    click_button('Save News')
    expect(current_path).to eq('/admin/news')
  end

  it 'should have destroy action' do
    visit '/admin/news'
    click_link('Delete')
    expect(current_path).to eq('/admin/news')
  end
end
