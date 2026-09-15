Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811D1C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Auz/JUaOZifPVizkmjShDXJQfBW8wRxsQW7Wi4PyzNw=; b=wYGV6exHNq7+r1eWyoFMkdVgAz
	ZmFEL1eLWIfPK5ccEo7OuWI0sw68vHiBp5d4WDc71tbNqFaR4UerB6toHbUukRwJcELqkuklnrcsA
	8HBQomkt6Fd+7vVcz6VpFZUIzoDyLeD1arc57IH7I7I7iWXBQhasu/NAyuM3g50lFf97l0ZYJIPQ3
	Rl7wUVzGutsx63HSH+gQTE4NH+tcvBMG+vz2LwFdxLIOWoY2SPgRFCScBMN3/06VjUNpkvTGbLQDB
	c5BhamAT+EKm70S2Hsp4yZi+HT7F4QG1WRdxsIcs7bEc7ab6OM/URmOU8f+Tnaiziu9j1Zll3SMtH
	tpGkotYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V7U-00000007AJH-49Fo;
	Tue, 15 Sep 2026 15:30:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V7U-00000007AJ2-0dgm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Auz/JUaOZifPVizkmjShDXJQfBW8wRxsQW7Wi4PyzNw=; b=Q8sIIJmw2QdiOwmLBWuysassgB
	BeIQmX9D0h9Sig+6zMPi/FLBdYjJLcg/Rzb4ep740bpROWFuhVSKL4wTN5uksFfKZLLGoE6QIfEsr
	7mdNVn/ltM+Q6UhHQv0ckV9Fd87zWir8XiY2h3bJnjaksYEt4TeBWqnAGFE06t4ZKPyLNbcc8fPBD
	zfa1znQjy8XjHRJWlbKlZq3zWgS2CQ7xSD6ZyDVgxw3fBQeBxQWJJ7Ba+LqO3FuQF3KrBHRi1AfYp
	tIYeikzYdzouCdQeVVSQejKP0OL3386dKnUmECEb5UXOyoophUQlHETniMGZq3RRVWuJo3IAuHmXk
	L6mc1OCA==;
Received: from mgamail.intel.com ([192.198.163.10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6V7R-00000006wRf-0Efn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789486249; x=1821022249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g8LXI+FLmIC86HxvAHNU7lIP6/5lrj8l5npIS9TK1TE=;
  b=hkp6rMlF3SnZi+AZf1/f+sNWm3vGToafX87jmM6QxlZIYAWZ7iH4O3fm
   midjgyG579wuNFyMTciygEQs0kiqHNQkM5lBVnn4cWtXwQ/HAYv46JqiI
   x4tNHgFsu8NNCU2pBABzmbec2jjffJioM/bIRUA7k5zFt90qBa8Ozrd1j
   G7kZfE8zNuFMzEWebXcYtmLZi20TsMDDN0V/Bt51LIwcwG0OfvKMlA+u4
   Wic71TXrYrL4+Fu+iRhCo+2edaGe9VE6OrDk6fcLWg3MwRR3yjsNqevVg
   whO207aT8Iv8GZxeKEKPzSv7mFKfx78rSvji4vWY8wQSrrADCQxCl7VEl
   Q==;
X-CSE-ConnectionGUID: pOdzl55GT7KYJH7W7QQ9Kw==
X-CSE-MsgGUID: XddxO6dSTUqv7d+PdQRBJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101202664"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101202664"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 08:30:47 -0700
X-CSE-ConnectionGUID: 6C7AqoZuRhSZQAKatvE9Iw==
X-CSE-MsgGUID: L/Rwoq4CRxqPHw3+KDO9Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="302924565"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.57])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 08:30:41 -0700
Date: Tue, 15 Sep 2026 18:30:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
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
Subject: Re: [PATCH v7 09/15] gpiolib: regmap: add gpio_regmap_get_chip()
Message-ID: <aqlknvOejkE5zutq@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-9-3297d3fbc9c0@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-cv75-v5-v7-9-3297d3fbc9c0@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_163049_505273_EA04B517 
X-CRM114-Status: GOOD (  16.08  )
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

On Tue, Sep 15, 2026 at 07:15:39PM +0800, Long Zhao via B4 Relay wrote:

> Let drivers that implement a custom irqchip retrieve the gpio_chip
> after registration. Attach a caller-provided irq_domain only when it
> is present.

...

>  struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config)
>  {
> -	struct irq_domain *irq_domain;
>  	struct gpio_regmap *gpio;
>  	struct gpio_chip *chip;
>  	int ret;

>  #ifdef CONFIG_REGMAP_IRQ
>  	if (config->regmap_irq_chip) {
> +		struct irq_domain *irq_domain;
> +
>  		gpio->regmap_irq_line = config->regmap_irq_line;
>  		ret = regmap_add_irq_chip_fwnode(dev_fwnode(config->parent), config->regmap,
>  						 config->regmap_irq_line, config->regmap_irq_flags,
> @@ -420,12 +427,15 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
>  			goto err_remove_gpiochip;
>  
>  		irq_domain = regmap_irq_get_domain(gpio->irq_chip_data);
> +		if (irq_domain) {
> +			ret = gpiochip_irqchip_add_domain(chip, irq_domain);
> +			if (ret)
> +				goto err_remove_gpiochip;
> +		}
>  	} else
>  #endif
> -	irq_domain = config->irq_domain;
> -
> -	if (irq_domain) {
> -		ret = gpiochip_irqchip_add_domain(chip, irq_domain);
> +	if (config->irq_domain) {
> +		ret = gpiochip_irqchip_add_domain(chip, config->irq_domain);
>  		if (ret)
>  			goto err_remove_gpiochip;
>  	}

I do not understand how it's different from the original one. Can you elaborate?

-- 
With Best Regards,
Andy Shevchenko



