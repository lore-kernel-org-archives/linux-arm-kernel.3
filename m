Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65A3FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 23:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJitWIhedwEhROcjfcAJaAzg1I+/wnNIEe6ZEGKeoOs=; b=0YEskSyZPpOEqYUe8jkXXcKasz
	jFgGay/NbujR9o5JGKTQR+HCzxp470txklygQxMPvBJNrkM7lWG3OzHwegyi4NI7O14PHVVP/j05B
	j6UL8MjA/wI2/UW6P4Me41wkvZRNNjA2QnbE9dlwgPY+Ryyo0ZJzn4+jeD1xrDKxNhU2CTBTbuTOk
	MR8YeIO2M6U+RMkaTSeQsqtCK+DDsUUZUJWkWooxlo7pz0KOJDTfJPqtNX9SmAho+zwRVqxNvr9Mx
	wGG84xXJ0+Z+Rr4YYXDm2V247WjY8LHDooBq12LHJDXVP386oM9fsjyZmUUEiXIX6YwTugP48nL6O
	DhG1MxTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPVb-0000000Drr2-2M2J;
	Fri, 24 Apr 2026 23:00:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPVY-0000000Drqc-29iM;
	Fri, 24 Apr 2026 23:00:26 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59E6C986;
	Sat, 25 Apr 2026 00:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777071519;
	bh=mXeWIc4bSwDCNBcdRGufU1M9fLVnzL1D1gJleQSCgmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFci2RcD/qwzOICb/XJNhBJMrszBBdEiF2PyvpZYQfELPjQ992/wd1Xq+LB4T+F+a
	 UAj9P3s909RycxhJp4fW+3EBpbIxcOA2C/2kXmTl51mqqbRKLFXHhfQRuik4aavhI3
	 Tf7H1cNcUMW50IzgCaiIUOL90GIg1VQyVer2BrgU=
Date: Sat, 25 Apr 2026 02:00:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Xu Hongfei <xuhf@rock-chips.com>, michael.riesch@collabora.com,
	stefan.klug@ideasonboard.com, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [RFC PATCH 2/5] arm64: dts: rockchip: add ISP nodes to rk3588
Message-ID: <20260424230017.GD3219146@killaraus.ideasonboard.com>
References: <20260424175853.638202-1-paul.elder@ideasonboard.com>
 <20260424175853.638202-3-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424175853.638202-3-paul.elder@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_160024_694916_B97769C8 
X-CRM114-Status: GOOD (  15.07  )
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

Hi Paul,

Thank you for the patch.

On Sat, Apr 25, 2026 at 02:58:47AM +0900, Paul Elder wrote:
> From: Xu Hongfei <xuhf@rock-chips.com>
> 
> Add device tree nodes for the ISP and their iommus on the RK3588.
> 
> Signed-off-by: Xu Hongfei <xuhf@rock-chips.com>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index 8b98e5c3cc8b..607b03d55dfd 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -3535,6 +3535,66 @@ gpio4: gpio@fec50000 {
>  			#interrupt-cells = <2>;
>  		};
>  	};
> +
> +	isp0: isp@fdcb0000 {
> +		compatible = "rockchip,rk3588-isp";
> +		reg = <0x0 0xfdcb0000 0x0 0x7f00>;
> +		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names = "isp_irq", "mi_irq";
> +		clocks = <&cru ACLK_ISP0>, <&cru HCLK_ISP0>,
> +			 <&cru CLK_ISP0_CORE>, <&cru CLK_ISP0_CORE_MARVIN>,
> +			 <&cru CLK_ISP0_CORE_VICAP>;
> +		clock-names = "aclk", "hclk", "clk_core",
> +			      "clk_core_marvin", "clk_core_vicap";
> +		power-domains = <&power RK3588_PD_VI>;
> +		iommus = <&isp0_mmu>;
> +		status = "disabled";
> +	};
> +
> +	isp0_mmu: iommu@fdcb7f00 {
> +		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg = <0x0 0xfdcb7f00 0x0 0x100>;
> +		interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names = "isp0_mmu";

I don't think interrupt-names is needed. Same for the second IOMMU.

> +		clocks = <&cru ACLK_ISP0>, <&cru HCLK_ISP0>;
> +		clock-names = "aclk", "iface";
> +		power-domains = <&power RK3588_PD_VI>;
> +		#iommu-cells = <0>;
> +		rockchip,disable-mmu-reset;
> +		status = "disabled";
> +	};
> +
> +	isp1: isp@fdcc0000 {
> +		compatible = "rockchip,rk3588-isp";
> +		reg = <0x0 0xfdcc0000 0x0 0x7f00>;
> +		interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names = "isp_irq", "mi_irq";
> +		clocks = <&cru ACLK_ISP1>, <&cru HCLK_ISP1>,
> +			 <&cru CLK_ISP1_CORE>, <&cru CLK_ISP1_CORE_MARVIN>,
> +			 <&cru CLK_ISP1_CORE_VICAP>;
> +		clock-names = "aclk", "hclk", "clk_core",
> +			      "clk_core_marvin", "clk_core_vicap";
> +		power-domains = <&power RK3588_PD_ISP1>;
> +		iommus = <&isp1_mmu>;
> +		status = "disabled";
> +	};
> +
> +	isp1_mmu: iommu@fdcc7f00 {
> +		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg = <0x0 0xfdcc7f00 0x0 0x100>;
> +		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names = "isp1_mmu";
> +		clocks = <&cru ACLK_ISP1>, <&cru HCLK_ISP1>;
> +		clock-names = "aclk", "iface";
> +		power-domains = <&power RK3588_PD_ISP1>;
> +		#iommu-cells = <0>;
> +		rockchip,disable-mmu-reset;
> +		status = "disabled";
> +	};
>  };
>  
>  #include "rk3588-base-pinctrl.dtsi"

-- 
Regards,

Laurent Pinchart

