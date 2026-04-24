Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FA4FED3CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 14:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6hD4wtW+751Ni0lApxyePPsPfRZU5U4e0NgGymmjl4=; b=p71W8OYrafjJ6m8M0/8zTic6QZ
	qPF7yBLtxfufjUygUY77y01mMExrgfqGpxQRvdP5Rpt6Ck9rS9a5KQh9TCPHH0i4xePbTJrmS7m2Q
	E/H4u4o85z3oVyrTmPloMjSLEIzW3hJU/1HSBDEmcv5SkMB2L39Pcz30SdUFEGgeJ86+pE2jNPOqq
	FZEWyVKZCn3KfqMyomMaOXCYQ2R2BXSKsfySuUlfxZ57MkPsAmaiY8iyLv/kNWYB4QF/LsUCUvSir
	ec2FBP+vRYmWPl5S8gXzOJEUdJgLs6hfeXGi4DmVhKMLdsxkB6UXdoSWfDXelPpC9Hwsd0ndVI8AX
	lY8XXTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGH5d-0000000DHm9-49GR;
	Fri, 24 Apr 2026 14:01:06 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGH5Z-0000000DHlK-2dio;
	Fri, 24 Apr 2026 14:01:05 +0000
Message-ID: <d81b706e-e703-46fd-b560-08b04fa49f98@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1777039255;
	bh=9pUhrKJcwFra8E+jfRhvbHF2LOR340gxwUJUdLIfuIs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=ZpHkUmLdcMXDWY338GnmSfmcP+yIFuCYhyVpFLFW0EVRCADz2r2F6I3gxWK7n2F94
	 zf3VQC/HKYFmdwULy3kXCe27kGQu19amfQL+y/nOJa3hT+jY1wC9lykgSdv1C/vd8T
	 VEGWxpuHPTqTqnnZjx0vylRhNyF1VyoaWN4KRrB8=
Date: Fri, 24 Apr 2026 16:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v4 5/8] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
 <20260421-add-mcu-fan-khadas-vim4-v4-5-447114a28f2d@aliel.fr>
 <f057dbd9-5fa7-414f-98f4-1bbb691e2fc7@linaro.org>
Content-Language: en-US
In-Reply-To: <f057dbd9-5fa7-414f-98f4-1bbb691e2fc7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_070102_281566_6DB95BB8 
X-CRM114-Status: GOOD (  20.06  )
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

Thanks for your review.

On 4/24/26 12:00 PM, Neil Armstrong wrote:
> On 4/21/26 13:49, Ronald Claveau via B4 Relay wrote:
>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> Replace the hardcoded MAX_LEVEL constant and fan register
>> with values read from platform_data (fan_reg, max_level),
>> as new MCUs need different values.
>>
>> Optionally acquire and enable a "fan" regulator supply
>> at probe time and on resume,
>> so boards that gate fan power through a regulator are handled.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>   drivers/thermal/khadas_mcu_fan.c | 49 ++++++++++++++++++++++++++++++
>> +++++-----
>>   1 file changed, 43 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/
>> khadas_mcu_fan.c
>> index d35e5313bea41..24559bf65de46 100644
>> --- a/drivers/thermal/khadas_mcu_fan.c
>> +++ b/drivers/thermal/khadas_mcu_fan.c
>> @@ -13,13 +13,15 @@
>>   #include <linux/regmap.h>
>>   #include <linux/sysfs.h>
>>   #include <linux/thermal.h>
>> -
>> -#define MAX_LEVEL 3
>> +#include <linux/regulator/consumer.h>
>>     struct khadas_mcu_fan_ctx {
>>       struct khadas_mcu *mcu;
>> +    unsigned int fan_reg;
>>       unsigned int level;
>> +    unsigned int max_level;
>>       struct thermal_cooling_device *cdev;
>> +    struct regulator *power;
>>   };
>>     static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>> @@ -27,8 +29,7 @@ static int khadas_mcu_fan_set_level(struct
>> khadas_mcu_fan_ctx *ctx,
>>   {
>>       int ret;
>>   -    ret = regmap_write(ctx->mcu->regmap,
>> KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
>> -               level);
>> +    ret = regmap_write(ctx->mcu->regmap, ctx->fan_reg, level);
>>       if (ret)
>>           return ret;
>>   @@ -40,7 +41,9 @@ static int khadas_mcu_fan_set_level(struct
>> khadas_mcu_fan_ctx *ctx,
>>   static int khadas_mcu_fan_get_max_state(struct
>> thermal_cooling_device *cdev,
>>                       unsigned long *state)
>>   {
>> -    *state = MAX_LEVEL;
>> +    struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>> +
>> +    *state = ctx->max_level;
>>         return 0;
>>   }
>> @@ -61,7 +64,7 @@ khadas_mcu_fan_set_cur_state(struct
>> thermal_cooling_device *cdev,
>>   {
>>       struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>>   -    if (state > MAX_LEVEL)
>> +    if (state > ctx->max_level)
>>           return -EINVAL;
>>         if (state == ctx->level)
>> @@ -83,11 +86,32 @@ static int khadas_mcu_fan_probe(struct
>> platform_device *pdev)
>>       struct device *dev = &pdev->dev;
>>       struct khadas_mcu_fan_ctx *ctx;
>>       int ret;
>> +    const struct khadas_mcu_fan_pdata *pdata =
>> dev_get_platdata(&pdev->dev);
> 
> Move this on top to respect reverse christmas ordering.
> 

Ok I will do that.

>>         ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>       if (!ctx)
>>           return -ENOMEM;
>> +
>>       ctx->mcu = mcu;
>> +    ctx->fan_reg   = pdata->fan_reg;
>> +    ctx->max_level = pdata->max_level;
>> +
>> +    ctx->power = devm_regulator_get_optional(dev->parent, "fan");
>> +    if (IS_ERR(ctx->power)) {
>> +        if (PTR_ERR(ctx->power) == -ENODEV)
>> +            ctx->power = NULL;
>> +        else
>> +            return PTR_ERR(ctx->power);
>> +    }
>> +
>> +    if (ctx->power) {
>> +        ret = regulator_enable(ctx->power);
>> +        if (ret) {
>> +            dev_err(dev, "Failed to enable fan power supply: %d\n",
>> ret);
>> +            return ret; +        }
>> +    }
> 
> Or you can request with devm_regulator_get(dev->parent, "fan"); which will
> return a dummy regulator, and then you can just call regulator_enable &
> disable
> and remove all those checks.
> 

Make sense, I'm on it.

>> +
>>       platform_set_drvdata(pdev, ctx);
>>         cdev = devm_thermal_of_cooling_device_register(dev->parent,
>> @@ -124,12 +148,25 @@ static int khadas_mcu_fan_suspend(struct device
>> *dev)
>>         ctx->level = level_save;
>>   +    if (ctx->power) {
>> +        ret = regulator_disable(ctx->power);
>> +        if (ret)
>> +            return ret;
>> +    }
> 
> if (ctx->power)
>     return regulator_disable(ctx->power);
> 
>> +
>>       return 0;
>>   }
>>     static int khadas_mcu_fan_resume(struct device *dev)
>>   {
>>       struct khadas_mcu_fan_ctx *ctx = dev_get_drvdata(dev);
>> +    int ret;
>> +
>> +    if (ctx->power) {
>> +        ret = regulator_enable(ctx->power);
>> +        if (ret)
>> +            return ret;
>> +    }
>>         return khadas_mcu_fan_set_level(ctx, ctx->level);
>>   }
>>
> 
> Thanks,
> Neil


-- 
Best regards,
Ronald

