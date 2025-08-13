Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851AAC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 08:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKY9kQla1vF2+SgiMrm6lmDBQufde/8tr1mwFyOdZF0=; b=piY2sFJot8GLrfGrUVh7Mx/kbo
	sg/oeT8O8gG+tUURBda3kdJZO7DK2xMJ/th9k7sVCp5O392fX2/9KLrW7BnN8m/Lyc5ozssKopBGg
	nezpAsFhSnj/8rLocIXDUMT/NrqVtz2VnY46ZlUOaV0KQ9eR2HW/aDlLpx/+zT/eQmUyT4sk9E3TJ
	xtN61/sdHcc+cI4uLdCb2is8QEUpmNKGZUBkoyicv29YcscBdHxnP/DJ/tvnYMxJtSB9sAThRwq3M
	FRo1WuBdOuAv+0++QOLWavZOfNS4YUTrQ/tp0UY2hnZ60vUh32Nie2GTZJr5aKVZ9qoCAVdaODDgx
	3oJTwFWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6ZD-0000000D2yU-1iLA;
	Wed, 13 Aug 2025 08:10:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6Ls-0000000D0YP-1caE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 07:56:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55CD85C6989;
	Wed, 13 Aug 2025 07:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2FEC4CEEB;
	Wed, 13 Aug 2025 07:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755071811;
	bh=SKWXBFlygeG3qDZNnsJJVgf3glQMopwMM8YJ342cbAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D1ln4MWCFlclf+UsMtL4BG/cdi8RRDSpRkbWIWOqN13A4FeYX+AlQmTAFA7JvfQj2
	 P9MLVGh/1GP3xgYGuAjJ2dl/UjiwfKabXH6+CK5dpTiSomUjHxeu/MpSTf6XFR5IEJ
	 G7+PVIlbTr1aVRvZk0EgZ1R0zQ3bdMQ0PaaBCk+Pp98znt3qgQEP1+xw04s6UtjaPX
	 DLVJfybtVtRqA4+nnQRbJR1oclLNDc9aszt/uXkeBcVBNWIQ3aE+79Oed7/Cidx2+3
	 0SeGAtz0bp1MSy8Si8igK9XB8vPRF0YTQrwJUCR06gkiuTGHCZUOyVsBSe9IqkZStB
	 jri3B9iFlb0pQ==
Message-ID: <6f0451ee-ddb8-4ded-8f0a-b491de9cc308@kernel.org>
Date: Wed, 13 Aug 2025 09:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: exynos7870: add DSI support
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
 <20250627-exynos7870-drm-dts-v2-3-d4a59207390d@disroot.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250627-exynos7870-drm-dts-v2-3-d4a59207390d@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_005652_509347_F74D0B47 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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

On 26/06/2025 22:13, Kaustabh Chakraborty wrote:
>  			reboot-mode {
>  				compatible = "syscon-reboot-mode";
>  				offset = <0x080c>;
> @@ -674,6 +682,83 @@ cmu_isp: clock-controller@144d0000 {
>  				 <&cmu_mif CLK_GOUT_MIF_CMU_ISP_VRA>;
>  		};
>  
> +		syscon_cam0: syscon@144f1040 {
> +			compatible = "samsung,exynos7870-cam0-sysreg", "syscon";
> +			reg = <0x144f1040 0x04>;
> +		};
> +
> +		dsi: dsi@14800000 {
> +			compatible = "samsung,exynos7870-mipi-dsi";
> +			reg = <0x14800000 0x100>;
> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clock-names = "bus", "pll", "byte", "esc";
> +			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_BUS_DISP>,
> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_APB_DISP>,
> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_MIPIPHY_TXBYTECLKHS_USER>,
> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_MIPIPHY_RXCLKESC0_USER>;

First clocks, then clock-names, please. Same for phys here and in all
other place.

> +
> +			phy-names = "dsim";
> +			phys = <&mipi_phy 1>;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					dsi_to_decon: endpoint {
> +						remote-endpoint = <&decon_to_dsi>;
> +					};
> +				};
> +			};
> +		};
> +
> +		decon: decon@14830000 {

node name: display-controller@

> +			compatible = "samsung,exynos7870-decon";
> +			reg = <0x14830000 0x8000>;
> +			interrupt-names = "fifo", "vsync", "lcd_sys";
> +			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clock-names = "pclk_decon0", "aclk_decon0",
> +				      "decon0_eclk", "decon0_vclk";
> +			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_PLL>,
> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_BUS_USER>,
> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_DECON_ECLK>,
> +				 <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_DECON_VCLK>;
> +
> +			iommus = <&sysmmu_decon>;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					decon_to_dsi: endpoint {
> +						remote-endpoint = <&dsi_to_decon>;
> +					};
> +				};
> +			};
> +		};
> +
> +		sysmmu_decon: sysmmu@14860000 {

iommu@

> +			compatible = "samsung,exynos-sysmmu";
> +			reg = <0x14860000 0x1000>;
> +			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
> +			#iommu-cells = <0>;
> +
> +			clock-names = "sysmmu";
> +			clocks = <&cmu_dispaud CLK_GOUT_DISPAUD_MUX_BUS_USER>;
> +		};



Best regards,
Krzysztof

