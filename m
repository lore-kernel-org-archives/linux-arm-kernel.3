Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDE0FC0342
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2Rw8WELINupack8eDMNUwAOaIJmY3KmbG0Aab+FSQU=; b=vuADyqboWbxoaLA6Wba/Ys6oIi
	KKRSZ6orgPi2lRc9lv/ybgGVOSIYVqrECamq4EOvB7b61ETRNd8IfrnrFB6NQeQu5bq4liKKfu4JL
	ZBx9yi8z/hmUcQgfeR3lKEYoQaWr67LF9gfx3y/sT+pIUuryfeCmuWMXeSb3HOzRZi9qxTLLRFJjU
	E0tqX464ougrYsjOFsC3QLQ5njqrL+fgcpKdtMdNZybOexv39O34buuuuhZvARhSuEnme9P7EAOiE
	8l/JiFHZgYcU9tKU/ac9ehTJHuR+K4grNKEbCgXTQ3rTG2AGRfMaQu9nXq5ZgtlXJBatzBPIsxodE
	YPZNm/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvgk-0000000BrHD-46Ee;
	Thu, 23 Apr 2026 15:09:58 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvgd-0000000BrFz-1e25;
	Thu, 23 Apr 2026 15:09:57 +0000
Message-ID: <19d70883-21db-4963-841d-7c00505e0d9e@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776956983;
	bh=piKDcOgjcm+FqKMFf8GBg3CE1PJohOeelaXmkED6UDY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=L8gvUVSOu4mCjW2Z+XaVEo7qANhshywZdZSvqUUiHdnmrsSpdRvMKPifgNJvjoBDD
	 nae1D0LMx8ahyMvlnDEzZAqJ13YZWcr+0HlKIt+hkF0bXwa6cxf9+fpPYsvNAew3zG
	 aWSqvQk3Ufo4S+Cntm3dcU8+FYHoJ+Ruxs/anKkM=
Date: Thu, 23 Apr 2026 17:09:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v3 4/8] thermal: amlogic: Add support for secure monitor
 calibration readout
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260421-add-thermal-t7-vim4-v3-0-a2e7215ed003@aliel.fr>
 <20260421-add-thermal-t7-vim4-v3-4-a2e7215ed003@aliel.fr>
 <7aaa7873-9274-48d8-a6fe-cff4239b03b4@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7aaa7873-9274-48d8-a6fe-cff4239b03b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_080952_046000_BEC4E41C 
X-CRM114-Status: GOOD (  27.02  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Daniel,

Thanks for your feedback.

On 4/23/26 12:25 PM, Daniel Lezcano wrote:
> 
> Hi Ronald,
> 
> On 4/21/26 09:19, Ronald Claveau wrote:
>> Some SoCs (e.g. T7) expose thermal calibration data through the secure
>> monitor rather than a directly accessible eFuse register. Add a use_sm
>> flag to amlogic_thermal_data to select this path, and retrieve the
>> firmware handle and tsensor_id from the "amlogic,secure-monitor" DT
>> phandle with one fixed argument.
>>
>> Also introduce the amlogic,t7-thermal compatible using this new path.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>   drivers/thermal/amlogic_thermal.c | 58 +++++++++++++++++++++++++++++
>> ++++++----
>>   1 file changed, 53 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/
>> amlogic_thermal.c
>> index 5448d772db12a..11e3948cc0669 100644
>> --- a/drivers/thermal/amlogic_thermal.c
>> +++ b/drivers/thermal/amlogic_thermal.c
>> @@ -25,6 +25,7 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/regmap.h>
>>   #include <linux/thermal.h>
>> +#include <linux/firmware/meson/meson_sm.h>
>>     #include "thermal_hwmon.h"
>>   @@ -84,12 +85,14 @@ struct amlogic_thermal_soc_calib_data {
>>    * @u_efuse_off: register offset to read fused calibration value
>>    * @calibration_parameters: calibration parameters structure pointer
>>    * @regmap_config: regmap config for the device
>> + * @use_sm: read data from secure monitor instead of efuse
>>    * This structure is required for configuration of amlogic thermal
>> driver.
>>    */
>>   struct amlogic_thermal_data {
>>       int u_efuse_off;
>>       const struct amlogic_thermal_soc_calib_data
>> *calibration_parameters;
>>       const struct regmap_config *regmap_config;
>> +    bool use_sm;
>>   };
>>     struct amlogic_thermal {
>> @@ -100,6 +103,8 @@ struct amlogic_thermal {
>>       struct clk *clk;
>>       struct thermal_zone_device *tzd;
>>       u32 trim_info;
>> +    struct meson_sm_firmware *sm_fw;
>> +    u32 tsensor_id;
>>   };
>>     /*
>> @@ -138,6 +143,12 @@ static int amlogic_thermal_initialize(struct
>> amlogic_thermal *pdata)
>>       int ret = 0;
>>       int ver;
>>   +    if (pdata->data->use_sm) {
>> +        return meson_sm_get_thermal_calib(pdata->sm_fw,
>> +                          &pdata->trim_info,
>> +                          pdata->tsensor_id);
>> +    }
>> +
>>       regmap_read(pdata->sec_ao_map, pdata->data->u_efuse_off,
>>               &pdata->trim_info);
>>   @@ -226,6 +237,12 @@ static const struct amlogic_thermal_data
>> amlogic_thermal_a1_cpu_param = {
>>       .regmap_config = &amlogic_thermal_regmap_config_g12a,
>>   };
>>   +static const struct amlogic_thermal_data amlogic_thermal_t7_param = {
>> +    .use_sm            = true,
>> +    .calibration_parameters    = &amlogic_thermal_g12a,
>> +    .regmap_config        = &amlogic_thermal_regmap_config_g12a,
>> +};
>> +
>>   static const struct of_device_id of_amlogic_thermal_match[] = {
>>       {
>>           .compatible = "amlogic,g12a-ddr-thermal",
>> @@ -239,6 +256,10 @@ static const struct of_device_id
>> of_amlogic_thermal_match[] = {
>>           .compatible = "amlogic,a1-cpu-thermal",
>>           .data = &amlogic_thermal_a1_cpu_param,
>>       },
>> +    {
>> +        .compatible = "amlogic,t7-thermal",
>> +        .data = &amlogic_thermal_t7_param,
>> +    },
>>       { /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, of_amlogic_thermal_match);
>> @@ -271,11 +292,38 @@ static int amlogic_thermal_probe(struct
>> platform_device *pdev)
>>       if (IS_ERR(pdata->clk))
>>           return dev_err_probe(dev, PTR_ERR(pdata->clk), "failed to
>> get clock\n");
>>   -    pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
>> -        (pdev->dev.of_node, "amlogic,ao-secure");
>> -    if (IS_ERR(pdata->sec_ao_map)) {
>> -        dev_err(dev, "syscon regmap lookup failed.\n");
>> -        return PTR_ERR(pdata->sec_ao_map);
>> +    if (pdata->data->use_sm) {
>> +        struct device_node *sm_np;
>> +        struct of_phandle_args ph_args;
>> +
>> +        ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
>> +                               "amlogic,secure-monitor",
>> +                               1, 0, &ph_args);
>> +        if (ret)
>> +            return ret;
>> +
>> +        sm_np = ph_args.np;
>> +        if (!sm_np) {
>> +            dev_err(dev,
>> +                "Failed to parse secure monitor phandle\n");
>> +            return -ENODEV;
>> +        }
>> +
>> +        pdata->sm_fw = meson_sm_get(sm_np);
>> +        of_node_put(sm_np);
>> +        if (!pdata->sm_fw) {
>> +            dev_err(dev, "Failed to get secure monitor firmware\n");
>> +            return -EPROBE_DEFER;
>> +        }
>> +
>> +        pdata->tsensor_id = ph_args.args[0];
>> +    } else {
>> +        pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
>> +            (pdev->dev.of_node, "amlogic,ao-secure");
>> +        if (IS_ERR(pdata->sec_ao_map)) {
>> +            dev_err(dev, "syscon regmap lookup failed.\n");
>> +            return PTR_ERR(pdata->sec_ao_map);
>> +        }
>>       }
> 
> I suggest to separate these two routines into functions. That will help
> the readability.
> 

Sure, I will do that.

>>       pdata->tzd = devm_thermal_of_zone_register(&pdev->dev
> 
> The thermal zone is registered before calling
> amlogic_thermal_initialize(), thus pdata->trim_info is not initialized.
> When a thermal zone is registered the thermal framework reads the
> temperature, so it reads an invalid value because:
> 
> devm_thermal_of_zone_register()
>  -> thermal_of_zone_register()
>    -> thermal_zone_device_register_with_trips()
>    -> thermal_zone_device_enable()
>       -> __thermal_zone_device_update()
>         -> __thermal_zone_get_temp()
>           -> amlogic_thermal_get_temp()
>              -> amlogic_thermal_code_to_millicelsius()
>                  [ Use of uninitialized pdata->trim_info ]
> 
> Right ?
> 

Yes, I will move the initialize before the register.

> IIUC, amlogic_thermal_initialize() can be also split and moved the
> corresponding blocks to the functions to be created in the comment above.
> 

The SM and syscon setup will be extracted into two functions.
amlogic_thermal_initialize() itself is kept as-is but moved before
devm_thermal_of_zone_register().
Let me know if you'd prefer a different approach.

> 
>>
> 


-- 
Best regards,
Ronald

