<div class="site-brand-wrapper">
  <div class="site-meta {% if theme.custom_logo.enabled %}custom-logo{% endif %}">
    {% if theme.custom_logo.image and theme.scheme === 'Muse' %}
      <div class="site-meta-headline">
        <a>
          <img class="custom-logo-image" src="{{ theme.custom_logo.image }}"
               alt="{{ config.title }}"/>
        </a>
      </div>
    {% endif %}

    {% set font_merienda_uri = url_for(theme.vendors._internal + '/font-awesome/css/font-merienda.css?v=4.6.2') %}
    {% if theme.vendors.fontawesome %}
      {% set font_merienda_uri = theme.vendors.fontawesome %}
    {% endif %}

    <link href="{{ font_merienda_uri }}" rel="stylesheet" type="text/css" />

    <div class="custom-logo-site-title">
      <a href="{{ config.root }}"  class="brand" rel="start">
        <span class="logo-line-before"><i></i></span>
        <span class="site-title" style="font-family:Merienda;font-size:1.3rem">{{ config.title }}</span>
        <span class="logo-line-after"><i></i></span>
      </a>
    </div>
      {% if theme.seo %}
        <h1 class="site-subtitle" itemprop="description">{{ config.subtitle }}</h1>
      {% else %}
        <p class="site-subtitle">{{ config.subtitle }}</p>
      {% endif %}
  </div>

  <div class="site-nav-toggle">
    <button>
      <span class="btn-bar"></span>
      <span class="btn-bar"></span>
      <span class="btn-bar"></span>
    </button>
  </div>
</div>

<nav class="site-nav">

  {% if theme.menu %}
    <ul id="menu" class="menu">
      {% for name, path in theme.menu %}
        {% set itemName = name.toLowerCase() %}
        {% set menuName = name.toLocaleUpperCase() %}
        <li class="menu-item menu-item-{{ itemName | replace(' ', '-') }}">
          <a href="{{ url_for(path.split('||')[0]) | trim }}" rel="section">
            {{ menuName }}
          </a>
        </li>
      {% endfor %}

    </ul>
  {% endif %}

</nav>

{% include '../_custom/header.swig' %}
