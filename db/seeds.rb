# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




[
  ['ruby'],
  ['ruby on rails', 'rails', 'rails5', 'rails4'],
  ['python'],
  ['django'],
  ['perl'],
  ['ocaml', 'caml'],
  ['c'],
  ['c++'],
  ['c#', 'csharp', 'c sharp'],
  ['asp'],
  ['.net', 'dot net', 'dotnet'],
  ['visualbasic', 'vb', 'visual basic'],
  ['java'],
  ['javascript', 'js', 'es6', 'es5'],
  ['angular', 'angularjs'],
  ['react', 'reactjs', 'reactrb'],
  ['ember', 'emberjs'],
  ['php', 'phpoo'],
  ['laravel'],
  ['zend'],
  ['wordpress'],
  ['word'],
  ['excel'],
  ['powerpoint', 'keynote'],
  ['publisher'],
  ['matlab'],
  ['hadoop'],
  ['apache'],
  ['sql', 'mysql', 'mariadb','postgresql', 'postgre', 'postgres', 'psql'],
  ['oracle'],
  ['salesforce'],
  ['sap'],
  ['mysql', 'mariadb'],
  ['postgresql', 'postgre', 'postgres', 'psql'],
  ['apache cassandra', 'cassandradb', 'cassandra'],
  ['dynamo', 'dynamodb'],
  ['git', 'github', 'bitbucket', 'gitflow'],
  ['mercury'],
  ['svn'],
  ['cvs'],
  ['dropbox'],
  ['f#'],
  ['lisp', 'common lisp', 'commonlisp'],
  ['haskell'],
  ['elixir'],
  ['erlang'],
  ['elm'],
  ['html', 'xhtml', 'html5', 'haml', 'erb', 'slim'],
  ['css', 'scss', 'sass', 'less', 'css3'],
  ['android'],
  ['ios'],
  ['swift'],
  ['objective c', 'objectivec', 'objc'],
  ['assembleur', 'assembler', 'assembly', 'asm'],
  ['security'],
  ['linux', 'debian', 'netbsd', 'freebsd', 'bsd', 'archlinux', 'ubuntu', 'fedora', 'redhat'],
  ['macos', 'mac', 'cocoa', 'apple', 'apple cocoa', 'cocoascript', 'macintosh'],
  ['windows'],
  ['windowsphone', 'windows phone'],
  ['phoenix'],
  ['rubymotion'],
  ['basic'],
  ['sinatra'],
  ['nodejs', 'node'],
  ['coffee', 'coffeescript'],
  ['flash'],
  ['actionscript'],
  ['flex'],
  ['bison'],
  ['adobe-air'],
  ['r'],
  ['bigdata'],
  ['data'],
  ['machine learning'],
  ['javaee', 'j2e', 'j2ee', 'jee'],
  ['hibernate'],
  ['maven'],
  ['struts'],
  ['wpf'],
  ['wcf'],
  ['programmation orientee objet', 'object oriented', 'poo', 'oop'],
  ['uml'],
  ['mvc'],
  ['mvvm'],
  ['windows forms', 'windows form', 'winform', 'winforms'],
  ['unity3D', 'unity'],
  ['gpu computing', 'gpu', 'opengl', 'opencl', 'cuda', 'directx'],
  ['photoshop'],
  ['visual studio'],
  ['sql server'],
  ['emacs'],
  ['amazon web services', 'aws', 's3', 'ec2'],
  ['scheme'],
  ['clojure'],
  ['scala'],
  ['ada'],
  ['cobol'],
  ['fotran'],
  ['delphi'],
  ['redis'],
  ['resque'],
  ['sidekiq'],
  ['mongodb'],
  ['travis'],
  ['circleci'],
  ['travisci'],
  ['jira'],
  ['jenkins'],
  ['puppet'],
  ['redmine'],
  ['docker'],
  ['vi', 'vim'],
  ['sublime text'],
  ['textmate'],
  ['nano'],
  ['vhdl'],
  ['aadl'],
  ['lighthouse'],
  ['real-time', 'realtime'],
  ['devops'],
  ['arduino'],
  ['raspberry pi', 'raspberry'],
  ['systeme embarque', 'embedded systems', 'fpga', 'embedded system', 'embed systems', 'embed system'],
  ['robotique', 'robotic', 'robotics'],
  ['elasticsearch'],
  ['solr'],
  ['spark'],
  ['hive'],
  ['cryptage', 'encryption'],
].each do |skills|
  trueskill = skills.first
  aliases = skills[1..-1]
  skill = Skill.find_by(name: trueskill) || Skill.create(name: trueskill)
  puts trueskill
  aliases.each do |aliase|
    next if skill.children.pluck(:name).include?(aliase)
    Skill.create(name: aliase, parent_id: skill.id)
  end
end
