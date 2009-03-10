Ext.ns("Coolite.MVC");

Coolite.MVC.Northwind = {
    hashCode: function(str) {
        var hash = 1315423911;

        for (var i = 0; i < str.length; i++) {
            hash ^= ((hash << 5) + str[i] + (hash >> 2));
        }

        return (hash & 0x7FFFFFFF);
    },

    addPageTab: function(tabpanel, title, url) {
        if (Ext.isEmpty(url, false)) {
            return;
        }

        var id = this.hashCode(url);
        var tab = tabpanel.getComponent(id);

        if (!tab) {
            tab = tabpanel.addTab({
                id: id.toString(),
                title: title,
                closable: true,
                autoLoad: {
                    showMask: true,
                    url: url,
                    mode: "iframe",
                    noCache:true,
                    maskMsg: "Loading '" + title + "'..."
                }
            });
        }
        else {
            tabpanel.setActiveTab(tab);
        }
    }
};