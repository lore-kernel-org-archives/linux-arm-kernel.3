Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8CF607635C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 19:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KaattYwq;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BSj8IZT7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yWX9HzorOqGIhuw+UhmBUEbF43oZfzZ1Cb6+mPXskkk=; b=KaattYwqzqVAYNDwbgSDrThmGV
	XZ/EIYGu4645RwVKhMS5wO9H9OuhKCO/9MxP+hlcve3c9MA5B371y33J5TyKExGXbMjH1HJ56tCGq
	qka+lPAgW8Xy2Daityzd9oCEDzskF32HXpTN2URcU1vXjqcwHxh7pVV8d7HOMUg+umrNDZamiuJIu
	HXK/or8LXky/P4XK0E7qBOZEH/xcnxNf9J3GNRe2rRjlvdbq6Lk/DM06L35Iz3JWsjznsbZtcyxgK
	vWTPRCylKQB1C/sbBh9IeSmARM3ODDsiHo7p8SEwIYm3GoHgcMTM46QnyA1NcaNd27B23sxUCBWER
	P5S7tOlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgg9-00000006dOE-2xy1;
	Wed, 04 Nov 2026 19:29:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgg6-00000006dMY-1Ygl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 19:29:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 624131A1454;
	Wed,  4 Nov 2026 19:29:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3180160770;
	Wed,  4 Nov 2026 19:29:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1B4410329206;
	Wed,  4 Nov 2026 20:29:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793820582; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=yWX9HzorOqGIhuw+UhmBUEbF43oZfzZ1Cb6+mPXskkk=;
	b=BSj8IZT7vEM8sPwRrBbpYMSNZS4utcQHBp7d60z3/cZn1wUBZnl2jwSztI087/32KR6k+R
	84GtoqcAny7uqt+Hzfi7lMiU+JieyMXUFHcDqS9JUm1ESOLCZl6YqoVlngEFoPZiC0+Z6q
	LskGLvs7rRGF3z04Gw7Bud5lUEdBYeEQ5sAKKTLPNY21osBMUJtfzi5vU5AgXOnlCnEqcF
	KJaO0pr/lzp6lh66c160vcYixvk+TC1ikWwkwXeMKVKbmAVovJzyW+tqXS88s/uT6VkH09
	B+orPWf9BVprThZH/+OjxxslO2GyC7dH55CL5pSRSRcwFy0msbA535tHIvyn2w==
Date: Wed, 4 Nov 2026 20:29:35 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
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
Message-ID: <20261104192935108e0e12@mail.local>
References: <20261101190733.121473-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261104185308b845fb6d@mail.local>
 <c4eb1d41-8b61-4aca-abad-22cb61a4415e@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4eb1d41-8b61-4aca-abad-22cb61a4415e@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_112946_552265_6C1CAA82 
X-CRM114-Status: GOOD (  22.41  )
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

On 04/11/2026 19:59:45+0100, Krzysztof Kozlowski wrote:
> On 04/11/2026 19:53, Alexandre Belloni wrote:
> > Hi,
> > 
> > On 01/11/2026 20:07:34+0100, Krzysztof Kozlowski wrote:
> >> Unprepare and drop the SMC clock reference, if probe fails to avoid
> >> resource leakage e.g. during probe deferral.
> >>
> >> There is no remove() callback, presumably on purpose so only error paths
> >> are handled.
> >>
> >> Cc: <stable@vger.kernel.org>
> >> Fixes: 87108dc78eb8 ("memory: atmel-ebi: Enable the SMC clock if specified")
> >> Reported-by: Wentao Liang <vulab@iscas.ac.cn>
> >> Closes: https://lore.kernel.org/all/20260917101623.2146392-1-vulab@iscas.ac.cn/
> >> Reported-by: Sashiko <sashiko-bot@kernel.org>
> >> Closes: https://sashiko.dev/#/bug/linux-8e236c81-01b2-4274-a213-11c3f31acfc2
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>
> >> ---
> >>
> >> I independently developed the patch and then checked the queue with
> >> pending work of iscas. That one has issues and other complains from me,
> >> so only credits for the report.
> >>
> >> Changes in v2:
> >> 1. Handle of_platform_populate() error.
> >> ---
> >>  drivers/memory/atmel-ebi.c | 27 ++++++++++++++++++++-------
> >>  1 file changed, 20 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
> >> index 1e8e8aba2542..7dc2f7add1b1 100644
> >> --- a/drivers/memory/atmel-ebi.c
> >> +++ b/drivers/memory/atmel-ebi.c
> >> @@ -562,7 +562,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
> >>  	}
> >>  	ret = clk_prepare_enable(ebi->smc.clk);
> >>  	if (ret)
> >> -		return ret;
> >> +		goto err_put_clk;
> >>  
> > 
> > Couldn't we simply devm_clk_get_enabled() ?
> It is not this device's clock. Is there devm_clk_get_enabled() variant
> which takes from other node?

Right! Not that I know of.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>


> 
> Best regards,
> Krzysztof

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

