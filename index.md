---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Home
---

# We Believe

<div class="container">
  <div class="row">
    <ul class="we-believe">
      <li>Technology is a good thing when used intentionally and with purpose</li>
      <li>Childhood is being stolen by screen time</li>
      <li>Kids grow best from real life play and from time spent with people</li>
      <li>The longer we wait to give children devices, the healthier they will be</li>
      <li>Schools should be places to learn, not marketplaces for tech companies</li>
      <li>Teachers should focus on teaching and kids should focus on learning</li>
    </ul>
  </div>
</div>

# Sewickley Unplugged Commitment

> As a family, we commit to waiting until at least 9th grade to give our child(ren) a smart phone and delay access to social media until we feel it will be a positive addition to their lives. Prior to high school, we will explore ["talk and text"](https://dumbwireless.com/) only devices for communication needs.
>
> We support school policies that prohibit personal electronic devices throughout the school day.
>
> As parents, we will model positive technology behaviors in and outside of the home.
>
> As stakeholders in our community, we support free-roam childhoods and screen-free experiences. Businesses will offer access to phones and camps, clubs, and activities are encouraged to keep devices away.

<div class="signup-form">
  <h3>Join Our Community</h3>
  <form id="emailForm" onsubmit="submitForm(event)">
    <div class="form-group">
      <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
    </div>
    <button type="submit" class="btn btn-primary">Sign Up</button>
  </form>
</div>

<div id="toast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
  <div class="toast-header">
    <strong class="me-auto">Success</strong>
    <button type="button" class="btn-close" onclick="dismissToast()" aria-label="Close"></button>
  </div>
  <div class="toast-body">
    Thank you for signing up!
  </div>
</div>

<div class="unplugged-families">
  {% assign committed_families = site.data.families | where_exp: "family", "family['Commitment Agreement'] contains 'I commit'" %}

  <h1>Unplugged Families</h1>
  <h2>{{ committed_families.size }} Sewickley families have committed to delay smart phones and social media</h2>

  <section class="grade-group">
      <div class="grade-filter">
          <select id="grade-filter" class="form-select" onchange="filterFamilies()">
              <option value="all">Show All Families</option>
              <option value="grade-kindergarten">Kindgergarten</option>
              <option value="grade-1st">1st Grade</option>
              <option value="grade-2nd">2nd Grade</option>
              <option value="grade-3rd">3rd Grade</option>
              <option value="grade-4th">4th Grade</option>
              <option value="grade-5th">5th Grade</option>
              <option value="grade-6th">6th Grade</option>
              <option value="grade-7th">7th Grade</option>
              <option value="grade-8th">8th Grade</option>
              <option value="grade-9th">9th Grade</option>
              <option value="grade-10th">10th Grade</option>
              <option value="grade-11th">11th Grade</option>
              <option value="grade-12th">12th Grade</option>
          </select>
      </div>
  </section>

  {% for family in committed_families %}
    {% assign class_names = "family" %}

    {% if family["(1st Child) School Year"] %}
      {% assign grade = family["(1st Child) School Year"] | downcase | replace: " grade", "" %}
      {% assign class_names = class_names | append: " grade-" | append: grade %}
    {% endif %}

    {% if family["(2nd Child) School Year"] %}
      {% assign grade = family["(2nd Child) School Year"] | downcase | replace: " grade", "" %}
      {% assign class_names = class_names | append: " grade-" | append: grade %}
    {% endif %}

    {% if family["(3rd Child) School Year"] %}
      {% assign grade = family["(3rd Child) School Year"] | downcase | replace: " grade", "" %}
      {% assign class_names = class_names | append: " grade-" | append: grade %}
    {% endif %}

    {% if family["(4th Child) School Year"] %}
      {% assign grade = family["(4th Child) School Year"] | downcase | replace: " grade", "" %}
      {% assign class_names = class_names | append: " grade-" | append: grade %}
    {% endif %}

    {% if family["(5th Child) School Year"] %}
      {% assign grade = family["(5th Child) School Year"] | downcase | replace: " grade", "" %}
      {% assign class_names = class_names | append: " grade-" | append: grade %}
    {% endif %}

    <div class="{{ class_names }}">
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

        {% assign school_year_order = "Preschool,Kindergarten,1st Grade,2nd Grade,3rd Grade,4th Grade,5th Grade,6th Grade,7th Grade,8th Grade,9th Grade,10th Grade,11th Grade,12th Grade" | split: "," %}

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

        {% if sorted_children.last != "Kindergarten" and sorted_children.last != "Preschool" %}
          {% assign children = children | append: " grade" %}
        {% endif %}

        {{ children }} @ {{ family['School(s)'] }}
      </div>
    </div>
  {% endfor %}
</div>

<script>
  function filterFamilies() {
    var filter = document.getElementById("grade-filter").value;
    var families = document.getElementsByClassName("family");

    for (var i = 0; i < families.length; i++) {
        if (filter === "all") {
            families[i].style.display = "block";
        } else {
            if (families[i].classList.contains(filter)) {
                families[i].style.display = "block";
            } else {
                families[i].style.display = "none";
            }
        }
    }
}

function showToast() {
  const toast = document.getElementById('toast');
  toast.classList.add('show');
}

function dismissToast() {
  const toast = document.getElementById('toast');
  toast.classList.remove('show');
}

async function submitForm(event) {
  event.preventDefault();

  const email = document.getElementById('email').value;
  const submitButton = document.querySelector('button[type="submit"]');
  const scriptURL = 'https://script.google.com/macros/s/AKfycbwZ24nUKRBqBwU_mY_IYwl2tqtzNqodmaLPHEZdUHv0gCEPOht2GxeR1BujgQ0nffYe/exec';

  try {
    // Disable the submit button
    submitButton.disabled = true;
    submitButton.textContent = 'Submitting...';

    console.log('Submitting form with email:', email);
    const formData = new FormData();
    formData.append('email', email);

    const response = await fetch(scriptURL, {
      method: 'POST',
      body: formData,
      mode: 'no-cors',
      headers: {
        'Accept': 'application/json'
      }
    });

    console.log('Response received:', response);
    document.getElementById('emailForm').reset();
    showToast();
  } catch (error) {
    console.error('Error details:', error);
    showToast();
  } finally {
    // Re-enable the submit button
    submitButton.disabled = false;
    submitButton.textContent = 'Sign Up';
  }
}
</script>
