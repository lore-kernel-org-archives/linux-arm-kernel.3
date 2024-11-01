Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319DEE6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPHPOhW9HUBF4EAgD2hHEl89Ml4qq1QzyjIJ4lZA8VU=; b=nVQHvAprqHEeIkxQwg+zJQDmHM
	mUAVxBtDDZcsu0bD5Gqnnfx6LZJJ5g/uhL7f7WB8i8Ll7WAcOOUlA80uGOXajzDAPIIXdsoGvV2Gi
	w2LQi6c0vej4VAQWI5CnsSUr2EvExNQalb9styMMuQ8wgyjx0fhjVhxKs8epK/eEr/I9MVPfVQxAJ
	lSoik9NoVe3LCXy2Zx99M+WOL5q7+BXZ3IteIliLgG7n2NxDkp5xucgZrH2dVofsvZMjpuuRguTHd
	qn7qFE+ZkdNs4W46KnmGBFCrEVvr3KlCrbLCNqVeJ3V3Y80J+skmmmGlDL6AOkhS+ddGfYX/k1ZEp
	F5/DF3cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uGD-00000007cdy-1Oam;
	Fri, 01 Nov 2024 16:12:29 +0000
Received: from smtp-82.smtpout.orange.fr ([80.12.242.82] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6u3i-00000007aGE-1l6c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:59:37 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 6u3ZtHqXNH3SU6u3ZtLSD5; Fri, 01 Nov 2024 16:59:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1730476768;
	bh=OPHPOhW9HUBF4EAgD2hHEl89Ml4qq1QzyjIJ4lZA8VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=iPUnZ8bsHVrouKOtqJuIaZT9mlO0HzGTPoMPj1s2yuM7ms6mOg1moCSuWZku7Ndwd
	 jVvaMAENZvOrBkCGLorHATLAAPE6NlDfdntZ/qDdho1yOfACdoBrRqASevzKgLALSM
	 BwHgW4OJGsJTjXJhY9j/3yFgXkQy2JwkIa5/YVqIy6++dEH7a/qKYfrrjuPoVl5cXj
	 j4BXOjPqvwWLbR1y81ZcWdy9Uac4kiVk6xFgVLeEmzzp7W1aJAWjSi5alIw/pc53tW
	 m4RJNOq5bexSI9JFbWxfbVKaIa40QZ76aXuFzifXUTnSDZI95RWCdQmZ+N3+ol/neF
	 kxZXn8wK1zuEA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 01 Nov 2024 16:59:28 +0100
X-ME-IP: 90.11.132.44
Message-ID: <9bf24861-f792-4315-9492-e71f7d9c457f@wanadoo.fr>
Date: Fri, 1 Nov 2024 16:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] spi: apple: Add driver for Apple SPI controller
To: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20241101-asahi-spi-v2-0-763a8a84d834@jannau.net>
 <20241101-asahi-spi-v2-2-763a8a84d834@jannau.net>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241101-asahi-spi-v2-2-763a8a84d834@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_085935_834040_D32137FD 
X-CRM114-Status: GOOD (  23.33  )
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

Le 01/11/2024 à 15:25, Janne Grunau via B4 Relay a écrit :
> From: Hector Martin <marcan-WKacp4m3WJJeoWH0uzbU5w@public.gmane.org>
> 
> This SPI controller is present in Apple SoCs such as the M1 (t8103) and
> M1 Pro/Max (t600x). It is a relatively straightforward design with two
> 16-entry FIFOs, arbitrary transfer sizes (up to 2**32 - 1) and fully
> configurable word size up to 32 bits. It supports one hardware CS line
> which can also be driven via the pinctrl/GPIO driver instead, if
> desired. TX and RX can be independently enabled.
> 
> There are a surprising number of knobs for tweaking details of the
> transfer, most of which we do not use right now. Hardware CS control
> is available, but we haven't found a way to make it stay low across
> multiple logical transfers, so we just use software CS control for now.
> 
> There is also a shared DMA offload coprocessor that can be used to handle
> larger transfers without requiring an IRQ every 8-16 words, but that
> feature depends on a bunch of scaffolding that isn't ready to be
> upstreamed yet, so leave it for later.
> 
> The hardware shares some register bit definitions with spi-s3c24xx which
> suggests it has a shared legacy with Samsung SoCs, but it is too
> different to warrant sharing a driver.
> 
> Signed-off-by: Hector Martin <marcan-WKacp4m3WJJeoWH0uzbU5w@public.gmane.org>
> Signed-off-by: Janne Grunau <j@jannau.net>

Hi,

a few nitpicks, if they make sense to you or in case of v3.


> +static int apple_spi_probe(struct platform_device *pdev)
> +{
> +	struct apple_spi *spi;
> +	int ret, irq;
> +	struct spi_controller *ctlr;
> +
> +	ctlr = devm_spi_alloc_master(&pdev->dev, sizeof(struct apple_spi));
> +	if (!ctlr)
> +		return dev_err_probe(&pdev->dev, -ENOMEM, "out of memory\n");

Usually, no message is needed, because kmalloc like functions are 
already verbose.

> +
> +	spi = spi_controller_get_devdata(ctlr);
> +	init_completion(&spi->done);
> +	platform_set_drvdata(pdev, ctlr);
> +
> +	spi->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(spi->regs))
> +		return PTR_ERR(spi->regs);
> +
> +	spi->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(spi->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(spi->clk),
> +				     "Unable to find or enable bus clock\n");
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(&pdev->dev, irq, apple_spi_irq, 0,
> +			       dev_name(&pdev->dev), spi);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Unable to bind to interrupt\n");
> +
> +	ctlr->dev.of_node = pdev->dev.of_node;
> +	ctlr->bus_num = pdev->id;
> +	ctlr->num_chipselect = 1;
> +	ctlr->mode_bits = SPI_CPHA | SPI_CPOL | SPI_LSB_FIRST;
> +	ctlr->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 32);
> +	ctlr->flags = 0;

Nitpick: not needed, the memory if already zeroed.

> +	ctlr->prepare_message = apple_spi_prepare_message;
> +	ctlr->set_cs = apple_spi_set_cs;
> +	ctlr->transfer_one = apple_spi_transfer_one;
> +	ctlr->auto_runtime_pm = true;
> +
> +	pm_runtime_set_active(&pdev->dev);
> +	devm_pm_runtime_enable(&pdev->dev);

There could be an error handling, or if intentional, maybe a (void) or a 
comment to show the intent.

> +
> +	apple_spi_init(spi);
> +
> +	ret = devm_spi_register_controller(&pdev->dev, ctlr);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "devm_spi_register_controller failed\n");
> +
> +	return 0;
> +}

...

CJ

