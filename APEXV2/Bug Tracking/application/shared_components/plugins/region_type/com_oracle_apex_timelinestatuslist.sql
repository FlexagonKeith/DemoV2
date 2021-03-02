prompt --application/shared_components/plugins/region_type/com_oracle_apex_timelinestatuslist
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1589222718426433455)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.TIMELINESTATUSLIST'
,p_display_name=>'Timeline and Status List'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.TIMELINESTATUSLIST'),'#IMAGE_PREFIX#plugins/com.oracle.apex.timelinestatuslist/1.2/')
,p_javascript_file_urls=>'#PLUGIN_FILES#timelinestatuslist#MIN#.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'procedure render_list_calendar( p_region in apex_plugin.t_region ) is',
'    c_group_col          constant varchar2(255) := p_region.attribute_01;',
'    c_color_col          constant varchar2(255) := p_region.attribute_02;',
'    c_title_col          constant varchar2(255) := p_region.attribute_03;',
'    c_link_col           constant varchar2(255) := p_region.attribute_04;',
'    c_row1_attr1_val_col constant varchar2(255) := p_region.attribute_05;',
'    c_row1_attr2_val_col constant varchar2(255) := p_region.attribute_06;',
'    c_row2_attr1_val_col constant varchar2(255) := p_region.attribute_07;',
'    c_row2_attr2_val_col constant varchar2(255) := p_region.attribute_08;',
'    c_description_1_col  constant varchar2(255) := p_region.attribute_09;',
'    c_description_2_col  constant varchar2(255) := p_region.attribute_10;',
'    c_description_3_col  constant varchar2(255) := p_region.attribute_11;',
'    c_description_4_col  constant varchar2(255) := p_region.attribute_15;',
'    c_group_type         constant varchar2(255) := p_region.attribute_12;',
'    c_status_col         constant varchar2(255) := p_region.attribute_13;',
'    c_color_label_col    constant varchar2(255) := p_region.attribute_14;',
'',
'    l_group_col_no          pls_integer;',
'    l_color_col_no          pls_integer;',
'    l_title_col_no          pls_integer;',
'    l_link_col_no           pls_integer;',
'    l_row1_attr1_val_col_no pls_integer;',
'    l_row1_attr2_val_col_no pls_integer;',
'    l_row2_attr1_val_col_no pls_integer;',
'    l_row2_attr2_val_col_no pls_integer;',
'    l_description_1_col_no  pls_integer;',
'    l_description_2_col_no  pls_integer;',
'    l_description_3_col_no  pls_integer;',
'    l_description_4_col_no  pls_integer;',
'    l_status_col_no         pls_integer;',
'    l_color_label_col_no    pls_integer;',
'',
'    l_date           timestamp with local time zone;',
'    l_last_day       varchar2(8);',
'    l_group          varchar2(4000);',
'    l_color          varchar2(4000);',
'    l_color_label    varchar2(4000);',
'    l_title          varchar2(4000);',
'    l_link           varchar2(4000);',
'    l_row1_attr1_val varchar2(4000);',
'    l_row1_attr1_lbl varchar2(4000);',
'    l_row1_attr2_val varchar2(4000);',
'    l_row1_attr2_lbl varchar2(4000);',
'    l_row2_attr1_val varchar2(4000);',
'    l_row2_attr1_lbl varchar2(4000);',
'    l_row2_attr2_val varchar2(4000);',
'    l_row2_attr2_lbl varchar2(4000);',
'    l_description_1  varchar2(4000);',
'    l_description_2  varchar2(4000);',
'    l_description_3  varchar2(4000);',
'    l_description_4  varchar2(4000);',
'    l_status         varchar2(4000);',
'',
'    --',
'    l_no_data_found     varchar2(32767) := p_region.no_data_found_message;',
'    l_num_rows          pls_integer     := p_region.fetched_rows;',
'    --',
'    l_column_value_list    apex_plugin_util.t_column_value_list2;',
'    l_region_source        varchar2(32767) := p_region.source;',
'',
'    --',
'    l_last_group  varchar2(255) := ''x'';',
'',
'    l_found boolean;',
'    l_count pls_integer := 0;',
'',
'    type vc2_aat is table of varchar2(32767) index by varchar2(255);',
'    l_colors vc2_aat;',
'    l_color_idx varchar2(255);',
'',
'begin',
'    -- get the data to be displayed',
'    l_column_value_list := apex_plugin_util.get_data2 (',
'                               p_sql_statement  => l_region_source,',
'                               p_min_columns    => 3,',
'                               p_max_columns    => null,',
'                               p_component_name => p_region.name,',
'                               p_max_rows       => null );',
'',
'    -- Get the actual column number for the fields we want.',
'    l_group_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''Group column'',',
'                        p_column_alias      => c_group_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => false,',
'                        p_data_type         => null -- might be date, timestamp, etc.',
'                    );',
'',
'    l_color_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''Color column'',',
'                        p_column_alias      => c_color_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => false,',
'                        p_data_type         => apex_plugin_util.c_data_type_varchar2',
'                    );',
'',
'    l_color_label_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''Color Label column'',',
'                        p_column_alias      => c_color_label_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => false,',
'                        p_data_type         => apex_plugin_util.c_data_type_varchar2',
'                    );',
'',
'    l_status_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''Status column'',',
'                        p_column_alias      => c_status_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => false,',
'                        p_data_type         => apex_plugin_util.c_data_type_varchar2',
'                    );',
'',
'    l_title_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''Title column'',',
'                        p_column_alias      => c_title_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => true,',
'                        p_data_type         => apex_plugin_util.c_data_type_varchar2',
'                    );',
'',
'    l_link_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''Link column'',',
'                        p_column_alias      => c_link_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => false,',
'                        p_data_type         => apex_plugin_util.c_data_type_varchar2',
'                    );',
'',
'    l_row1_attr1_val_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''First Attribute Value column'',',
'                        p_column_alias      => c_row1_attr1_val_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => false,',
'                        p_data_type         => apex_plugin_util.c_data_type_varchar2',
'                    );',
'',
'    l_row1_attr2_val_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''Second Attribute Value column'',',
'                        p_column_alias      => c_row1_attr2_val_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => false,',
'                        p_data_type         => apex_plugin_util.c_data_type_varchar2',
'                    );',
'',
'    l_row2_attr1_val_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''Third Attribute Value column'',',
'                        p_column_alias      => c_row2_attr1_val_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => false,',
'                        p_data_type         => apex_plugin_util.c_data_type_varchar2',
'                    );',
'',
'    l_row2_attr2_val_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''Fourth Attribute Value column'',',
'                        p_column_alias      => c_row2_attr2_val_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => false,',
'                        p_data_type         => apex_plugin_util.c_data_type_varchar2',
'                    );',
'',
'    l_description_1_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''First Description column'',',
'                        p_column_alias      => c_description_1_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => false,',
'                        p_data_type         => apex_plugin_util.c_data_type_varchar2',
'                    );',
'',
'    l_description_2_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''Second Description column'',',
'                        p_column_alias      => c_description_2_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => false,',
'                        p_data_type         => apex_plugin_util.c_data_type_varchar2',
'                    );',
'',
'    l_description_3_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''Third Description column (allows HTML)'',',
'                        p_column_alias      => c_description_3_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => false,',
'                        p_data_type         => apex_plugin_util.c_data_type_varchar2',
'                    );',
'',
'    l_description_4_col_no := apex_plugin_util.get_column_no (',
'                        p_attribute_label   => ''Fourth Description column (allows HTML)'',',
'                        p_column_alias      => c_description_4_col,',
'                        p_column_value_list => l_column_value_list,',
'                        p_is_required       => false,',
'                        p_data_type         => apex_plugin_util.c_data_type_varchar2',
'                    );',
'',
'    -- Loop through the data',
'    if c_group_type = ''D'' then',
'        sys.htp.p(''<div class="t-StatusList t-StatusList--dates">'');',
'    else',
'        sys.htp.p(''<div class="t-StatusList t-StatusList--bullets">'');',
'    end if;',
'',
'    for l_row_num in 1..l_column_value_list(1).value_list.count loop',
'        wwv_flow_plugin_util.set_component_values (',
'            p_column_value_list => l_column_value_list,',
'            p_row_num           => l_row_num );',
'',
'        l_found := true;',
'',
'        if l_group_col_no is not null then',
'            if c_group_type = ''D'' then',
'                if l_column_value_list(l_group_col_no).value_list(l_row_num).date_value is not null then',
'                    l_date := l_column_value_list(l_group_col_no).value_list(l_row_num).date_value;',
'                elsif l_column_value_list(l_group_col_no).value_list(l_row_num).timestamp_value is not null then',
'                    l_date := l_column_value_list(l_group_col_no).value_list(l_row_num).timestamp_value;',
'                elsif l_column_value_list(l_group_col_no).value_list(l_row_num).timestamp_tz_value is not null then',
'                    l_date := l_column_value_list(l_group_col_no).value_list(l_row_num).timestamp_tz_value;',
'                elsif l_column_value_list(l_group_col_no).value_list(l_row_num).timestamp_ltz_value is not null then',
'                    l_date := l_column_value_list(l_group_col_no).value_list(l_row_num).timestamp_ltz_value;',
'                else',
'                    -- Couldn''t get a usable date value; ignore this row.',
'                    l_found := false;',
'                end if;',
'            else',
'                l_group := apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_group_col_no).data_type,',
'                                p_value     => l_column_value_list(l_group_col_no).value_list(l_row_num) ),',
'                            p_region.escape_output );',
'            end if;',
'        end if;',
'        if l_found = true and l_count < nvl(l_num_rows,l_count) then',
'            l_count := l_count + 1;',
'            if l_color_col_no is not null then',
'                l_color := apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_color_col_no).data_type,',
'                                p_value     => l_column_value_list(l_color_col_no).value_list(l_row_num) ),',
'                            p_region.escape_output );',
'            end if;',
'',
'            if l_color_label_col_no is not null then',
'                l_color_label := apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_color_label_col_no).data_type,',
'                                p_value     => l_column_value_list(l_color_label_col_no).value_list(l_row_num) ),',
'                            p_region.escape_output );',
'            end if;',
'',
'            if l_status_col_no is not null then',
'                l_status := apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_status_col_no).data_type,',
'                                p_value     => l_column_value_list(l_status_col_no).value_list(l_row_num) ),',
'                            p_region.escape_output );',
'            end if;',
'',
'            if l_title_col_no is not null then',
'                l_title := apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_title_col_no).data_type,',
'                                p_value     => l_column_value_list(l_title_col_no).value_list(l_row_num) ),',
'                            p_region.escape_output );',
'            end if;',
'',
'            if l_link_col_no is not null then',
'                l_link := apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_link_col_no).data_type,',
'                                p_value     => l_column_value_list(l_link_col_no).value_list(l_row_num) ),',
'                            p_region.escape_output );',
'            end if;',
'',
'            if l_row1_attr1_val_col_no is not null then',
'                l_row1_attr1_lbl := apex_plugin_util.escape(',
'                            p_region.region_columns( l_row1_attr1_val_col_no ).heading,',
'                            p_region.escape_output );',
'                l_row1_attr1_val := apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_row1_attr1_val_col_no).data_type,',
'                                p_value     => l_column_value_list(l_row1_attr1_val_col_no).value_list(l_row_num) ),',
'                            p_region.escape_output );',
'            end if;',
'',
'            if l_row1_attr2_val_col_no is not null then',
'                l_row1_attr2_lbl := apex_plugin_util.escape(',
'                            p_region.region_columns( l_row1_attr2_val_col_no ).heading,',
'                            p_region.escape_output );',
'                l_row1_attr2_val := apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_row1_attr2_val_col_no).data_type,',
'                                p_value     => l_column_value_list(l_row1_attr2_val_col_no).value_list(l_row_num) ),',
'                            p_region.escape_output );',
'            end if;',
'',
'            if l_row2_attr1_val_col_no is not null then',
'                l_row2_attr1_lbl := apex_plugin_util.escape(',
'                            p_region.region_columns( l_row2_attr1_val_col_no ).heading,',
'                            p_region.escape_output );',
'                l_row2_attr1_val := apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_row2_attr1_val_col_no).data_type,',
'                                p_value     => l_column_value_list(l_row2_attr1_val_col_no).value_list(l_row_num) ),',
'                            p_region.escape_output );',
'            end if;',
'',
'            if l_row2_attr2_val_col_no is not null then',
'                l_row2_attr2_lbl := apex_plugin_util.escape(',
'                            p_region.region_columns( l_row2_attr2_val_col_no ).heading,',
'                            p_region.escape_output );',
'                l_row2_attr2_val := apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_row2_attr2_val_col_no).data_type,',
'                                p_value     => l_column_value_list(l_row2_attr2_val_col_no).value_list(l_row_num) ),',
'                            p_region.escape_output );',
'            end if;',
'',
'            if l_description_1_col_no is not null then',
'                l_description_1 := substr(apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_description_1_col_no).data_type,',
'                                p_value     => l_column_value_list(l_description_1_col_no).value_list(l_row_num) ),',
'                            p_region.escape_output ),0,2000);',
'            end if;',
'',
'            if l_description_2_col_no is not null then',
'                l_description_2 := substr(apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_description_2_col_no).data_type,',
'                                p_value     => l_column_value_list(l_description_2_col_no).value_list(l_row_num) ),',
'                            p_region.escape_output ),0,2000);',
'            end if;',
'',
'            if l_description_3_col_no is not null then',
'                l_description_3 := substr(apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_description_3_col_no).data_type,',
'                                p_value     => l_column_value_list(l_description_3_col_no).value_list(l_row_num) ),',
'                            false ),0,2000);',
'            end if;',
'',
'            if l_description_4_col_no is not null then',
'                l_description_4 := substr(apex_plugin_util.escape(',
'                            apex_plugin_util.get_value_as_varchar2(',
'                                p_data_type => l_column_value_list(l_description_4_col_no).data_type,',
'                                p_value     => l_column_value_list(l_description_4_col_no).value_list(l_row_num) ),',
'                            false ),0,2000);',
'            end if;',
'',
'            -- Start of the actual rendering code.',
'            if c_group_type = ''D'' then',
'                if l_last_group != to_char(l_date,''YYYYMM'') then',
'                    l_last_group := to_char(l_date,''YYYYMM'');',
'',
'                    if l_count > 1 then',
'                        -- Not the first row; close the previous group.',
'                        sys.htp.p(''</ul></div>'');',
'                    end if;',
'',
'                    sys.htp.p(''<div class="t-StatusList-block">'');',
'                    sys.htp.p(''<div class="t-StatusList-blockHeader"><span class="t-StatusList-headerTextPrimary">''||trim(to_char(l_date,''Month''))||',
'                        ''</span><span class="t-StatusList-headerTextAlt">''||to_char(l_date,''YYYY'')||''</span></div>'');',
'                    sys.htp.p(''<ul class="t-StatusList-list">'');',
'                end if;',
'            else',
'                if l_last_group != l_group then',
'                    l_last_group := l_group;',
'                    if l_count > 1 then',
'                        -- Not the first row; close the previous group.',
'                        sys.htp.p(''</ul></div>'');',
'                    end if;',
'',
'                    sys.htp.p(''<div class="t-StatusList-block" aria-labelledby="tl_''||trim(l_group)||''">'');',
'                    sys.htp.p(''<div class="t-StatusList-blockHeader" id="tl_''||trim(l_group)||''">''',
'                        ||''<span class="t-StatusList-headerTextPrimary">''||trim(l_group)||''</span></div>'');',
'                    sys.htp.p(''<ul class="t-StatusList-list">'');',
'                end if;',
'            end if;',
'',
'            if l_color_col_no is not null then',
'                -- Limit it down to the colors we support.',
'                l_color := lower(l_color);',
'                if l_color = ''red'' then',
'                    l_color := ''is-danger'';',
'                elsif l_color = ''black'' then',
'                    l_color := ''is-complete'';',
'                elsif l_color = ''blue'' then',
'                    l_color := ''is-info'';',
'                elsif l_color = ''yellow'' then',
'                    l_color := ''is-warning'';',
'                elsif l_color = ''green'' then',
'                    l_color := ''is-success'';',
'                end if;',
'',
'                l_colors(l_color) := l_color_label;',
'            end if;',
'',
'            if c_group_type = ''D'' then',
'                sys.htp.p(''<li class="t-StatusList-item ''||l_color||''" aria-label="''',
'                    ||to_char(l_date,''Month fmDD, YYYY'')||''" aria-describedby="tl_''||to_char(l_date,''DD_MON_YYYY'')||''">''',
'                    ||''<div class="t-StatusList-itemMarker">'');',
'',
'                if l_last_day is null or to_char(l_date,''YYYYMMDD'') != l_last_day',
'                then',
'                    sys.htp.p(''<span class="t-StatusList-marker" role="presentation">''',
'                        ||to_char(l_date,''fmDD'')||''</span>'');',
'                end if;',
'',
'                sys.htp.p(''</div>'');',
'',
'                l_last_day := to_char(l_date, ''YYYYMMDD'');',
'',
'                sys.htp.p(''<div class="t-StatusList-itemBody" id="tl_''||to_char(l_date,''DD_MON_YYYY'')||''_''||l_count||''">'');',
'            else',
'                sys.htp.p(''<li class="t-StatusList-item ''||l_color||''" aria-label="''',
'                    ||trim(l_title)||''" aria-describedby="tl_''||trim(l_title)||''">''',
'                    ||''<div class="t-StatusList-itemMarker">''',
'                    ||''<span class="t-StatusList-marker" role="presentation">''',
'                    ||trim(l_title)||''</span></div>'');',
'',
'                sys.htp.p(''<div class="t-StatusList-itemBody" id="tl_''||trim(l_title)||''_''||l_count||''">'');',
'            end if;',
'',
'            sys.htp.p(''<h3 class="t-StatusList-itemTitle">''',
'                ||case when l_link is null then l_title',
'                    else ''<a href="''||apex_util.prepare_url(l_link)||''">''||l_title||''</a>''',
'                    end',
'                ||''</h3>'');',
'',
'            if l_row1_attr1_lbl is not null or l_row1_attr1_val is not null',
'                    or l_row1_attr2_lbl is not null or l_row1_attr2_val is not null then',
'                sys.htp.prn(''<div class="t-StatusList-itemAttrs">'');',
'',
'                if l_status is not null then',
'                    sys.htp.p(''<span class="t-Badge t-Badge--basic t-Badge--xsmall ''',
'                        ||l_color||''">''||l_status||''</span>'');',
'                end if;',
'',
'                if l_row1_attr1_lbl is not null and l_row1_attr1_val is not null then',
'                    sys.htp.prn(''<span class="t-StatusList-attr"><span class="t-StatusList-attrLabel">''||l_row1_attr1_lbl||''</span> ''',
'                        ||''<span class="t-StatusList-attrValue">''||l_row1_attr1_val||''</span></span>'');',
'                elsif l_row1_attr1_lbl is null and l_row1_attr1_val is not null then',
'                    sys.htp.prn(''<span class="t-StatusList-attrValue">''||l_row1_attr1_val||''</span></span>'');',
'                elsif l_row1_attr1_lbl is not null and l_row1_attr1_val is null then',
'                    sys.htp.prn(''<span><span class="t-StatusList-attrLabel"></span></span>'');',
'                else',
'                    -- No attr1.',
'                    null;',
'                end if;',
'',
'                if l_row1_attr2_lbl is not null and l_row1_attr2_val is not null then',
'                    sys.htp.prn(''<span class="t-StatusList-attr"><span class="t-StatusList-attrLabel">''||l_row1_attr2_lbl||''</span> ''',
'                        ||''<span class="t-StatusList-attrValue">''||l_row1_attr2_val||''</span></span>'');',
'                elsif l_row1_attr2_lbl is null and l_row1_attr2_val is not null then',
'                    sys.htp.prn(''<span class="t-StatusList-attrValue">''||l_row1_attr2_val||''</span></span>'');',
'                elsif l_row1_attr2_lbl is not null and l_row1_attr2_val is null then',
'                    sys.htp.prn(''<span class="t-StatusList-attr"><span class="t-StatusList-attrLabel"></span></span>'');',
'                else',
'                    -- No attr2.',
'                    null;',
'                end if;',
'                -- sys.htp.prn(''</div>'');',
'            end if;',
'',
'            if l_row2_attr1_lbl is not null or l_row2_attr1_val is not null',
'                    or l_row2_attr2_lbl is not null or l_row2_attr2_val is not null then',
'                -- sys.htp.prn(''<p>'');',
'                if l_row2_attr1_lbl is not null and l_row2_attr1_val is not null then',
'                    sys.htp.prn(''<span class="t-StatusList-attr"><span class="t-StatusList-attrLabel">''||l_row2_attr1_lbl||''</span> ''',
'                        ||''<span class="t-StatusList-attrValue">''||l_row2_attr1_val||''</span></span>'');',
'                elsif l_row2_attr1_lbl is null and l_row2_attr1_val is not null then',
'                    sys.htp.prn(''<span class="t-StatusList-attrValue">''||l_row2_attr1_val||''</span></span>'');',
'                elsif l_row2_attr1_lbl is not null and l_row2_attr1_val is null then',
'                    sys.htp.prn(''<span class="t-StatusList-attr"><span class="t-StatusList-attrLabel"></span></span>'');',
'                else',
'                    -- No attr3.',
'                    null;',
'                end if;',
'',
'                if l_row2_attr2_lbl is not null and l_row2_attr2_val is not null then',
'                    sys.htp.prn(''<span class="t-StatusList-attr"><span class="t-StatusList-attrLabel">''||l_row2_attr2_lbl||''</span> ''',
'                        ||''<span class="t-StatusList-attrValue">''||l_row2_attr2_val||''</span></span>'');',
'                elsif l_row2_attr2_lbl is null and l_row2_attr2_val is not null then',
'                    sys.htp.prn(''<span class="t-StatusList-attrValue">''||l_row2_attr2_val||''</span></span>'');',
'                elsif l_row2_attr2_lbl is not null and l_row2_attr2_val is null then',
'                    sys.htp.prn(''<span class="t-StatusList-attr"><span class="t-StatusList-attrLabel"></span></span>'');',
'                else',
'                    -- No attr4.',
'                    null;',
'                end if;',
'                sys.htp.prn(''</div>'');',
'            end if;',
'',
'            if l_description_1 is not null then',
'                sys.htp.prn(''<p class="t-StatusList-textDesc">''||l_description_1||''</p>'');',
'            end if;',
'',
'            if l_description_2 is not null then',
'                sys.htp.prn(''<p class="t-StatusList-textDesc">''||l_description_2||''</p>'');',
'            end if;',
'',
'            if l_description_3 is not null then',
'                sys.htp.prn(''<p class="t-StatusList-textDesc">''||l_description_3||''</p>'');',
'            end if;',
'',
'            if l_description_4 is not null then',
'                sys.htp.prn(''<p class="t-StatusList-textDesc">''||l_description_4||''</p>'');',
'            end if;',
'',
'            sys.htp.prn(''</div></li>'');',
'        end if;',
'    end loop;',
'    if l_count > 0 then',
'        -- Close the HTML.',
'        sys.htp.p(''</ul></div>'');',
'',
'        -- Print Legend',
'        if l_color_label_col_no is not null then',
'            sys.htp.p(''<div class="t-StatusList-legend" style="padding: 8px; border-top: 1px solid rgba(0,0,0,.05); font-size: 11px;">'');',
'            sys.htp.p(''  <strong>Status Color Coding:</strong>'');',
'            l_color_idx := l_colors.first;',
'            while l_color_idx is not null loop',
'                if l_colors(l_color_idx) is not null then',
'                    sys.htp.p(''  <span class="t-Badge t-Badge--basic t-Badge--small ''||l_color_idx||''">''||l_colors(l_color_idx)||''</span>'');',
'                end if;',
'                l_color_idx := l_colors.next( l_color_idx );',
'            end loop;',
'            sys.htp.p(''</div>'');',
'        end if;',
'    else',
'        sys.htp.p(''<span class="nodatafound">''||l_no_data_found||''</span>'');',
'    end if;',
'    sys.htp.p(''</div>'');',
'end render_list_calendar;',
'',
'function render ( p_region in apex_plugin.t_region,',
'    p_plugin in apex_plugin.t_plugin, p_is_printer_friendly in boolean )',
'    return apex_plugin.t_region_render_result is',
'begin',
'    sys.htp.p(''<div id="'' || p_region.static_id || ''_inner">'');',
'    render_list_calendar( p_region );',
'    sys.htp.p(''</div>'');',
'    ',
'    /* ',
'    apex_javascript.add_onload_code (',
'        p_code => ''(function( apex, util, server, $ ){',
'  window.com_oracle_apex_timeline_status_list = function( regionId, details ) {',
'    function _clear() {',
'      _inner$.empty();',
'    }',
'    function _render( markup ) {',
'      _inner$.html( markup );',
'    }',
'    function _debug( error ) {',
'            if ( error.status >= 200 && error.status < 300 ) {',
'                _render( error.responseText );',
'            } else {',
'                debugger;',
'            }',
'    }',
'    function _refresh() {',
'      server.plugin( details.ajaxIdentifier, { pageItems : details.pageItems }, {',
'        refreshObject : _region$,',
'        clear : _clear,',
'        success : _render,',
'        error : _debug,',
'        loadingIndicator : _inner$,',
'        loadingIndicatorPosition : "append"',
'      });',
'    }',
'',
'    var _region$ = $( "#" + regionId );',
'        var _inner$ = $( "#" + details.innerRegionId );',
'    _region$.on( "apexrefresh", _refresh );',
'  }',
'})( apex, apex.util, apex.server, apex.jQuery );''',
'    );',
'    */',
'    ',
'    apex_javascript.add_onload_code (',
'        p_code => ''(function(){ var a = com_oracle_apex_timeline_status_list('' ||',
'            apex_javascript.add_value(p_region.static_id) ||',
'            ''{'' ||',
'                apex_javascript.add_attribute(''innerRegionId'',  p_region.static_id || ''_inner'' ) ||',
'                apex_javascript.add_attribute(''pageItems'',      apex_plugin_util.page_item_names_to_jquery(p_region.ajax_items_to_submit)) ||',
'                apex_javascript.add_attribute(''ajaxIdentifier'', apex_plugin.get_ajax_identifier, false, false) ||',
'            ''});})()'' );',
'    return null;',
'end render;',
'',
'function ajax (',
'    p_region in apex_plugin.t_region,',
'    p_plugin in apex_plugin.t_plugin )',
'    return apex_plugin.t_region_ajax_result is',
'begin',
'    render_list_calendar( p_region );',
'    return null;',
'end ajax;'))
,p_api_version=>1
,p_render_function=>'render'
,p_ajax_function=>'ajax'
,p_standard_attributes=>'SOURCE_SQL:AJAX_ITEMS_TO_SUBMIT:FETCHED_ROWS:NO_DATA_FOUND_MESSAGE:ESCAPE_OUTPUT:COLUMNS:COLUMN_HEADING'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Timeline and Status lists are useful for displaying a region with calendar dates and summary information. </p>',
'<p>This plug-in is suitable for adding to Master / Detail pages to show important summary information with dates.</p>'))
,p_version_identifier=>'5.1'
);
end;
/
begin
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619040804173592536)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Group By Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2:NUMBER:DATE:TIMESTAMP:TIMESTAMP_TZ:TIMESTAMP_LTZ'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the column the report will be grouped by.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619041205790592538)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>120
,p_prompt=>'Color Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the color for the list.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619041536611592538)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Title Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the title for each grouping.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619041931714592539)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Link Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the link for each record.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619042331577592539)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'First Value'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the first value to be displayed in the report.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619042785778592539)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Second Value'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the second value to be displayed in the report.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619043222319592540)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Third Value'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_is_common=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the third value to be displayed in the report.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619043608701592540)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Fourth Value'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_is_common=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the fourth value to be displayed in the report.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619043983253592540)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Primary Description'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the primary description to be displayed in the report.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619044337124592540)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Secondary Description'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_is_common=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the secondary description to be displayed in the report.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619044782781592541)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Additional Description (with HTML)'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_is_common=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds an additional description to be displayed in the report, which allows HTML content.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619045143114592541)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>5
,p_prompt=>'Display As'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'D'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select whether the region should be displayed as a timeline, based on a given date, or a list.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1619045602587592542)
,p_plugin_attribute_id=>wwv_flow_api.id(1619045143114592541)
,p_display_sequence=>10
,p_display_value=>'Timeline'
,p_return_value=>'D'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1619046077541592543)
,p_plugin_attribute_id=>wwv_flow_api.id(1619045143114592541)
,p_display_sequence=>20
,p_display_value=>'Status List'
,p_return_value=>'L'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619046590198592543)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>20
,p_prompt=>'Status Column'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds the status to be displayed in the report.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619046996444592543)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Color Label'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_show_in_wizard=>false
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1619041205790592538)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1619047415529592544)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>115
,p_prompt=>'Second Additional Description (with HTML)'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>false
,p_is_common=>false
,p_column_data_types=>'VARCHAR2'
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
,p_help_text=>'Select the column from the region SQL Query that holds an additional description to be displayed in the report, which allows HTML content.'
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(1619049014414592555)
,p_plugin_id=>wwv_flow_api.id(1589222718426433455)
,p_name=>'SOURCE_SQL'
,p_sql_min_column_count=>3
);
end;
/
