$LOAD_PATH << './features/support'
libdir = File.dirname('./features/support')
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)
require 'yaml'
require 'selenium-webdriver'
#require 'sqlite3'
require 'httparty'
require 'nokogiri'
require 'page-object'
require 'rspec-expectations'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/session'
require 'capybara'
require 'cucumber'
require 'securerandom'
require 'commonMethods'
require 'fileutils'
require 'logger'
require 'spreadsheet'
require 'page-object/page_factory'
require "rautomation"
require "test/unit"
require 'oci8'

World(PageObject::PageFactory)
World(Capybara)

$rv=17
$sno=0
$loc = YAML::load(File.open('features/ObjectRepository/properties.yaml'))
config_file = "config/#{ENV['ENV_FILE']}"
$yml_file = YAML::load(File.open(config_file))
$ind=0
$lpe=1
$efi=1
$aes=1
$sort=1
$dp=0
$pid=0
$sort=0
$lo=0
$mir=1
$mird=1
$mirds=1
$iend=2
$fsv=1
$arc ="null"
