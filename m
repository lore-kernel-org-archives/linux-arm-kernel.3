Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA93C88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 20:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IgkSdK4NV3Xpqp8L57l3/LXegir+VXdAeBOnojRKHY=; b=3CNaOB0tfNyUVdbjmF84j2ecxu
	ZqMrjLvRAxn6hmFtLyexJoQ+6x/I41Il6qVLzae4BppN4xbIUctD0hRchr2XbCWzLoRh7H68g1iEo
	hE2MvM0LXoQA25k1CsDdZta7UIJKA/4gk3TNnvo89bxQerEUnZAwQ3Q7AR1gydsw5Ox8s8BicqaOS
	lSAn7AsJWkOdBrCLxHo/zFhJGeiCwlV27uIdwJu1pcO9Ydl9i0IUddw8mMwLbqGw0JEObjQa83uVq
	BX1Eiv0cDs8boPuUcehLW1LB1rqN6pu/xFMMO+htvu+V0UKzCUGD6nKRYIVA1zbFtZd1c7paGT45g
	wtAOHqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DEP-00000004aQu-2pDG;
	Mon, 14 Sep 2026 20:24:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DEM-00000004aKE-0GAR;
	Mon, 14 Sep 2026 20:24:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 868C243F12;
	Mon, 14 Sep 2026 20:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA81D1F00893;
	Mon, 14 Sep 2026 20:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789417485;
	bh=6IgkSdK4NV3Xpqp8L57l3/LXegir+VXdAeBOnojRKHY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P0/phZkxGdk3D6k9BFGpNa7xFsJTUUhOdAqNO3pl5CKYTCIrtXznGgPCwYm7++Y/h
	 jBjIEyT0m7LzI8h0LuVwx6yb1s+oIeUO/E+kznlxUAAJt9OzcnAl9yLyXNYiic49Js
	 R/0rC6ZZogjTgPg2o4Mcnq8lP7BpjOHa6Ihc5rFM3zXKTFLHsXwqbbjLX2RcfkJGnJ
	 sdxdtB5/XL3Nn2/QmdGqHYaRt4i81OZJ8JgoJfLSMP46NrxjVZp/rI3RwCwYhWL7bb
	 GjWB83b+H/G0vn/F2aGm+4hdoIqFFAf3ivgbuEVudHYKRGA7dpNym5gliAtFoeQnmi
	 MI0YfaUmWr3Kg==
Subject: Re: [PATCH net-next v5 05/11] arm64: dts: rockchip: rk3568: add XPCS
 and fixed-clock nodes
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
Date: Mon, 14 Sep 2026 20:24:43 +0000
Message-ID: <178941748344.22033.1486715412344785390@kernel.org>
In-Reply-To: <20260913185849.907479-6-coiaprant@gmail.com>
References: <20260913185849.907479-6-coiaprant@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 1

- [Medium] DT/binding mismatch: the new `xpcs: ethernet-pcs@fda00000`
  node in `arch/arm64/boot/dts/rockchip/rk3568.dtsi` (line 113) omits…
- [Low] Claimed missing driver/consumer for the new DT nodes: no driver
  matches `rockchip,rk3568-xpcs`, the `ethernet-pcs-mii@N` children are…

--

arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes

Adds the RK3568 XPCS node at 0xfda00000 with its four ethernet-pcs-mii
child nodes, all disabled by default, plus two 125 MHz fixed-clock nodes
intended as assigned-clock-parents for gmac0 and gmac1.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> index 3bc653f027f1f..227d03e336043 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -110,6 +110,51 @@ sata0: sata@fc000000 {
>  		status = "disabled";
>  	};
>  
> +	xpcs: ethernet-pcs@fda00000 {
> +		compatible = "rockchip,rk3568-xpcs";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x0 0xfda00000 0x0 0x200000>;
> +		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> +		clock-names = "csr", "eee";
> +		power-domains = <&power RK3568_PD_PIPE>;
> +		status = "disabled";

[Severity: Medium]
Does this node validate against the binding added earlier in the series?

Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml lists
phys and phy-names in its top-level required array, unconditionally, and
sets additionalProperties: false:

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

The node here supplies clocks and power-domains but not phys/phy-names.

dtschema validates nodes irrespective of status = "disabled", so does
make dtbs_check now report "'phys' is a required property" and
"'phy-names' is a required property" for every rk3568 board DTB?  At the
end of the series only rk3568-photonicat.dts fills them in:

  &xpcs {
  	phys = <&combphy2 PHY_TYPE_SGMII>;
  	phy-names = "serdes";
  	status = "okay";
  };

The other 21 device trees that include rk3568.dtsi (rk3568-bpi-r2-pro.dts,
rk3568-rock-3a.dts, rk3568-odroid-m1.dts, rk3568-nanopi-r5s.dtsi,
rk3568-qnap-ts433.dts, ...) do not.

The commit message says "The XPCS node also requires a reference to the
appropriate Naneng Combo PHY via the phys property at the board level."
If that is the intended model, should phys/phy-names be dropped from the
binding's required list (or gated), rather than left mandatory?
Alternatively the SoC dtsi could carry a default phandle for boards to
override.

> +
> +		xpcs_mii0: ethernet-pcs-mii@0 {
> +			reg = <0>;
> +			status = "disabled";
> +		};

[ ... ]

> +	clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> +		compatible = "fixed-clock";
> +		clock-frequency = <125000000>;
> +		clock-output-names = "clk_gmac0_xpcs_mii";
> +		#clock-cells = <0>;
> +	};

[Severity: Low]
One point that was checked and turned out not to be an issue, noted here
only for completeness: the compatible string, the ethernet-pcs-mii@N
children and these two fixed clocks all gain in-tree consumers later in
the same series, so there is nothing to change here.

drivers/net/pcs/pcs-xpcs-rk.c matches the compatible:

  static const struct of_device_id xpcs_rk_of_ids[] = {
  	{ .compatible = "rockchip,rk3568-xpcs" },
  	{ /* sentinel */ },
  };

and rk3568-photonicat.dts consumes both the child node and the clock:

  assigned-clocks = <&cru SCLK_GMAC0_RX_TX>;
  assigned-clock-parents = <&clk_gmac0_xpcs_mii>;
  managed = "in-band-status";
  pcs-handle = <&xpcs_mii0>;

Until the driver patch lands the nodes are disabled and inert, which is
the usual bindings-then-dtsi-then-driver ordering.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260913185849.907479-1-coiaprant%40gmail.com

