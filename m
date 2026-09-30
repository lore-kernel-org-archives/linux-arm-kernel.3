Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F33CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 19:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XoUDkMKF7L1Z9q3nwhGq3tIuxBl8dHtlGRc13BPjNPo=; b=psi4d6kDC83tff6BHy8dyedExv
	aM/PieHKzJuJhFzDe7szK637oZetvtr14jCOTmIZ5N5XOARIi/9NDXlzGBfk88sLT7I05cF27IxWR
	zswwYWcNYcxPdFbZDby0l5Gt/dDkt+VBs1xJnvl6fx0PL/fXpxOUJ4ueFfXyaMFRLQwvA1pOZ0R7u
	iiTQP8mGx+TkNE267eXiO+d8C7s8799XrJTfo/ejOkD2c8MsUKzKQvzPIg/6KWwNEwYaIsw2g0l1f
	zhuKgYWAmU5Muv0+YoIo61GSAO7GtmOcZWVzeC62Qmd1BsxD7Z1TCFo+VI3GlsDcdonzuFfpvKrCf
	M38rX+wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzpc-000000073yx-1lKU;
	Wed, 30 Sep 2026 19:19:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzpa-000000073yH-00zR;
	Wed, 30 Sep 2026 19:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XoUDkMKF7L1Z9q3nwhGq3tIuxBl8dHtlGRc13BPjNPo=; b=CVzhuWnti4+kryn8IEFwItWWNM
	9IlhVS2Pj0dduA+RR0QTDF9yL8Bjwkk5n5VFdv4kgxf5lfuUUmooxWKBBv/Kdvviqym+UgrMV6V5P
	y22BiSzrOl2nHPvkHn3+o+b85ypMo9T6kMW1eMgOvJt5NCDvJsfsu+Bi9qZKqbV7Lx3g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xBzpV-008E5Z-AF; Wed, 30 Sep 2026 21:19:01 +0200
Date: Wed, 30 Sep 2026 21:19:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: add Forlinx OK3568-C
Message-ID: <b81186ad-1da0-4c20-8b4a-aabdb7abb396@lunn.ch>
References: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
 <20260930-ok3568-c-v1-3-a0ffd55f5c95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-ok3568-c-v1-3-a0ffd55f5c95@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_121906_084863_593197B7 
X-CRM114-Status: UNSURE (   7.84  )
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

> +&gmac0 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy0>;
> +	/* Use rgmii-rxid mode to disable rx delay inside Soc */
> +	phy-mode = "rgmii-rxid";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_miim
> +		     &gmac0_tx_bus2
> +		     &gmac0_rx_bus2
> +		     &gmac0_rgmii_clk
> +		     &gmac0_rgmii_bus
> +		     &gmac0_clkinout
> +		     &eth0_pins>;
> +	tx_delay = <0x36>;
> +	status = "okay";
> +};
> +
> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	/* Use rgmii-rxid mode to disable rx delay inside Soc */
> +	phy-mode = "rgmii-rxid";

Yet another rockchip board which gets RGMII delays wrong.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

	Andrew

