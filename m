Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959AFCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 15:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRvtjLOKKj58kQx+6lfIqkje8+KXfbLqId/Ktzx36GQ=; b=CdRa+GfrkN/xzuNG3FBZl42RTH
	m7++6JQ+kA7NZ4WbzjXZThqTy7t+AgXQb+KwsLoLQLGQ3sj7jXMYYBUpPRwc7POscOpqFBONEYGOd
	OsjPoMjrqJ9j8ULeCDN0pKMi86olEkcnXmP1MJDtArF/4iAYltvhJhYP4ehlFSJnTKu41BOfXnw9P
	t30kxuMLBozhqil+GeTafSkVFeJuAJ7DfMhqL3jE+ZXLxkEdD6pNCSQ8U59Bmtvz8uv46pNoo0zp5
	n3vyoQOOh3h5fTjtEjIn3q3avHOj/vpmCty/I98fDgIGry/SUbimTc4OnCE25GDuG89Ai1LGB8mzh
	RgJrFBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOGlh-0000000AvX6-3LLp;
	Sat, 16 May 2026 15:17:33 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOGle-0000000AvVq-2mpk;
	Sat, 16 May 2026 15:17:32 +0000
Message-ID: <4d4fa560-6115-4065-8472-50f8acb14436@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1778944635;
	bh=O7wIGuzhX4RxL35efQuwMtvJrnGNwx9gEjo3jv3h1co=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=id/Chqy0k/nRhbaLSSTVUYtMeD+KkJ2cgtpTaX/+PHGM1VvcaZN/3pfG1ONuTLKgp
	 muWK9a7rdDl6d7mWWPruD+VVaBLx8nrThnQ9A6jGF7Q+dH4mibJ4vSCn3VQfvgH6o/
	 88odJvyRsoPC0NdrbdlF8wt7MVBnjQyHHW/jH5J0=
Date: Sat, 16 May 2026 17:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v5 4/8] mfd: khadas-mcu: Add support for VIM4 MCU variant
To: Lee Jones <lee@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20260424-add-mcu-fan-khadas-vim4-v5-0-afcfa7157b23@aliel.fr>
 <20260424-add-mcu-fan-khadas-vim4-v5-4-afcfa7157b23@aliel.fr>
 <20260514105459.GJ305027@google.com>
Content-Language: en-US
In-Reply-To: <20260514105459.GJ305027@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_081731_356150_18892897 
X-CRM114-Status: GOOD (  25.78  )
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

Thanks for your review Lee.

On 5/14/26 12:54 PM, Lee Jones wrote:
> On Fri, 24 Apr 2026, Ronald Claveau via B4 Relay wrote:
> 
>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> Refactor probe() to use per-variant khadas_mcu_data
>> instead of hardcoded globals.
>>
>> Add dedicated regmap configuration and device data for the VIM4 MCU,
>> with its own volatile/writeable registers.
>>
>> Add the fan control register
>> (0–100 levels vs 0–3 for previous supported boards).
>>
>> Add a new compatible string "khadas,vim4-mcu".
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>  drivers/mfd/khadas-mcu.c | 106 ++++++++++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 95 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
>> index ba981a7886921..b36b3b3ab73c0 100644
>> --- a/drivers/mfd/khadas-mcu.c
>> +++ b/drivers/mfd/khadas-mcu.c
>> @@ -75,15 +75,91 @@ static const struct regmap_config khadas_mcu_regmap_config = {
>>  	.cache_type	= REGCACHE_MAPLE,
>>  };
>>  
>> +static const struct khadas_mcu_fan_pdata khadas_mcu_fan_pdata = {
>> +	.fan_reg	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
>> +	.max_level	= 3,
>> +};
> 
> What is 3?
> 

This is the max fan speed level as defined in the MCU register.
I will add it as a comment.
/* Fan speed: 0 = off, 1 = low, 2 = medium, 3 = high */

>> +
>>  static struct mfd_cell khadas_mcu_fan_cells[] = {
>>  	/* VIM1/2 Rev13+ and VIM3 only */
>> -	{ .name = "khadas-mcu-fan-ctrl", },
>> +	{
>> +		.name = "khadas-mcu-fan-ctrl",
>> +		.platform_data = &khadas_mcu_fan_pdata,
>> +		.pdata_size    = sizeof(khadas_mcu_fan_pdata),
>> +	},
>>  };
> 
> Worth making this const at one point.
> 

Yes I will.
>>  
>>  static struct mfd_cell khadas_mcu_cells[] = {
>>  	{ .name = "khadas-mcu-user-mem", },
>>  };
>>  

I will for that one too.

>> +static const struct khadas_mcu_data khadas_mcu_data = {
>> +	.regmap_config	= &khadas_mcu_regmap_config,
>> +	.cells		= khadas_mcu_cells,
>> +	.ncells		= ARRAY_SIZE(khadas_mcu_cells),
>> +	.fan_cells	= khadas_mcu_fan_cells,
>> +	.nfan_cells	= ARRAY_SIZE(khadas_mcu_fan_cells),
>> +};
> 
> This is a red flag!
> 
>> +static bool khadas_mcu_vim4_reg_volatile(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case KHADAS_MCU_PWR_OFF_CMD_REG:
>> +	case KHADAS_MCU_VIM4_REST_CONF_REG:
>> +	case KHADAS_MCU_WOL_INIT_START_REG:
>> +	case KHADAS_MCU_VIM4_LED_ON_RAM_REG:
>> +	case KHADAS_MCU_VIM4_FAN_CTRL_REG:
>> +	case KHADAS_MCU_VIM4_WDT_EN_REG:
>> +	case KHADAS_MCU_VIM4_SYS_RST_REG:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static bool khadas_mcu_vim4_reg_writeable(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case KHADAS_MCU_VERSION_0_REG:
>> +	case KHADAS_MCU_VERSION_1_REG:
>> +	case KHADAS_MCU_SHUTDOWN_NORMAL_STATUS_REG:
>> +		return false;
>> +	default:
>> +		return true;
>> +	}
>> +}
>> +
>> +static const struct regmap_config khadas_mcu_vim4_regmap_config = {
>> +	.reg_bits	= 8,
>> +	.reg_stride	= 1,
>> +	.val_bits	= 8,
>> +	.max_register	= KHADAS_MCU_VIM4_SYS_RST_REG,
>> +	.volatile_reg	= khadas_mcu_vim4_reg_volatile,
>> +	.writeable_reg	= khadas_mcu_vim4_reg_writeable,
>> +	.cache_type	= REGCACHE_MAPLE,
>> +};
>> +
>> +static const struct khadas_mcu_fan_pdata khadas_vim4_fan_pdata = {
>> +	.fan_reg	= KHADAS_MCU_VIM4_FAN_CTRL_REG,
>> +	.max_level	= 0x64,
>> +};
>> +
>> +static const struct mfd_cell khadas_mcu_vim4_cells[] = {
>> +	{
>> +		.name		= "khadas-mcu-fan-ctrl",
>> +		.platform_data	= &khadas_vim4_fan_pdata,
>> +		.pdata_size	= sizeof(khadas_vim4_fan_pdata),
>> +	},
>> +};
>> +
>> +static const struct khadas_mcu_data khadas_vim4_mcu_data = {
>> +	.regmap_config	= &khadas_mcu_vim4_regmap_config,
>> +	.cells		= NULL,
>> +	.ncells		= 0,
>> +	.fan_cells	= khadas_mcu_vim4_cells,
>> +	.nfan_cells	= ARRAY_SIZE(khadas_mcu_vim4_cells),
>> +};
>> +
>>  static int khadas_mcu_probe(struct i2c_client *client)
>>  {
>>  	struct device *dev = &client->dev;
>> @@ -94,28 +170,35 @@ static int khadas_mcu_probe(struct i2c_client *client)
>>  	if (!ddata)
>>  		return -ENOMEM;
>>  
>> +	ddata->data = i2c_get_match_data(client);
>> +	if (!ddata->data)
>> +		return -EINVAL;
> 
> Shouldn't this be -ENODEV?
> 

I will change to -ENODEV for the switch default.

>>  	i2c_set_clientdata(client, ddata);
>>  
>>  	ddata->dev = dev;
>>  
>> -	ddata->regmap = devm_regmap_init_i2c(client, &khadas_mcu_regmap_config);
>> +	ddata->regmap = devm_regmap_init_i2c(client,
>> +					     ddata->data->regmap_config);
> 
> Use up to 100-chars to prevent this kind of wrapping.
> 

Ok will do, is it a general rule or depends on maintainer ?

>>  	if (IS_ERR(ddata->regmap)) {
>>  		ret = PTR_ERR(ddata->regmap);
>>  		dev_err(dev, "Failed to allocate register map: %d\n", ret);
>>  		return ret;
>>  	}
> 
> Maybe convert this to dev_err_probe() at one point.
> 

Ok I change that.

>> -	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
>> -				   khadas_mcu_cells,
>> -				   ARRAY_SIZE(khadas_mcu_cells),
>> -				   NULL, 0, NULL);
>> -	if (ret)
>> -		return ret;
>> +	if (ddata->data->cells && ddata->data->ncells) {
>> +		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
>> +					   ddata->data->cells,
>> +					   ddata->data->ncells,
>> +					   NULL, 0, NULL);
>> +		if (ret)
>> +			return ret;
>> +	}
>>  
>>  	if (of_property_present(dev->of_node, "#cooling-cells"))
>>  		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
>> -					    khadas_mcu_fan_cells,
>> -					    ARRAY_SIZE(khadas_mcu_fan_cells),
>> +					    ddata->data->fan_cells,
>> +					    ddata->data->nfan_cells,
>>  					    NULL, 0, NULL);
>>  
>>  	return 0;
>> @@ -123,7 +206,8 @@ static int khadas_mcu_probe(struct i2c_client *client)
>>  
>>  #ifdef CONFIG_OF
>>  static const struct of_device_id khadas_mcu_of_match[] = {
>> -	{ .compatible = "khadas,mcu", },
>> +	{ .compatible = "khadas,mcu", .data = &khadas_mcu_data },
>> +	{ .compatible = "khadas,vim4-mcu", .data = &khadas_vim4_mcu_data },
> 
> We don't allow data from one registration API (MFD) to be shoved through
> another (DT).  Pass a value to match on instead, then use a switch()
> statement or similar to populate or register the devices.
> 

Thanks I'm on it.

>>  	{},
>>  };
>>  MODULE_DEVICE_TABLE(of, khadas_mcu_of_match);
>>
>> -- 
>> 2.49.0
>>
>>


-- 
Best regards,
Ronald

