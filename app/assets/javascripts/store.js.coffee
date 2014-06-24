# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

EmberExample.ApplicationStore = DS.Store.extend
  revision: 12
  adapter: 'EmberExample.ApplicationAdapter'

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
EmberExample.ApplicationAdapter = DS.ActiveModelAdapter.extend
  namespace: 'api'
