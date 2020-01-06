<!DOCTYPE html>

{% set html_class = 'theme-next ' + theme.scheme %}
{% if theme.motion.enable %}
  {% set html_class = html_class + ' use-motion' %}
{% endif %}

<html class="{{ html_class | lower }}" lang="{{ config.language }}">
<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
  {% include '_third-party/analytics/index.swig' %}
</head>

<body itemscope itemtype="http://schema.org/WebPage" style="overflow-x:hidden;padding-right:320px" lang="{{ page.lang || page.language || config.language }}">

  <style>@media (min-width:768px) and (max-width:991px){body .header-innerr{width:700px!important}}.header-innerr{margin:0 auto;padding:100px 0 70px;width:880px}@media (min-width:1600px){.container .header-innerr{width:1200px}}.header-innerr{position:relative}.header-innerr{padding:20px 0 0}.header-innerr:after,.header-innerr:before{content:" ";display:table}.header-innerr:after{clear:both}@media (max-width:767px){.header-innerr{width:auto;padding:10px;margin-bottom:-20px}}</style>

  <div class="container sidebar-position-left {% block page_class %}{% endblock %}">
    <div class="headband"></div>

    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner"> {%- include '_partials/header.swig' %} </div>

      <div class="header-innerr">
        {% for name, url in theme.top.links %}
          <div class="note info" style="margin:0;letter-spacing:.15px">
            {{ name }}：
            <a style="color:#40dab2;font-weight:600" 
              href="{{ url }}" target="_blank" class="animsition-link">
              {{ url }}
            </a>
          </div>
        {% endfor %}
      </div>
    </header>

    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
          {% include '_third-party/duoshuo-hot-articles.swig' %}
          {% include '_partials/comments.swig' %}
        </div>
        {% if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {% endif %}
      </div>
    </main>

    <footer id="footer" class="footer">
      <div class="footer-inner">
        {% include '_partials/footer.swig' %}
        {% include '_third-party/analytics/analytics-with-widget.swig' %}
        {% block footer %}{% endblock %}
      </div>
    </footer>

    <div class="back-to-top">
      <span style="font-family:'Source Sans Pro','Helvetica Neue',Arial,sans-serif;font-size:1.2em;font-weight:600">TOP</span>
    </div>

  </div>

  {% include '_scripts/vendors.swig' %}
  {% include '_scripts/commons.swig' %}

  {% set scheme_script = '_scripts/schemes/' + theme.scheme | lower + '.swig' %}
  {% include scheme_script %}

  {% block script_extra %}{% endblock %}

  {% include '_scripts/boostrap.swig' %}

  {% include '_third-party/comments/index.swig' %}
  {% include '_third-party/search/index.swig' %}
  {% include '_third-party/analytics/lean-analytics.swig' %}
  {% include '_third-party/analytics/firestore.swig' %}
  {% include '_third-party/seo/baidu-push.swig' %}
  {% include '_third-party/needsharebutton.swig' %}
  {% include '_third-party/rating.swig' %}
  {% include '_third-party/mathjax.swig' %}
  {% include '_third-party/scroll-cookie.swig' %}
  {% include '_third-party/exturl.swig' %}

  <script type="text/javascript" src="{{ url_for(theme.js) }}/src/mo.min.js"></script>
  <script>$(function(){$("a").not(".nav-link,.cloud-tie-join-count,.ignore-href,.jstree-anchor").addClass("animsition-link")});var burst1=new mojs.Burst({left:0,top:0,radius:{5:40},children:{shape:"circle",fill:["red","cyan","orange"],fillOpacity:.8,radiusX:3.5,radiusY:3.5}});document.addEventListener("click",function(a){null==a.target.href&&"footer"!=a.target.className&&"copyright"!=a.target.className&&"author__urls social-icons"!=a.target.className&&"author__avatar"!=a.target.className&&"sidebar sidebar-active"!=a.target.className&&burst1.tune({x:a.pageX,y:a.pageY}).generate().replay()})</script>
  <div data-name="mojs-shape"></div>
  
</body>
</html>
