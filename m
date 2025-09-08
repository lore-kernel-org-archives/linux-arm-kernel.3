Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4667DCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIo+HgFDBSGjk+ryK4PE8d8TpiiCG+5aEmtrJp8mr2Y=; b=TWtzXiY8WHf4uNeWk2Q1D7NO+a
	kDXJx3gwEELDgqP+DziDrVpdHuPxXcTEPBrtfPQhd0A79l2uDTiz9APpzqDZrUfTmxcDBSF2kfra3
	NtKFxM9cLxudESRRaqiVOKAnS56NYSGLB2nyfRUdl6gyv+SYMCFdX0aQGeAyw5z2we/bxlNz+wuyz
	Z5oKxHDxZaFVvIEGC/4WgFU9xbzgNJpu7hK13hSmdLzGwzD/Wd+4jCR8R9gOxGpWKOy0ifBc392Po
	y7U3wXip1Ce66ToneF3ylaC1g3SrW3ejQW+IbmRpFAuIPJa5+RyLzGSVZeGPVtknJ480mswt6KMIO
	jWDQOG4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uviLP-000000029Lp-1UdB;
	Mon, 08 Sep 2025 20:20:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uverP-00000000nPO-3P5x;
	Mon, 08 Sep 2025 16:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tIo+HgFDBSGjk+ryK4PE8d8TpiiCG+5aEmtrJp8mr2Y=; b=W8XWzjn0JY78XM1rjlNQr5OpUY
	dXHyf6I+qj/yv6fEtIh9ljgEs0tYlnNlsu1SvcJJ8I83bEcJYaeJZRYsMjy7K6SlgnS9ba9ghfGfC
	akZnwBMaDbsPGXKjbbs6qDtvRfDJxQgfdXCWXDWbymYozZsfUKUTwC8Kbzdk7wW6MOH0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uver6-007gmH-9h; Mon, 08 Sep 2025 18:36:36 +0200
Date: Mon, 8 Sep 2025 18:36:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kaison Deng <dkx@t-chip.com.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Wayne Chou <zxf@t-chip.com.cn>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add devicetree for the
 ROC-RK3588-RT
Message-ID: <153e5099-ee64-4ce9-b70e-feb24d8731cb@lunn.ch>
References: <20250905090115.718622-1-dkx@t-chip.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905090115.718622-1-dkx@t-chip.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_093655_854553_64DC2403 
X-CRM114-Status: UNSURE (   8.19  )
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
> +	phy-mode = "rgmii-rxid";

The usual problem with rockchip boards. rgmii-rxid is probably wrong,
unless you have a very odd PCB.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_miim
> +		     &gmac0_tx_bus2
> +		     &gmac0_rx_bus2
> +		     &gmac0_rgmii_clk
> +		     &gmac0_rgmii_bus>;
> +	tx_delay = <0x47>;

Please try rgmii-id, and small values here.

> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	phy-mode = "rgmii-rxid";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus>;
> +	tx_delay = <0x42>;

Same here.

	Andrew

