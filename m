Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F75CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wre4FpTCl7XL4P34pkB4obVncsb6MAdc1sAcNM+l0o8=; b=ppOYQlvaeGbYkfUnQYit9qIj6/
	WlsjA2lk40Ii+ce+t7Sb5mVX4zLMusZsC/O7A1KkzV2rknYUlVLNx1MvtYBZ5m4DV1nCkG4uqPF9T
	yEusMMfmN7Ysf0wHrmM17PjW/sVg1vq3r1yqGTO66pTniP9WnApbZCC734eJieXFUBizBCFh3jDhz
	NwCBd7W3sybAuAdjpW8UdHYSXtgFaUI7Ft2o4blBhSPzACNo1wFXxeFj6aAL5h1QbXpvHQ8OVB0ix
	ImKyYZgPjtLMLh7m08OiH6Yy6qxzcSmU6Th5cogDEA2ACciJnOPQ3hzRGu2/gqhOnmXHXw5nl+KVa
	CqvnKrrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unHQ8-00000004iXN-3e9m;
	Sat, 16 Aug 2025 13:58:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unHKd-00000004i7n-3TIz;
	Sat, 16 Aug 2025 13:52:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D964F1691;
	Sat, 16 Aug 2025 06:52:18 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CF773F738;
	Sat, 16 Aug 2025 06:52:24 -0700 (PDT)
Date: Sat, 16 Aug 2025 14:49:36 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: iuncuim <iuncuim@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 5/7] arm64: dts: allwinner: a523: add USB3.0 phy node
Message-ID: <20250816144936.3f2738cc@minigeek.lan>
In-Reply-To: <20250816084700.569524-6-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
	<20250816084700.569524-6-iuncuim@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_065227_909510_13B8C36B 
X-CRM114-Status: GOOD (  19.32  )
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

On Sat, 16 Aug 2025 16:46:58 +0800
iuncuim <iuncuim@gmail.com> wrote:

Hi,

> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> After adding the phy driver, we can also add phy node. In addition to the
> clk and reset lines, the power domain PD_PCIE is declared in this node
> according to the bsp dtb. So let's mention it. 
> Currently, phy driver does not support role selection and only works in
> USB3.0 mode.

That's the current limitation of the proposed Linux driver, but should
not affect the binding or DT:

> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index e4ed4fa82..233365496 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -606,6 +606,16 @@ mdio0: mdio {
>  			};
>  		};
>  
> +		combophy: phy@4f00000 {
> +			compatible = "allwinner,sun55i-a523-usb3-pcie-phy";
> +			reg = <0x04f00000 0x100000>;
> +			clocks = <&ccu CLK_USB3>;

Will we need more clocks (or resets) when supporting PCIe later? If
yes, we should add them already now, even if they are not used by the
current driver.

> +			resets = <&ccu RST_BUS_PCIE_USB3>;
> +			#phy-cells = <0>;

I think we should use one PHY cell here, to allow users to select the
PHY path they need. A USB3.0-only driver implementation could choose to
ignore it, or require the number to be 0 only, rejecting anything else.
But this way we keep compatibility with newer DTs.

Cheers,
Andre

> +			power-domains = <&pck600 PD_PCIE>;
> +			status = "disabled";
> +		};
> +
>  		ppu: power-controller@7001400 {
>  			compatible = "allwinner,sun55i-a523-ppu";
>  			reg = <0x07001400 0x400>;


