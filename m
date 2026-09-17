Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F5BC982DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKmKsOz0rmPsjSmLJwkcoCz4Udwn6GVMn7bxI6KVIZ8=; b=tvzYBbMnf1k9DMXl9HSWMPj342
	B2D3B+bO9iwy0a4hC78+3tIo5o/zMDtrKSuEaFOLen/Mt2XAgVVDiI7eW4MeuxZ07wYjelJ49v9N+
	HVSgWmbM1UyG0C4LpfGhG6Z/uWEh+yCAbEixRHp6FKegl5XwJktA0hPtxlIx7Sali4Zp8QjuCEivz
	PowItC8t6uvH0D5/DR0u52zSMRTqaYtV5F5tj+VEu91WGUbCajE3xyt9MufgZcCFCok9FI65stjiI
	XbmcuyqO04eJHkJRYtiMhfJMFC7r2AgCCh9ISki0QG/BDEOtXcGRKu3nlZ9l3o1Ek9xVBvkwzC9fW
	pGXTUnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H0F-0000000CFcC-2GHJ;
	Thu, 17 Sep 2026 18:38:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H06-0000000CFLg-3ulP;
	Thu, 17 Sep 2026 18:38:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 60C6E60209;
	Thu, 17 Sep 2026 18:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8754B1F00893;
	Thu, 17 Sep 2026 18:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789670306;
	bh=oKmKsOz0rmPsjSmLJwkcoCz4Udwn6GVMn7bxI6KVIZ8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FPWK5qc8ZUfZACfSRpN3e+20j29nrCMV1H2aePYIWBQfBiu/GnECo1fWXjEfE39II
	 dG+JcgvRShPb51sTZDQy3KYaiaMRsO/fQEfMVqr9kA6il98ubGEFopVeIaISBJ7n+7
	 cn3iDXBafqYnoBBizRwr7/zjE0jydr49PqbQDFypuqkeKzJ6r0LINKBnQp708lFr8D
	 u/l12cMd04ujVlhWN9vFLcNwVmGNCeL/frrLY/XrtdXx2SzcWHOU7rjANGCbOdFML4
	 ozXhWTMAXAV7jZK4Ywkyez+kmCZFVpJW5GV6ElzDIrqciwKzUyaeU5GAHjx2uJOUd3
	 nnVCiQwhSW4yA==
Subject: Re: [PATCH net-next v6 10/11] arm64: dts: rockchip:
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
Date: Thu, 17 Sep 2026 18:38:24 +0000
Message-ID: <178967030410.22033.9337863064862932142@kernel.org>
In-Reply-To: <20260915123802.1561724-11-coiaprant@gmail.com>
References: <20260915123802.1561724-11-coiaprant@gmail.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 0

- [Medium] DT binding and SoC dtsi disagree:
  Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml…

--

arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

This enables the SGMII LAN port on the Ariaboard Photonicat by turning on
gmac0, the xpcs node and its port 0 sub-node, adding the YT8521SC PHY on
mdio0, and adding PHY LED nodes for both the new and existing PHYs.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> index 58c1052ba8ef3..fdaa4a2a4328b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts

[ ... ]

> @@ -586,3 +646,13 @@ &xin32k {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&clk32k_out1>;
>  };
> +
> +&xpcs {
> +	phys = <&combphy2 PHY_TYPE_SGMII>;
> +	phy-names = "serdes";
> +	status = "okay";
> +};

[Severity: Medium]

Should phys/phy-names live in the board file rather than in rk3568.dtsi?

Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml lists
both of them as mandatory:

    required:
      - compatible
      - reg
      - "#address-cells"
      - "#size-cells"
      - clocks
      - clock-names
      - phys
      - phy-names
      - power-domains

    additionalProperties: false

But the SoC node in arch/arm64/boot/dts/rockchip/rk3568.dtsi supplies
neither:

    xpcs: ethernet-pcs@fda00000 {
            compatible = "rockchip,rk3568-xpcs";
            #address-cells = <1>;
            #size-cells = <0>;
            reg = <0x0 0xfda00000 0x0 0x200000>;
            clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
            clock-names = "csr", "eee";
            power-domains = <&power RK3568_PD_PIPE>;
            status = "disabled";
            ...
    };

Since dtschema selects on compatible regardless of status = "disabled",
doesn't every other rk3568 board DTB now fail make CHECK_DTBS=1 with
"'phys' is a required property" and "'phy-names' is a required property",
with rk3568-photonicat being the only board that happens to satisfy the
binding?

The SerDes here also looks SoC-internal rather than board-specific: it is
combphy2 in SGMII mode, the glue driver asks for devm_phy_get(dev,
"serdes"), and the binding's own example already uses
phys = <&combphy2 PHY_TYPE_SGMII>.

Would it be better to put phys/phy-names in rk3568.dtsi, so board files
only flip status and set rockchip,sgmii-mac-sel, or alternatively to drop
the two properties from the binding's required: list?

I checked the following commits in the series and did not find a patch that
adds these properties to rk3568.dtsi or relaxes the binding, and the
baseline has no xpcs node at all, so the disagreement appears to come from
this series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260915123802.1561724-1-coiaprant%40gmail.com

