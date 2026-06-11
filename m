Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6174ACD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 19:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgKjrl2kBco33Z51Ec7gTlmK5v4gJb9LV8M2yodlQLk=; b=nM/4iOARCrPRgtqroMyd9i2s+n
	RQiGhNtd9pvFo2PrxIXAMJnuiTnO/NVbbReisB0IzSL+ilNZOKp8Qy57p0QXX4OxkPeoUb0ggON7p
	QwO6y/ymdo4p+73btkjOgO6weZy2g3zzgJEeJNF3Orwf1KDaw2vVttmBZfHgYmwNqeSSmI1f1PYrt
	jjM3sQ7Y/3n3cOU79mO5WpDHeJbBNUSed+jYeUOO3/5EZotGbPRGzTGIRWAAd2uollLSXR5zVDVD6
	JQj1HquNHk5GvCpRFsEzG5cwBFfnNKgztI74XLjkWIMeIe7LHDuO9iP9uFXHyd8IKBoUBEZ+soG+1
	DOk1olMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlHZ-00000009y0t-25wj;
	Thu, 11 Jun 2026 19:41:41 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlHX-00000009y00-2IQ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 19:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781206900; x=1812742900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9HYVqEkTBk+W9sTm/UsyiNOHZTc2Vs3uZL+vLA75+gk=;
  b=k4n6ABrCqPRIAwrsV76bu4CWp8zUatoM5KM5xG6ZbK5/DMmO2LKtSsgb
   gT3r04353VyOJ4WPCcM268mOnBp44LFnl7a3epBHk0/DMyhypiK7gOcje
   YEq0y58vTJ2IlzauwdfbJ77IbKKuYQamSgZV5U3J6IJp50kdWXk5Yc8gT
   vJ8Na46BZAHYJ5jfDSkBYbxKlWojqrSoeKvbE9VxQCzdfHn+e7E4bn4YO
   qrL+Vz8voshBqvZByRmRP94WYViLTL+mKxQlzhMKCnTZgc8nSEfTYEfPG
   VLOGirObUHK1hER92hBcxitZMU3HwP/3XE58LGYwzZTR1/6gREukFEYR6
   w==;
X-CSE-ConnectionGUID: rpwRm1XMTvGN4EkX8PSQ9g==
X-CSE-MsgGUID: Y0ZDAhqpSkWxvF80hMZuDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93520586"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="93520586"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:41:39 -0700
X-CSE-ConnectionGUID: NZmom4I3TMqhdskBrcAdgg==
X-CSE-MsgGUID: IFxkRuRCTBy47PiDh/soDw==
X-ExtLoop1: 1
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:41:35 -0700
Date: Thu, 11 Jun 2026 22:41:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <aisPbXOB6cofF4_r@ashevche-desk.local>
References: <20260611-axiado-ax3000-ax3005-saradc-v2-0-913c9de7c64c@axiado.com>
 <20260611-axiado-ax3000-ax3005-saradc-v2-2-913c9de7c64c@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-axiado-ax3000-ax3005-saradc-v2-2-913c9de7c64c@axiado.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_124139_629717_BA55E7A2 
X-CRM114-Status: GOOD (  15.24  )
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

On Thu, Jun 11, 2026 at 02:37:44AM -0700, Petar Stepanovic wrote:
> Add support for the SARADC controller found on Axiado AX3000 and
> AX3005 SoCs.
> 
> The driver supports single-shot voltage reads through the IIO
> subsystem. The number of available input channels is selected from
> the SoC match data, allowing AX3000 and AX3005 variants to use the
> same driver.

Tried to not overlap Jonathan's review.

...

> +struct axiado_saradc {
> +	void __iomem *regs;
> +	struct clk *clk;
> +	unsigned long clk_rate;
> +	int vref_uV;
> +	struct mutex lock; /* Serializes ADC conversions. */
> +};

Is `pahole` satisfied with the chosen layout?


...

> +static int axiado_saradc_read_raw(struct iio_dev *indio_dev,
> +				  struct iio_chan_spec const *chan, int *val,
> +				  int *val2, long mask)
> +{
> +	struct axiado_saradc *info = iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret = axiado_saradc_conversion(info, chan, val);
> +		return ret ? ret : IIO_VAL_INT;

Better to use plain if.

		if (ret)
			return ret;

		return IIO_VAL_INT;

> +	case IIO_CHAN_INFO_SCALE:
> +		*val = info->vref_uV / 1000;

1000 --> (MICRO / MILLI) ?
(yes, with parentheses)

> +		*val2 = AX_RESOLUTION_BITS;
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}

-- 
With Best Regards,
Andy Shevchenko



