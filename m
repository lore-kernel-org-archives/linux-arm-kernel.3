Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F053606D835
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hwyh9Mqj;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Tv+VOjuX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kll/G1zD/C2JyZu7pxNelwTrLUBWbNvvxhXCfrLDdII=; b=hwyh9Mqj3J6zVKKeDwSW6uayX6
	/3qFp3yfLwAXsU/Ps/Vzlqv4C/VqDQVn2J8oBG+R3JA3NmfDAh9/ilgJcm8qDXbNshJRW2ofc+nLT
	tcbXi5rAW5AqjW88Ijm1g3K6D3whPFLuqpZtYTA7Uu1JoKD7da/6chZ70czGUyzMJntjqu3e6K4CD
	wPrDslZZAbZ/cI8vuHAEzKob+nAoC/DOaGXPt3N84EJWlztX2A0WSeyLDZHhuxZrSHkwBD2hnL9aP
	y812CGwFxmc6hetHS6iRnYrtxdIMk5zOEe2bDx7g6usXSRA6wIeZ1BLvNKkyLDRCcG5Q2IjtybU1O
	OP7OT/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg6y-00000006SSr-48A6;
	Wed, 04 Nov 2026 18:53:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg6v-00000006SS5-0p9o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:53:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A71331A1451;
	Wed,  4 Nov 2026 18:53:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6714A60770;
	Wed,  4 Nov 2026 18:53:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C414410329205;
	Wed,  4 Nov 2026 19:53:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793818395; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=kll/G1zD/C2JyZu7pxNelwTrLUBWbNvvxhXCfrLDdII=;
	b=Tv+VOjuXj3AH4ln4E3aXj4PZMQKql3KWSZmz2mqRiK+jgYCiAKLyFxJvFwNFzOT2mtfa/p
	/bx6al1jJJa+bZV3C/HjKYVwdSHnNj8K+VmDEMZY3OlMMIZEFHnds8sgV9MHo+HHCYtDbn
	x70RoP2HsMme65Nfa8ffeM8rDHEGo3j2+2HSbRpN6yCyuTlkgd0HG3FUPB2K32I/sVrj1A
	QtaakxhrG4MI4ibpZz6wPkLdC3Y5lwyrVFf/Ha/JM1zFsyvQeTFeUDZjjKHvUFr+l7oMnW
	YRz4CV1SlYuEY/gOOB+7jtEAUBx2umSS15PswdMcUJmkil+id0WtdNn/3JwwbA==
Date: Wed, 4 Nov 2026 19:53:08 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Mark Brown <broonie@kernel.org>, Andy Gross <andy.gross@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] memory: atmel-ebi: Disable SMC clock on probe failure
Message-ID: <20261104185308b845fb6d@mail.local>
References: <20261101190733.121473-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101190733.121473-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105325_766146_120EA521 
X-CRM114-Status: GOOD (  24.52  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 01/11/2026 20:07:34+0100, Krzysztof Kozlowski wrote:
> Unprepare and drop the SMC clock reference, if probe fails to avoid
> resource leakage e.g. during probe deferral.
> 
> There is no remove() callback, presumably on purpose so only error paths
> are handled.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 87108dc78eb8 ("memory: atmel-ebi: Enable the SMC clock if specified")
> Reported-by: Wentao Liang <vulab@iscas.ac.cn>
> Closes: https://lore.kernel.org/all/20260917101623.2146392-1-vulab@iscas.ac.cn/
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-8e236c81-01b2-4274-a213-11c3f31acfc2
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> I independently developed the patch and then checked the queue with
> pending work of iscas. That one has issues and other complains from me,
> so only credits for the report.
> 
> Changes in v2:
> 1. Handle of_platform_populate() error.
> ---
>  drivers/memory/atmel-ebi.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
> index 1e8e8aba2542..7dc2f7add1b1 100644
> --- a/drivers/memory/atmel-ebi.c
> +++ b/drivers/memory/atmel-ebi.c
> @@ -562,7 +562,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
>  	}
>  	ret = clk_prepare_enable(ebi->smc.clk);
>  	if (ret)
> -		return ret;
> +		goto err_put_clk;
>  

Couldn't we simply devm_clk_get_enabled() ?

>  	/*
>  	 * The sama5d3 does not provide an EBICSA register and thus does need
> @@ -572,14 +572,16 @@ static int atmel_ebi_probe(struct platform_device *pdev)
>  		ebi->regmap =
>  			syscon_regmap_lookup_by_phandle(np,
>  							ebi->caps->regmap_name);
> -		if (IS_ERR(ebi->regmap))
> -			return PTR_ERR(ebi->regmap);
> +		if (IS_ERR(ebi->regmap)) {
> +			ret = PTR_ERR(ebi->regmap);
> +			goto err_disable_clk;
> +		}
>  	}
>  
>  	ret = of_property_read_u32(np, "#address-cells", &val);
>  	if (ret) {
>  		dev_err(dev, "missing #address-cells property\n");
> -		return ret;
> +		goto err_disable_clk;
>  	}
>  
>  	reg_cells = val;
> @@ -587,7 +589,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
>  	ret = of_property_read_u32(np, "#size-cells", &val);
>  	if (ret) {
>  		dev_err(dev, "missing #address-cells property\n");
> -		return ret;
> +		goto err_disable_clk;
>  	}
>  
>  	reg_cells += val;
> @@ -603,11 +605,22 @@ static int atmel_ebi_probe(struct platform_device *pdev)
>  
>  			ret = atmel_ebi_dev_disable(ebi, child);
>  			if (ret)
> -				return ret;
> +				goto err_disable_clk;
>  		}
>  	}
>  
> -	return of_platform_populate(np, NULL, NULL, dev);
> +	ret = of_platform_populate(np, NULL, NULL, dev);
> +	if (ret)
> +		goto err_disable_clk;
> +
> +	return 0;
> +
> +err_disable_clk:
> +	clk_disable_unprepare(ebi->smc.clk);
> +err_put_clk:
> +	clk_put(ebi->smc.clk);
> +
> +	return ret;
>  }
>  
>  static __maybe_unused int atmel_ebi_resume(struct device *dev)
> -- 
> 2.53.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

