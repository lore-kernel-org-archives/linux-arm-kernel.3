Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6A0C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 19:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gY4t7rmcqgViWNSGJyiBePKpLVcx+wYsIBqre4T9vB8=; b=LKRVgaW29YMXsEe67H/xdkwDcr
	bEj0/kWpqkHJ5IszbuNhynatXWpD0VKVRHxQ7Iepo5/bZoxXCoVt5kQK2jkCmZ7T3JKXBF22+CTEg
	YAky7+A8kAfJLjwtViWqr8hbiQ18tjvg8d7dh8CwdoQFaa8JHl1JaTZ9pm4sa4rKmMGWdij7q+z5b
	wYNdvBUk9EKFrqQh+RCQ8x9P/SxlbigDtCxLvQwrugjAxL03uhHjniiQiRe07h5sS8ReVGHz1RbXK
	BgyUacGv90tinL1nTAzNtguI9Ah+iUu0BINGNQrxU2GWxeBi/eaZ3lrww/UcehERC/4i20SIqlgsP
	eXKtoFzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H07-0000000CFNK-2eDM;
	Thu, 17 Sep 2026 18:38:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Gzw-0000000CFGo-29Do;
	Thu, 17 Sep 2026 18:38:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC88A6020A;
	Thu, 17 Sep 2026 18:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1A51F000FF;
	Thu, 17 Sep 2026 18:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789670295;
	bh=gY4t7rmcqgViWNSGJyiBePKpLVcx+wYsIBqre4T9vB8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZtxC1UvADoNWivCx/UaWVPAkm5WTty7/9X1HhLEyfOvsiHQWPn1ewUvDxV3suTZMU
	 zcTz80bcTGCpNhqm+HKmXWgaTJyh20dLCxPFUwDbHdoVRBUpE4TEJgCiMOXanqkxrp
	 KogDzgHZr1unDk5LWcgEUlY5VKNBXzhyzW1IxnCxY7/dbwDgQDmj3ma6/YPhLRx8P2
	 836XHmnx/LwKWXmWTLdwaNv7S2D5eGJ81nUujYtiMnTi2c0gD8QJoC/NkKFZ9ChOHd
	 bUkrDFx73Omv+uU6LaRMmL9RIq0L56p9MkxJiax2a/gXc1sHDm3ufRbamipItYZdl5
	 vpR3F999UvlEg==
Subject: Re: [PATCH net-next v6 05/11] arm64: dts: rockchip: rk3568: add XPCS
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
Date: Thu, 17 Sep 2026 18:38:13 +0000
Message-ID: <178967029365.22033.1005706659427633436@kernel.org>
In-Reply-To: <20260915123802.1561724-6-coiaprant@gmail.com>
References: <20260915123802.1561724-6-coiaprant@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 2 · Low: 2

- [Medium] The new `xpcs: ethernet-pcs@fda00000` node in
  arch/arm64/boot/dts/rockchip/rk3568.dtsi (line 113) omits `phys` and…
- [Medium] dts: incorrect fixed-clock modeling for XPCS generated clock
- [Low] Concern (invalidated by later patches in the same series):
  `compatible = "rockchip,rk3568-xpcs"` matches no driver, the `eee`…
- [Low] The commit message states it adds "two fixed-clock nodes
  (xpcs_gmac0_clk and xpcs_gmac1_clk)".

--

arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes

This adds an ethernet-pcs node at 0xfda00000 for the RK3568 Synopsys
DesignWare XPCS, along with four ethernet-pcs-mii child nodes, all disabled
by default.  It also adds two fixed-clock nodes providing a 125 MHz
reference for the GMACs when running through the XPCS.

No Link: tags present in the commit header.

Two remarks on the changelog first:

> Also add two fixed-clock nodes (xpcs_gmac0_clk and xpcs_gmac1_clk)
> providing the 125 MHz reference clock for the GMACs when operating

[Severity: Low]
Could the names here be updated to match the patch?  The nodes added are
clock-xpcs-gmac0 and clock-xpcs-gmac1, labelled clk_gmac0_xpcs_mii and
clk_gmac1_xpcs_mii, and there are no xpcs_gmac0_clk / xpcs_gmac1_clk
identifiers anywhere in the diff.

The exact strings matter for anyone cross-checking the reparenting, since
clock-output-names has to match the CRU mux parent names in
drivers/clk/rockchip/clk-rk3568.c:

  PNAME(mux_gmac0_rx_tx_p) = { "clk_gmac0_rgmii_speed", "clk_gmac0_rmii_speed", "clk_gmac0_xpcs_mii" };
  PNAME(mux_gmac1_rx_tx_p) = { "clk_gmac1_rgmii_speed", "clk_gmac1_rmii_speed", "clk_gmac1_xpcs_mii" };

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
Does this node validate against its own binding?  The schema added earlier
in this series, Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml,
lists phys and phy-names unconditionally:

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

The node here supplies neither.  At the tip of the series only
rk3568-photonicat.dts fills them in via an override:

  &xpcs {
        phys = <&combphy2 PHY_TYPE_SGMII>;
        phy-names = "serdes";
        status = "okay";
  };

Since dt-validate matches by compatible regardless of status, wouldn't
every other rk3568 board DTB now report "'phys' is a required property" and
"'phy-names' is a required property" under make CHECK_DTBS=y?

Would it make sense either to drop phys/phy-names from the binding's
required list (the SerDes phandle is board specific), or to give the dtsi a
default combphy phandle here, given combphy is an on-SoC block?

> +
> +		xpcs_mii0: ethernet-pcs-mii@0 {
> +			reg = <0>;
> +			status = "disabled";
> +		};

[Severity: Low]
At this commit alone, compatible "rockchip,rk3568-xpcs" matches no driver,
the eee clock, the PD_PIPE power domain and the four MII children have no
consumer, the two fixed clocks have no user, and dwmac-rk provides no
pcs_init()/select_pcs().

Checking the rest of the series, all of those do land: pcs-xpcs-rk.c adds

  static const struct of_device_id xpcs_rk_of_ids[] = {
        { .compatible = "rockchip,rk3568-xpcs" },
        { /* sentinel */ },
  };

xpcs_rk_init_clk() consumes both csr and eee, xpcs_rk_serdes_phy_poweron()
consumes the power domain, xpcs_rk_create() reads the child reg and calls
xpcs_create_mdiodev(), dwmac-rk sets pcs_init/pcs_exit/select_pcs with
rk_pcs_init() parsing pcs-handle, and rk3568-photonicat.dts uses both
assigned-clock-parents = <&clk_gmac0_xpcs_mii> and pcs-handle = <&xpcs_mii0>.

So this looks like the usual DT-before-driver split, and the disabled node
is inert at this commit.  Is that ordering intentional, so that a bisect
landing here stays functional?

> +
> +		xpcs_mii1: ethernet-pcs-mii@1 {
> +			reg = <1>;
> +			status = "disabled";
> +		};

[ ... ]

> +
> +	clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> +		compatible = "fixed-clock";
> +		clock-frequency = <125000000>;
> +		clock-output-names = "clk_gmac0_xpcs_mii";
> +		#clock-cells = <0>;
> +	};

[Severity: Medium]
These two are not board oscillators.  Per the changelog the 125 MHz
is the MII reference produced by the XPCS/SerDes block itself, i.e. by
the very node added above, which lives behind RK3568_PD_PIPE and only
runs once that domain is up.  Describing it as a root-level fixed-clock
tells the clock framework something different: of_fixed_clk_setup()
registers clk_gmac0_xpcs_mii and clk_gmac1_xpcs_mii at of_clk_init()
time, unconditionally (the nodes deliberately carry no status), and
from then on they always look present, enabled and at rate, with no
link to the XPCS provider or to its power domain.

Where that bites is the reparenting path this patch exists to serve.
A board that sets assigned-clock-parents = <&clk_gmac0_xpcs_mii> on
the GMAC has it applied by of_clk_set_defaults(), which platform_probe()
calls before the GMAC driver's probe() body runs.  So mux_gmac0_rx_tx_p
in drivers/clk/rockchip/clk-rk3568.c gets parked on the XPCS leg before
dwmac-rk, and therefore before pcs-xpcs-rk and
xpcs_rk_serdes_phy_poweron(), has touched PD_PIPE.  Because there is no
clock provider/consumer relationship to the xpcs node, there is also
nothing for the driver to defer on: -EPROBE_DEFER is not reachable from
of_clk_set_defaults(), and the mux is switched regardless of whether
the XPCS is powered.  At best the GMAC is briefly clocked from a dead
source; at worst a CRU mux switch to a stopped parent is not something
I would assume is harmless.

Was the intent to have the xpcs node (or the combphy) be the clock
provider here, with #clock-cells and an entry in the binding, so the
framework tracks the PD_PIPE lifecycle and consumers defer until the
source exists?  If instead you have measured that the RK3568 CRU
tolerates being parked on the XPCS leg with PD_PIPE gated, could you
say so explicitly in the changelog and state what keeps the 125 MHz
alive before pcs-xpcs-rk probes?  Modelling a generated on-SoC clock
as fixed-clock is the kind of shortcut that tends to be noticed only
when probe order changes.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260915123802.1561724-1-coiaprant%40gmail.com

