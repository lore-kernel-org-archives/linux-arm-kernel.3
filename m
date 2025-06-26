Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD04C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zeiWsIBvFrWgna5yEgaH/IXXNiu0EY7mLCIeHhCpakg=; b=g+hhOcntARdIOVdUkK2Zn3o2MJ
	CQuiBTvByVmZxDip49J0j6GSqv97FzyMMXDymfzyhPwYLTx7UpmKNOU0dxNgkvdMhaxMOyIha4Y9M
	mn+SxBvh7Li1zXM07TfJX5ApOd1RtJRDknlNVznv9zkLnJSY6TvAdEb3m2hZwk5NPoZeebVrL21U0
	6uvn4C4NdETskDySG4MOYuAwTIHQ91IPfsRCtEYXxlIniIcd4pDSsWATtZbc/AYWTFbnmJqqGM6ma
	hWonyNzT+pqW+mUU96B0h2jQLOh39hK5fEfLW3ml9tWJHh2IJdTFXswaZ2WwhgBVioSRS6aafTduI
	T+XeCpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUovH-0000000CC0k-0tCg;
	Thu, 26 Jun 2025 15:53:59 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUniG-0000000Bwxv-1LlD;
	Thu, 26 Jun 2025 14:36:30 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-60c60f7eeaaso1787495a12.0;
        Thu, 26 Jun 2025 07:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750948587; x=1751553387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeiWsIBvFrWgna5yEgaH/IXXNiu0EY7mLCIeHhCpakg=;
        b=lHhpT3HAX4+FIjDmDtZTcYGJpVKNma+5LJrhA1YSczJRTn6gopvbqebFAbxkd9javp
         cTWnexiQf+pQy5tiq3YtSd3mN/qKK3aP9/M3wdfc5qprWXZf7+pZHMeq5vSJu8nvcPIX
         +43haYuyTB3NVmXODMIqIajKM854tz6782gmtyWczKp9pDLZ9EDHDS05mMFsAZaul7MM
         ByVxEmp5U/SsE5WDD/li5LjSZusDtTB5mTfog66zn95yTwBZZwIFO676feIN1EGSNuWc
         c4IVd86W+WovDfG4309UAXwJfKyOfeXHzi4N7yI5n3hieiqdEMDHPymCNGfwuSknxH1A
         x9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948587; x=1751553387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeiWsIBvFrWgna5yEgaH/IXXNiu0EY7mLCIeHhCpakg=;
        b=pkJQiqtF+1ufo2Wen3tEAvm9+ZYKNGi2Y3Z79o1UfZY+r8c6LGxEvximP1P94GIM2c
         y92h/AQp5Vg3NYMX+56ghIzJPn6NV07fJIZVxSt+WbYinRWl38hsu1KcGgD1k1Om2+KP
         0bo8MVkVD6cB1PIv2NonDTZfYYxPEnMsdZaw+oGo8EKBDRqLkGxIuea9MwXsg8+s1mfa
         yBfvQ/kkELBacnK+y5z+mAn89+BhBUQhUdYBAVyVtVQ9X48qgeqZkeHVZi6bCXtCz0/e
         pLubOI7WSwHWNtsFbukn/0oBPOumOkCuoyD0dpHYvLj9tPS1WjY8+htGUWKiUYuSKjb6
         0VCg==
X-Forwarded-Encrypted: i=1; AJvYcCWPElLraZMKzHhA+PcK7spiTzOmd4vXrODBf8xLM8PA6AOWbatHs1F9aj1WYgzodq5/9CSxZgA4UXTXNOHYztM=@lists.infradead.org, AJvYcCXW0im3UCQpuTmEiaD+f+6dLgnTuEoeKQgDjc5S326Te08iiLIeoJJaOCq/PJeN93aOERkPrJxd01OcOASPKLJI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6ugjdtL08XJab7psx1HceQ0o3d9EJx7I25JV5rBOUyw4WKWUV
	B7S8ZpYSevFfxQeOVcoHrkb5sShEQ34rh36XjRjap4OlMmIx1Fmb4kvN
X-Gm-Gg: ASbGncuQPb5jhQvoMS5EJHzSKzSGCX/5NcHWlwQGO5J06cb/VItY1zE7kPdcsTmQX6s
	OAHSXEq/irjDuW95ruEdQgcRNCMOg7L4VCAFCFO4mxwpgm5ezRcFHQmpPB/BHltMNi8MQc1cSYa
	smrPgfELJ9xrRd8aTbbUf576vHSduWosrG/f6VWn1hvaGWktaFueQs4lg+3n9M3dcZhqir9CqD6
	pBfYFXNmniT+mDNOi+/Lt5FH5IzddqwgG7f0pSNLu9rJxfFQg7VM2CMzKXN9x1GKZzjnNzKgB3L
	LOwjeCZB+sJ1TaFV4tOTSAZ9vrKA0O3hgHvqas5P77IVFVZXtRBNtN1CK7uUo27uxkf6KYgcXV3
	3ZeVmbCVOFBfK
X-Google-Smtp-Source: AGHT+IGBfj0HisJC5Hs7wbCAlRtLKFU3fvp+QXCNcRi1xOH0OF9hMH/GCsxQFG5ls3pbZPdGawEVYA==
X-Received: by 2002:a17:906:f581:b0:ade:43e8:8fa4 with SMTP id a640c23a62f3a-ae0bec4e39cmr782595366b.18.1750948586462;
        Thu, 26 Jun 2025 07:36:26 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143da38fsm7884666b.78.2025.06.26.07.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:36:25 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
To: neil.armstrong@linaro.org
Cc: daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	efectn@protonmail.com,
	heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	muhammed.efecetin.67@gmail.com,
	rafael@kernel.org,
	robh+dt@kernel.org
Subject: Re: [PATCH 4/5] thermal: khadas_mcu_fan: add support for Khadas Edge 2
Date: Thu, 26 Jun 2025 17:36:07 +0300
Message-ID: <20250626143607.1423954-1-muhammed.efecetin.67@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <09af27e2-34a7-4cda-b36c-5577829cc173@linaro.org>
References: <09af27e2-34a7-4cda-b36c-5577829cc173@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_073628_393625_E9041747 
X-CRM114-Status: GOOD (  26.55  )
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

On 6/26/25 17:11, neil.armstrong@linaro.org wrote:
> On 26/06/2025 16:04, muhammed.efecetin.67@gmail.com wrote:
>> From: Muhammed Efe Cetin <efectn@protonmail.com>
>>
>> Fan control on the Khadas Edge 2 is controlled with the 0x8A register,
>> using percentage values from 0 to 100, whereas there are only 3 constant steps in previous Khadas boards.
>> Therefore, i added a new cooling-levels property, similar to the one used in the pwm-fan driver.
>> The original behavior can still be used when the cooling-levels property is not specified,
>> ensuring that the new functionality does not break old boards. 
>
> Thanks for the explanation, but would would you like to change that ? The MCU can accept
> any value between 0 and 99, so why change the levels from DT ?
>
> Neil

Thanks for the review. Therefore, you say just add values between 0-100 to cooling-device instead of remapping them using cooling-levels property?

What would be the best practise of detecting whether the board is Khadas Edge 2? Adding new bool property, reading model propety from devicetree etc.

Best regards.

>
>>
>> Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
>> ---
>>   drivers/thermal/khadas_mcu_fan.c | 76 ++++++++++++++++++++++++++++++--
>>   1 file changed, 72 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
>> index d35e5313b..504e7d254 100644
>> --- a/drivers/thermal/khadas_mcu_fan.c
>> +++ b/drivers/thermal/khadas_mcu_fan.c
>> @@ -15,10 +15,16 @@
>>   #include <linux/thermal.h>
>>     #define MAX_LEVEL 3
>> +#define MAX_SPEED 0x64
>>     struct khadas_mcu_fan_ctx {
>>       struct khadas_mcu *mcu;
>>       unsigned int level;
>> +
>> +    unsigned int fan_max_level;
>> +    unsigned int fan_register;
>> +    unsigned int *fan_cooling_levels;
>> +
>>       struct thermal_cooling_device *cdev;
>>   };
>>   @@ -26,9 +32,21 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>>                       unsigned int level)
>>   {
>>       int ret;
>> +    unsigned int write_level = level;
>> +
>> +    if (level > ctx->fan_max_level)
>> +        return -EINVAL;
>> +
>> +    if (ctx->fan_cooling_levels != NULL) {
>> +        write_level = ctx->fan_cooling_levels[level];
>> +
>> +        if (write_level > MAX_SPEED)
>> +            return -EINVAL;
>> +    }
>> +
>> +    ret = regmap_write(ctx->mcu->regmap, ctx->fan_register,
>> +               write_level);
>>   -    ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
>> -               level);
>>       if (ret)
>>           return ret;
>>   @@ -40,7 +58,9 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>>   static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
>>                       unsigned long *state)
>>   {
>> -    *state = MAX_LEVEL;
>> +    struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>> +
>> +    *state = ctx->fan_max_level;
>>         return 0;
>>   }
>> @@ -61,7 +81,7 @@ khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
>>   {
>>       struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>>   -    if (state > MAX_LEVEL)
>> +    if (state > ctx->fan_max_level)
>>           return -EINVAL;
>>         if (state == ctx->level)
>> @@ -76,6 +96,47 @@ static const struct thermal_cooling_device_ops khadas_mcu_fan_cooling_ops = {
>>       .set_cur_state = khadas_mcu_fan_set_cur_state,
>>   };
>>   +static int khadas_mcu_fan_get_cooling_data_edge2(struct khadas_mcu_fan_ctx *ctx, struct device *dev)
>> +{
>> +    struct device_node *np = ctx->mcu->dev->of_node;
>> +    int num, i, ret;
>> +
>> +    if (!of_property_present(np, "cooling-levels"))
>> +        return 0;
>> +
>> +    ret = of_property_count_u32_elems(np, "cooling-levels");
>> +    if (ret <= 0) {
>> +        dev_err(dev, "Wrong data!\n");
>> +        return ret ? : -EINVAL;
>> +    }
>> +
>> +    num = ret;
>> +    ctx->fan_cooling_levels = devm_kcalloc(dev, num, sizeof(u32),
>> +                           GFP_KERNEL);
>> +    if (!ctx->fan_cooling_levels)
>> +        return -ENOMEM;
>> +
>> +    ret = of_property_read_u32_array(np, "cooling-levels",
>> +                     ctx->fan_cooling_levels, num);
>> +    if (ret) {
>> +        dev_err(dev, "Property 'cooling-levels' cannot be read!\n");
>> +        return ret;
>> +    }
>> +
>> +    for (i = 0; i < num; i++) {
>> +        if (ctx->fan_cooling_levels[i] > MAX_SPEED) {
>> +            dev_err(dev, "MCU fan state[%d]:%d > %d\n", i,
>> +                ctx->fan_cooling_levels[i], MAX_SPEED);
>> +            return -EINVAL;
>> +        }
>> +    }
>> +
>> +    ctx->fan_max_level = num - 1;
>> +    ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG_V2;
>> +
>> +    return 0;
>> +}
>> +
>>   static int khadas_mcu_fan_probe(struct platform_device *pdev)
>>   {
>>       struct khadas_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
>> @@ -90,6 +151,13 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
>>       ctx->mcu = mcu;
>>       platform_set_drvdata(pdev, ctx);
>>   +    ctx->fan_max_level = MAX_LEVEL;
>> +    ctx->fan_register = KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG;
>> +
>> +    ret = khadas_mcu_fan_get_cooling_data_edge2(ctx, dev);
>> +    if (ret)
>> +        return ret;
>> +
>>       cdev = devm_thermal_of_cooling_device_register(dev->parent,
>>               dev->parent->of_node, "khadas-mcu-fan", ctx,
>>               &khadas_mcu_fan_cooling_ops); 
>


