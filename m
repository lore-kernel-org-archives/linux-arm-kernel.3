Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19DAFD375F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rG3bFXrppjeuA+iWryZ7vgudlEyemROZ7fVq2Z8BIXg=; b=v3GZOcrHWhLkL6MEiVpP6IvQJx
	xdMYt2uYKXHdk1S5x8m74pNtilYB92/ji3aRGQU2mfViTMSCOQ4+F5PuORitM98kTI0Hiby697dwl
	YPs4keqoSF8p6PjQRGgZduHYV/VZtneUMcWFPZF+UmwPR6oFyWlZYhb6eg4/KWaLuPESd0t31TPUm
	8C0VyetcXf2AFe1hmm3o6i5dQL7AIGqqc4jllf+xX+0fPfgxjg0OlpbEJluL0BxpQs7u7CyJ8k+VO
	Iaex7A3+vBw/10iNYYWX3Z4zHrMO1PCtFg/Z0zubJjTQkwM5flrmruIaXGwtHlWPXhJuF36ldJYnv
	jTZZmsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFOX-000000049SQ-1NhZ;
	Wed, 25 Feb 2026 13:57:41 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFOU-000000049R7-0Fs3;
	Wed, 25 Feb 2026 13:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rG3bFXrppjeuA+iWryZ7vgudlEyemROZ7fVq2Z8BIXg=; b=sE7ro5j5T1LKj13VybTetBxXZT
	VRbucUIenZh6gy/4TouqpsqjKJcgsP8yNOxWIk8MzTwu8+4ShFqiYkD9dkIU7NIKmjKvFMGyoD1zC
	dI0LkSU3Q332Wcs/BfHk98kabRpqLwi/j820Ryd/x5ppOJBoI/00Qou4NktlGhAx/gJ78jZXxILsa
	m837YfYMtkCCWuSh7WPjwoFOvvFk2zzuMGZzFzfzg0jcgqhkurnKTYAO7B+seO9bYPeKGrEHyX4aM
	DfLHnMX4GMQbhoLpe5CCCs/kNZtZPRSK1OJnVQjq1MhZ4+7IxBzwypfV5jjZBpauyQs0s3h29xttG
	IYc7JnHw==;
Received: from [189.7.87.203] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vvFOB-005FoP-D2; Wed, 25 Feb 2026 14:57:19 +0100
Message-ID: <481489f1-850f-44ae-8586-b69c1d2faf8e@igalia.com>
Date: Wed, 25 Feb 2026 10:57:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
 <20260218-v3d-power-management-v6-1-40683fd39865@igalia.com>
 <20260224-curvy-shiny-dodo-e50cef@houat>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20260224-curvy-shiny-dodo-e50cef@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_055738_570965_B212D955 
X-CRM114-Status: GOOD (  29.39  )
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

Hi Maxime,

On 24/02/26 11:11, Maxime Ripard wrote:
> Hi Maira,
> 

[...]

>> @@ -289,16 +290,22 @@ static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
>>   static int raspberrypi_fw_prepare(struct clk_hw *hw)
>>   {
>>   	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
>> +	struct raspberrypi_clk_variant *variant = data->variant;
>>   	struct raspberrypi_clk *rpi = data->rpi;
>>   	u32 state = RPI_FIRMWARE_STATE_ENABLE_BIT;
>>   	int ret;
>>   
>>   	ret = raspberrypi_clock_property(rpi->firmware, data,
>>   					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
>> -	if (ret)
>> +	if (ret) {
>>   		dev_err_ratelimited(rpi->dev,
>>   				    "Failed to set clock %s state to on: %d\n",
>>   				    clk_hw_get_name(hw), ret);
>> +		return ret;
>> +	}
>> +
>> +	if (variant->maximize)
>> +		ret = raspberrypi_fw_set_rate(hw, variant->max_rate, 0);
> 
> 
> It's not clear to me why you would want to force it to the max there,
> and especially the max of the clock. It would make more sense to me to
> set it to whatever maximum rate clk_hw_get_rate_range would return
> (which should be the minimum of variant->max_rate + all clk->max_rate),
> but even then it would erase every call to clk_set_rate before calling
> clk_prepare().
> 
> I'd understand lowering the clock rate in unprepare to avoid wasting too
> much power, but why do we need to raise it here?

This only applies to clocks with variant->maximize == true, which is
exclusively the V3D clock. The V3D driver doesn't do fine-grained rate
control, it always wants maximum performance. In the case of V3D, there
are no intermediate clk_set_rate() calls to preserve.

> 
>>   	return ret;
>>   }
>> @@ -306,10 +313,19 @@ static int raspberrypi_fw_prepare(struct clk_hw *hw)
>>   static void raspberrypi_fw_unprepare(struct clk_hw *hw)
>>   {
>>   	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
>> +	struct raspberrypi_clk_variant *variant = data->variant;
>>   	struct raspberrypi_clk *rpi = data->rpi;
>>   	u32 state = 0;
>>   	int ret;
>>   
>> +	/*
>> +	 * On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
>> +	 * actually power off the clock. To achieve meaningful power consumption
>> +	 * reduction, the driver needs to set the clock rate to minimum before
>> +	 * disabling it.
>> +	 */
>> +	raspberrypi_fw_set_rate(hw, variant->min_rate, 0);
> 
> I'm not sure setting it to variant->min_rate would work directly either,
> since it would break consumers expectations. Also, can we guard it with

The clock is being unprepared, which means that any consumer that wants
to use it again must call clk_prepare() first, at which point the rate
gets restored (for maximize clocks) or re-established by the consumer
via clk_set_rate(). Considering that no consumer should be relying on
the rate of an unprepared clock, I understand that there are no
expectations to break here.

> a version check if we know that there's some good and bad firmwares?

So far, all firmware versions have this issue. For future firmware
releases, it might change, but so far, all firmware versions have this
issue.

> 
>>   	ret = raspberrypi_clock_property(rpi->firmware, data,
>>   					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
>>   	if (ret)
>> @@ -334,7 +350,7 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
>>   {
>>   	struct raspberrypi_clk_data *data;
>>   	struct clk_init_data init = {};
>> -	u32 min_rate, max_rate;
>> +	unsigned long rate;
>>   	int ret;
>>   
>>   	data = devm_kzalloc(rpi->dev, sizeof(*data), GFP_KERNEL);
>> @@ -354,18 +370,20 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
>>   
>>   	data->hw.init = &init;
>>   
>> -	ret = raspberrypi_clock_property(rpi->firmware, data,
>> -					 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
>> -					 &min_rate);
>> -	if (ret) {
>> -		dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
>> -			id, ret);
>> -		return ERR_PTR(ret);
>> +	if (!variant->min_rate) {
>> +		ret = raspberrypi_clock_property(rpi->firmware, data,
>> +						 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
>> +						 &variant->min_rate);
>> +		if (ret) {
>> +			dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
>> +				id, ret);
>> +			return ERR_PTR(ret);
>> +		}
>>   	}
> 
> It feels to me like it would need to be a separate patch. Why do you
> need to override the minimum clock rate reported by the firmware?

This change is needed because the prepare/unprepare callbacks need
access to the min/max rates. In the current code, these are local
variables in raspberrypi_clk_register(). Storing them in the variant
struct makes them available to the callbacks. The `if (!variant-
 >min_rate)` guard only preserves the existing behavior for clocks like
M2MC that have a hard-coded minimum rate.

Having said that, I can split this into a separate preparatory patch if
you prefer.

Thanks for your review!

Best regards,
- Maíra

> 
> Maxime


