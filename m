Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B59EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 07:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Coy02//KS7MYK7jX90haXrVAAKw75veVepRFuvAw9mQ=; b=vTGuDXvF4qPJcT0g04fP0QClj8
	igIvraR3ecQjga3BwBj4V1RGB288m1Tvyrm0eW5hZvcJ8ukOVMHWTFSAN5bXbTh3D9h283Wl4nq/x
	pUmzkUBl1O0lg3pRSEzwKI3ooGwp4MtzIhVACNIg4iX9cnOp7gWpXxXhRmlitEDwhw2FpPd/8Qyxn
	yK9FeGVBLB0xSYwLs8cV62HVJRYOq/WTJyX6bbK6YAmkINwKDIWeSBBmL1wTpC3wuUfaOZEdVWDrI
	ULOXBwBFn4q+Md9rF5bYQPIQXCErwNKyRRRlQrkp0eOKVZMscWDUtxMALNtSJhNixUVTgAet+CnzG
	UxNTZ+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW9tz-0000000ERwA-2lTv;
	Fri, 10 Jan 2025 07:57:55 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW9sm-0000000ERqP-2LqF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 07:56:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA47F1484594;
	Fri, 10 Jan 2025 08:56:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1736495797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Coy02//KS7MYK7jX90haXrVAAKw75veVepRFuvAw9mQ=;
	b=hCtfg57dLN+Tf8kjrLOlVV72y4rYNehARxRiXWkcOPcGRI4HFu/z7OyCg/BbOFCmrQ7aqW
	mW7I8eGfSWo7iwHoghbswWkUX+eZZ6Z24j1WG/zr4ETu5VDjgM/Vtwtt21790wS4t41Wo6
	BlSicHzLRm/rCzkhmrMWLpWBwfOltaQC+LYu8/iOH67JOztV6ZFxta9yFuVxSNtNAFKsgp
	55u6bt+Wm1MTofTcFMZeCW0XO8x10QX4dWoq+utfbDY4jR1CoQWWh668Y4rJQHGLcShByf
	LKoD+zUcraIQ0xD7rmKoKyPxgxKLmsYN8wC3+wRDDk5MGV9135zNZq1Byjl1dg==
Date: Fri, 10 Jan 2025 08:56:29 +0100
From: Alexander Dahl <ada@thorsis.com>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Subject: Re: [PATCH v3 2/2] spi: atmel-quadspi: Add support for sama7g5 QSPI
Message-ID: <20250110-paycheck-irregular-bcddab1276c7@thorsis.com>
Mail-Followup-To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
References: <20241128174316.3209354-1-csokas.bence@prolan.hu>
 <20241128174316.3209354-3-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241128174316.3209354-3-csokas.bence@prolan.hu>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_235641_063472_9C965657 
X-CRM114-Status: GOOD (  17.03  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Varshini Rajendran <varshini.rajendran@microchip.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

found another suspicious area regarding pm_runtime in
atmel_qspi_probe(), see below (irrelevant stuff dropped this time) …

Am Thu, Nov 28, 2024 at 06:43:15PM +0100 schrieb Csókás, Bence:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 

[…]

> @@ -726,18 +1411,32 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>  				"failed to enable the QSPI system clock\n");
>  			goto disable_pclk;
>  		}
> +	} else if (aq->caps->has_gclk) {
> +		/* Get the QSPI generic clock */
> +		aq->gclk = devm_clk_get(&pdev->dev, "gclk");
> +		if (IS_ERR(aq->gclk)) {
> +			dev_err(&pdev->dev, "missing Generic clock\n");
> +			err = PTR_ERR(aq->gclk);
> +			goto disable_pclk;
> +		}
> +	}
> +
> +	if (aq->caps->has_dma) {
> +		err = atmel_qspi_dma_init(ctrl);
> +		if (err == -EPROBE_DEFER)
> +			goto disable_qspick;
>  	}
>  
>  	/* Request the IRQ */
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
>  		err = irq;
> -		goto disable_qspick;
> +		goto dma_release;
>  	}
>  	err = devm_request_irq(&pdev->dev, irq, atmel_qspi_interrupt,
>  			       0, dev_name(&pdev->dev), aq);
>  	if (err)
> -		goto disable_qspick;
> +		goto dma_release;
>  
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
>  	pm_runtime_use_autosuspend(&pdev->dev);
> @@ -745,7 +1444,9 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>  	pm_runtime_enable(&pdev->dev);
>  	pm_runtime_get_noresume(&pdev->dev);
>  
> -	atmel_qspi_init(aq);
> +	err = atmel_qspi_init(aq);
> +	if (err)
> +		goto dma_release;

This error handling leads to unbalanced pm_runtime right?  The block
below rolls back pm_runtime before jumping to 'dma_release', this here
does not.

>  	err = spi_register_controller(ctrl);
>  	if (err) {
> @@ -753,13 +1454,16 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>  		pm_runtime_disable(&pdev->dev);
>  		pm_runtime_set_suspended(&pdev->dev);
>  		pm_runtime_dont_use_autosuspend(&pdev->dev);
> -		goto disable_qspick;
> +		goto dma_release;
>  	}

This hunk got it right?

>  	pm_runtime_mark_last_busy(&pdev->dev);
>  	pm_runtime_put_autosuspend(&pdev->dev);
>  
>  	return 0;
>  
> +dma_release:
> +	if (aq->caps->has_dma)
> +		atmel_qspi_dma_release(aq);
>  disable_qspick:
>  	clk_disable_unprepare(aq->qspick);
>  disable_pclk:
> @@ -768,6 +1472,44 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>  	return err;
>  }

I think this is another issue of forwarding porting.  The pm_runtime
stuff was added in mainline after the original patch was forked of,
and not entirely considered when porting?

Greets
Alex

