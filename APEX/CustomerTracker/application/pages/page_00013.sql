--application/pages/page_00013
prompt  ...PAGE 13: Customer Map
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 13
 ,p_user_interface_id => 1573006194470354318 + wwv_flow_api.g_id_offset
 ,p_tab_set => 'TS1'
 ,p_name => 'Customer Map'
 ,p_step_title => 'Sample Database Application - Customer Map'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Customer Map'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 1732188011359373082 + wwv_flow_api.g_id_offset
 ,p_step_template => 1020515051496437553 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'C'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_upd_yyyymmddhh24miss => '20120827072614'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'||unistr('\000a')||
'    codebase="#HOST_PROTOCOL#://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"'||unistr('\000a')||
'    width="#WIDTH#"'||unistr('\000a')||
'    height="#HEIGHT#"'||unistr('\000a')||
'    id="#CHART_NAME#"'||unistr('\000a')||
'    align="top">'||unistr('\000a')||
'<param name="movie" value="#IMAGE_PREFIX#flashchart/swf/AnyChart.swf">'||unistr('\000a')||
'<param name="quality" value="high">'||unistr('\000a')||
'<param name="allowScriptAccess" value="sa';

s:=s||'meDomain">'||unistr('\000a')||
'<param name="allowNetworking" value="all">'||unistr('\000a')||
'<param name="scale" value="noscale">'||unistr('\000a')||
'<param name="wmode" value="transparent">'||unistr('\000a')||
'<param name="FlashVars" value="XMLFile=#HOST#apex_util.flash?p=&APP_ID.:13:&APP_SESSION.:FLOW_FLASH_CHART5_R#REGION_ID#&noDataText=#FLASH_NO_DATA#&initText=#FLASH_INIT#&xmlLoadingText=#FLASH_LOADING#&resourcesLoadingText=#FLASH_RESOURCES#&waitingForDataText=#FLASH_WAI';

s:=s||'TING#&templatesLoadingText=#FLASH_TEMPLATES#">'||unistr('\000a')||
''||unistr('\000a')||
'<embed src="#IMAGE_PREFIX#flashchart/swf/AnyChart.swf"'||unistr('\000a')||
'       quality="high"'||unistr('\000a')||
'       width="#WIDTH#"'||unistr('\000a')||
'       height="#HEIGHT#"'||unistr('\000a')||
'       name="#CHART_NAME#"'||unistr('\000a')||
'       scale="noscale"'||unistr('\000a')||
'       align=""'||unistr('\000a')||
'       allowScriptAccess="sameDomain" '||unistr('\000a')||
'       allowNetworking="all"'||unistr('\000a')||
'       type="application/x-shockwave-flash"'||unistr('\000a')||
'       pluginspage="#HOST_PROTOCOL#://www.macrome';

s:=s||'dia.com/go/getflashplayer"'||unistr('\000a')||
'       wmode="transparent"'||unistr('\000a')||
'        FlashVars="XMLFile=#HOST#apex_util.flash?p=&APP_ID.:13:&APP_SESSION.:FLOW_FLASH_CHART5_R#REGION_ID#&noDataText=#FLASH_NO_DATA#&initText=#FLASH_INIT#&xmlLoadingText=#FLASH_LOADING#&resourcesLoadingText=#FLASH_RESOURCES#&waitingForDataText=#FLASH_WAITING#&templatesLoadingText=#FLASH_TEMPLATES#">'||unistr('\000a')||
'</embed>'||unistr('\000a')||
'</object>'||unistr('\000a')||
'#CHART_REFRESH#';

wwv_flow_api.create_page_plug (
  p_id=> 7567329980565641695 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 13,
  p_plug_name=> 'Customer Map',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => false,
  p_plug_new_grid_column  => false,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'FLASH_MAP',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1 := null;
wwv_flow_api.create_flash_chart5(
  p_id                     => 7567330178735641698+wwv_flow_api.g_id_offset,
  p_flow_id                => wwv_flow.g_flow_id,
  p_page_id                => 13,
  p_region_id              => 7567329980565641695+wwv_flow_api.g_id_offset,
  p_default_chart_type     =>'Map',
  p_chart_title            =>'Count of Customers by State',
  p_chart_rendering        =>'FLASH_PREFERRED',
  p_chart_name             =>'chart_829383609554689260',
  p_chart_width            =>700,
  p_chart_height           =>500,
  p_chart_animation        =>'N',
  p_display_attr           =>':H:N:V:X::N::V:Y:None:::::',
  p_dial_tick_attr         =>'',
  p_gantt_attr             =>'Y:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:30:15:5:Y:I:N:S:E',
  p_pie_attr               =>'Outside:::',
  p_map_attr               =>'Orthographic:RegionBounds:REGION_ID:Y:Y:Series:::- Map Regions -:Y:',
  p_map_source             =>'usa/country/states.amap',
  p_margins                =>':::',
  p_omit_label_interval    => null,
  p_bgtype                 =>'Trans',
  p_bgcolor1               =>'',
  p_bgcolor2               =>'',
  p_gradient_rotation      =>null,
  p_grid_bgtype            =>'Solid',
  p_grid_bgcolor1          =>'#FFFFFF',
  p_grid_bgcolor2          =>'',
  p_grid_gradient_rotation =>null,
  p_color_scheme           =>'7',
  p_custom_colors          =>'',
  p_map_undef_color_scheme =>'1',
  p_map_undef_custom_colors =>'',
  p_x_axis_title           =>'',
  p_x_axis_min             =>null,
  p_x_axis_max             =>null,
  p_x_axis_decimal_place   =>null,
  p_x_axis_prefix          =>'',
  p_x_axis_postfix         =>'',
  p_x_axis_label_rotation  =>'',
  p_x_axis_label_font      =>'',
  p_x_axis_major_interval  =>null,
  p_x_axis_minor_interval  =>null,
  p_y_axis_title           =>'',
  p_y_axis_min             =>null,
  p_y_axis_max             =>null,
  p_y_axis_decimal_place   =>null,
  p_y_axis_prefix          =>'',
  p_y_axis_postfix         =>'',
  p_y_axis_label_rotation  =>'',
  p_y_axis_label_font      =>'',
  p_y_axis_major_interval  =>null,
  p_y_axis_minor_interval  =>null,
  p_async_update           =>'N',
  p_async_time             =>null,
  p_legend_title           =>'',
  p_legend_title_font      =>'',
  p_names_font             => null,
  p_names_rotation         => null,
  p_values_font            =>'Arial:10:#000000',
  p_values_rotation        =>null,
  p_values_prefix          =>'',
  p_values_postfix         =>'',
  p_hints_font             =>'Tahoma:10:#000000',
  p_legend_font            =>'Arial:10:#000000',
  p_grid_labels_font       =>'',
  p_chart_title_font       =>'Tahoma:14:#000000',
  p_x_axis_title_font      =>'Tahoma:14:',
  p_x_axis_title_rotation  =>'',
  p_y_axis_title_font      =>'Tahoma:14:',
  p_y_axis_title_rotation  =>'',
  p_gauge_labels_font      =>'Tahoma:10',
  p_use_chart_xml          =>'N',
  p_chart_xml              => a1);
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select apex_util.prepare_url(''f?p=''||:APP_ID||'':2:''||:app_session||'':::2,RIR:IR_CUST_STATE:''||'||unistr('\000a')||
'             cust_state) click_link,'||unistr('\000a')||
'       cust_state region_id,'||unistr('\000a')||
'       count(*) count_of_customers'||unistr('\000a')||
'  from demo_customers'||unistr('\000a')||
'group by cust_state';

wwv_flow_api.create_flash_chart5_series(
  p_id                        => 7567330281571641700+wwv_flow_api.g_id_offset,
  p_chart_id                  => 7567330178735641698+wwv_flow_api.g_id_offset,
  p_flow_id                   => wwv_flow.g_flow_id,
  p_series_seq                =>10,
  p_series_name               =>'Series 1',
  p_series_query              => a1,
  p_series_type               =>'Bubble',
  p_series_query_type         =>'SQL_QUERY',
  p_series_ajax_items_to_submit=>'',
  p_series_query_parse_opt    =>'PARSE_CHART_QUERY',
  p_series_query_no_data_found=>'No customers found.',
  p_series_query_row_count_max=>50,
  p_action_link               =>'',
  p_show_action_link          =>'N',
  p_action_link_checksum_type =>'',
  p_display_when_cond_type    =>'',
  p_display_when_condition    =>'',
  p_display_when_condition2   =>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 13
--
 
begin
 
null;
end;
null;
 
end;
/

 
