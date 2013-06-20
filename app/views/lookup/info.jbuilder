json.ferd 'doop'
json.metadata do
  json.mysql @data[:mysql]
  json.processes @data[:processes]
  json.localhome @data[:localhome]
  json.webtypes @data[:webtypes]
  json.netid @netid
end
