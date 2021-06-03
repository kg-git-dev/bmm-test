---
layout: event
title: Life & Health Group Coaching
theid: 2785
permalink: /register/
facilitators:
  - img: /uploads/facilitator-steve.png
    name: Steve Seay
    title: Life & Leadership Coach
    desc: "Steve has over 15 years of experience in the healthcare arena where he worked as a Marriage and Family Therapist. Currently works as a Life and Leadership Coach serving physicians, manager business leaders through the discovery of their highest potential in the areas of body, mind and spirit. Steve brings his combined experience to Beautiful Minds by helping develop and co-facilitate this 8-week program to wellness."
  - img: /uploads/facilitator-mariola.png
    name: Mariola Porras
    title: Life & Health Coach
    desc: "After 15 years of a global marketing career and burnout, Mariola learned how crucial healthy living is for optimal wellbeing. She brings her personal life experience and training to Beautiful Minds where she partners with medical experts in helping others reach their potential through healthy lifestyle principles. Mariola will co-facilitate this group and share tools to help optimize mental health through the acronym: CHOOSELIFE©."
published: true
---

<style>  
  h2, p {
    margin-left: 36px;
    margin-right: 36px;
  }

  h3 {
    //color: #64a351;
    margin: 20px 36px;
  }


  ul.style-1 {
    margin-left: 50px;
  }

  .fac-item {
    display: grid;
    margin: 20px 36px;
    max-width: 800px !important;
    grid-template-columns: auto auto;
  }

  .img-item {
    //height: 100px;
    //width: 100px;
    margin-right: 30px;
  }

  .img-item img {
    height: 170px;
    /* border-radius: 50%; */
  }

  .desc-item .title {
    color: #64a351;
    font-size: 1.2em;
  }

  .desc-item .subtitle {
    color: #adadad;
    padding: 5px 0;
  }

  .desc-item {
    font-family: "helvetica";
  }

  .desc-item .desc {
    color: #525252;
  }

  .top-info {
    display: flex;
  }

  .reg-btn {
    width: 163px; 
    font-size: 1.3em; 
    padding: 10px;
  }

  .btn-container {
    align-self: center;
    margin: auto
  }

  @media only screen and (max-width: 800px) {
    .top-info {
      flex-direction: column-reverse;
    }

    .btn-container {
      width: 90%;
      margin-top: 15px;
      margin-bottom: 15px;
    }

    .reg-btn {
      width: 100%;
    }
  }

  .iframe-body {
    height: 1300px;
    width: 100%;
    overflow: hidden;
    top: 0;
    left: 0;
  }

  @media only screen and (max-width: 955px) {
    .iframe-body {
      height: 1520px;
    }
  }

  @media only screen and (max-width: 556px) {

    h2, p, h3 {
      margin-left: 20px;
      margin-right: 20px;
    }

    h2 {
      font-size: 20px;
    }

    h3 {
      font-size: 17px;
    }

    ul.style-1 {
      margin-left: 40px;
    }

    .fac-item {
      /* margin: 20px 36px; */
      /* max-width: 800px !important; */
      grid-template-columns: auto;
      justify-items: center;
    }

    .img-item {
      margin-right: 0;
    }

    .desc-item .title,
    .desc-item .subtitle {
      text-align: center;
    }
  }
</style>


![Life &amp; Health Group Coaching Fly`er](/uploads/group_coaching.png "Life &amp; Health Group Coaching"){: class="img-center" style="max-width: 700px; width: 100%;"}

<h2>
  Thank you for your interest in joining our 8-week program to wellness!
</h2>

<div class="top-info">
  <div>
    <h3>This program will help you:</h3>

    <ul class="style-1">
      <li>Optimize your overall health</li>
      <li>Define and achieve goals</li>
      <li>Focus on future not past</li>
      <li>Explore what is holding you back</li>
      <li>Get structure, guidance and encouragement </li>
      <li>Become your best self</li>
    </ul>
  </div>

  <!-- <a class="btn-container" href="http://localhost:3777/beautifulminds/31bc26ab-c3be-4792-a57b-0d271d365e36">
    <div class="bm-btn reg-btn">Register</div>
  </a> -->
</div>


<script type="text/javascript" src="https://hipaa.jotform.com/jsform/93017366384158"></script>

{%- comment -%} <div class="overflow-hidden relative h-screen w-full" style="padding-top: 100%;">
  <iframe class="absolute h-full w-full overflow-hidden top-0 left-0 bottom-0 right-0" src="http://localhost:3000/beautifulminds/31bc26ab-c3be-4792-a57b-0d271d365e36"></iframe>
</div> {%- endcomment -%}

{%- comment -%} <h2 style="margin-bottom: 0;">
<div style="margin-top: 10px; margin-bottom: 20px; border: 0px; border-bottom-width: 2px; border-style: solid; border-color: #e2e8f0;"></div>
Register Below:
</h2>

<iframe frameBorder="0" class="iframe-body" src="http://localhost:3777/beautifulminds/31bc26ab-c3be-4792-a57b-0d271d365e36"></iframe> {%- endcomment -%}

<h2>
<div style="border: 0px; border-bottom-width: 2px; border-style: solid; border-color: #e2e8f0;"></div>
</h2>

### About the Facilitators:

{% for fac in page.facilitators %}
  <div class="fac-item">
    <div class="img-item">
      <img src="{{ fac.img }}" alt="">
    </div>
    <div class="desc-item">
      <div class="title">{{ fac.name }}</div>
      <div class="subtitle">{{ fac.title }}</div>
      <hr>
      <div class="desc">{{ fac.desc }}</div>
    </div>
  </div>
{% endfor %}