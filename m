Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCB8CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnE/uLXPZCe1VSHvqcoTHEVGQ4O32FN0ovU1bXUARic=; b=Eujkw7M0JirTBEz45rLa9aNrbP
	1LGmA2VSRlDKyRDdu+SQpCS67V6XA3Y6dpc+dNTiHaQOkdUuBnFDhi4Q1ho5DloxGmEA1hr074ZXP
	yzNA29JKu2mvoZYg7YIcTtNegKPncKiC05H0r7FoJgMYXMo2Y5CG3GThwFjPy3v+uk9e7GzQL4OOn
	10HeNS89t11Z69B6dXQq9iLdcdBYdHzhrJW2ARmh1wtXoreTnHsxjXb0pCXsaCbX+/G9ky1EAS4KJ
	iaeMyJ35u8GL40yk6mWLwRqq5yiJ1lyX4Y4QzGC2vQayt9M+e9cDkG9tvwZlJeqMOYZL6UhLx9GiU
	B1hco8aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlqr-0000000FBvl-1YVu;
	Wed, 03 Jun 2026 13:41:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlqo-0000000FBv4-3xMU;
	Wed, 03 Jun 2026 13:41:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B1F34076B;
	Wed,  3 Jun 2026 13:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B031F00893;
	Wed,  3 Jun 2026 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780494102;
	bh=TnE/uLXPZCe1VSHvqcoTHEVGQ4O32FN0ovU1bXUARic=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=htLHZ/bTWSKQDDbVwToSkF9CW2OiNYBuNJbe0DIOLVX+ZxwXUsnsF3UCwj/ZtIzqN
	 BUdw77jFIFUAzQoRyVjTh1+D9VM7iPcjAUnXIARcF7260zeSu77KhHGOqVadj3/c0C
	 HcP5bYU4o8Wi0hMehvV6hmXh0UCOmbp2hgb75tN75R/Ezmx8VDAtm0kaCb5NT4m3uz
	 +VKnl383MUD+5N6uUbB/Fhf8MXlGEunJ4W9Uty3CQlkQsvumqw02nKqL6ViLBikH4+
	 Gu0XHyy0/Q04qL5n56eqB+eytb/QLzrgo5JTi2V6a664eN4d5cm34dMz3msWh6WWBA
	 vgb6tNNGe7f+Q==
Date: Wed, 3 Jun 2026 14:41:32 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Cc: rva333@protonmail.com, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
Message-ID: <20260603144132.6c5daea8@jic23-huawei>
In-Reply-To: <20260602-mt6323-adc-v1-2-68ec737508ee@protonmail.com>
References: <20260602-mt6323-adc-v1-0-68ec737508ee@protonmail.com>
	<20260602-mt6323-adc-v1-2-68ec737508ee@protonmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_064143_030617_DE8C8708 
X-CRM114-Status: GOOD (  25.75  )
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

On Tue, 02 Jun 2026 15:46:55 +0300
Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:

> From: Roman Vivchar <rva333@protonmail.com>
> 
> The mt6323 AUXADC is a 15-bit ADC used for system monitoring. This driver
> provides support for reading various channels including battery and
> charger voltages, battery and chip temperature, current sensing and
> accessory detection.
> 
> Add a driver for the AUXADC found in the MediaTek mt6323 PMIC.
> 
> Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
Trivial stuff inline + a question from the sashiko bot you may have
missed.

Jonathan

> diff --git a/drivers/iio/adc/mt6323-auxadc.c b/drivers/iio/adc/mt6323-auxadc.c
> new file mode 100644
> index 000000000000..da6c11a5079c
> --- /dev/null
> +++ b/drivers/iio/adc/mt6323-auxadc.c
> @@ -0,0 +1,299 @@


> +static int mt6323_auxadc_request(struct mt6323_auxadc *auxadc,
> +				 unsigned long channel)
> +{
> +	struct regmap *map = auxadc->regmap;
> +	int ret;
> +
> +	ret = regmap_set_bits(map, MT6323_AUXADC_CON11, AUXADC_CON11_VBUF_EN);

See below. Sashiko asked if lack of turning this off again when done
with a read is wasting power or similar.

> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_clear_bits(map, MT6323_AUXADC_CON22, BIT(channel));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_set_bits(map, MT6323_AUXADC_CON22, BIT(channel));
> +}
> +
> +static int mt6323_auxadc_read(struct mt6323_auxadc *auxadc,
> +			      const struct iio_chan_spec *chan, int *out)
> +{
> +	struct regmap *map = auxadc->regmap;
> +	u32 reg = chan->address;
It's only used one. I'd probably put it inline and skip the local variable.
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read_poll_timeout(map, reg, val, (val & AUXADC_READY_MASK),
> +				       1 * USEC_PER_MSEC, 100 * USEC_PER_MSEC);
> +	if (ret)
> +		return ret;
> +
> +	*out = FIELD_GET(AUXADC_DATA_MASK, val);
> +
> +	return 0;
> +}
> +
> +static int mt6323_auxadc_read_raw(struct iio_dev *indio_dev,
> +				  const struct iio_chan_spec *chan,
> +				  int *val, int *val2, long mask)
> +{
> +	struct mt6323_auxadc *auxadc = iio_priv(indio_dev);
> +	int ret, mult;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		if (chan->channel == MT6323_AUXADC_ISENSE ||
> +		    chan->channel == MT6323_AUXADC_BATSNS)
> +			mult = 4;
> +		else
> +			mult = 1;
> +
> +		/* 1800mV full range with 15-bit resolution. */
> +		*val = mult * 1800;
> +		*val2 = 15;
> +
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	case IIO_CHAN_INFO_RAW:
> +		scoped_guard(mutex, &auxadc->lock) {
> +			ret = mt6323_auxadc_prepare_channel(auxadc);
> +			if (ret)
> +				return ret;
> +
> +			ret = mt6323_auxadc_request(auxadc, chan->channel);
Sashiko asks:
"Does this leak power by leaving AUXADC_CON11_VBUF_EN enabled after the
reading finishes?
It appears the voltage buffer is enabled in mt6323_auxadc_request() but never
disabled once the conversion completes and exits here. Also, the active
channel is never cleared."
https://sashiko.dev/#/patchset/20260602-mt6323-adc-v1-0-68ec737508ee%40protonmail.com

Seems like a reasonable point.


> +			if (ret)
> +				return ret;
> +
> +			/* Hardware limitation: the AUXADC needs a delay to become ready. */
> +			fsleep(300);
> +
> +			ret = mt6323_auxadc_read(auxadc, chan, val);
> +			if (ret)
> +				return ret;
> +		}
> +		return IIO_VAL_INT;
> +	default:
> +		return -EINVAL;
> +	}
> +}

> +static int mt6323_auxadc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mt6323_auxadc *auxadc;
> +	struct iio_dev *iio;
> +	struct regmap *regmap;

When no other particular ordering preference in IIO is for reverse xmas
tree. 

> +	int ret;
> +
> +	regmap = dev_get_regmap(dev->parent->parent, NULL);
> +	if (!regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
> +
> +	iio = devm_iio_device_alloc(dev, sizeof(*auxadc));
> +	if (!iio)
> +		return -ENOMEM;
> +
> +	auxadc = iio_priv(iio);
> +	auxadc->regmap = regmap;
> +
> +	ret = devm_mutex_init(dev, &auxadc->lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = mt6323_auxadc_init(auxadc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to initialize auxadc\n");
> +
> +	iio->name = "mt6323-auxadc";
> +	iio->info = &mt6323_auxadc_iio_info;
> +	iio->modes = INDIO_DIRECT_MODE;
> +	iio->channels = mt6323_auxadc_channels;
> +	iio->num_channels = ARRAY_SIZE(mt6323_auxadc_channels);
> +
> +	return devm_iio_device_register(dev, iio);
> +}

