Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12377CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HoG5nibkY73X5+Sim6btQdITTv97/tVHKTgeohtTGg=; b=1PRdeUH/eVtO58vbOxF3EGjnzE
	1f8Z3M8xyODD4/8gDczrFTsfrBmxdQJphcaQSpduo95Yb96ayMlYwp0mgNZC101tNssugaEUOB3XM
	EMc1Vb1pNt44rZgW7oGjOU8v5WIULInPBLanq+HvPjKfvXiAJeS1dXn03y4awnw/Kn2AOhTkHY0kY
	1wD/cE2+ZK85HxTdJGiMSqY8y3o6/GGsM2lSo4iNRmSuJsAK4BgyNlVyObMHujYk7LSum5SJcT7/s
	nbBoKLlzSM1X76xGD7Ggzcnj5f0MPRrP9Hf6Q51bD44gCqmcyw2ocqPeUnLm6HHU9qWX1nlOai8da
	CMM+38zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPml-000000081ze-3IgG;
	Wed, 24 Jun 2026 15:45:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPmi-000000081y9-2pfp;
	Wed, 24 Jun 2026 15:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4HoG5nibkY73X5+Sim6btQdITTv97/tVHKTgeohtTGg=; b=BtxnOHP1PijdZwZuVcOKI5sK5c
	54MUxwFe6LX9lO9Pmeo0BFQVIa2+yf4XeAstyWjbCgm9jMq8IzD7dil3cUJsGjnBOpScm4R7Ar7Lv
	oyeZYEXG1rjg2PQBNMNnupaLRQ8zvVYxAcnKFMXOhp/Q576eiWf2LxAF45Nuk+DIxkSM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wcPmY-0096vk-Jm; Wed, 24 Jun 2026 17:44:54 +0200
Date: Wed, 24 Jun 2026 17:44:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Yanan He <grumpycat921013@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	david.wu@rock-chips.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 7/7] ARM: dts: rockchip: Add Alientek DLRV1126
Message-ID: <f526c23f-2ead-4246-bfaf-5bf4fbaec29f@lunn.ch>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-dc42d99f75a7@gmail.com>
 <20260624-rv1126-alientek-dlrv1126-v1-7-dc42d99f75a7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-7-dc42d99f75a7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_084504_731148_051E1AA8 
X-CRM114-Status: UNSURE (   9.81  )
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

> The board consists of a CLRV1126F core module and a DLRV1126 carrier
> board. The core module contains the RV1126 SoC, eMMC and RK809 PMIC,
> while the carrier board provides Ethernet, SD card, AP6212 WiFi and
> Bluetooth, PCF8563 RTC, ADC keys, GPIO LEDs and audio connectors.
> 
> The board has been tested with Ethernet/NFS boot, eMMC, SD card, SDIO
> WiFi enumeration, Bluetooth LE scanning, RTC, ADC keys, GPIO LEDs and
> RK809 audio card registration.

Ah, here is the networking nodes. But why was it not threaded to the
rest of the series?

> +&gmac {
> +	phy-mode = "rgmii";
> +	clock_in_out = "input";
> +	assigned-clocks = <&cru CLK_GMAC_SRC>, <&cru CLK_GMAC_TX_RX>,
> +			  <&cru CLK_GMAC_ETHERNET_OUT>;
> +	assigned-clock-parents = <&cru CLK_GMAC_SRC_M1>,
> +				 <&cru RGMII_MODE_CLK>;
> +	assigned-clock-rates = <125000000>, <0>, <25000000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rgmiim1_miim &rgmiim1_bus2 &rgmiim1_bus4
> +		     &clk_out_ethernetm1_pins>;
> +	tx_delay = <0x2a>;
> +	rx_delay = <0x1a>;

As i predicted, this is wrong.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

Please try removing rx_delay, rx_delay and setting phy-mode to
rgmii-id.

	Andrew

