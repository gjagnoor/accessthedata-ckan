import logging
from ckan import model
from ckan.plugins import toolkit
from ckanext.showcase.controller import ShowcaseController
log = logging.getLogger(__name__)
_ = toolkit._


class BlogController(ShowcaseController):

    def search(self):
        posts = []
        context = {'model': model}
        showcases = toolkit.get_action('ckanext_showcase_list')(context, {})
        for showcase in showcases:
            showcase = toolkit.get_action('package_show')(context, {'id': showcase['id']})
            if showcase.get('story_type') == 'Blog post':
                posts.append(showcase)
        return toolkit.render(self._search_template('blog'), extra_vars={'posts': posts})

    def _search_template(self, package_type):
        return 'blog/search.html'

    def _read_template(self, package_type):
        return 'blog/read.html'


class StaticController(toolkit.BaseController):

    def faqs(self):
        return toolkit.render('static/faqs.html')

    def aboutus(self):
        return toolkit.render('static/about.html')

    def termsofservice(self):
        return toolkit.render('static/termsofservice.html')

    def privacypolicy(self):
        return toolkit.render('static/privacypolicy.html')

    def resources(self):
        return toolkit.render('static/resources.html')

    def getinvolved(self):
        return toolkit.render('static/getinvolved.html')
