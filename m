Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F033C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 21:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+FCVvhI3Xheokbmt2/UdTHQUuxm0dysdqGb3CqIcBo=; b=FcOax3m4GKZFY9ml+v8WOj/GI2
	hJ/Gqlz2YSlVrhNf8dtlCWtJEQfHbobPfsKN8/+mWEU7WYSHagzH7Dde3t4uvTcJ2iUjQM9X9vKrS
	dulaB9EmDHnES7DIys3DI/eEEJAQkoigrrmRwAA6NEDVQeP//1KHOtept8Jbrrc2/uLJraBB74cM7
	8psi7d1swlIYMy5RGQPqULjzDi+stPDDtms54KzH3iVjrkHASogQmbZsX7jQ9QrvD8nfZho5vLGfI
	pfeeC7nzBUgaoRtLrX9IdAVJj2gJcDuF9f56/GmD2jY5dk4KmKzFPiekOaiDl3tbt1te4N0JFkQ41
	jLB2bUFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpBUG-00000008yst-1aml;
	Wed, 29 Jul 2026 21:06:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpBUF-00000008ysn-0lTe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 21:06:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FF1F6004E;
	Wed, 29 Jul 2026 21:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0641F000E9;
	Wed, 29 Jul 2026 21:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785359205;
	bh=7+FCVvhI3Xheokbmt2/UdTHQUuxm0dysdqGb3CqIcBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IU1ZOudVvxPdWnp1DPRNuIk8LrhrFjyL6heQEcgdMHrqZu2ZHxDPsLsRHugbCbxHg
	 BLua11y1f68ZEwt8a5rYDZfsB+PpaZGCLCYeJBOCBLXofequouIJr3rQHrkpHY58ER
	 VPWK6VDyKrQsA81yAi/Su0JWhGVQnZLcIabB/PldOfq80ers9sRkKAHOpiEaqLrKAt
	 YKoU4bRiM27NGLG5vVwL+eWjip40D61q5xvabdhf+DhD/GGedgiOsbTOkpM8ck8ZwJ
	 DfSH5l/Sw1UiX0jKJeGFVBvJZyI0gRgULNvB2a+scepCPtEE7bahaHxiuXTQ1BW/qQ
	 EZ9AdpkzebQGw==
Date: Wed, 29 Jul 2026 23:06:40 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v7 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
Message-ID: <ampnhe-GqNoQwmJZ@zenone.zhora.eu>
References: <20260727081859.1737223-1-zychennvt@gmail.com>
 <20260727081859.1737223-3-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727081859.1737223-3-zychennvt@gmail.com>
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

> +static void ma35d1_i2c_stop(struct ma35d1_i2c *i2c, int ret)
> +{
> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STO_SI);

I think there is a valid review from sashiko here.

> +	if (ret)
> +		i2c->err = ret;
> +
> +	ma35d1_i2c_controller_complete(i2c);
> +}

...

> +static irqreturn_t ma35d1_i2c_irq(int irqno, void *dev_id)
> +{
> +	struct ma35d1_i2c *i2c = dev_id;
> +	unsigned long status;
> +
> +	status = readl(i2c->regs + MA35_STATUS0);
> +
> +	if (status == MA35_BUS_ERROR) {
> +		dev_err(i2c->dev, "Bus error during transfer\n");
> +		ma35d1_i2c_stop(i2c, -EIO);
> +		goto out;
> +	}
> +
> +	if (ma35d1_is_controller_status(status))
> +		ma35d1_i2c_irq_controller_trx(i2c, status);
> +	else
> +		ma35d1_i2c_irq_target_trx(i2c, status);

Why are these functions void? We should at least print an error
in case of failures.

> +
> +out:
> +	return IRQ_HANDLED;
> +}

...

> +static int ma35d1_i2c_probe(struct platform_device *pdev)
> +{
> +	struct ma35d1_i2c *i2c;
> +	struct resource *res;
> +	int ret, clkdiv;
> +	u32 val;
> +	unsigned int busfreq;

you can immediately initialize busfreq here.

> +	struct device *dev = &pdev->dev;

nit: can you please sort the declaration by line length, in a
reverse christmast tree shape?

> +	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;

...

> +	ret = devm_add_action_or_reset(dev, ma35d1_i2c_pm_cleanup, dev);
> +	if (ret)
> +		goto rpm_put;
> +
> +	writel(MA35_CTL_I2CEN | MA35_CTL_INTEN, i2c->regs + MA35_CTL0);
> +	writel(FIELD_PREP(MA35_CLKDIV_MSK, clkdiv), i2c->regs + MA35_CLKDIV);
> +
> +	ret = devm_request_irq(dev, i2c->irq, ma35d1_i2c_irq, 0, dev_name(dev),
> +			       i2c);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "cannot claim IRQ %d\n", i2c->irq);
> +		goto rpm_put;

The actions in rpm_put are executed twice, considering
devm_add_action_or_reset.

Thanks,
Andi

> +	}

