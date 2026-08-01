Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3140C55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V06eygovF9pqY3vHyXKEpDH3PhLpNuC5Yjsi32fVPNY=; b=yK/9k841ULEkQxXs3oli6UWz6p
	0/B/Hk7U146obhXbjMxJ7D1/2ZpMtwk/d0y7hDUYt7I0zOrcW7wG0eqjjV0eSmjQM1VRTH9kW+APL
	TSg913xi4WgJ18dBv78/9o9VMgcIJFeyFrnJKAMQSdAWESMrpEpMOxe3nGzZAtl5cIwMTtYIi7bZ7
	V35GT5exF8votoaPmJmDXdaWLjUwcRLvOhh93elsHJxbGQwhhaltljAro688wXgnP6lC2XMKfCmso
	Uo15cXWR16KjcoVRz0OPP5oUC3b3PR8Pd2Z+MedfJ6cypf3BCsUCsQ9JvsKt/ZjEQpL7ossdvs5gZ
	XipbwN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqCZm-0000000ErSl-0tKB;
	Sat, 01 Aug 2026 16:28:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqCZj-0000000ErS1-0bSp;
	Sat, 01 Aug 2026 16:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=V06eygovF9pqY3vHyXKEpDH3PhLpNuC5Yjsi32fVPNY=; b=GkspQDxIH8XQuNGEPi3OaHsWVb
	MWqmQLy8kUKXVbYdQCn+ie/STVzV3V1s7aPOK5PK5RjrA5Wiyz8hXdbdIEgc6WcPFfAa21KBC40+n
	tiyw0Mn+j6oxgkEwMCeuve4BVeBfqLtB2EPeZ7wTyUU4mSmU1sLPii9wSHsjQ5BuPbhAuQtRTEjA5
	n8pZMtkAH/FxaT++U1I8L6londMFmfOBCEtEEp2HcNsc6P3S1esk+oUHFDqac/TtiB/qTngEgeWVx
	vxh6+0AgQRrVMtC7TkoRzlWwcomWycXXPeveXnhe6HMtGaMMJNgHU/uwXIYS2D1qggPlKOWmYdUmd
	HqiZeHug==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Coia Prant <coiaprant@gmail.com>,
 Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Shawn Lin <shawn.lin@rock-chips.com>,
 David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 05/10] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock
 nodes
Date: Sat, 01 Aug 2026 18:28:11 +0200
Message-ID: <2847036.GUH7pLUipS@diego>
In-Reply-To: <20260801142244.679437-7-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
 <20260801142244.679437-7-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_092839_215141_5A762A9C 
X-CRM114-Status: GOOD (  18.07  )
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

Am Samstag, 1. August 2026, 16:22:29 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Coia Prant:
> The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
> the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
> interfaces via its four MII ports.  Add the XPCS device node and
> its pcs-mii sub-nodes to the SoC device tree.
>=20
> The XPCS device is accessed via the APB3 bus at 0xfda00000 and
> requires the CSR clock (PCLK_XPCS) for register access and the EEE
> clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
> PD_PIPE power domain must be enabled before any register access.
>=20
> Also add two fixed-clock nodes (xpcs_gmac0_clk and xpcs_gmac1_clk)
> providing the 125 MHz reference clock for the GMACs when operating
> with XPCS.  These clocks are used as the assigned-clock-parents
> for the respective GMAC nodes in board-level device trees.
>=20
> The XPCS node and its pcs-mii sub-nodes are disabled by default and
> must be enabled at the board level when 1000BASE-X/SGMII/QSGMII is
> in use.  The fixed-clock nodes are always present and do not have a
> status property, as they are static clock sources.
>=20
> The XPCS node also requires a reference to the appropriate Naneng
> Combo PHY via the phys property at the board level.
>=20
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568.dtsi | 45 ++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> index 3bc653f027f1f..989e164c0eb39 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -110,6 +110,51 @@ sata0: sata@fc000000 {
>  		status =3D "disabled";
>  	};
> =20
> +	xpcs: pcs@fda00000 {
> +		compatible =3D "rockchip,rk3568-xpcs";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		reg =3D <0x0 0xfda00000 0x0 0x200000>;
> +		clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> +		clock-names =3D "csr", "eee";
> +		power-domains =3D <&power RK3568_PD_PIPE>;
> +		status =3D "disabled";
> +
> +		xpcs_mii0: pcs-mii@0 {
> +			reg =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		xpcs_mii1: pcs-mii@1 {
> +			reg =3D <1>;
> +			status =3D "disabled";
> +		};
> +
> +		xpcs_mii2: pcs-mii@2 {
> +			reg =3D <2>;
> +			status =3D "disabled";
> +		};
> +
> +		xpcs_mii3: pcs-mii@3 {
> +			reg =3D <3>;
> +			status =3D "disabled";
> +		};
> +	};
> +
> +	xpcs_gmac0_clk: xpcs-gmac0-clock {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac0_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};
> +
> +	xpcs_gmac1_clk: xpcs-gmac1-clock {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac1_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};

I don't fully believe those clocks are "just there" inside the SoC.
Instead I _assume_ they are generated by some oscillator on the
individual boards?

Because as described there, they would be just magically be there.

So please aim for a real clock description (likely on a board-level)


Heiko




