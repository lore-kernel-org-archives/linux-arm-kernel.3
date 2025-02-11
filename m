Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9CEC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 07:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rn0RBFJfAEAIgoAzu1BVM5JXCwZahw0WpRnDyoZDBpI=; b=QyY8hXjgBmsBvDFi3sNFqdWHBu
	4yMIwZWDu8M1d/b/s3rg5cO+NZy7z+7RFQwBE+yDlRYL86uoIB7/P5D7e7DQ5jfh76WNDiaga3T/c
	sN7IJerk5KYNn8InG9aysVMNeNAlznABfGGgri5NMlwZFtFBKA8rh90AbTxx/KzJrUevdawjFcIjC
	3sO1XU2PeySWscymTQXOSdI6ONpWewkr7dXSw7j2iamBMMtAFiYvTqI9XnMB5Jw2Gjtccsv6q+Mze
	zDMyiggclTQ+SarbLNBgKRRFR0M2HpslJxSe65Vp1b9yOTvm9RgwfZKu1ICb+2wmgdkCFijrL1bAb
	LZvOqWDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thkvI-00000002ri2-2m10;
	Tue, 11 Feb 2025 07:43:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thksd-00000002rMJ-2eoA;
	Tue, 11 Feb 2025 07:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rn0RBFJfAEAIgoAzu1BVM5JXCwZahw0WpRnDyoZDBpI=; b=sKWuHyJ89/93wgixZY/dwdkmQP
	C5fovYVoa3m9R9Y2jPo0IXzqqoIqECpXNbX2CxDICc6Crn3qA/mYjooJA9w0Q2evqMLqFad/FEjCO
	Hd60hrjyTX+kMaxEeTzO/zsrPPSRw51+c4b/hdl8K+DpI0Ec25K4FKMEjbyc92OtDmzuEymBX7+VD
	OHKGHEKRD41bdWaFWyANI44k2mAFcqHwdhyxfVTxy9gcEwtIWF4uZ+FBsVqKf8MZpD473Q/3SFhhQ
	N1vb6xQVNfpSpjsNpcZrtPXubBiZshKji3AcoWYxBlddRjLfCnA21MMhKbN/6eSjvoXE5oqu1tLa1
	QFneMPQQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thksc-0004qb-2X; Tue, 11 Feb 2025 08:40:26 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Patrick Wildt <patrick@blueri.se>,
 Niklas Cassel <cassel@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 robin.murphy@arm.com
Subject: Re: [PATCH] arm64: dts: rockchip: adjust SMMU interrupt type
Date: Tue, 11 Feb 2025 08:40:25 +0100
Message-ID: <25203566.ouqheUzb2q@diego>
In-Reply-To: <Z6pxme2Chmf3d3uK@windev.fritz.box>
References: <Z6pxme2Chmf3d3uK@windev.fritz.box>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_234027_675467_C7F7E78C 
X-CRM114-Status: GOOD (  18.15  )
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

Am Montag, 10. Februar 2025, 22:37:29 MEZ schrieb Patrick Wildt:
> The SMMU architecture requires wired interrupts to be edge triggered,
> which does not align with the DT description for the RK3588.  This leads
> to interrupt storms, as the SMMU continues to hold the pin high and only
> pulls it down for a short amount when issuing an IRQ.  Update the DT
> description to be in line with the spec and perceived reality.
> 

Cc'ed Niklas

This should probably also get a

Fixes: cd81d3a0695c ("arm64: dts: rockchip: add rk3588 pcie and php IOMMUs")

> Signed-off-by: Patrick Wildt <patrick@blueri.se>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index 8cfa30837ce7..520d0814a4de 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -549,10 +549,10 @@ usb_host2_xhci: usb@fcd00000 {
>  	mmu600_pcie: iommu@fc900000 {
>  		compatible = "arm,smmu-v3";
>  		reg = <0x0 0xfc900000 0x0 0x200000>;
> -		interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH 0>,
> -			     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH 0>,
> -			     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH 0>,
> -			     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupts = <GIC_SPI 369 IRQ_TYPE_EDGE_RISING 0>,
> +			     <GIC_SPI 371 IRQ_TYPE_EDGE_RISING 0>,
> +			     <GIC_SPI 374 IRQ_TYPE_EDGE_RISING 0>,
> +			     <GIC_SPI 367 IRQ_TYPE_EDGE_RISING 0>;
>  		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
>  		#iommu-cells = <1>;
>  	};
> @@ -560,10 +560,10 @@ mmu600_pcie: iommu@fc900000 {
>  	mmu600_php: iommu@fcb00000 {
>  		compatible = "arm,smmu-v3";
>  		reg = <0x0 0xfcb00000 0x0 0x200000>;
> -		interrupts = <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>,
> -			     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
> -			     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH 0>,
> -			     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupts = <GIC_SPI 381 IRQ_TYPE_EDGE_RISING 0>,
> +			     <GIC_SPI 383 IRQ_TYPE_EDGE_RISING 0>,
> +			     <GIC_SPI 386 IRQ_TYPE_EDGE_RISING 0>,
> +			     <GIC_SPI 379 IRQ_TYPE_EDGE_RISING 0>;
>  		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
>  		#iommu-cells = <1>;
>  		status = "disabled";
> 





