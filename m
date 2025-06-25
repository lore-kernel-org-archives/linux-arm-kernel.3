Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FF0C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAKxH+OFvMtqotaPXR3NZe5PouiAWrAKarzXNqYQJOk=; b=X0XUTrdcj/BbnZhIVXkr8oP2N/
	lHGCo4uOnN0Bq1+YI5ZvEy8gza4u1eWA95H2/ilO6nErggz4biXRcH9mLuBeLyAzMwSFvQaOhhaLE
	mh+hm938EF8QeUaNtzXqZza8ituCwTwcjhjmVq0b6rMeSbLmRFIximgaYGTvZTwi3xsJeMbcMeHZu
	5rUbi0hA5v1YOASL9wsJsGGSiU1qMgFLft2K6t9W3mYzUj1ONzErK+9JF++qaTdGEoq/GpCBGhJcw
	zdmp7Oegih8SWYiPkizAwSYhJczCDoHPEUH6p1vRuMjdFT84PLGWoZXodKB0pl//4WBv/so79DqYB
	tAfJmEDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVdW-00000009jUb-1Jy0;
	Wed, 25 Jun 2025 19:18:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQCE-00000008oOV-3RW5;
	Wed, 25 Jun 2025 13:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750858188;
	bh=VfXy1sSzFunuddiHtM+uLU9xQdYDLn8lHfOI5lG9CX8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ay5NlWknYmbxfUNMTCn2HwLL3f2bys3CsMz/fE6gTs4BL02RAjzY1dc+wa8Zlv8tN
	 rmAn9zLzGZHzpdmK+IPMgiJAdU8IFvV1sgTtNaexjHB9VyTqjtAvJNyGw1q9L0PLhw
	 +JI3qniO5tV6R/2VfDvXxK5rJNgbbSMqq6om7XiCXw4uogKZSrW3sHQAU9GLAYOyKd
	 iLeQDZpXQ3zBTo5iLBCM3zgzHSmRc/WFcy8dVvXWrqSbMFaduwebS84xoMSalyfpEM
	 aHglPIB0GyhRFbBBVly56RfEh1q3qqsUY91pA38V2/swHnoWhxf6bOj9YDdWCL7ZNv
	 QPr36ygolnnGg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE09A17E1465;
	Wed, 25 Jun 2025 15:29:47 +0200 (CEST)
Message-ID: <1b173e16-f681-4256-8dd2-92db2e90ca73@collabora.com>
Date: Wed, 25 Jun 2025 15:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] iio: adc: mt6359: Add support for MediaTek MT6363
 PMIC AUXADC
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
 <20250623120028.108809-5-angelogioacchino.delregno@collabora.com>
 <aFlk-l5LhgO8dnXK@smile.fi.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aFlk-l5LhgO8dnXK@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_062951_013939_F9E06D06 
X-CRM114-Status: GOOD (  25.77  )
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

Il 23/06/25 16:30, Andy Shevchenko ha scritto:
> On Mon, Jun 23, 2025 at 02:00:27PM +0200, AngeloGioacchino Del Regno wrote:
>> MediaTek MT6363 is a PMIC found on MT8196/MT6991 board designs
>> and communicates with the SoC over SPMI.
>>
>> This PMIC integrates an Auxiliary ADC (AUXADC) which has a grand
>> total of 54 ADC channels: 49 PMIC-internal channels, 2 external
>> NTC thermistor channels and 2 generic ADC channels (mapped to 7
>> PMIC ADC external inputs).
>>
>> To use a generic ADC channel it is necessary to enable one of
>> the PMIC ADC inputs at a time and only then start the reading,
>> so in this case it is possible to read only one external input
>> for each generic ADC channel.
>>
>> Due to the lack of documentation, this implementation supports
>> using only one generic ADC channel, hence supports reading only
>> one external input at a time.
> 
>> +#define MT6363_EXT_CHAN_MASK		GENMASK(2, 0)
>> +#define MT6363_EXT_PURES_MASK		GENMASK(4, 3)
>> + #define MT6363_PULLUP_RES_100K		0
>> + #define MT6363_PULLUP_RES_OPEN		3
> 
> I would rather expect the two spaces after #define. This most likely will break
> syntax highlighting in (some of) the editors.
> 

I can change that no problem (or if this can be changed while applying, that'd
buy me some time and I'd appreciate that a lot)

> ...
> 
>> +#define MTK_PMIC_ADC_EXT_CHAN(_ch_idx, _req_idx, _req_bit, _rdy_idx, _rdy_bit,	\
>> +			      _ext_sel_idx, _ext_sel_ch, _ext_sel_pu,		\
>> +			      _samples, _rnum, _rdiv)				\
> 
> Wondering, and it's out of scope here, if we can go to use a macro for
> initialization of struct *_fract.
> 
>>   	[PMIC_AUXADC_CHAN_##_ch_idx] = {					\
>>   		.req_idx = _req_idx,						\
>>   		.req_mask = BIT(_req_bit),					\
>>   		.rdy_idx = _rdy_idx,						\
>>   		.rdy_mask = BIT(_rdy_bit),					\
>> +		.ext_sel_idx = _ext_sel_idx,					\
>> +		.ext_sel_ch = _ext_sel_ch,					\
>> +		.ext_sel_pu = _ext_sel_pu,					\
>>   		.num_samples = _samples,					\
>>   		.r_ratio = { _rnum, _rdiv }					\
>>   	}
> 
> Perhaps something in math.h as
> 
> #define INIT_STRUCT_FRACT_UXX(n, d) ...

Not sure... honestly, at a first glance it looks like a macro would only make
a longer line and nothing else...

...but - effectively - I can see a benefit for a INIT_CONST_STRUCT_FRACT_Uxx(n, d)
where we could perform a build-time check for division by zero.

I'm not sure how many users would there be of such a macro, ideas?

> 
> ...
> 
>> +	if (MTK_AUXADC_HAS_FLAG(cinfo, IS_SPMI)) {
>> +		/* If the previous read succeeded, this can't fail */
>> +		regmap_read(regmap, reg - 1, &lval);
> 
> No error check? lval may contain garbage here, right?
> 

No, because if the previous read succeeded, this can't fail, and also cannot ever
possibly contain garbage (and if it does, - but again, that can't happen - there is
no way to validate that because valid values are [0x00..0xff] anyway).

>> +		val = (val << 8) | lval;
> 
> Is it guaranteed that lval is always less than 256 (if unsigned)?
> 

Yes, with SPMI that is guaranteed.

>> +	}
> 
> ...
> 
>> +		regmap_update_bits(regmap, cinfo->regs[desc->ext_sel_idx],
>> +				   MT6363_EXT_PURES_MASK, ext_sel);
> 
> No  error check?
> 

No, because if the previous reads and/or writes succeeded, it is impossible for
this to fail :-)

Cheers,
Angelo


