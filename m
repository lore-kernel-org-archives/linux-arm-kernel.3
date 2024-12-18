Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FBAE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 12:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLJpu+b23LSwwdvL7n7XLGKUllrDriyC6Kq2l3Yieb8=; b=ilL98iiSTFcg9UNmMk45pkYE1Q
	NFposOWgTFAMOAmKYgRn2HmuDGzrAa7y0YHwaAPOpKseOGMl+GMFxp1wsgYjXV0uDfpiCNYPwakmZ
	KEIFaTumjzyJXPy+Ag0ln/NrKaMdsG7CzCxuOTWBZwyoc1apbHZvzOgu6YXX2W95fO7lQ19HvJqrH
	ibgu2ulqw4HVyG0z8ZRJsCTjccBSjlFcPuwCSl9RieLqYi01sCaVHbLbfjlrkX92BEtRGMnsOlQHa
	l+5HhvshLFVM2tEr++F7vthsxlFOnR7ZYalqFnI0j6bL8YoI4nWizYE3mgodZ+SBC5wERDII7zNMR
	0YnPLsuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtSg-0000000GdQs-1cpO;
	Wed, 18 Dec 2024 12:47:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtRD-0000000GdCM-0Iqc;
	Wed, 18 Dec 2024 12:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TLJpu+b23LSwwdvL7n7XLGKUllrDriyC6Kq2l3Yieb8=; b=pZ1IiM/GepDBlm0BzCnzLzCJVS
	3TV/p+VgoCYxMIjBPchJKO8Z/heOB3k1A9MhaR6+1FK6XaNs8lxNEhe1qWzjm2QvkxkPPVZCCxOBu
	stQz1ybGI9V+vhkgK/G9RndtK3WZnpSiMcyK6Zlv9XmcdpZdHhdN023CUQYoGxEuNL2wEHS9KgpQk
	w4Xf3CDWuSeLuDenMdS3LBNRRcxM6rWuvlivsuWmbHOVUx2sMRsIvsx+UgMKW/DIjUJDadPC0GtB1
	VttAj5eE9fp63i42Q3OYcwgvy1Jajki7fZL+DRT0JUR3WaTqH2d8nn+1PqVyfnSGPZVGC8s1W5XKZ
	x+Y0HQsg==;
Received: from i53875bfb.versanet.de ([83.135.91.251] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tNtR5-0000QS-4R; Wed, 18 Dec 2024 13:45:55 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v2 11/11] arm64: dts: rockchip: Add nodes related to eDP1 for
 RK3588
Date: Wed, 18 Dec 2024 13:45:54 +0100
Message-ID: <2173171.OBFZWjSADL@diego>
In-Reply-To: <20241216031225.3746-12-damon.ding@rock-chips.com>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-12-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_044603_113010_F51B8D1D 
X-CRM114-Status: GOOD (  16.07  )
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

Hi Damon,

Am Montag, 16. Dezember 2024, 04:12:25 CET schrieb Damon Ding:
> The related nodes are hdptxphy1_grf, hdptxphy1 and edp1. And the
> aliases edp0 and edp1 are added to separate two independent eDP
> devices.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> index 0ce0934ec6b7..17cc0b619744 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> @@ -7,6 +7,11 @@
>  #include "rk3588-extra-pinctrl.dtsi"
>  
>  / {
> +	aliases {
> +		edp0 = &edp0;
> +		edp1 = &edp1;
> +	};
> +

drop aliases please


> @@ -67,6 +72,11 @@ u2phy1_otg: otg-port {
>  		};
>  	};
>  
> +	hdptxphy1_grf: syscon@fd5e4000 {
> +		compatible = "rockchip,rk3588-hdptxphy-grf", "syscon";
> +		reg = <0x0 0xfd5e4000 0x0 0x100>;
> +	};
> +
>  	i2s8_8ch: i2s@fddc8000 {
>  		compatible = "rockchip,rk3588-i2s-tdm";
>  		reg = <0x0 0xfddc8000 0x0 0x1000>;

> @@ -395,6 +434,22 @@ sata-port@0 {
>  		};
>  	};
>  
> +	hdptxphy1: phy@fed70000 {
> +		compatible = "rockchip,rk3588-hdptx-phy";
> +		reg = <0x0 0xfed70000 0x0 0x2000>;
> +		clocks = <&cru CLK_USB2PHY_HDPTXRXPHY_REF>, <&cru PCLK_HDPTX1>;
> +		clock-names = "ref", "apb";
> +		#phy-cells = <0>;
> +		resets = <&cru SRST_HDPTX1>, <&cru SRST_P_HDPTX1>,
> +			 <&cru SRST_HDPTX1_INIT>, <&cru SRST_HDPTX1_CMN>,
> +			 <&cru SRST_HDPTX1_LANE>, <&cru SRST_HDPTX1_ROPLL>,
> +			 <&cru SRST_HDPTX1_LCPLL>;
> +		reset-names = "phy", "apb", "init", "cmn", "lane", "ropll",
> +			      "lcpll";
> +		rockchip,grf = <&hdptxphy1_grf>;
> +		status = "disabled";
> +	};

the hdptxphy nodes should be their own patch, also because most likely
Cristian's patch for hdmi1 [0] will be slightly faster.


[0] https://lore.kernel.org/r/20241211-rk3588-hdmi1-v2-2-02cdca22ff68@collabora.com




