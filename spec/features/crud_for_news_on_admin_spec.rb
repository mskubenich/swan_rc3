require 'rails_helper'
describe 'CRUD actions' do
  before {@news = News.create(title: 'Example Example',body: 'Example')}
  it 'should have link_to news index from admin_page' do
    visit admin_path
    click_link('News Table')
    expect(current_path).to eq(admin_news_path)
  end
  it 'should list each news' do
    visit admin_news_path
    expect(page).to have_selector('table tbody td',text: @news.id && @news.updated_at.strftime("%y.%m.%d") && @news.created_at.strftime("%y.%m.%d" && @news.title &&  @news.body))
    expect(page).to have_selector('table tbody td',text: 'Show' && 'Edit' && 'Delete' )
  end
  it 'should have crud actions' do
    visit admin_news_path
    click_link('Show')
    expect(current_path).to eq(news_path(@news))
    expect(page).to have_content(@news.title && @news.body && @news.updated_at.strftime("%y.%m.%d") && @news.created_at.strftime("%y.%m.%d"))
    visit admin_news_path
    click_link('Edit')
    expect(current_path).to eq(edit_news_path(@news))
    click_button('Update News')
    expect(current_path).to eq(news_path(@news))
    expect(page).to have_selector('div',text: 'Updated')
    visit admin_news_path
    click_link('Delete')
    expect(current_path).to eq(admin_news_path)
    expect(page).to have_selector('div',text: 'Deleted')
  end
end