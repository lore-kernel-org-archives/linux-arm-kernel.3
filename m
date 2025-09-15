Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D57CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 03:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpUJEfkdBkKRAwczqeGRWOLvBP7B0LPXqOrz9cHTX7w=; b=JS6hnn3sHbFKsqt/Eekb30MafN
	E4u6H5bxbmUN1RBfVUMBVNL/zgH12efIQYMCKzYyX794gTfE9tRqcbipIWid3few/oc7C0Garzrgx
	EiP2Xf1n/DVODDMLY8RNUyvp6LtveoC6q/NBUCDKVbZSK2l2hPs7Uo5v7gm8MkKzhSJAtW7qqSn74
	Atmhi1mq4uvQlOiw5OiML5B5JsvnzR9pImJBYvkUVrxkmzoNs/XYto30KWsSb7sSf9y8YFAP4Pn3p
	dQocbd0Fz0E7/Iu2pvMl9AIMWqY2IJg6toTKIudW/6yHdhe6n4RJn7PONsQf8f6kzGnDrpT+UWKPG
	F3EZg3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxzTv-00000002bpH-3pr6;
	Mon, 15 Sep 2025 03:02:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxzTt-00000002bor-2i70;
	Mon, 15 Sep 2025 03:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wpUJEfkdBkKRAwczqeGRWOLvBP7B0LPXqOrz9cHTX7w=; b=q1fQlkgbxn2h+zFqDxFnTbyhD7
	rNIAbOO3pCYQXhkvXYW4ax5gA+6IUg2NwHuu55ahmvHrx55T1rHkc8mt3Fb5jb78ocCAFmPo3mUdp
	yC1YLINp1ayfCPzuEMtqQ7TZq/WS0gzKB1/pq5KBPHyHQcgbvQ4B5N3iquvgEyz/OZFI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uxzTY-008OGE-Tm; Mon, 15 Sep 2025 05:01:56 +0200
Date: Mon, 15 Sep 2025 05:01:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kaison Deng <dkx@t-chip.com.cn>
Cc: Rob Herring <robh@kernel.org>, Jimmy Hon <honyuenkwun@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Wayne Chou <zxf@t-chip.com.cn>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add devicetree for the
 ROC-RK3588-RT
Message-ID: <83b50c2a-bcbc-45cc-935b-af3bc910853c@lunn.ch>
References: <cover.1757902513.git.dkx@t-chip.com.cn>
 <349c4226824efa52ceb14e3d8518c8bb5c7465fc.1757902513.git.dkx@t-chip.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <349c4226824efa52ceb14e3d8518c8bb5c7465fc.1757902513.git.dkx@t-chip.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_200217_687946_5F9EDD5B 
X-CRM114-Status: UNSURE (   7.11  )
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
> +	phy-mode = "rgmii-id";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_miim
> +		     &gmac0_tx_bus2
> +		     &gmac0_rx_bus2
> +		     &gmac0_rgmii_clk
> +		     &gmac0_rgmii_bus>;
> +	status = "okay";
> +};
> +
> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus>;
> +	status = "okay";
> +};

> +&mdio0 {
> +	rgmii_phy0: ethernet-phy@1 {
> +		compatible = "ethernet-phy-id001c.c916";
> +		reg = <0x1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&rtl8211f_0_rst>;
> +		reset-assert-us = <20000>;
> +		reset-deassert-us = <100000>;
> +		reset-gpios = <&gpio3 RK_PC0 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&mdio1 {
> +	rgmii_phy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-id001c.c916";
> +		reg = <0x1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&rtl8211f_1_rst>;
> +		reset-assert-us = <20000>;
> +		reset-deassert-us = <100000>;
> +		reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
> +	};
> +};

For these nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

