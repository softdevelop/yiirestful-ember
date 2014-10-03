<script type="text/x-handlebars" id="index">
  <div class="row">
      <div class="small-12 columns">
          <h1>Lastest BoyCotts</h1>
          <table>
            <thead>
              <tr>
                <th width="200">Title</th>
                <th width="200" >Description</th>
                <th width="150">Demand</th>
                <th width="150">Product</th>
              </tr>
            </thead>
            <tbody>
              {{#each item in boycott}}
                <tr>
                  <td>{{item.title}}</td>
                  <td>{{item.description}}</td>
                  <td>{{item.demand}}</td>
                  <td>{{item.product.title}}</td>
                </tr>
              {{/each}}
            </tbody>
          </table>
      </div>
  </div>
  <div class="row">
        <div class="small-12 columns">
            <h1>Ranking Top BoyCotts</h1>
            <table>
              <thead>
                <tr>
                  <th width="200">Title</th>
                  <th width="200" >Description</th>
                  <th width="150">Demand</th>
                  <th width="150">Product</th>
                </tr>
              </thead>
              <tbody>
                {{#each item in boycottrank}}
                  <tr>
                    <td>{{item.title}}</td>
                    <td>{{item.description}}</td>
                    <td>{{item.demand}}</td>
                    <td>{{item.product.title}}</td>
                  </tr>
                {{/each}}
              </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="small-12 columns">
            <h1>News</h1>
            <table>
              <thead>
                <tr>
                  <th width="200">Title</th>
                  <th width="200" >Content</th>
                  <th width="150">Created at</th>
                </tr>
              </thead>
              <tbody>
                {{#each item in news}}
                  <tr>
                    <td>{{#link-to 'news' item.id class="button tiny"}}{{item.title}}{{/link-to}}</td>
                    <td>{{item.content}}</td>
                    <td>{{item.created_at}}</td>
                  </tr>
                {{/each}}
              </tbody>
            </table>
        </div>
    </div>
</script>