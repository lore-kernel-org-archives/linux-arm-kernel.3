Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38C4E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 07:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRkqo2vCIPvvfZ0H7gNeIfyEHMp6dUwFO/jiGLyMtk4=; b=z3OhMLextDgj9KLHeySAx5qZhj
	Bgup0tcB5Tj4u04iDFbYyFr3wgRlDzOjJ2VXCzOq6nCaUjF9W6WwgveiUkTusm2gwpY2sxRit8fAN
	lvojj5dDs3GnEirjBcyle0TqPOUoVKq0iztQGQgJTBWQPYgyl5q9B7ZaGKs3MsXTYSTZKvwYDFOEd
	IjkX4iHSkpPTUPPFW+uthtlI9zJAUBCJaZY6Cdekqu4suB1JKU2tGePKswENpLWZAv6+5c48N6U1m
	eZPnVNM+FStm0E05EDtZEeLXhNjfPwJVqv8hKLckDfP8nJtctXDrmtGMXFUarNpPzgiU+QN0BQSpk
	FDcYCatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMjUY-00000007aWq-32zU;
	Sun, 15 Dec 2024 07:56:42 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMjTT-00000007aR5-169I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 07:55:36 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1734249330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DRkqo2vCIPvvfZ0H7gNeIfyEHMp6dUwFO/jiGLyMtk4=;
	b=X6AZtEw3uOUVXCqCpY7rs27S3+N+fxh8zEMtymDE8HRrcBhG53znRlgQ585GWGJSIa7Xoi
	Svayph6Hw6SkLBQVcMg47Rq5NvI3HJL10ZTyFGT3DimEuOoxkp8Mksnr2dPu2PBEhRbJRy
	b+66vVyLT0MQ6coKyGc9eYMPezf89OryOrg4uTTvo+qlG22EBzqFe67sN8XssHuIW/avr2
	xsBn2maD46Z3WxXmaAxE7osGkEk+pYUr0okIBsNKRN2BUR4RwUs0eQf+FNfdy9slpWWmMS
	x1F5J6JfeOq+Yol/5ruSe+3i13ICfcr96Rc6NHWnVqGBB7b8OlLpEDtSTalKMg==
Date: Sun, 15 Dec 2024 08:55:27 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman Beranek
 <me@crly.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and
 PLL_MIPI
In-Reply-To: <20241215053639.738890-2-anarsoul@gmail.com>
References: <20241215053639.738890-1-anarsoul@gmail.com>
 <20241215053639.738890-2-anarsoul@gmail.com>
Message-ID: <1f400eec0f0583335ad8b40fcbf1b5d4@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_235535_490027_B5AE331A 
X-CRM114-Status: GOOD (  11.76  )
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

Hello Vasily,

On 2024-12-15 06:34, Vasily Khoruzhick wrote:
> These will be used to explicitly select TCON0 clock parent in dts
> 
> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in 
> TCON0 mux")
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>

Looking good to me, as a preparatory patch.  Please feel free
to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
>  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
> b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
> index a8c11c0b4e06..dfba88a5ad0f 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
> @@ -21,7 +21,6 @@
> 
>  /* PLL_VIDEO0 exported for HDMI PHY */
> 
> -#define CLK_PLL_VIDEO0_2X		8
>  #define CLK_PLL_VE			9
>  #define CLK_PLL_DDR0			10
> 
> @@ -32,7 +31,6 @@
>  #define CLK_PLL_PERIPH1_2X		14
>  #define CLK_PLL_VIDEO1			15
>  #define CLK_PLL_GPU			16
> -#define CLK_PLL_MIPI			17
>  #define CLK_PLL_HSIC			18
>  #define CLK_PLL_DE			19
>  #define CLK_PLL_DDR1			20
> diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h
> b/include/dt-bindings/clock/sun50i-a64-ccu.h
> index 175892189e9d..4f220ea7a23c 100644
> --- a/include/dt-bindings/clock/sun50i-a64-ccu.h
> +++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
> @@ -44,7 +44,9 @@
>  #define _DT_BINDINGS_CLK_SUN50I_A64_H_
> 
>  #define CLK_PLL_VIDEO0		7
> +#define CLK_PLL_VIDEO0_2X	8
>  #define CLK_PLL_PERIPH0		11
> +#define CLK_PLL_MIPI		17
> 
>  #define CLK_CPUX		21
>  #define CLK_BUS_MIPI_DSI	28

