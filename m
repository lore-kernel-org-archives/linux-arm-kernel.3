Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C041C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 07:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6vCqpN/5HuZQgBmiAxz4UUgNvspDYiuUeIfB/A1j8k=; b=QUdSIzF8G4TPO5IoZWQfRsT3+6
	kM6XFX2AX698xJbkQnxFyOYjWOa8J5nvx2rVsh6ef6wYRao0FS/MT4/gn7wh8z2WKvgJSub5IW0n4
	h8FCOmJfNDEt10AzPQ8bWB/9vOxxb9qYdaHoP4wdwUO7aRrU8rzEoWYVejuRzqbjXNfV44f2pEMxz
	c+6H1I2/UXs4sg5OOxh4NC7dkLjtnG5R2svJ1OUTcGSjgLivDYJLo/BheRKCawtZFyZVjB6cxSgpM
	Qj5dUml+KoNMtX8WstmiY2KrkIrg7Bz/vwoeVJ6ckNTAlHRs1qu8k04Uw0lnDIqYNUYSC9D84+MtU
	uKTtPmew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm6GH-0000000Aa5Y-1GhF;
	Sun, 23 Feb 2025 07:18:49 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm6EN-0000000AZtL-37Go
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 07:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=b6vCqpN/5HuZQgBmiAxz4UUgNvspDYiuUeIfB/A1j8k=;
	b=dgNJ0QelQ/ROLJbumLMULkQoKtZXXL1i/EwFo2Uc9GYIhVYrAeuZjlgGbUYHvX
	V4IRtC6EKgHynZ5bHt3OE13llDlXWyT5pA4s08GL1Od4pI/le255DAm4wL9iBfuL
	n+0NjWNGujwEqkFyA7/1yP+eDanygALddJMnR+r0ybF5o=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgB3MO9Yy7pntFqLCQ--.21466S3;
	Sun, 23 Feb 2025 15:16:42 +0800 (CST)
Date: Sun, 23 Feb 2025 15:16:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	patchwork-lst@pengutronix.de
Subject: Re: [PATCH] arm64: dts: imx8mp: configure GPU and NPU clocks to
 overdrive rate
Message-ID: <Z7rLWJ52aUqGkFiY@dragon>
References: <20250204182737.3361431-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204182737.3361431-1-l.stach@pengutronix.de>
X-CM-TRANSID: M88vCgB3MO9Yy7pntFqLCQ--.21466S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxWFWkAw1Utry8urWkKw48JFb_yoW5Xr4Up3
	ZFyw42kF40yr10v34xtwn5Xr1UtayrZF1xWry2ga48Aw1YyF92qF13Jay3uaykXr1xZ3y0
	9ry3tr1SyFs0kaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwL05UUUUU=
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQn8ZWe6mgGjTgAAsy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_231652_111022_E83373A8 
X-CRM114-Status: GOOD (  18.53  )
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

On Tue, Feb 04, 2025 at 07:27:37PM +0100, Lucas Stach wrote:
> A lot of other clocks on the i.MX8MP, including the DRAM set up by the
> bootloader are already running at overdrive clock rates. While this is a
> deviation from the configuration of other i.MX8M* family SoCs, overdrive
> is the default for most i.MX8MP boards and only some special purpose
> boards will choose to run the SoC at nominal drive rates.

Are any of these special purpose boards in upstream?  If so, does this
change have any impact on them?

Shawn

> Up the GPU and
> NPU clock rates to their overdrive level to be consistent with other
> clocks set up in the dtsi.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index e0d3b8cba221..aeaa6a5c2f56 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -816,12 +816,12 @@ pgc_mlmix: power-domain@4 {
>  						assigned-clocks = <&clk IMX8MP_CLK_ML_CORE>,
>  								  <&clk IMX8MP_CLK_ML_AXI>,
>  								  <&clk IMX8MP_CLK_ML_AHB>;
> -						assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
> +						assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
>  									 <&clk IMX8MP_SYS_PLL1_800M>,
>  									 <&clk IMX8MP_SYS_PLL1_800M>;
> -						assigned-clock-rates = <800000000>,
> +						assigned-clock-rates = <1000000000>,
>  								       <800000000>,
> -								       <300000000>;
> +								       <400000000>;
>  					};
>  
>  					pgc_audio: power-domain@5 {
> @@ -2232,9 +2232,9 @@ gpu3d: gpu@38000000 {
>  			clock-names = "core", "shader", "bus", "reg";
>  			assigned-clocks = <&clk IMX8MP_CLK_GPU3D_CORE>,
>  					  <&clk IMX8MP_CLK_GPU3D_SHADER_CORE>;
> -			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
> -						 <&clk IMX8MP_SYS_PLL1_800M>;
> -			assigned-clock-rates = <800000000>, <800000000>;
> +			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
> +						 <&clk IMX8MP_SYS_PLL2_1000M>;
> +			assigned-clock-rates = <1000000000>, <1000000000>;
>  			power-domains = <&pgc_gpu3d>;
>  		};
>  
> @@ -2247,8 +2247,8 @@ gpu2d: gpu@38008000 {
>  				 <&clk IMX8MP_CLK_GPU_AHB>;
>  			clock-names = "core", "bus", "reg";
>  			assigned-clocks = <&clk IMX8MP_CLK_GPU2D_CORE>;
> -			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
> -			assigned-clock-rates = <800000000>;
> +			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
> +			assigned-clock-rates = <1000000000>;
>  			power-domains = <&pgc_gpu2d>;
>  		};
>  
> 
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> -- 
> 2.39.5
> 


