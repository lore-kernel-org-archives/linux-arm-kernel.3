Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019E1CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpXaZMqjSZbAgdwg8mSDEftWCWDwoNsLUW2Eef19G38=; b=FHM1g0pCAUkhCJwihFkc4aRdc9
	9Ef1riEJOXVtHpdNgvOog26gHOq8q+24zRybywBy526C//MskpbcwTJEeChpoGCsXygQRZ62VwMNL
	US6JnWS+reOatA3Jr5USXC6n183hYLAY2Lv1pCW0Enf0zH8mzjIZ7JdRxN32jdop0S5DhvFDPTFFo
	fy/+gFhwHpy3BD8bdE9XsmdGyfaRgeisUihhJTilsMjmBWP+14hUGD5mzEoVg8TaDHwZIFywJrzZ+
	otRkiE/DC98OGuju/PeZCTAgg8I8qbM6/+QKUBv/YlrEDjX2ienG1J+8Y5h2aTZnZgfutskBA1/9s
	iTnsikQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAhe-00000000EHl-3CPV;
	Thu, 21 Aug 2025 19:12:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5HO-0000000H2qR-46HI;
	Thu, 21 Aug 2025 13:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cpXaZMqjSZbAgdwg8mSDEftWCWDwoNsLUW2Eef19G38=; b=aXqgfhv8eg6zEIGtl21VggWx5Z
	us+jnh526lU0meVen16i2u0Nzg/J148die1WZMebLepoq/W05DUw4lXttx+AGOaW8OdafpUnqUSbc
	HFDoJYaEKkD83dETjzus75JXBkQZ1ol9ale5AOPta2u1D6wSsw9cPgyojjEWL6Wbyh5U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1up5H1-005SGu-S5; Thu, 21 Aug 2025 15:24:11 +0200
Date: Thu, 21 Aug 2025 15:24:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hsun Lai <i@chainsx.cn>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, inindev@gmail.com, quentin.schulz@cherry.de,
	jonas@kwiboo.se, sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 2/2] arm64: dts: rockchip: add DTs for 100ASK DShanPi
 A1
Message-ID: <40b212df-2a55-48d5-8479-07c2de7b7cd6@lunn.ch>
References: <20250821110942.172150-1-i@chainsx.cn>
 <20250821110942.172150-3-i@chainsx.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821110942.172150-3-i@chainsx.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_062435_018152_BC4BD999 
X-CRM114-Status: UNSURE (   6.51  )
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
> +	phy-mode = "rgmii-id";
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&eth0m0_miim
> +		     &eth0m0_tx_bus2
> +		     &eth0m0_rx_bus2
> +		     &eth0m0_rgmii_clk
> +		     &eth0m0_rgmii_bus>;
> +	status = "okay";
> +};
> +
> +&gmac1 {
> +	phy-mode = "rgmii-id";
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&eth1m0_miim
> +		     &eth1m0_tx_bus2
> +		     &eth1m0_rx_bus2
> +		     &eth1m0_rgmii_clk
> +		     &eth1m0_rgmii_bus
> +		     &ethm0_clk1_25m_out>;
> +	status = "okay";
> +};

> +&mdio0 {
> +	rgmii_phy0: phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +		clocks = <&cru REFCLKO25M_GMAC0_OUT>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gmac0_rst>;
> +		reset-assert-us = <20000>;
> +		reset-deassert-us = <100000>;
> +		reset-gpios = <&gpio0 RK_PC2 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&mdio1 {
> +	rgmii_phy1: phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +		clocks = <&cru REFCLKO25M_GMAC1_OUT>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gmac1_rst>;
> +		reset-assert-us = <20000>;
> +		reset-deassert-us = <100000>;
> +		reset-gpios = <&gpio0 RK_PC5 GPIO_ACTIVE_LOW>;
> +	};
> +};

For these nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

