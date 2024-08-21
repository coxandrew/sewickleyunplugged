---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Home
---

## Sewickley Unplugged Commitment

> As a family, we commit to waiting until at least 9th grade to give our child(ren) a smart phone and delay access to social media until 11th grade. Prior to high school, we will explore "[talk and text](https://dumbwireless.com/)" only devices for communication needs.
>
> As parents, we will model positive technology behaviors in and outside of the home.
>
> We support school policies that prohibit personal electronic devices throughout the school day.
>
> As stakeholders in our community, we support free-roam childhoods and screen-free experiences. Businesses will offer access to phones and camps, clubs, and activities are encouraged to keep devices away.

<a class="btn btn-primary" href="https://forms.gle/W4hoVLB4qVczjRJs6" target="_blank">Sign the Commitment</a>

<div class="unplugged-families">
  <h1>Unplugged Families</h1>

  {% for family in site.data.families %}
    {% if family["Commitment Agreement"] contains "I commit" %}

      <div class="family">
        <div class="parents">
          <!-- Cox Family -->
          {{ family['Parent/Guardian Name(s)'] }}
        </div>
        <div class="students">
          <!-- Kindergartener, 2nd & 6th grader @ Sewickley Academy -->
          {% assign children = "" %}
          {% assign child1 = family["(1st Child) School Year"] %}
          {% assign child2 = family["(2nd Child) School Year"] %}
          {% assign child3 = family["(3rd Child) School Year"] %}
          {% assign child4 = family["(4th Child) School Year"] %}
          {% assign child5 = family["(5th Child) School Year"] %}

          {% assign child_list = "" %}
          {% if child1 %} {% assign child_list = child_list | append: child1 | append: "|" %} {% endif %}
          {% if child2 %} {% assign child_list = child_list | append: child2 | append: "|" %} {% endif %}
          {% if child3 %} {% assign child_list = child_list | append: child3 | append: "|" %} {% endif %}
          {% if child4 %} {% assign child_list = child_list | append: child4 | append: "|" %} {% endif %}
          {% if child5 %} {% assign child_list = child_list | append: child5 | append: "|" %} {% endif %}

          {% assign child_array = child_list | split: "|" %}

          {% assign school_year_order = "Kindergarten,1st Grade,2nd Grade,3rd Grade,4th Grade,5th Grade,6th Grade,7th Grade,8th Grade,9th Grade,10th Grade,11th Grade,12th Grade" | split: "," %}

          {% assign sorted_children = "" %}
          {% for year in school_year_order %}
            {% for child in child_array %}
              {% if child == year %}
                {% assign year_without_grade = year | replace: " Grade", "" %}
                {% assign sorted_children = sorted_children | append: year_without_grade | append: "|" %}
              {% endif %}
            {% endfor %}
          {% endfor %}
          {% assign sorted_children = sorted_children | split: "|" %}

          {% assign child_count = sorted_children.size %}
          {% assign second_to_last_index = child_count | minus: 1 %}

          {% for child in sorted_children %}
            {% if forloop.last and child_count > 1 %}
              {% assign children = children | append: " & " | append: child %}
            {% elsif forloop.last %}
              {% assign children = children | append: child %}
            {% elsif forloop.index < second_to_last_index %}
              {% assign children = children | append: child | append: ", " %}
            {% else %}
              {% assign children = children | append: child %}
            {% endif %}
          {% endfor %}

          {% if sorted_children.last != "Kindergarten" %}
            {% assign children = children | append: " grade" %}
          {% endif %}

          {{ children }} @ {{ family['School(s)'] }}
        </div>
      </div>
    {% endif %}
  {% endfor %}
</div>
