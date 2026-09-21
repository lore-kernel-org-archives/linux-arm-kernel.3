Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDEBC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9A0A2kqXtdyBSvTCoAbbk2qCDL8pg4K8rZZYQxHcMY=; b=sCpxesXnjGnLx/eGZSfBbEnGL7
	LQgadFIymKho4yM3GndMNeLhXCf/L2dGaQ4bEfTmvdoh3SaXgBBcGY5nSLNm+Ya9dtKHeLt07J76A
	Kb9+bgGRB3mwEL92SzDTRMLrxzoL8hugq+VvA2b7aHnaNkBlrEKpKskd6ItAB2OYH2w+ZZhMIuT8T
	8fUCseUMU1G+PukuxaPHPi0HkLp53OX9+BTliO0OxPkDP4f73QM39bmy2GIQNC+xwwwL4uWxwxENU
	ZGf50Y1jqBv9cQ6ilW/2V2c0yaDWoJ803GbvHX+7GriMl4GizQ2fjyuKx7+nucqpFa7oR6kLJ6obW
	Pa4T8tog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b3m-00000001e5S-0nVb;
	Mon, 21 Sep 2026 10:15:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b3i-00000001e4i-3oX9;
	Mon, 21 Sep 2026 10:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789985735;
	bh=tZtMCjyRjEVpTYK9a7RCqJ/OJnIZNfwPzTXTJARyiqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mXwGSfjC43zRsHGRv+b3VYs9+SM/XZumFJR8wiN1GnOLRQgPqtyB3HPTLbTo6Xcmm
	 diCckJQntmudlTEfHjY/bJgOAKq30axoN1qb9NBscKfniEEiz0nCFotPzAA1MJtR3A
	 7x7wk/dh5tZnmJ7LWIZfLQsLQijoXGB1RmBhrBxUdE6NnDw46PH6tDKdWlj1lXU8Yb
	 ABcs3SsTxkL2wGGhVzVVpVtSOJwkuOxWCwILObqwTHrOt7YTPkoUEwmTa4EmqAYjv/
	 F50Dkz0OIiiGU3IFXMYfuX2s8sXb1rJ/ySozxlV25vurscmYniZGESKOL02aPzY16n
	 BEX50MZjDC4xg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1932017E01D1;
	Mon, 21 Sep 2026 12:15:35 +0200 (CEST)
Message-ID: <9d9648f8-2097-492a-ba20-6345e8661174@collabora.com>
Date: Mon, 21 Sep 2026 12:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
To: Ryan Brue <ryanbrue.dev@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev,
 Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
 <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-2-c00edacbee64@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-2-c00edacbee64@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_031539_125517_A4555F21 
X-CRM114-Status: GOOD (  43.85  )
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

On 9/20/26 07:31, Ryan Brue wrote:
> The mt6397 AUXADC is a 10-bit ADC behind the SoC's PMIC wrapper. On boards
> built around this PMIC it is the only way to read the battery: the SoC's
> AUXADC is wired to board thermistors and the charger ICs these boards use
> have no ADC of their own.
> 
> Add a driver exposing the battery voltage and battery temperature
> channels. Only those two are described, so a channel ID in the device tree
> indexes the driver's channel array rather than the PMIC's channel number,
> as mt6323-auxadc does. The ready bit lives in a channel's raw result
> register, but the value comes from the chip's factory-calibrated copy.
> 
> The battery voltage is measured through ISENSE, because a board with a
> switching charger in the power path leaves BATSNS on the charger's system
> rail instead of on the pack. The thermistor only reads correctly with the
> PMIC's battery-detect bias and input buffer enabled, which take 20 ms to
> settle. Both are switched back off afterwards.
> 
> Reads average sixteen conversions in software; the chip's sample
> accumulator makes no measurable difference at any setting, so it is left
> at one sample per conversion.
> 
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> 
> ---
> 
> A new driver was created here, instead of modifying an existing driver such
> as mt6323-auxadc or mt6359-auxadc, for the following reasons:
> 
>   - Both mt6323-auxadc and mt6359-auxadc select channels through a request
>     register (1 bit per channel), while mt6397 uses a 4-bit numeric field
>     CHSEL in CON1 (10:7), and then pulses a START bit (CON1 bit 0).
> 
>   - For mt6323-auxadc, which is the closest I could find to the mt6397
>     (CON0..CON27), it has 13 more registers than the mt6397 (CON0..CON14).
>     It uses CON22 for its request register, and reads the result value
>     from the same register as the ready bit. We don't do that - the mt6397
>     has a factory-calibrated value for each channel at 0x16 higher than the
>     raw value. mt6323 also has a 1800 mV / 15 bit scale / resolution while
>     we have 1200 mV / 10 bits. We also have some per-channel preparation
>     that we have to do before the burst, that the mt6323 doesn't have to
>     do.
> 
>   - For mt6359-auxadc, it has a more generic framework for describing the
>     AUXADC, but it assumes requests are channel-per-bit, and so we would
>     have to basically ignore req_idx, req_mask, rdy_idx, and rdy_mask.
> 
>   - We also have our own software sampling, which the vendor does too
>     (Amazon Fire OS based on Linux 3.18). We'd have to have our own
>     sampling callback to do it.
> ---
>   MAINTAINERS                     |   1 +
>   drivers/iio/adc/Kconfig         |  11 ++
>   drivers/iio/adc/Makefile        |   1 +
>   drivers/iio/adc/mt6397-auxadc.c | 391 ++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 404 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 41d7b3a67415..9b254f98b5d7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16717,6 +16717,7 @@ MEDIATEK MT6397 PMIC AUXADC DRIVER
>   M:	Ryan Brue <ryanbrue.dev@gmail.com>
>   L:	linux-iio@vger.kernel.org
>   S:	Maintained
> +F:	drivers/iio/adc/mt6397-auxadc.c
>   F:	include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
>   
>   MEDIATEK MT6735 CLOCK & RESET DRIVERS
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 415e519ad4eb..9a1d36ed53cb 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1233,6 +1233,17 @@ config MEDIATEK_MT6370_ADC
>   	  This driver can also be built as a module. If so, the module
>   	  will be called "mt6370-adc".
>   
> +config MEDIATEK_MT6397_AUXADC
> +	tristate "MediaTek MT6397 PMIC AUXADC driver"
> +	depends on MFD_MT6397
> +	help
> +	  Say yes here to enable support for MediaTek MT6397 PMIC Auxiliary ADC.
> +	  This driver provides the battery voltage and battery temperature
> +	  channels used by the fuel gauge on boards built around this PMIC.
> +
> +	  This driver can also be built as a module. If so, the module will be
> +	  called mt6397-auxadc.
> +
>   config MEDIATEK_MT6577_AUXADC
>   	tristate "MediaTek AUXADC driver"
>   	depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index dcec0abb03b7..13cb4206bdb7 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -105,6 +105,7 @@ obj-$(CONFIG_MEDIATEK_MT6323_AUXADC) += mt6323-auxadc.o
>   obj-$(CONFIG_MEDIATEK_MT6359_AUXADC) += mt6359-auxadc.o
>   obj-$(CONFIG_MEDIATEK_MT6360_ADC) += mt6360-adc.o
>   obj-$(CONFIG_MEDIATEK_MT6370_ADC) += mt6370-adc.o
> +obj-$(CONFIG_MEDIATEK_MT6397_AUXADC) += mt6397-auxadc.o
>   obj-$(CONFIG_MEDIATEK_MT6577_AUXADC) += mt6577_auxadc.o
>   obj-$(CONFIG_MEN_Z188_ADC) += men_z188_adc.o
>   obj-$(CONFIG_MESON_SARADC) += meson_saradc.o
> diff --git a/drivers/iio/adc/mt6397-auxadc.c b/drivers/iio/adc/mt6397-auxadc.c
> new file mode 100644
> index 000000000000..d860cd3a8922
> --- /dev/null
> +++ b/drivers/iio/adc/mt6397-auxadc.c
> @@ -0,0 +1,391 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * MediaTek MT6397 PMIC AUXADC IIO driver
> + *
> + * Copyright (c) 2026 Ryan Brue <ryanbrue.dev@gmail.com>
> + *
> + * Based on drivers/iio/adc/mt6323-auxadc.c
> + */
> +

..snip..

> +
> +static int mt6397_auxadc_battemp_bias_on(struct mt6397_auxadc *adc)
> +{
> +	struct regmap *map = adc->regmap;
> +	int ret;
> +
> +	ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
> +			      MT6397_AUXADC_CON0_BUF_PWD_ON);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
> +			      MT6397_AUXADC_CON0_BUF_PWD_B);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_set_bits(map, MT6397_CHR_CON7,
> +			       MT6397_CHR_CON7_BATON_TDET_EN);
> +}
> +
> +static int mt6397_auxadc_battemp_bias_off(struct mt6397_auxadc *adc)
> +{
> +	struct regmap *map = adc->regmap;
> +	int ret;
> +
> +	ret = regmap_clear_bits(map, MT6397_CHR_CON7, MT6397_CHR_CON7_BATON_TDET_EN);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_clear_bits(map, MT6397_AUXADC_CON0, MT6397_AUXADC_CON0_BUF_PWD_B);
> +	if (ret)
> +		return ret;

If this fails, and the internal buffers are kept enabled, are you sure that
the AUXADC won't lock up?

Should it lock up, I imagine that the best thing that could happen is a power
leakage, but can be as bad as a system lockup.

Should we unconditionally also clear the MT6397_AUXADC_CON0_BUF_PWD_ON bit
even if MT6397_AUXADC_CON0_BUF_PWD_B clearing fails?

> +
> +	return regmap_clear_bits(map, MT6397_AUXADC_CON0,
> +				 MT6397_AUXADC_CON0_BUF_PWD_ON);
> +}
> +
> +static int mt6397_auxadc_isense_enable(struct mt6397_auxadc *adc)
> +{
> +	struct regmap *map = adc->regmap;
> +	int ret;
> +
> +	/*
> +	 * Two of the five independent input enables, not a select field:
> +	 * BATSNS is cleared first so that the two inputs are never enabled
> +	 * onto the battery channel at the same time.
> +	 */
> +	ret = regmap_clear_bits(map, MT6397_CHR_CON16, MT6397_CHR_CON16_ADCIN_VBAT_EN);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_set_bits(map, MT6397_CHR_CON16, MT6397_CHR_CON16_ADCIN_VSEN_EN);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_set_bits(map, MT6397_AUXADC_CON14,
> +			       MT6397_AUXADC_CON14_CH0_NORM_SEL |
> +			       MT6397_AUXADC_CON14_CH0_LBAT_SEL);
> +}
> +
> +static int mt6397_auxadc_isense_disable(struct mt6397_auxadc *adc)
> +{
> +	struct regmap *map = adc->regmap;
> +	int ret;
> +
> +	ret = regmap_clear_bits(map, MT6397_AUXADC_CON14,
> +				MT6397_AUXADC_CON14_CH0_NORM_SEL |
> +				MT6397_AUXADC_CON14_CH0_LBAT_SEL);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_clear_bits(map, MT6397_CHR_CON16,
> +				 MT6397_CHR_CON16_ADCIN_VSEN_EN |
> +				 MT6397_CHR_CON16_ADCIN_VBAT_EN);

Same here, but makes even more sense: if clearing the channel selector
fails, you still want to disable the ADCIN in an effort to avoid power
leakage.

Everything else looks good, so I'm sure that you're getting my R-b on
version 4.

Cheers,
Angelo

