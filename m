Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF910CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiZ1PzidiWdDGIawNNmIB37ozkzICOH2riI2nuoFSRo=; b=wIvsxXKA8+ZPx/V8t6v+TLVRCc
	gDf/DwlUeTNPK5ljNsxuJWex1zmRxkKcDv8JeiGqFssqoKgAPiPczsIXV7bGGBBkFSpBnIdHiuFoY
	/LNU8BstIUVZFhI2Pv4JAVzYJVT7veXS9mFMnJlYvE7PJh7X5P87OblBKk2vbrNH9tD9ld3aIwg9E
	mJnqa3Bl/F0gOsYUXM8aNsIbD4TKFYdKg0FrP6ELdMidUKoDuVSWLGiq7JWuPOnlMliRRpZQEiZvf
	1jMAe4SRE10Ny6OP6UPVzvAfbbdBe6l3CV2Y404l0gv6MOqpjvBM7HhwB02SjJTBz0XETKifu4+5h
	3grL/rSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsEq-00000004tDx-0SPa;
	Tue, 09 Sep 2025 06:54:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvmAp-00000003DnG-1Yvs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 00:25:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4225C1691;
	Mon,  8 Sep 2025 17:25:16 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBCBE3F66E;
	Mon,  8 Sep 2025 17:25:22 -0700 (PDT)
Date: Tue, 9 Sep 2025 01:24:22 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet
 LEDs
Message-ID: <20250909012422.43b755a4@minigeek.lan>
In-Reply-To: <20250818163520.1004528-1-olek2@wp.pl>
References: <20250818163520.1004528-1-olek2@wp.pl>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_172527_455645_FB7ABBCB 
X-CRM114-Status: GOOD (  16.35  )
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

On Mon, 18 Aug 2025 18:35:13 +0200
Aleksander Jan Bajkowski <olek2@wp.pl> wrote:

> This patch adds support for Ethernet LEDs.

So I tried this on my OPi-PC2, but I cannot influence the LEDs. I have
CONFIG_LED_TRIGGER_PHY and CONFIG_LEDS_TRIGGER_NETDEV built in, and I
see mdio_mux-0.2:01:amber:lan and mdio_mux-0.2:01:green:lan in
/sys/class/leds, but anything I write into trigger does not seem to
change the output: it always stays on the network functionality, I
guess because it's still configured to the PHY hardware wired function?

What am I missing?

Cheers,
Andre

> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 20
> +++++++++++++++++++ 1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts index
> 0f29da7d51e6..7688f565ec9b 100644 ---
> a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts +++
> b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts @@ -7,6
> +7,7 @@ 
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
>  
>  / {
> @@ -132,6 +133,25 @@ &external_mdio {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible = "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
> +
> +		leds {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			led@0 {
> +				reg = <0>;
> +				color = <LED_COLOR_ID_GREEN>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +
> +			led@1 {
> +				reg = <1>;
> +				color = <LED_COLOR_ID_AMBER>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +		};
>  	};
>  };
>  


