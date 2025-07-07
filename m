Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB5BC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 23:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85QRM07cbafBKk/k5uPDcgO+bSgOcpSlD7+TD7+9cZ8=; b=Xv7t9lInWWBrUCwNf22BFTfzSp
	oXp/9qTubXk5SYwL2JLZ4FahEh8LMQM7Z3f5qL0bFtZas3PmcIrfiK9M/30Iqup01xOQCEMoug7DQ
	KKQVSWOo2NqYhxM03DWiud9s/Ltiwalk2V12zSrgWdZMW6OZeWJZk20P2dgxVoqKG228pDxBLp4GI
	SjUlFbCXATW46BHk0cWj9wZgOeJSVdpEjIwx8pAa0ZtbilTnDwsFgqQGbZRZ4Mhv+4Kd9qRFc/du2
	U+82gX2chk5jVK1oGVBHHTvwXlN6zC+CCFNUwSiS3RqAfFzDF3BIdCOSRkEfahCJiEffQTXlnOsuP
	OBQCyWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvR7-00000003nK2-2jXi;
	Mon, 07 Jul 2025 23:39:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvNc-00000003mvg-4AgA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 23:36:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7E861595;
	Mon,  7 Jul 2025 16:35:58 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68AFE3F66E;
	Mon,  7 Jul 2025 16:36:09 -0700 (PDT)
Date: Tue, 8 Jul 2025 00:34:25 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: a133-liontron-h-a133l:
 Add Ethernet support
Message-ID: <20250708003348.58fe509f@minigeek.lan>
In-Reply-To: <20250707165155.581579-5-paulk@sys-base.io>
References: <20250707165155.581579-1-paulk@sys-base.io>
	<20250707165155.581579-5-paulk@sys-base.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_163613_078914_3EDA76F4 
X-CRM114-Status: GOOD (  19.93  )
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

On Mon,  7 Jul 2025 18:51:55 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi Paul,

> The Liontron H-A133L board features an Ethernet controller with a
> JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.
> 
> Note that the reset pin must be handled as a bus-wide reset GPIO in
> order to let the MDIO core properly reset it before trying to read
> its identification registers. There's no other device on the MDIO bus.

putting the PHY reset GPIO into the MDIO node is a clever solution, I
was struggling with putting it either in the MAC or PHY node, though
conceptually it would still belong in the latter, I think. But this
might be a more generic problem: for most other devices we activate
reset and clock gates *before* trying to access them, though this might
be historically different for Ethernet PHYs.
 
> The datasheet of the PHY mentions that the reset signal must be held
> for 1 ms to take effect. Make it 2 ms (and the same for post-delay) to
> be on the safe side without wasting too much time during boot.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Despite the above, this looks fine, and works for me:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> index fe77178d3e33..90a50910f07b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> @@ -65,6 +65,25 @@ &ehci1 {
>  	status = "okay";
>  };
>  
> +&emac0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rmii0_pins>;
> +	phy-handle = <&rmii_phy>;
> +	phy-mode = "rmii";
> +	status = "okay";
> +};
> +
> +&mdio0 {
> +	reset-gpios = <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
> +	reset-delay-us = <2000>;
> +	reset-post-delay-us = <2000>;
> +
> +	rmii_phy: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +	};
> +};
> +
>  &mmc0 {
>  	vmmc-supply = <&reg_dcdc1>;
>  	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */


