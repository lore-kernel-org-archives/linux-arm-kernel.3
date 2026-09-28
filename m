Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2281C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrvuQ5S7vUig/3iGGMMV/FCD0w6ruETLjU2iIyssM5Q=; b=GOWyL9VsJMNV0ndyjPSiy+4zsT
	O6XvrINnY3fd6blUKLQCNGTFw8PuUX30SVMN7NY7lcVAeMv0Jf99XOH53pGWqnFaVcNfugVjyEiwP
	rLGciZsgWFtPayETPo24vBiUJ0hiwX+Sju24Z0U+z7KEJG4OrqdA9EvhlTIGDazyjM7ycRJmiEXG5
	who9cObWdzbSvRi2t/V0dFBakjS4aEsWIrYlENBm4iJcFwCQcz01ox4/x6tq1mAjzMYLO4tzGIMPi
	FvEFq6NwzaYUgdhOm8PBnGFADDABPyEzh6HPoW7wYXFUu+bnvxQQxY9FsAvf4G7EV3A5DVXqdPzUR
	ggkUKkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAP7-00000000XrA-0vhM;
	Mon, 28 Sep 2026 12:24:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAP5-00000000Xqz-3ji0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 12:24:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B66E411AD;
	Mon, 28 Sep 2026 12:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE86F1F00893;
	Mon, 28 Sep 2026 12:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790598259;
	bh=XrvuQ5S7vUig/3iGGMMV/FCD0w6ruETLjU2iIyssM5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QLRpJa7ihe8BNoFi0vwJrxl93TUD/Y2GHFKJv9EZpkAA4ypzjyuZwg9Vp9WGJ/tMz
	 yUywzyXXA2WUcgAxgZRntBsGwVrs72XaWlatZ6yJEZ/+JHnzXuRiwxfHumQHIRE7K9
	 iUNoRiLAXQwuXZl8Fgn9snkloAK5dKCjZbtGkgTzANsrH90SVosilLNChjexSETemE
	 akNF7SyXnho96J4elepwaYMd4sXTgC8HUvnQ0TbUFWDmrt2c5t+QeT461ij8tt7xkC
	 TSrdlfCxsAYNwjV7+xVDUoXqt91X+3+u/VKxxvlde1iYsd+iI3ymosiypnKRzFnFut
	 X5SloFiPx8uxQ==
Date: Mon, 28 Sep 2026 14:24:16 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v10 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
Message-ID: <aro-QitaRwK87gdO@zenone.zhora.eu>
References: <20260921083753.1109826-1-zychennvt@gmail.com>
 <20260921083753.1109826-3-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921083753.1109826-3-zychennvt@gmail.com>
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

Hi Zi-Yu,

...

> +/* Constants */
> +#define MA35_CLKDIV_MSK		GENMASK(9, 0)
> +#define I2C_PM_TIMEOUT_MS	5000
> +#define STOP_TIMEOUT_MS		50

these two defines are the only ones without the MA35 prefix.

...

> +static irqreturn_t ma35d1_i2c_irq_target_trx(struct ma35d1_i2c *i2c,
> +					     unsigned long i2c_status)
> +{
> +	unsigned char byte = 0;
> +
> +	switch (i2c_status) {
> +	case MA35_S_RECE_ARB_LOST:
> +		/*
> +		 * Arbitration lost during address transmission phase.
> +		 * The hardware switches to Target Transmitter mode when
> +		 * our own SLA+W is detected on the bus.
> +		 */
> +		i2c->err = -EAGAIN;
> +		ma35d1_i2c_controller_complete(i2c);
> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);

All the return values of these i2c_slave_event()'s are ignored.

> +		break;
> +
> +	case MA35_S_RECE_ADDR_ACK:
> +		/* Own SLA+W has been receive; ACK has been return */
> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);
> +		break;
> +
> +	case MA35_S_TRAN_DATA_NACK:
> +	case MA35_S_RECE_DATA_NACK:
> +		/*
> +		 * Data byte or last data in I2CDAT has been transmitted and NACK received,
> +		 * or previously addressed with own SLA address and NACK returned.
> +		 */
> +		break;
> +

...

> +	default:
> +		dev_err(i2c->dev, "Status 0x%02lx is NOT processed\n",
> +			i2c_status);
> +		ma35d1_i2c_restore_idle(i2c);
> +		return IRQ_NONE;
> +	}
> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI_AA);

As far as I understood, this this is an unconditional ACK enabled
for the next bytes received, right? In that case are we ignoring
failed communications as above where we are supposed to send
NACKs?

> +	return IRQ_HANDLED;
> +}

...

> +	i2c->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(i2c->regs))
> +		return PTR_ERR(i2c->regs);
> +
> +	i2c->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(i2c->rst))
> +		return dev_err_probe(dev, PTR_ERR(i2c->rst),
> +				     "failed to get reset control\n");
> +
> +	ret = reset_control_deassert(i2c->rst);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert reset line\n");
> +
> +	/* Setup info block for the I2C core */
> +	strscpy(i2c->adap.name, "ma35d1-i2c", sizeof(i2c->adap.name));
> +	i2c->adap.owner = THIS_MODULE;
> +	i2c->adap.algo = &ma35d1_i2c_algorithm;
> +	i2c->adap.quirks = &ma35d1_i2c_quirks;
> +	i2c->adap.retries = 2;
> +	i2c->adap.algo_data = i2c;
> +	i2c->adap.dev.parent = &pdev->dev;
> +	i2c->adap.dev.of_node = pdev->dev.of_node;
> +	i2c_set_adapdata(&i2c->adap, i2c);
> +
> +	if (!device_property_read_u32(dev, "clock-frequency", &val)) {
> +		if (val != 0 && val <= MEGA)
> +			busfreq = val;
> +	}
> +	/* Calculate divider based on the current peripheral clock rate */
> +	clkdiv = DIV_ROUND_CLOSEST(clk_get_rate(i2c->clk), busfreq * 4) - 1;
> +	if (clkdiv < 0 || clkdiv > 0x3ff)
> +		return dev_err_probe(dev, -EINVAL, "invalid clkdiv value: %d\n",
> +				     clkdiv);
> +
> +	i2c->irq = platform_get_irq(pdev, 0);
> +	if (i2c->irq < 0)
> +		return dev_err_probe(dev, i2c->irq, "failed to get irq\n");
> +
> +	platform_set_drvdata(pdev, i2c);
> +
> +	pm_runtime_set_autosuspend_delay(dev, I2C_PM_TIMEOUT_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	ret = devm_add_action_or_reset(dev, ma35d1_i2c_pm_cleanup, dev);
> +	if (ret)
> +		return ret;

you are printing an error message everywhere, except of here.

> +
> +	writel(MA35_CTL_I2CEN | MA35_CTL_INTEN, i2c->regs + MA35_CTL0);
> +	writel(FIELD_PREP(MA35_CLKDIV_MSK, clkdiv), i2c->regs + MA35_CLKDIV);
> +
> +	ret = devm_request_irq(dev, i2c->irq, ma35d1_i2c_irq, 0, dev_name(dev),
> +			       i2c);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "cannot claim IRQ %d\n", i2c->irq);
> +		return ret;
> +	}
> +
> +	ret = devm_i2c_add_adapter(dev, &i2c->adap);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to add bus to i2c core\n");
> +		return ret;

return dev_err_probe(...)

Thanks,
Andi

> +	}
> +
> +	dev_info(&i2c->adap.dev, "%pa MA35D1 I2C adapter registered\n",
> +		 &res->start);
> +	return 0;
> +}

