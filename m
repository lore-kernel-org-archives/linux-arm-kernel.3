Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FE0C44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oy7KDCiie69MUnyvy/2/gWtYYCH4ZMop/RN1w+cqgro=; b=J4xz4nE2oyWA1uDp/hbB2KAvOp
	o/snaVntKVpOn6KJpt5QwZXodVRN2DO03B19WhcRJK9oiNuKMIUeBcQOnwNn++iv44ier+3w7aadc
	Q7jiUmvC3dvBaBPvboTbGRd9e66DzxGLFY0ufEqPqL2yM59rHjEMv2LCVb8P8EfldsnmNiIBcLpDF
	fW6ltD24FUGDbl1B4ANNmjxUyAD6PSCEFx7K5Y7uRvI7snUbtTO8lxOSel5PC3VVDSjriEF2PA6Vv
	AR0VHY+iAiDjTCIAKnTHxwikDWn7rK9l7YBDT5RgAycHL1vWebOCyQpCtxGMSpomwiCAkyIOIXLVh
	UjEKlbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPtu-00000000HPF-23bK;
	Thu, 16 Jul 2026 17:29:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPtr-00000000HNF-1j6Q;
	Thu, 16 Jul 2026 17:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Oy7KDCiie69MUnyvy/2/gWtYYCH4ZMop/RN1w+cqgro=; b=RFXip3c57PRC16yRHWVjGWfcBO
	WPr112RJloTjAizRsaTVqHYYmC7h1NFbF36WOOwCEfevN7aoGix2wmY94uuWQqwP6xBEAWaTKCtCD
	9IjH4eLUWqS+T2b8uDwiPP0xN6hBz+63Se42ItF4DN50zNnus+nJTX0Mtm1RohYZLgIE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wkPtj-00Cb53-9i; Thu, 16 Jul 2026 19:29:23 +0200
Date: Thu, 16 Jul 2026 19:29:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pufan Jin <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add EmbedFire LubanCat 4
 board
Message-ID: <b648a0b0-2b78-4256-8a30-ab4f9a1b40f1@lunn.ch>
References: <20260705135014.1004166-1-2254650260@qq.com>
 <tencent_D22A164B3AEEA50562C1EC988862BA827A09@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_D22A164B3AEEA50562C1EC988862BA827A09@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_102931_448831_260C982D 
X-CRM114-Status: UNSURE (   9.23  )
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

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	/*
> +	 * The PCB adds ~2ns of trace delay on both TXC and RXC, so the
> +	 * required RGMII clock skew is provided by the board itself.
> +	 * Neither the MAC nor the PHY should add any internal delay,
> +	 * hence "rgmii" (not "rgmii-id") is correct here.
> +	 */
> +	phy-mode = "rgmii";
> +	pinctrl-0 = <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};

> +&mdio1 {
> +	rgmii_phy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gmac1_phy_rst>;
> +		reset-assert-us = <20000>;
> +		reset-deassert-us = <100000>;
> +		reset-gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_LOW>;
> +	};

For these nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

