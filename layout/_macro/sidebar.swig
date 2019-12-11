{% macro render(is_post) %}  
  <aside id="sidebar" class="sidebar">
    {% if theme.sidebar.onmobile %}
      <div id="sidebar-dimmer"></div>
    {% endif %}
    <div class="sidebar-inner">

      {% set display_toc = is_post and theme.toc.enable or is_page and theme.toc.enable %}

      {% if display_toc and toc(page.content).length > 1 %}
        <ul class="sidebar-nav motion-element" style="opacity: 1; display: block; transform: translateX(0px);">
          <li class="sidebar-nav-toc sidebar-nav-active" data-target="post-toc-wrap">{{ __('sidebar.toc') }}</li>
          <li class="sidebar-nav-overview" data-target="site-overview">{{ __('sidebar.overview') }}</li>
        </ul>
      {% endif %}

  {% set hasSearch = theme.swiftype_key || theme.algolia_search.enable || theme.tinysou_Key || theme.local_search.enable %}

      <section class="site-overview sidebar-panel{% if not display_toc or toc(page.content).length <= 1 %} sidebar-panel-active{% endif %}">
        <div class="site-overview">
          <div class="sidebar-sticky sticky">
            <div itemscope="" itemtype="http://schema.org/Person">
              <div class="author__avatar">
                {% if theme.avatar %}
                  <img itemprop="image"
                    src="{{ url_for( theme.avatar | default(theme.images + '/avatar.gif') ) }}"
                    alt="{{ theme.author }}" /> 
                {% endif %}
              </div>
              <div class="author__content">
                <h3 class="author__name" itemprop="name">{{ theme.author }}</h3>
                <p class="author__bio" itemprop="description">{{ theme.description }}</p>
              </div>
              {% if theme.social %}
                <div class="author__urls-wrapper">
                  <button class="btn btn--inverse">Follow</button>
                  <ul class="author__urls social-icons">
                    {% for name, link in theme.social %}
                      <li>
                        <a href="{{ link.split('||')[0] | trim }}" target="_blank" title="{{ name }}">
                            {% if theme.social_icons.enable %}
                              <i class="fa fa-fw fa-{{ link.split('||')[1] | trim | default('globe') }}"></i>{#
                          #}{% endif %}{#
                            #}{% if not theme.social_icons.icons_only %}{#
                              #}&nbsp;&nbsp;{{ name }}{#
                            #}{% endif %}{#
                        #}</a>
                      </li>
                    {% endfor %}

                    {% if hasSearch %}
                      <li class="menu-item menu-item-search">
                        {% if theme.swiftype_key %}
                          <a href="javascript:;" class="st-search-show-outputs">
                          <i class="fa fa-fw fa-search"></i>&nbsp;&nbsp;
                        {% elseif theme.local_search.enable || theme.algolia_search.enable %}
                          <a href="javascript:;" class="popup-trigger">
                          <i class="fa fa-fw fa-search"></i>&nbsp;&nbsp;
                        {% endif %}
                          {% if theme.menu_icons.enable %}
                          {% endif %}
                          {{ __('menu.search') }}
                        </a>
                      </li>
                    {% endif %}

                    {% if hasSearch %}
                      <div class="site-search">
                        {% include '../_partials/search.swig' %}
                      </div>
                    {% endif %}

                  </ul>
                </div>
              {% endif %}
            </div>
          </div>
        </div>
      </section>



      {% if display_toc and toc(page.content).length > 1 %}
      <!--noindex-->
        <section class="post-toc-wrap motion-element sidebar-panel sidebar-panel-active">
          <div class="post-toc">

            {% if page.toc_number === undefined %}
              {% set toc = toc(page.content, { "class": "nav", list_number: theme.toc.number }) %}
            {% else %}
              {% set toc = toc(page.content, { "class": "nav", list_number: page.toc_number }) %}
            {% endif %}

            {% if toc.length <= 1 %}
              <p class="post-toc-empty">{{ __('post.toc_empty') }}</p>
            {% else %}
              <div class="post-toc-content">{{ toc }}</div>
            {% endif %}

          </div>
        </section>
      <!--/noindex-->
      {% endif %}

      {% if theme.sidebar.b2t %}
        <div class="back-to-top">
          <i class="fa fa-arrow-up"></i>
          {% if theme.sidebar.scrollpercent %}
            <span id="scrollpercent"><span>0</span>%</span>
          {% endif %}
        </div>
      {% endif %}

    </div>
  </aside>
{% endmacro %}