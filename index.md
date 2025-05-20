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

# Join Our Movement

> As a family, we commit to waiting until at least 9th grade to give our child(ren) a smart phone and delay access to social media until we feel it will be a positive addition to their lives. Prior to high school, we will explore ["talk and text"](https://dumbwireless.com/) only devices for communication needs.
>
> We support school policies that prohibit personal electronic devices throughout the school day.
>
> As parents, we will model positive technology behaviors in and outside of the home.
>
> As stakeholders in our community, we support free-roam childhoods and screen-free experiences. Businesses will offer access to phones and camps, clubs, and activities are encouraged to keep devices away.

<div class="signup-form">
  <form id="emailForm" onsubmit="submitForm(event)">
    <div class="form-group">
      <label for="parentName">Parent/Guardian Name(s)</label>
      <input type="text" id="parentName" name="parentName" class="form-control" placeholder="Enter your name(s)" required>
    </div>

    <div class="form-group">
      <label for="email">Email Address</label>
      <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
    </div>

    <div class="form-group">
      <label>Are you okay with your name appearing on the PA Unplugged website?</label>
      <div class="radio-group">
        <div class="form-check">
          <input class="form-check-input" type="radio" name="publicName" id="publicNameYes" value="yes" required>
          <label class="form-check-label" for="publicNameYes">Yes</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="publicName" id="publicNameNo" value="no" required>
          <label class="form-check-label" for="publicNameNo">No, I'd like to be anonymous</label>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label>Commitment Agreement</label>
      <div class="radio-group">
        <div class="form-check">
          <input class="form-check-input" type="radio" name="commitment" id="commitmentYes" value="committed" required>
          <label class="form-check-label" for="commitmentYes">I commit to delaying the purchase of a smartphone and the usage of social media for my child(ren)</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="commitment" id="commitmentNo" value="considering" required>
          <label class="form-check-label" for="commitmentNo">I am considering this commitment and would like more information</label>
        </div>
      </div>
    </div>

    <div class="children-section">
      <div id="childrenContainer">
        <div class="child-entry">
          <div class="child-header">
            <h4>Child #1</h4>
          </div>
          <div class="form-group">
            <label for="graduationYear1">Graduation Year</label>
            <select class="form-select" id="graduationYear1" name="graduationYear[]" required>
              <option value="">Select Graduation Year</option>
              <option value="2025">2025</option>
              <option value="2026">2026</option>
              <option value="2027">2027</option>
              <option value="2028">2028</option>
              <option value="2029">2029</option>
              <option value="2030">2030</option>
              <option value="2031">2031</option>
              <option value="2032">2032</option>
              <option value="2033">2033</option>
              <option value="2034">2034</option>
              <option value="2035">2035</option>
              <option value="2036">2036</option>
            </select>
          </div>
          <div class="form-group">
            <label for="county1">County</label>
            <select class="form-select county-select" id="county1" name="county[]" onchange="updateDistricts(this)" required>
              <option value="">Select County</option>
              <option value="Allegheny">Allegheny County</option>
              <option value="Beaver">Beaver County</option>
              <option value="Delaware">Delaware County</option>
            </select>
          </div>
          <div class="form-group">
            <label for="district1">School District</label>
            <select class="form-select district-select" id="district1" name="district[]" required disabled>
              <option value="">Select District</option>
            </select>
          </div>
        </div>
      </div>
      <button type="button" class="btn btn-secondary" onclick="addChild()">Add Another Child</button>
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
    Thank you for joining us!
  </div>
</div>

<hr>

<div class="unplugged-families">
  {% assign committed_families = site.data.supporters | where_exp: "supporter", "supporter['Commitment Status'] contains 'committed'" %}
  {% assign families_by_name = committed_families | group_by: "Parent/Guardian Name" %}

  <h1>Unplugged Families</h1>
  <h2>{{ families_by_name.size }} Pennsylvania families have committed to delay smart phones and social media</h2>

  <section class="grade-group">
      <div class="grade-filter">
          <select id="grade-filter" class="form-select" onchange="filterFamilies()">
              <option value="all">Show All Families</option>
              <option value="grade-kindergarten">Kindergarten</option>
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

  {% assign sorted_families = families_by_name | sort: "name" %}
  {% for family in sorted_families %}
    {% assign class_names = "family" %}
    {% assign children = family.items | sort: "Graduation Year" %}

    {% for child in children %}
      {% assign graduation_year = child["Graduation Year"] | plus: 0 %}
      {% assign current_year = 2024 %}
      {% assign years_until_graduation = graduation_year | minus: current_year %}
      {% assign grade_number = 12 | minus: years_until_graduation | plus: 1 %}

      {% case grade_number %}
        {% when 0 %}
          {% assign grade = "Kindergarten" %}
        {% when 1 %}
          {% assign grade = "1st" %}
        {% when 2 %}
          {% assign grade = "2nd" %}
        {% when 3 %}
          {% assign grade = "3rd" %}
        {% when 4 %}
          {% assign grade = "4th" %}
        {% when 5 %}
          {% assign grade = "5th" %}
        {% when 6 %}
          {% assign grade = "6th" %}
        {% when 7 %}
          {% assign grade = "7th" %}
        {% when 8 %}
          {% assign grade = "8th" %}
        {% when 9 %}
          {% assign grade = "9th" %}
        {% when 10 %}
          {% assign grade = "10th" %}
        {% when 11 %}
          {% assign grade = "11th" %}
        {% when 12 %}
          {% assign grade = "12th" %}
        {% else %}
          {% assign grade = "Preschool" %}
      {% endcase %}

      {% assign class_names = class_names | append: " grade-" | append: grade | downcase %}
    {% endfor %}

    <div class="{{ class_names }}">
      <div class="parents">
        {{ family.name }}
      </div>
      <div class="students">
        {% assign child_count = children.size %}
        {% assign second_to_last_index = child_count | minus: 1 %}

        {% assign unique_grades = "" | split: "" %}
        {% for child in children %}
          {% assign graduation_year = child["Graduation Year"] | plus: 0 %}
          {% assign current_year = 2024 %}
          {% assign years_until_graduation = graduation_year | minus: current_year %}
          {% assign grade_number = 12 | minus: years_until_graduation | plus: 1 %}

          {% case grade_number %}
            {% when 0 %}
              {% assign grade = "Kindergarten" %}
            {% when 1 %}
              {% assign grade = "1st" %}
            {% when 2 %}
              {% assign grade = "2nd" %}
            {% when 3 %}
              {% assign grade = "3rd" %}
            {% when 4 %}
              {% assign grade = "4th" %}
            {% when 5 %}
              {% assign grade = "5th" %}
            {% when 6 %}
              {% assign grade = "6th" %}
            {% when 7 %}
              {% assign grade = "7th" %}
            {% when 8 %}
              {% assign grade = "8th" %}
            {% when 9 %}
              {% assign grade = "9th" %}
            {% when 10 %}
              {% assign grade = "10th" %}
            {% when 11 %}
              {% assign grade = "11th" %}
            {% when 12 %}
              {% assign grade = "12th" %}
            {% else %}
              {% assign grade = "Preschool" %}
          {% endcase %}

          {% if grade != "Kindergarten" and grade != "Preschool" %}
            {% assign grade = grade | append: " grade" %}
          {% endif %}

          {% unless unique_grades contains grade %}
            {% assign unique_grades = unique_grades | push: grade %}
          {% endunless %}
        {% endfor %}

        {% assign unique_grades_count = unique_grades.size %}
        {% for grade in unique_grades %}
          {% if forloop.last and unique_grades_count > 1 %}
            & {{ grade }}
          {% elsif forloop.last %}
            {{ grade }}
          {% elsif forloop.index < unique_grades_count | minus: 1 %}
            {{ grade }},
          {% else %}
            {{ grade }} &
          {% endif %}
        {% endfor %}
        @ {% assign districts = children | map: "District" | uniq | join: ", " %}{{ districts }}
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

// District data
const districtsByCounty = {
  'Allegheny': [
    'Bethel Park', 'Central Catholic', 'Eden Christian', 'Faulk Laboratory',
    'Fox Chapel', 'Keystone Oaks', 'Montessori', 'Mt. Lebanon', 'New Brighton',
    'North Allegheny', 'Oakland Catholic', 'Pine Richland', 'Pittsburgh Public',
    'Quaker Valley', 'Saint James', 'Seneca Valley', 'Sewickley Academy',
    'Shady Side Academy', 'The Ellis School', 'Upper Saint Clair', 'Watermark'
  ],
  'Beaver': [
    'Beaver Area', 'Beaver Falls', 'Blackhawk', 'New Brighton'
  ],
  'Delaware': [
    'Chester Upland', 'Chichester', 'Garnet Valley', 'Haverford Township',
    'Interboro', 'Marple Newtown', 'Penn-Delco', 'Radnor', 'Ridley',
    'Rose Tree Media', 'Southeast Delco', 'Springfield', 'Upper Darby',
    'Wallingford-Swarthmore', 'William Penn'
  ]
};

function updateDistricts(countySelect) {
  const childEntry = countySelect.closest('.child-entry');
  const districtSelect = childEntry.querySelector('.district-select');
  const selectedCounty = countySelect.value;

  // Clear and disable district select
  districtSelect.innerHTML = '<option value="">Select District</option>';
  districtSelect.disabled = !selectedCounty;

  if (selectedCounty) {
    // Add districts for selected county
    districtsByCounty[selectedCounty].forEach(district => {
      const option = document.createElement('option');
      option.value = district;
      option.textContent = district;
      districtSelect.appendChild(option);
    });
  }
}

function addChild() {
  const container = document.getElementById('childrenContainer');
  const childEntry = document.createElement('div');
  childEntry.className = 'child-entry';

  // Get the next child number
  const childNumber = container.children.length + 1;

  // Create child header with remove link
  const headerDiv = document.createElement('div');
  headerDiv.className = 'child-header';
  headerDiv.innerHTML = `
    <h4>Child #${childNumber}</h4>
    <a href="#" class="remove-child" onclick="event.preventDefault(); this.closest('.child-entry').remove();">Remove</a>
  `;

  // Create graduation year select
  const yearSelect = document.createElement('select');
  yearSelect.className = 'form-select';
  yearSelect.id = `graduationYear${childNumber}`;
  yearSelect.name = 'graduationYear[]';
  yearSelect.required = true;

  // Add the options
  const years = Array.from({length: 13}, (_, i) => 2025 + i);
  yearSelect.innerHTML = `
    <option value="">Select Graduation Year</option>
    ${years.map(year => `<option value="${year}">${year}</option>`).join('')}
  `
