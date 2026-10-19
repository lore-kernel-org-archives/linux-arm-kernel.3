Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4055CCCA490
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 02:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTeAHhDu6rLdIC+c7Ig9cS6MPdi5FFeMFdNOO55dM1c=; b=T9VIYBHSJ5yWqfORzb/S2HHBPi
	Bej6RmrQTU62Z6YX6Ey84TlQ8eQtjpmhHfv5aZf58pqlB1MLEZDqiRHuUILfKYXQsY3Fj8dXlLUE6
	7yCvyBGghRSOpnfMBhRM805XQVHli5MHh171CGDyTF3IsopwLcL1+vFxZZ+jFGiZr8dguo6xMYGrq
	yA/9yAjHVTyxNbpqaIfY16I24Wylfl90KBi+2+EsHK8HgyDeaaGUf6pDjBz0lhqsRba3jCDNaOmsm
	tFZ0vZqfEn5H4rp+e+w+NwJhmUQuFkr+BXF7lVVxuFg0EAFfY6hzwMR+w7HtyFaFNdBzxD2zSQ08w
	OYcBWpUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcse-00000006Ryi-3bES;
	Mon, 19 Oct 2026 02:13:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcsd-00000006RyZ-2qxZ;
	Mon, 19 Oct 2026 02:13:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C0B3419F1;
	Mon, 19 Oct 2026 02:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F52E1F000C4;
	Mon, 19 Oct 2026 02:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792376019;
	bh=OTeAHhDu6rLdIC+c7Ig9cS6MPdi5FFeMFdNOO55dM1c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GKU6XjhhijXdkLvmKWqe2lHLbB69e8YJyKEBgRBXBX0UKQ9bA6S9G+Om7USxlUmSe
	 0pQX1fEdIOiBPTfh2TQf6BFvoNNh9Ga0CwTWmPoeeEQcp3d9kVQVatwi84yNU75fD3
	 rwxyaZcB1ozG7EuT5EpDA/o1xO+w/wN4s4C7IaxDzKSuZuC+TQJXSy2+EL9wOSJzM5
	 AV+CEses5L1/LgQBDoJVCtXOCizpoHWfDmsJC/Nc1g9v11BEr+Z7/Xm2wfBPrTWM4x
	 DkE92auy1x01Gcu2YXObxGdnKnjqOizVA83Mw/k7G3lFUiEJs+taTrAmvtC1vDggBi
	 07MykhZB0Xhnw==
Date: Mon, 19 Oct 2026 03:13:33 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee
 Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>, Luca Leonardo
 Scorcia <l.scorcia@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v4 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
Message-ID: <20261019031333.1010682f@jic23-hlaptop>
In-Reply-To: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-2-23533a0d30e3@gmail.com>
References: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
	<20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-2-23533a0d30e3@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 28 Sep 2026 15:57:20 -0500
Ryan Brue <ryanbrue.dev@gmail.com> wrote:

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
Hi Ryan

Sorry for the delay.

Just one thing inline. If I wasn't tired from a long day
of review I might just have made the change and asked you
to check it. So bad luck on that!

Thanks,

Jonathan

> diff --git a/drivers/iio/adc/mt6397-auxadc.c b/drivers/iio/adc/mt6397-auxadc.c
> new file mode 100644
> index 000000000000..8d1702658876
> --- /dev/null
> +++ b/drivers/iio/adc/mt6397-auxadc.c

> +static void mt6397_auxadc_release(struct mt6397_auxadc *adc,
> +				  const struct iio_chan_spec *chan)
> +{
> +	/* Lowering START leaves the converter unarmed between reads. */
> +	regmap_clear_bits(adc->regmap, MT6397_AUXADC_CON1, MT6397_AUXADC_CON1_START);
> +
> +	if (chan->channel == MT6397_AUXADC_ISENSE)
> +		mt6397_auxadc_isense_disable(adc);
> +	else
> +		mt6397_auxadc_battemp_bias_off(adc);
> +}
> +
> +static int mt6397_auxadc_read_channel(struct iio_dev *indio_dev,
> +				      const struct iio_chan_spec *chan,
> +				      int *val)
> +{
> +	struct mt6397_auxadc *adc = iio_priv(indio_dev);
> +	int ret;
> +
> +	mutex_lock(&adc->lock);
> +
> +	if (chan->channel == MT6397_AUXADC_ISENSE) {
> +		ret = mt6397_auxadc_isense_enable(adc);
> +		if (ret)
> +			goto out_release;
> +
> +		fsleep(MT6397_AUXADC_ISENSE_SETTLE_US);
> +	} else {
> +		ret = mt6397_auxadc_battemp_bias_on(adc);
> +		if (ret)
> +			goto out_release;
> +
> +		fsleep(MT6397_AUXADC_BATTEMP_SETTLE_US);
> +	}
> +
> +	ret = mt6397_auxadc_read_burst(adc, chan, val);
> +
> +out_release:
> +	mt6397_auxadc_release(adc, chan);
This ends up rather confusing.  Would you mind instead doing it as a pair of helpers
and a top level bit of code that does.

	guard(mutex)(&adc->lock);
	if (chan->channel == MT6397_AUXADC_ISENSE) {
		return mt6397_auxadc_isense_read();
	else
		return mt6397_auxadc_battemp_read();


The only thing that get duplicated is the call to read_burst()
which seems simpler than having a pair of if / else on the channel
(one hidden in this release).

> +	mutex_unlock(&adc->lock);
> +
> +	return ret;
> +}



