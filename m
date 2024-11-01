Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57ED1E6B245
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 11:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmSTqBtY8i0PV0/oOuK2+7GAOUhp/cEFMitg8aJfC1I=; b=MinKY43Gk5823Z1TjJnJ2ZmBSG
	jieBgpsjKaCe+q+2NEdqTvQn7b/gJHQdbgKUq7BMniQJyWkmJ3gM/GMS3dodCTLj//+inCw/Q8VE2
	c+jTnL1t6qx4TB3XT+3ancF6g6ykWTn+a9Y4ozuf8ECdgp4KuSLpBzD/3ya0q8pDbz0Hdqmmc1paB
	Rh/bl4hLD0nTrMm4jooS9XH3HEJs5uu70bBQlBvnMx89eqNYmoizc2J/VBx4jJzUVDulUPxapPJwE
	/iFm55d98UNSuPgz8/HvaDvMAnkjFXO7dBCJllUJ9PtrhjgNQRgvnlRtwLcEiex/lzNIyUzJHhwaq
	cWUp19IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qF1-00000006ott-1DoY;
	Fri, 01 Nov 2024 11:54:59 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qCt-00000006oVt-2KKq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 11:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=YmSTqBtY8i0PV0/oOuK2+7GAOUhp/cEFMitg8aJfC1I=;
	b=Khd5SvqzK4rtnwdSVspx1OZJIDfgoHn0uXLi2VrZvWn1NQHe+VltzzSGFdGFwX
	KMTs+S9syWRr9k9cmpgf0VHlQQgQf9QmPe3t1VbtD7G0ejwSS2jQ5Tl50BhBYl5M
	5qIGCZx2vvT8H6OO4nQ/NEZknXoT9AT0Olnn0eMgU/MWo=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHn4XewCRn1RZrAQ--.14133S3;
	Fri, 01 Nov 2024 19:51:59 +0800 (CST)
Date: Fri, 1 Nov 2024 19:51:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mn-bsh-smm-s2/pro: add simple-framebuffer
Message-ID: <ZyTA3WLJ36ZAQyDN@dragon>
References: <20241024102800.3481574-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024102800.3481574-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID: Ms8vCgDHn4XewCRn1RZrAQ--.14133S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWxGFW7JF4rCrWrZw4rAFb_yoW8Zr15pa
	4DGF1rWrs2vw40k3s0vF4Iqrn5t3yDXF129FWfW342kwsayFySgw1xKrsrW3Z0vr4kXw4I
	kF13Wr1fKrWYqaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYc_fUUUUU=
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCweKZWcks1IjcgAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_045247_986657_B3E896B2 
X-CRM114-Status: GOOD (  14.73  )
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

On Thu, Oct 24, 2024 at 12:27:56PM +0200, Dario Binacchi wrote:
> Add a simple-framebuffer node for U-Boot to further fill and activate.
> 
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>  .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
> index 7675583a6b67..3d670534a714 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
> @@ -4,6 +4,34 @@
>   */
>  
>  / {
> +	chosen {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		framebuffer-panel0 {
> +			compatible = "simple-framebuffer";
> +			clocks = <&clk IMX8MN_CLK_DISP_PIXEL_ROOT>, /* lcdif */
> +				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
> +				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>,
> +				 <&clk IMX8MN_VIDEO_PLL1>,
> +				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>, /* pgc_dispmix */
> +				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
> +				 <&clk IMX8MN_CLK_DISP_AXI>,
> +				 <&clk IMX8MN_CLK_DISP_APB>,
> +				 <&clk IMX8MN_SYS_PLL2_1000M>,
> +				 <&clk IMX8MN_SYS_PLL1_800M>,
> +				 <&clk IMX8MN_CLK_DSI_CORE>, /* mipi_disi */
> +				 <&clk IMX8MN_CLK_DSI_PHY_REF>;
> +

Unneeded newline.

I dropped it and applied the patch.

Shawn

> +			power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_LCDIF>,
> +					<&disp_blk_ctrl IMX8MN_DISPBLK_PD_MIPI_DSI>;
> +			dvdd-supply = <&reg_3v3_dvdd>;
> +			avdd-supply = <&reg_v3v3_avdd>;
> +			status = "disabled";
> +		};
> +	};
> +
>  	backlight: backlight {
>  		compatible = "pwm-backlight";
>  		pwms = <&pwm1 0 700000 0>;	/* 700000 ns = 1337Hz */
> -- 
> 2.43.0
> 


