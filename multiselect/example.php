<html>
  <head>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link href="css/multi-select.css" media="screen" rel="stylesheet" type="text/css" />
    <script src="js/jquery.multi-select.js" type="text/javascript"></script>
  </head>
  <body>
    <select multiple="multiple" id="my-select" name="selected_items[]">
      <option value='elem_1'>elem 1</option>
      <option value='elem_2'>elem 2</option>
      <option value='elem_3'>elem 3</option>
      <option value='elem_4'>elem 4</option>
      <option value='elem_5'>elem 5</option>
      <option value='elem_6'>elem 6</option>
      <option value='elem_7'>elem 7</option>
      <option value='elem_8'>elem 8</option>
      <option value='elem_9'>elem 9</option>
      <option value='elem_10'>elem 10</option>
      <option value='elem_11'>elem 11</option>
      <option value='elem_12'>elem 12</option>
      <option value='elem_13'>elem 13</option>
      
      <!--//example of disabled item//
      <option value='elem_5' disabled>elem 5</option>
      -->
      
      <!--//example of pre-selected item//
      <option value='elem_6' selected>elem 6</option>
      -->
      
    </select>
    
    <!-- //example of opt-groups//
    <select id='my-select' multiple='multiple' name="selected_items[]">
        <optgroup label='Friends'>
        <option value='1'>John</option>
        <option value='2' selected>Akbar</option>
        </optgroup>
        <optgroup label='Best Friends'>
        <option value='3'>David</option>
        <option value='4' disabled>Michael</option>
        </optgroup>
    </select>
    -->
    
    <script type="text/javascript">
    $('#my-select').multiSelect();
    
    //example of all selected items. Uncomment the following code if you want to use this option
    //$('#my-select').multiSelect('select_all');
    
    //example of all deselected items. Uncomment the following code if you want to use this option
    //$('#my-select').multiSelect('deselect_all');
    
    //example of call backs. uncomment the below code to use this feature
    /*
    $('#my-select').multiSelect({
    afterSelect: function(values){
    alert("Select value: "+values);
    },
    afterDeselect: function(values){
    alert("Deselect value: "+values);
    }
    });
    */
    
    //example of custom headers and footers for seletable and selected item boxes. uncomment the code to use this feature
    /*
    $('#my-select').multiSelect({
    selectableHeader: "<div class='custom-header'>Selectable items</div>",
    selectionHeader: "<div class='custom-header'>Selection items</div>",
    selectableFooter: "<div class='custom-header'>Selectable footer</div>",
    selectionFooter: "<div class='custom-header'>Selection footer</div>"
    });
    */
    
    
    </script>
  </body>
</html>