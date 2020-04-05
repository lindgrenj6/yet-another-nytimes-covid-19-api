# frozen_string_literal: true

require 'test_helper'

class CountiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @county = counties(:one)
  end

  test 'should get index' do
    get counties_url, as: :json
    assert_response :success
  end

  test 'should create county' do
    assert_difference('County.count') do
      post counties_url, params: { county: { cases: @county.cases, date: @county.date, deaths: @county.deaths, fips: @county.fips, name: @county.name, state: @county.state } }, as: :json
    end

    assert_response 201
  end

  test 'should show county' do
    get county_url(@county), as: :json
    assert_response :success
  end

  test 'should update county' do
    patch county_url(@county), params: { county: { cases: @county.cases, date: @county.date, deaths: @county.deaths, fips: @county.fips, name: @county.name, state: @county.state } }, as: :json
    assert_response 200
  end

  test 'should destroy county' do
    assert_difference('County.count', -1) do
      delete county_url(@county), as: :json
    end

    assert_response 204
  end
end
