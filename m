Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B95C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 23:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReI6P1dfpghATGzljlPADr6RMmJKYaN1e5uocZaCDmY=; b=XxvROfGFJx9u0qxWd8fG9jqyzD
	ml7hjx+C5nMTQeqG0x8/2giDfJh5TCLmMZiXQ1XR6o0NmEmL9h+ISeXs0iRksvF5jNOLYX5IHw0Tq
	x+7i1T2BqKeLIFZVq81B/FroPOqClET3Hjxl8CNUghuD0ppbxT4xv72g7yiC8w+umKOH3ypm2SNAP
	4rT7ZqzmkWxd3SUaj+EFuzDce+eroJsmO9jB7rCNXu4qGBi/EPi3k1Aou4eK7BZLonrPW4CE2VztP
	POiG1fjlKziQzl2H6qzmsHHZn8AmEG7V9/tAAkaZTXjst1bVg6RZrFsPmVUrFnH6K2MfYNAXZ5e0t
	LMGOizQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXpxQ-0000000FfQj-2IQG;
	Fri, 04 Jul 2025 23:36:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXpv4-0000000FfBY-04LY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 23:34:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F02D153B;
	Fri,  4 Jul 2025 16:33:59 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C96E3F66E;
	Fri,  4 Jul 2025 16:34:10 -0700 (PDT)
Date: Sat, 5 Jul 2025 00:32:43 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a100: Add EMAC support
Message-ID: <20250705003243.07b3612d@minigeek.lan>
In-Reply-To: <20250626080923.632789-5-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
	<20250626080923.632789-5-paulk@sys-base.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_163414_106988_FAA0D685 
X-CRM114-Status: GOOD (  16.66  )
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

On Thu, 26 Jun 2025 10:09:22 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi,

> The Allwinner A100/A133 Ethernet MAC (EMAC) is compatible with the A64
> one and needs access to the syscon register for control of the
> top-level integration of the unit.

as mentioned before, this would benefit from using "emac0", to signify
that there is a second MAC, but otherwise this matches what I found in
the manual and could test, so with the 0 suffix added:

> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> index 1c4e71b32911..205faa90d37b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -420,6 +420,26 @@ i2c3: i2c@5002c00 {
>  			#size-cells = <0>;
>  		};
>  
> +		emac: ethernet@5020000 {
> +			compatible = "allwinner,sun50i-a100-emac",
> +				     "allwinner,sun50i-a64-emac";
> +			reg = <0x5020000 0x10000>;
> +			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			clocks = <&ccu CLK_BUS_EMAC>;
> +			clock-names = "stmmaceth";
> +			resets = <&ccu RST_BUS_EMAC>;
> +			reset-names = "stmmaceth";
> +			syscon = <&syscon>;
> +			status = "disabled";
> +
> +			mdio: mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>  		ths: thermal-sensor@5070400 {
>  			compatible = "allwinner,sun50i-a100-ths";
>  			reg = <0x05070400 0x100>;


