Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0457CC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 18:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoveDEqoZei+/8yplCoyw72lpueZgseH11UsT+FNsKQ=; b=3QLkzUMSO9HzpMYgKYcEumc+3l
	fh3EXN2AZ8hMJ1hOWYn+CAbSgpuHvvTyJDkOEW9DgVD8KqEFtS9rP5hj7i15KB0a6ESudL5DU1Ibv
	JtGSCo4b68ghYC+9cmuWNsSg5nOidJETEzWHapVUedrCcqZ9NQ0jNPMfeYO1/dO8800yrGuMjoxxc
	4Uqpx6iBFE6CFdn5038YsEhY5ezDBObQSxJCFJot/Juq6O9I8bmjNJZj1SHkEJygDlFMdP/bpU/yD
	Ylok/nPFcFeuaFc8l4dCWuMpCKIoZ5VDhJUELMJp5DD/cNuW23BXIqYQFZHUMoMRd3cdEok3s3WoQ
	YFN98DXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLnZt-00000005qNl-2VqG;
	Sun, 01 Jun 2025 18:38:37 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLnXk-00000005qIQ-43N7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Jun 2025 18:36:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uLnXh-0000Ae-4Q; Sun, 01 Jun 2025 20:36:21 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uLnXg-001KWO-1K;
	Sun, 01 Jun 2025 20:36:20 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uLnXg-004iLc-0o;
	Sun, 01 Jun 2025 20:36:20 +0200
Date: Sun, 1 Jun 2025 20:36:20 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp: Configure VPU clocks for
 overdrive
Message-ID: <20250601183620.npuicmipv6kv54z6@pengutronix.de>
References: <20250530221713.54804-1-aford173@gmail.com>
 <20250530221713.54804-5-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530221713.54804-5-aford173@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_113625_010241_25C8314B 
X-CRM114-Status: GOOD (  19.08  )
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

Hi Adam,

thanks for the patch.

On 25-05-30, Adam Ford wrote:
> The defaults for this SoC are configured for overdrive mode, but
> the VPU clocks are currently configured for nominal mode.
> Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
> Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
> Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.
> 
> This requires adjusting the clock parents. Since there is already
> 800MHz clock references, move the VPU_BUS and G1 clocks to it.
> This frees up the VPU_PLL to be configured at 700MHz to run
> the G2 clock at 700MHz.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 909555a5da4b..848b25c9b752 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2256,8 +2256,8 @@ vpu_g1: video-codec@38300000 {
>  			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
>  			assigned-clocks = <&clk IMX8MP_CLK_VPU_G1>;
> -			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> -			assigned-clock-rates = <600000000>;
> +			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
> +			assigned-clock-rates = <800000000>;
>  			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G1>;
>  		};
>  
> @@ -2267,8 +2267,8 @@ vpu_g2: video-codec@38310000 {
>  			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
>  			assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
> -			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
> -			assigned-clock-rates = <500000000>;
> +			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> +			assigned-clock-rates = <700000000>;
>  			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
>  		};
>  
> @@ -2284,8 +2284,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
>  				 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
>  			clock-names = "g1", "g2", "vc8000e";
>  			assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
> -			assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
> -			assigned-clock-rates = <600000000>, <600000000>;
> +			assigned-clock-parents = <0>, <&clk IMX8MP_SYS_PLL1_800M>;
> +			assigned-clock-rates = <700000000>, <800000000>;

I think we can drop the "assigned-clocks = <&clk IMX8MP_VPU_PLL>" part
completely.

Before your patch the IMX8MP_VPU_PLL_OUT was used as clock-parent for
the IMX8MP_CLK_VPU_BUS. With yout patch IMX8MP_SYS_PLL1_800M is used.

Regards,
  Marco

