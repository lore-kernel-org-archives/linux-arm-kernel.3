Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91432C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFXtIw4foyxCvVwYbnBgMNE6tcQc47kH16pvYnTTJw0=; b=Q4hKu/bWa1KOpeqzlUbSJFv4/E
	3jsuFqeLbPNzOr1fG6BQpFxvuRdGJfEBDJCT8QIkt5ZW6tZM3gTC2g3ugAUKnQbYN3ig7brGfzpMv
	5FFQ4GdVKO7Tv6RTRp/i3psBYlR1VnP5GX1M1dXhRLpWVPO7kzYgOSppMBO4frECaOvNLtjW8qPZh
	LWlPj/lZGR2YJ3QywuOOkzr9PIccUG6nTAJobgPAVPMKnVp+8QOxZ2E6XT06Ih3/q3RLdQ+HDj2tN
	osrlJx0tbzJnmbictyMQggiNxBWYgWvMdR0H/jqR5zV9Fecno0I41bV3ZNElsFNmu202tghsOsMdG
	MHAtF2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tkj-000000028YY-0K6P;
	Fri, 04 Sep 2026 13:14:45 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tkh-000000028Xd-0PWd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788527683; x=1820063683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FYT6/iyY31UJEUUxpTSXKwCdDX8cAQywGqhNs1TpiuM=;
  b=BpSwLDCycLmCZpQrdAOxL2zsEKEYrtd9exgTC6Nodo8LfJV9sQSdOReH
   O73Nda1iOJ8lDeZ/ebkbRmUAm/f4BADSNjf3URhZYCImYt0l2755MSwfT
   XKlEsoB3tF9UZREmVx5IjvrBk/qFHAFGZX/in2mKMxbFKCSX3jozc9nJV
   q0pMSGxs9cYrS3+vXMwmhtWuMzlANNCvlS233UhD8Y6nKXV/s60FJ3ymH
   oLDWuVJ6/lzjh4DQ/lHlvdKyciYrsQlP+CZAjrQaie8PX0McmnB0G/1pP
   BrwyqBWeV15iNkwerVh+daipxGRLLFYQT3UE+T7XDo3PyOLC8wKrBdEbg
   Q==;
X-CSE-ConnectionGUID: hIkbwvhkT/2/6n+583zfcw==
X-CSE-MsgGUID: Gc/dnnAHRR69Jysl/MJtOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="91540834"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="91540834"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 06:14:40 -0700
X-CSE-ConnectionGUID: unw6z+dxSXa0kQr2G8pHcA==
X-CSE-MsgGUID: +XaBCkDbTp2V2UqV7nszHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="273823407"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.224])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 06:14:34 -0700
Date: Fri, 4 Sep 2026 16:14:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 09/13] gpio: pl061: use gpio-regmap and add Ambarella
 layout
Message-ID: <aprEOB7AZQWNed4D@ashevche-desk.local>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-9-e918514cb3b1@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904-cv75-v5-v6-9-e918514cb3b1@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_061443_177712_A8944301 
X-CRM114-Status: GOOD (  20.68  )
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

On Fri, Sep 04, 2026 at 02:38:16PM +0800, Long Zhao via B4 Relay wrote:

> Convert PL061 data and direction handling to gpio-regmap while
> keeping the existing PL061 irqchip path.

> Add an Ambarella CV75 register layout variant on the AMBA bus, without
> claiming unverified GPIO suspend/resume support for Ambarella.

This part should be in a separate patch.

So far I see at least 2 patches against gpio-regmap and 2 patches against
gpio-pl061.

...

> +struct pl061_variant_data {
> +	unsigned int data;
> +	unsigned int dir;
> +	unsigned int is;
> +	unsigned int ibe;
> +	unsigned int iev;
> +	unsigned int ie;
> +	unsigned int ris;
> +	unsigned int mis;
> +	unsigned int ic;
> +	unsigned int mask;
> +	unsigned int enable;
> +	unsigned int ngpio;
> +	bool access_32bit;
> +	bool masked_data_address;
> +	bool write_data_after_dir;
> +	bool clear_irq_on_type;
> +	bool pm_save_restore;
> +	const struct regmap_config *regmap_config;
> +};

Should not be like this. Part of it is in the respective regmap config (with
all volatile, precious, et cetera registers, and part of it comes from driver
data (in other words based on the compatible string or other ID).

...

>  struct pl061 {
>  	raw_spinlock_t		lock;
> -

Stray change.

>  	void __iomem		*base;
> -	struct gpio_chip	gc;
> +	const struct pl061_variant_data *variant;
> +	struct gpio_irq_chip	girq;
>  	int			parent_irq;

Here (in this structure) we should get a struct regmap instead of base and
gpio_chip.

>  	struct pl061_context_save_regs csave_regs;

This is not needed, see how gpio-pca953x does that with enabled regmap cache.

>  };

...

> +static u32 pl061_read(struct pl061 *pl061, unsigned int reg)
>  {
> -	struct pl061 *pl061 = gpiochip_get_data(gc);
> -	unsigned long flags;
> -	unsigned char gpiodir;
> +	if (pl061->variant->access_32bit)
> +		return readl(pl061->base + reg);
>  
> -	raw_spin_lock_irqsave(&pl061->lock, flags);
> -	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
> -	gpiodir = readb(pl061->base + GPIODIR);
> -	gpiodir |= BIT(offset);
> -	writeb(gpiodir, pl061->base + GPIODIR);
> -
> -	/*
> -	 * gpio value is set again, because pl061 doesn't allow to set value of
> -	 * a gpio pin before configuring it in OUT mode.
> -	 */
> -	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
> -	raw_spin_unlock_irqrestore(&pl061->lock, flags);
> -
> -	return 0;
> +	return readb(pl061->base + reg);
>  }

> -static int pl061_get_value(struct gpio_chip *gc, unsigned offset)
> +static void pl061_write(struct pl061 *pl061, u32 value, unsigned int reg)
>  {
> -	struct pl061 *pl061 = gpiochip_get_data(gc);
> -
> -	return !!readb(pl061->base + (BIT(offset + 2)));
> +	if (pl061->variant->access_32bit)
> +		writel(value, pl061->base + reg);
> +	else
> +		writeb(value, pl061->base + reg);

This is achieved by different regmap config — one for 32-bit, one for 8-bit
access.

>  }

...

I guess it's enough for now. this needs one more round of designing this.

-- 
With Best Regards,
Andy Shevchenko



