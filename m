Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA22CCA463
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 06:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktvi53IU3mbKmGya4FnS/Pieemw2knzJym2TO/2fBOM=; b=P2oE2ZXhVioSp+pkZ1OaU2mdNa
	db+spQNAsdloI89YK6sL1bJ4NI04zD5BT373u7QJzw4Dw4IbgtL6qBTZgv3qzNEys9eSuvoOtunxk
	4L8HNoclTYx5eO0NuwaJdGNEtduxa9tg6vnBNSgEBqcT3Ug1gLVL+T22ogHgiBpvicYVsbixxPMPZ
	hF4JgnySph3fUYeQC0Fzngu7ilUyFTBDCbjcYirmAUDVBuJWKd4pjIkAimOts8sZqyPUgYXMk0hQk
	nOzfiz8WD6Q6TUR7WvO3ZRgFwG2KjkH7IIQUjqEeZcyy4xGb1BD1mDXdsZtfVa8uc5VY5eQarTmfc
	O2Z1WdEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHyIg-00000004Uuz-3nnF;
	Sat, 17 Oct 2026 06:53:50 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHyIe-00000004Uue-2ZeI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 06:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=ktvi53IU3mbKmGya4FnS/Pieemw2knzJym2TO/2fBOM=; t=1792220028; x=1793429628; 
	b=feGOjuOWs5ksLC4Ik1sUr1GhtjNeed2Ui2WbpzzMiAN+D6PxwZpdvz+YoES2q375fxprYqgatrd
	httZi8JS+8J/ESPHlW7Fkl4u1ycYcN3eeiv1F+RHLPKrOQgdrjoiWt42AHX6g3KIfDe0rWBf+LwnB
	vLIAq/+b7RtHGpDGXLg+Wl37gNqn0AFI6eyB3nPPILmJ6ex7IdQNo59XKsbewdVdKXeHR14h4ywtU
	4AT1jFRXXjVnbX+PeRIWga5acJ7JE6bV6vmuqwgCx+cvhYSUaTrJYbGEBEmtF9at3KFPIfAFrHSi9
	dhfM2hCt4glkj9u0e5fSy9sSitWCk3ZVd/FA==;
Date: Sat, 17 Oct 2026 08:53:39 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Christopher Obbard
 <chris.obbard@oss.qualcomm.com>, Andrew Goodbody
 <andrew.goodbody@linaro.org>, Linus Walleij <linusw@kernel.org>, Rouven
 Czerwinski <rouven.czerwinski@linaro.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 01/10] ARM: ti81xx: Prevent USB being put into idle
Message-ID: <20261017085339.3533e9ab@kemnade.info>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-1-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
	<20261016-patch-ektor5-dm8168-dts-v1-1-b4ce30217028@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_235348_663629_3578C4D4 
X-CRM114-Status: GOOD (  17.91  )
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

On Fri, 16 Oct 2026 16:41:16 +0200
Ettore Chimenti <ettore.chimenti@linaro.org> wrote:

> From: Andrew Goodbody <andrew.goodbody@linaro.org>
> 
> There is an issue with USB being put into idle with DMA enabled and that
> is mostly prevented with usbcore.autosuspend=-1 on the kernel command
> line. Stop the ti,hwmod code from putting it into idle by setting the
> appropriate flag. This stops the log entry 'clk:0058:0: failed to
> disable' being generated.
> 
So the module cannot be put into idle in certain conditions. Why do you
disable idle under all circumstances and not e.g. adding some
runtime_resume/suspend pair somewhere?

> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> ---
>  arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
> index 9b5c728fb7da..2f55dc32e150 100644
> --- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
> +++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
> @@ -650,6 +650,7 @@ static struct omap_hwmod dm816x_usbss_hwmod = {
>  	.name		= "usb_otg_hs",
>  	.clkdm_name	= "default_l3_slow_clkdm",
>  	.main_clk	= "sysclk6_ck",
> +	.flags		= HWMOD_NO_IDLE,

and why do we need this here and not in the ti-sysc node?

Regards,
Andreas

