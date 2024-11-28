Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95185D690E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 07:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoG8SgndLKsfnHcsX9KenvognL0Wa8mDSUjeF58ZhfI=; b=CUWEwxGhMOXtVe2zK9JdT9PGLT
	007Cy1ac5RvzWu9RFl9cjJmppDSO+y8AnK9dpFWVJc24V+Q5rzqI310/WnPtT9MmBG9jB0m6osYWO
	5RCkzomV8DY3H8T5681BAq/kSJ6vsW+8Wb/8fx6KRU+jmmTxNfTD/dvFMTCqXbWN292jcynPJgdGZ
	mEj1La/sY6cPgSTI7cX6Uu8MUw3f7vQ1J64/VRM60u22JUlXqAYP3OP+vU97Q8asu4Ds0lI8gC6Bq
	dvHIPniCB0s67XCmkLlTjeXVH9ij3ObXhapceP9kbHqGRdi62ejiK1jHxONXCvYJmJVA4cQ29z7Ys
	F10XkmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGYye-0000000Esxj-3DwH;
	Thu, 28 Nov 2024 07:30:16 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGYxf-0000000EsrJ-3rNd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 07:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=eoG8SgndLKsfnHcsX9KenvognL0Wa8mDSUjeF58ZhfI=; b=SM2Bnz0v8vH9gaihAjPdeFB9dy
	83Y67OwyN5Y1wrJeu2SAdnFNtJazbncNz8LdA+F4YEP4OhizrWMOjbDh+BfnAX1+YVnsWiizvnsZF
	frFcXF9wOUS80cswWG7WzyPjiiRMEopS5/GsFsA5E8b6r4IJ3HP/deoyk3NjjTB3pLFTQOpFYD7fe
	f2mhEf6MADLclsaJmQl2Ydo6F4Hn/p5Rdx53ywLXc1kaYqWdHsX/2vXZY5xCu8Dw/lQdDeD8p7DAZ
	/GLJVcgRB+B8eswMZlF2gYaiLR3W6jHOAFp9ngfO5UWLvrJKwe1RVXOwYih9eai23iER6YoPjCLni
	E24tSAMA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tGYxV-0005qs-Fj; Thu, 28 Nov 2024 08:29:05 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tGYxU-0000Zd-3A;
	Thu, 28 Nov 2024 08:29:05 +0100
From: Esben Haabendal <esben@geanix.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org,  linux-arm-kernel@lists.infradead.org,
  imx@lists.linux.dev,  kernel@pengutronix.de,  linux@roeck-us.net,  Fabio
 Estevam <festevam@denx.de>
Subject: Re: [PATCH] ARM: imx: defconfig: Explicitly select CONFIG_PINCTRL
In-Reply-To: <20241126194146.1193094-1-festevam@gmail.com> (Fabio Estevam's
	message of "Tue, 26 Nov 2024 16:41:46 -0300")
References: <20241126194146.1193094-1-festevam@gmail.com>
Date: Thu, 28 Nov 2024 08:29:04 +0100
Message-ID: <87ttbr6clb.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27470/Wed Nov 27 10:59:44 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_232915_954078_B11801F0 
X-CRM114-Status: GOOD (  13.34  )
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

Fabio Estevam <festevam@gmail.com> writes:

> From: Fabio Estevam <festevam@denx.de>
>
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
>
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.
>
> Fix it by selecting CONFIG_PINCTRL inside the affected defconfigs.
>
> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net/
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Esben Haabendal <esben@geanix.com>

> ---
>  arch/arm/configs/imx_v4_v5_defconfig | 1 +
>  arch/arm/configs/imx_v6_v7_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
> index 875c8cdbada7..1af29d12129d 100644
> --- a/arch/arm/configs/imx_v4_v5_defconfig
> +++ b/arch/arm/configs/imx_v4_v5_defconfig
> @@ -83,6 +83,7 @@ CONFIG_I2C_IMX=y
>  CONFIG_SPI=y
>  CONFIG_SPI_IMX=y
>  CONFIG_SPI_SPIDEV=y
> +CONFIG_PINCTRL=y
>  CONFIG_GPIO_SYSFS=y
>  CONFIG_GPIO_MXC=y
>  CONFIG_W1=y
> diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
> index 0beecdde55f5..73f7aa7e75f7 100644
> --- a/arch/arm/configs/imx_v6_v7_defconfig
> +++ b/arch/arm/configs/imx_v6_v7_defconfig
> @@ -204,6 +204,7 @@ CONFIG_SPI_FSL_QUADSPI=y
>  CONFIG_SPI_GPIO=y
>  CONFIG_SPI_IMX=y
>  CONFIG_SPI_FSL_DSPI=y
> +CONFIG_PINCTRL=y
>  CONFIG_PINCTRL_IMX8MM=y
>  CONFIG_PINCTRL_IMX8MN=y
>  CONFIG_PINCTRL_IMX8MP=y

