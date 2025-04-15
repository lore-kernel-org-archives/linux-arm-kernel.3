Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D83C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oml1Mrnp47RusR5d0ApAKkTSky1zT7/Gd1S7AMinXF0=; b=NvwATQYPtd1zzjchS+u9LjbIH7
	hBv/N2Si8i6Xr17iB2IR976AMPbdYKGYygmztHA7Rv00RPOYG3Ye0gGqIELTbUoAGhVIuBVcguo4o
	6y7GOTERvpTiLnw0DbodlA7ENvrVj+Yk430cWthhvvxwSfgJhGPzBs4RbEMJqKPq+a5RTKbEU5ER2
	oGIv8yprhNhAV2a84HNWIssaIG/iMaws4nmG1Xc2m7Wr2L835sNXilCkXIDym61NLcyASreaOZEst
	mLOSrfzBGM8EYkVBG3Q1IkxbSLaNVnrvup+uOegKqAKgbsuFaI1ccLkcfGsWNcBeRPTXFBd/IcXQz
	YxxTwpag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iFJ-00000006FSu-31nj;
	Tue, 15 Apr 2025 15:30:45 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iCO-00000006EwC-1YYI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oml1Mrnp47RusR5d0ApAKkTSky1zT7/Gd1S7AMinXF0=; b=f96StIq7u2cg4/MtulmKNAp16A
	1OO3m/xvx3je0VnrZwj+YB4U8Civ6zLKNI1Pucg9kLD/hU0/wiD11+A0p7CP++SyR98rp4KN+EfaE
	wz5adawaEkkukTZnuA0pAJIyACMaWt3JJkgjKwLPlNiccEJESrZjkZhZx7+k43yeTNlE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u4iCH-009TLQ-L9; Tue, 15 Apr 2025 17:27:37 +0200
Date: Tue, 15 Apr 2025 17:27:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add initial device tree for
 TQMa8XxS
Message-ID: <aa21556c-8c79-4d03-b6db-3b4cf450fc3a@lunn.ch>
References: <20250415133301.443511-1-alexander.stein@ew.tq-group.com>
 <20250415133301.443511-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415133301.443511-2-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_082744_588916_2518A99A 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
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

> +&fec1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec1>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	fsl,magic-packet;
> +	mac-address = [ 00 00 00 00 00 00 ];
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_ethphy0>;
> +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
> +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
> +			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +			ti,dp83867-rxctrl-strap-quirk;
> +			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +			reset-gpios = <&lsio_gpio3 22 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <500000>;
> +			reset-deassert-us = <50000>;
> +			enet-phy-lane-no-swap;
> +			interrupt-parent = <&lsio_gpio1>;
> +			interrupts = <30 IRQ_TYPE_EDGE_FALLING>;

EDGE_FALLING is very likely to be wrong. PHYs are generally level
triggered, not edge.

	Andrew

