$(function () {

    var colors = Highcharts.getOptions().colors,
            categories = ['MSIE', 'Firefox', 'Chrome', 'Safari', 'Opera'],
            data = [{
                y: gon.browser_msie,
                color: colors[0],
                drilldown: {
                    name: 'MSIE versions',
                    categories: gon.browser_msie_categories,
                    data: gon.browser_msie_versions,
                    color: colors[0]
                }
            }, {
                y: gon.browser_firefox,
                color: colors[1],
                drilldown: {
                    name: 'Firefox versions',
                    categories: gon.browser_firefox_categories,
                    data: gon.browser_firefox_versions,
                    color: colors[1]
                }
            }, {
                y: gon.browser_chrome,
                color: colors[2],
                drilldown: {
                    name: 'Chrome versions',
                    categories: gon.browser_chrome_categories,
                    data: gon.browser_chrome_versions,
                    color: colors[2]
                }
            }, {
                y: gon.browser_safari,
                color: colors[3],
                drilldown: {
                    name: 'Safari versions',
                    categories: gon.browser_safari_categories,
                    data: gon.browser_safari_versions,
                    color: colors[3]
                }
            }, {
                y: gon.browser_opera,
                color: colors[4],
                drilldown: {
                    name: 'Opera versions',
                    categories: gon.browser_opera_categories,
                    data: gon.browser_opera_versions,
                    color: colors[4]
                }
            }],
            browserData = [],
            versionsData = [],
            i,
            j,
            dataLen = data.length,
            drillDataLen,
            brightness;


    // Build the data arrays
    for (i = 0; i < dataLen; i += 1) {

        // add browser data
        browserData.push({
            name: categories[i],
            y: data[i].y,
            color: data[i].color
        });

        // add version data
        drillDataLen = data[i].drilldown.data.length;
        for (j = 0; j < drillDataLen; j += 1) {
            brightness = 0.2 - (j / drillDataLen) / 5;
            versionsData.push({
                name: data[i].drilldown.categories[j],
                y: data[i].drilldown.data[j],
                color: Highcharts.Color(data[i].color).brighten(brightness).get()
            });
        }
    }

    // Create the chart
    $('#container').highcharts({
        chart: {
            type: 'pie'
        },
        title: {
            text: 'Browser market share'
        },
        yAxis: {
            title: {
                text: 'Total percent market share'
            }
        },
        plotOptions: {
            pie: {
                shadow: false,
                center: ['50%', '50%']
            }
        },
        tooltip: {
            valueSuffix: ''
        },
        series: [{
            name: 'Browsers',
            data: browserData,
            size: '60%',
            dataLabels: {
                formatter: function () {
                    return this.y > 5 ? this.point.name : null;
                },
                color: 'white',
                distance: -30
            }
        }, {
            name: 'Versions',
            data: versionsData,
            size: '80%',
            innerSize: '60%',
            dataLabels: {
                formatter: function () {
                    // display only if larger than 1
                    return this.y > 1 ? '<b>' + this.point.name + ':</b> ' + this.y   : null;
                }
            }
        }]
    });
});