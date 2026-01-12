Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB98BC9EC7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDvjeCxmeHvlZ9VVx01hx9d17Spsbg7HFQEHfiqAH8M=; b=o3+xF8exV4EtugT6vNczOzM0Ju
	Ia3PIHkqUWOH9nRlYwdnAOJFpXQ7lWCbHUtY7whxS/cuAxmsIxQCS+JG0/9hNPQ9GDNeBf1JRC/F7
	hnoDdzfLjIh9LBcjDYFG9ulPiBAkHzHZvs//hJK478hdgmYUwZcXzE21EzTG1toyWqUgoIqTlXKK/
	5o5Wlop9LXcZJfbNXGsmFYXkSBvrF7quqwAZl0PNw2aWDb986nsKCsAIZgXJAuDsjexJDX1AVKf/1
	8eeXkPHyjRjerDM9R2tmtt+Jec4WwghvuUisyub1Ry0TPAGPuK76KXiycyPbH+6EmrKOSb8v/v7Ly
	CUT72lkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGPL-00000005Gzz-16uH;
	Mon, 12 Jan 2026 11:48:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGPJ-00000005Gzp-1f5P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:48:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0FD06001D;
	Mon, 12 Jan 2026 11:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04067C16AAE;
	Mon, 12 Jan 2026 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768218504;
	bh=URDluMm2oQAGrABVnCxy8FFxRYxGizv+hrewS1N56j8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cRdLqqmkPFRspZ/V5pmAzefvbhoMTp69aXHe94XB9hlP26X/Q560gdoGe5WtaHqN9
	 2lyRZ4RqBvpFsbOq57qa1xLl70Kxefkzjj1vv85Kdf/nPTo/uQJXNyVSTDY1YSFm36
	 nsvdHPdwaK7P6xEcyZdmiBzTvsdJZcL4goRAKqApa5T0CVHFDaNdamchF2IPw2mDqf
	 M+TFPOMB6gN9jZ3DSMIDO5bKMM9YzQqk7zHjE7hrw5TywWdpXcK42KU077Zrwb7HoZ
	 zC+5R3G53xBx5knYNveWEElodIzbh3urfSz7Y5tRWbZb1XVLamUnN7M6BeulZRFUhz
	 C0GChan0K58Vw==
Date: Mon, 12 Jan 2026 12:48:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add Asus IPMI card
Message-ID: <20260112-upbeat-gay-chachalaca-ecb74c@quoll>
References: <20260111201040.162880-1-anirudhsriniv@gmail.com>
 <20260111201040.162880-3-anirudhsriniv@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260111201040.162880-3-anirudhsriniv@gmail.com>
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

On Sun, Jan 11, 2026 at 02:10:32PM -0600, Anirudh Srinivasan wrote:
> Add device tree for Asus IPMI card, an AST2600 BMC PCIe card
> 
> Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../dts/aspeed/aspeed-bmc-asus-ipmi-card.dts  | 136 ++++++++++++++++++
>  2 files changed, 137 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-ipmi-card.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 9adf9278dc94..ff40d9ab88b7 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-asrock-spc621d8hm3.dtb \
>  	aspeed-bmc-asrock-x570d4u.dtb \
>  	aspeed-bmc-asus-x4tf.dtb \
> +	aspeed-bmc-asus-ipmi-card.dtb \
>  	aspeed-bmc-bytedance-g220a.dtb \
>  	aspeed-bmc-delta-ahe50dc.dtb \
>  	aspeed-bmc-facebook-bletchley.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-ipmi-card.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-ipmi-card.dts
> new file mode 100644
> index 000000000000..fea94360245c
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-ipmi-card.dts
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2025 Anirudh Srinivasan
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include "aspeed-g6-pinctrl.dtsi"
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "ASUS IPMI Card BMC";
> +	compatible = "asus,ipmi-card-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial4:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		video_engine_memory: video {
> +			size = <0x04000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-fault {
> +			gpios = <&gpio1 ASPEED_GPIO(C, 5) GPIO_ACTIVE_HIGH>;
> +			panic-indicator;
> +			default-state = "off";

Missing color and function. Or at least label.

> +		};
> +
> +		led-heartbeat {
> +			gpios = <&gpio0 ASPEED_GPIO(A, 7) GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "timer";
> +		};
> +

Drop redundant blank lines.

> +	};
> +};
> +
> +&mdio2 {
> +	status = "okay";
> +
> +	ethphy2: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};
> +
> +&mac2 {
> +	status = "okay";
> +
> +	/* Bootloader sets up the MAC to insert delay */
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy2>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii3_default>;
> +};
> +
> +

Like this as well. It's a sign of sloppy coding.

> +&fmc {
> +	status = "okay";
> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +		spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64.dtsi"
> +	};
> +};

Best regards,
Krzysztof


