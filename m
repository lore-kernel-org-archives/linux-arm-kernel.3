Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F98C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 21:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVs0AHMw3fsD2UbtLb9zEeprGKSe+lXYMd++O3wZybo=; b=f3faaSSvx+4kZ8a3Q0MbByJ3RG
	sT05AcvTer449PRZyovRDXkegdxO2WkJFHbFZGoTr431eZMARRROdMA3RhgcpeX1i2R33cUTFsAoN
	m2s8dxJI3wom8MU4n0bWm8YZ1ctpJAM61tvWAznvZDnoQNwJ2rCbuyF+H9Lq5Rl0ZsbZ72TFu/C73
	7nwP1K1vwSyjhxZnefM5J7tLQBaMI4QwhHEA8PDqh8qM0wvvB5hFEuVziA/CogIFK5PVC0ExRk8rd
	rFLEyq74bGB77avTAwaH+EurLq9NUbAM/ICzVu0nd66iVZSuEUMDb+LKg7ahj9Fv+nYPmShUcP/l2
	YmahOhOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMvOF-0000000EEv9-1lGu;
	Wed, 04 Jun 2025 21:11:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMvKQ-0000000EEbC-2NRU;
	Wed, 04 Jun 2025 21:07:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mVs0AHMw3fsD2UbtLb9zEeprGKSe+lXYMd++O3wZybo=; b=p53paCPZfwt6vUSz1ut77lJU3q
	sqxSL8txzmDgA5Pvy1zTINe3wZduLjQ8/0z49OmzRiEvv3tjAQCcMbYoF+13oGJ6dHcsv86uhZYiW
	HJFRB0cHFQ6ZGo6WRroV1AWhCkeYEyG+wwS1dmVzbFrae5QEwkLr75VyaZcgqPPT3LRc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uMvKJ-00Ei1J-VB; Wed, 04 Jun 2025 23:07:11 +0200
Date: Wed, 4 Jun 2025 23:07:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v3] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar
Message-ID: <66af3e62-83c7-4859-b8af-215098a825f0@lunn.ch>
References: <20250604-jaguar-mezz-eth-switch-v3-1-c68123240f9e@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604-jaguar-mezz-eth-switch-v3-1-c68123240f9e@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_140718_607490_3BFC9E5F 
X-CRM114-Status: UNSURE (   7.91  )
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
> +	phy-mode = "rgmii-id";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_rx_bus2
> +		     &gmac1_tx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus
> +		     &eth1_pins>;
> +	rx_delay = <0x0>;
> +	tx_delay = <0x0>;
> +	status = "okay";
> +
> +	fixed-link {
> +		speed = <1000>;
> +		full-duplex;
> +	};


> +	switch@5f {
> +		compatible = "microchip,ksz9896";
> +		reg = <0x5f>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <RK_PB7 IRQ_TYPE_EDGE_FALLING>; /* ETH_INTRP_N */
> +		pinctrl-0 = <&eth_reset_n &eth_intrp_n>;
> +		pinctrl-names = "default";
> +		reset-gpios = <&gpio3 RK_PB6 GPIO_ACTIVE_LOW>; /* ETH_RESET */
> +		microchip,synclko-disable; /* CLKO_25_125 only routed to TP1 */
> +
> +		ethernet-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			lan1: port@0 {
> +				reg = <0>;
> +				label = "ETH1";
> +			};
> +
> +			lan2: port@1 {
> +				reg = <1>;
> +				label = "ETH2";
> +			};
> +
> +			lan3: port@2 {
> +				reg = <2>;
> +				label = "ETH3";
> +			};
> +
> +			lan4: port@3 {
> +				reg = <3>;
> +				label = "ETH4";
> +			};
> +
> +			port@5 {
> +				reg = <5>;
> +				ethernet = <&gmac1>;
> +				label = "CPU";
> +				phy-mode = "rgmii-id";
> +				rx-internal-delay-ps = <2000>;
> +				tx-internal-delay-ps = <2000>;
> +
> +				fixed-link {
> +					speed = <1000>;
> +					full-duplex;
> +				};

For these bits only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

