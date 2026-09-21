Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E3BC982FB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZG4q1bWR2eMGYdwDsubP8MPzWiDbvYTpOk4BFn7wEjk=; b=XcowqHRqrqCiEnhxknroC107Od
	dvQW1ylyPW1PZv5osDVZ8EO4lu2y6hJEcunKmPLWM0qyVpunX32NOuToJDWiaN1qpLQV5EPANuB+N
	puO69ru2E+GKTCzsxhJp79dKvtQw4zPzu6Y7evx/CkMEik7qScWHNGFv0cVXAx5XyrGe3V9mmkuCs
	4MM8DE/2O9D+0upBvdGk4C+ylkJmvteazM3MWNIHgI2MOII6FfXywda3N7w2Dm8yBCvwf50sJB3OL
	n1WWpexn91OjBGC6r7dMGAlOVGyEZ0x8uFvyrhdJcf0AIIIBY313mBxxmP3AGhKUbtliVQ2YRz+h6
	FTxAcCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ngz-00000003iEF-28GG;
	Mon, 21 Sep 2026 23:45:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nfx-00000003hSx-3IoG;
	Mon, 21 Sep 2026 23:44:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D479960A53;
	Mon, 21 Sep 2026 23:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2B41F00893;
	Mon, 21 Sep 2026 23:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790034236;
	bh=ZG4q1bWR2eMGYdwDsubP8MPzWiDbvYTpOk4BFn7wEjk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kN2kcqegqTrBXWD/LP2j0qpShjoMhypaQ04GgiCeWD/cTHdjADw7IgIxgUCBUpSrJ
	 HIUKVpRQAECQ3rnpwScVKxCNzCzfYKJ1CfG2sYvvYGAfWUvTzpv7DUZhoeUhbmkU36
	 OU7PMMYWLGmZEf15yOx7qdoxqLLuJkOXBUMLtNnjfe7sUe91tbTzFHq1DROx+sZe3I
	 mQH6j5tPUvb/1Q8MbwVEqW291mEa1TGMzy+3NtxOn5nUVrkaufWAQFnWAyayA0MVCI
	 l0yG5qwCy1TJCRlSX3FJOTXvKT8qMj9zPlM2UqZKxvoU759FW2nWTnQXI74cFI2y/9
	 Sk/mcIkUcFIPw==
Subject: Re: [PATCH net-next v7 10/11] arm64: dts: rockchip:
 rk3568-photonicat: enable SGMII LAN port
From: netdev-bot+sashiko@kernel.org
To: coiaprant@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, vkoul@kernel.org,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 romain.gantois@bootlin.com, hkallweit1@gmail.com, neil.armstrong@linaro.org,
 linux@armlinux.org.uk, shawn.lin@rock-chips.com, david@ixit.cz,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Date: Mon, 21 Sep 2026 23:43:54 +0000
Message-ID: <179003423458.2160803.7280358019218159785@kernel.org>
In-Reply-To: <20260917204624.2427486-11-coiaprant@gmail.com>
References: <20260917204624.2427486-11-coiaprant@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Unrelated functional DT change bundled into an "enable SGMII LAN
  port" patch: the hunk under `&mdio1` adds a `leds { led@1; led@2; }`…

--

arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

This enables GMAC0 on the Ariaboard Photonicat by adding the XPCS SGMII
plumbing (combphy2 mac-sel, xpcs/xpcs_mii0, gmac0 properties) and describing
the Motorcomm YT8521SC PHY on a new mdio0 node.  It also adds a PHY LED
description to the existing RGMII PHY on mdio1.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> index 58c1052ba8ef3..fdaa4a2a4328b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts

[ ... ]

> @@ -350,6 +391,25 @@ rgmii_phy: ethernet-phy@3 {
>  		reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
>  		rx-internal-delay-ps = <1500>;
>  		tx-internal-delay-ps = <1500>;
> +
> +		leds {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			led@1 {
> +				reg = <1>;
> +				color = <LED_COLOR_ID_AMBER>;
> +				function = LED_FUNCTION_WAN;
> +				default-state = "keep";
> +			};
> +
> +			led@2 {
> +				reg = <2>;
> +				color = <LED_COLOR_ID_GREEN>;
> +				function = LED_FUNCTION_WAN;
> +				default-state = "keep";
> +			};
> +		};
>  	};
>  };

[Severity: Low]

This isn't a bug, but could this hunk go into a separate patch?  It changes
the pre-existing RGMII WAN PHY (rgmii_phy under &mdio1), which is already
enabled and working before this patch:

arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts:
	&gmac1 {
		phy-handle = <&rgmii_phy>;
		phy-mode = "rgmii-id";
		status = "okay";
	};

None of the SGMII enablement in this patch (&combphy2
rockchip,sgmii-mac-sel, &gmac0, &mdio0/sgmii_phy, &xpcs, &xpcs_mii0)
depends on the mdio1 leds node.

It is also not purely descriptive - drivers/net/phy/motorcomm.c implements
the LED callbacks for this PHY (yt8521_led_hw_is_supported(),
yt8521_led_hw_control_set(), yt8521_led_hw_control_get()), so PHY LED class
devices get instantiated for the WAN PHY as a result of this change.

Split into its own patch, the WAN LED description and the LAN port
enablement can be bisected and reverted independently, and the subject line
would reflect that the WAN PHY description changed too.  The commit message
mentions it:

    Also add LED configuration for the existing RGMII PHY on mdio1 for
    consistency.

but the subject only mentions the SGMII LAN port.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917204624.2427486-1-coiaprant%40gmail.com

