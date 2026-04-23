Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0CEFC0340
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 15:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=De8SGTzM/STU2PIqIjMSOyM2w12A70icmYWG5ZPyASE=; b=IMmkyaNTAJ4lXaxqiForTPXYso
	t5BkUhjSoThjXai39ML6y2lTcCcgzKGRPBef1KFyplbqjB2b0Kls5wMH7zu6OJjXYYx0sJel7IhpF
	wL6pZBYKpOyBd5+PCnFVuHXy0x6kR23PiaKK93t3eU6fOhGrRSCJHQHyy0rhL7HwCOODPU87ivRQq
	X10GGUWNY/bGU85DdgjdMIdpTNQ7Skdm90GcR4YcIPuKYCSQo9zxrNcD2eq1p06RI2kcZ6CqGs84Y
	TIgfz33YjKCyRwMIC226dYAg5f6pKzueSGz76tkKLyLXIdscqFSMX5N38teoCFvhk+Z5dBfrZzuKF
	pskBh2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFw01-0000000Btqz-2h7R;
	Thu, 23 Apr 2026 15:29:54 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvzz-0000000Btq8-04Sm;
	Thu, 23 Apr 2026 15:29:52 +0000
Message-ID: <9ac4db6a-b668-4e56-b940-dfb542086b39@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776958185;
	bh=BuFMoJ0ysYsrcKqnLlo60KQAjjDHrnpC5kQCUcwHtB0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=nDVJQ1AjCE5OlTV9ohw+s+40v3OWIxomoHihxxmKa33UWuI4CKmMPxIRrcc+qoTtr
	 MRafIrq7kiIn0mv+CjEkY4sx+kF/ymbOedcAFtood2+89njXRcH4XIqMUVbaWPC5PJ
	 +TqSnU2f6xdrIxnp2Ut4ZRt7cw3p8hKAmrHyW1y8=
Date: Thu, 23 Apr 2026 17:29:43 +0200
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
 <19d70883-21db-4963-841d-7c00505e0d9e@aliel.fr>
 <8a4dcb94-ab88-4559-9027-49308ad02b73@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8a4dcb94-ab88-4559-9027-49308ad02b73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_082951_513446_BF904528 
X-CRM114-Status: GOOD (  17.05  )
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

On 4/23/26 5:17 PM, Daniel Lezcano wrote:
> On 4/23/26 17:09, Ronald Claveau wrote:
>> Hi Daniel,
>>
>> Thanks for your feedback.
>>
>> On 4/23/26 12:25 PM, Daniel Lezcano wrote:
>>>
>>> Hi Ronald,
>>>
> 
> function1() {
> 
> 
>>>> +    if (pdata->data->use_sm) {
>>>> +        struct device_node *sm_np;
>>>> +        struct of_phandle_args ph_args;
>>>> +
>>>> +        ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
>>>> +                               "amlogic,secure-monitor",
>>>> +                               1, 0, &ph_args);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +
>>>> +        sm_np = ph_args.np;
>>>> +        if (!sm_np) {
>>>> +            dev_err(dev,
>>>> +                "Failed to parse secure monitor phandle\n");
>>>> +            return -ENODEV;
>>>> +        }
>>>> +
>>>> +        pdata->sm_fw = meson_sm_get(sm_np);
>>>> +        of_node_put(sm_np);
>>>> +        if (!pdata->sm_fw) {
>>>> +            dev_err(dev, "Failed to get secure monitor firmware\n");
>>>> +            return -EPROBE_DEFER;
>>>> +        }
>>>> +
>>>> +        pdata->tsensor_id = ph_args.args[0];
>>>> +    } 
> 
> }
> 
> function2() {
> 
> else {
>>>> +        pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
>>>> +            (pdev->dev.of_node, "amlogic,ao-secure");
>>>> +        if (IS_ERR(pdata->sec_ao_map)) {
>>>> +            dev_err(dev, "syscon regmap lookup failed.\n");
>>>> +            return PTR_ERR(pdata->sec_ao_map);
>>>> +        }
>>>>        }
> 
> }
> 
>> Sure, I will do that.
>>
>>>>        pdata->tzd = devm_thermal_of_zone_register(&pdev->dev
>>>
>>> The thermal zone is registered before calling
>>> amlogic_thermal_initialize(), thus pdata->trim_info is not initialized.
>>> When a thermal zone is registered the thermal framework reads the
>>> temperature, so it reads an invalid value because:
>>>
>>> devm_thermal_of_zone_register()
>>>   -> thermal_of_zone_register()
>>>     -> thermal_zone_device_register_with_trips()
>>>     -> thermal_zone_device_enable()
>>>        -> __thermal_zone_device_update()
>>>          -> __thermal_zone_get_temp()
>>>            -> amlogic_thermal_get_temp()
>>>               -> amlogic_thermal_code_to_millicelsius()
>>>                   [ Use of uninitialized pdata->trim_info ]
>>>
>>> Right ?
>>>
>>
>> Yes, I will move the initialize before the register.
>>
>>> IIUC, amlogic_thermal_initialize() can be also split and moved the
>>> corresponding blocks to the functions to be created in the comment
>>> above.
>>>
>>
>> The SM and syscon setup will be extracted into two functions.
>> amlogic_thermal_initialize() itself is kept as-is but moved before
>> devm_thermal_of_zone_register().
>> Let me know if you'd prefer a different approach.
> 
> In the initialize function the following chunk is added:
> 
> +    if (pdata->data->use_sm) {
> +        return meson_sm_get_thermal_calib(pdata->sm_fw,
> +                          &pdata->trim_info,
> +                          pdata->tsensor_id);
> +    }
> 
> I was suggesting to move it to function1() and the rest of code from
> initialize in function2()
> 
> That results in amlogic_thermal_initialize() to be dissolved in
> function1() and function2()
> 

Thanks for your answer, that was my second option, I will do that.

-- 
Best regards,
Ronald

