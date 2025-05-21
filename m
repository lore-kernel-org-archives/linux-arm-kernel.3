Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2A1C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3g+CVDtzdZuER6lgO4bsBUK1VAcbEEFUD1kAdD51SmY=; b=Sa3hGRBOyqVakzVrG+p4TEBbxo
	kqS/tNHyBLLb89pYDmpA2s4uUn5lcJj7Xf9ynNktAkePuHoz2nYI7D7fgt+Bi9iX9cyA1PGX+7ndw
	G4G/9qyZA4Pctwp6x+ppW+2HpZ0653gBHmLxHKMzq2wekXhGyvUC0b3YvHr3duedY19TYLpqK/rVl
	2suXEAbLVKLQUHvs1r/tYFMPPrY6YSIU2j+zn0v3Jk4To4OFVp4yEW4e1lmcGU1zhX1UlVVIpMJDm
	5wc7gNXholDGvbk1Nwdg12ZMleapIumlnrO58G6/wdC05g5ouCPsS/yXDLM0rzGJZ8i9Gd7MNxrfD
	nFD44vfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmIf-0000000GSqs-2mPS;
	Wed, 21 May 2025 16:28:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmGT-0000000GSTE-4C06;
	Wed, 21 May 2025 16:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3g+CVDtzdZuER6lgO4bsBUK1VAcbEEFUD1kAdD51SmY=; b=0QceTirrCVNAGS9NMWkA8dWXud
	0Ijic96VpnfzbUaQU8WJs5bQ73IwhTxqB43HicBwXfhvTmqdOadYRKNSzRumKnoBPVDo/7llJYeqz
	dGI/DJAJ00kGGqHhjvBCjIK6VuSsPV/jCXtT+Pftb7iM+fYbYKWek5nWH7/IqjQB+Qds=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uHmGM-00DKBr-7Y; Wed, 21 May 2025 18:25:50 +0200
Date: Wed, 21 May 2025 18:25:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: support Ethernet Switch
 adapter for RK3588 Jaguar
Message-ID: <657a085c-4214-4096-8a68-047d57a40d60@lunn.ch>
References: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
 <20250521-jaguar-mezz-eth-switch-v1-2-9b5c48ebb867@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-jaguar-mezz-eth-switch-v1-2-9b5c48ebb867@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_092558_037814_0E2BB5A7 
X-CRM114-Status: GOOD (  11.29  )
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
> +	phy-mode = "rgmii";

Does the PCB have extra long clock lines to implement the 2ns delays?

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_rx_bus2
> +		     &gmac1_tx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus
> +		     &eth1_pins>;
> +	rx_delay = <0x30>;
> +	tx_delay = <0x30>;

Since this has a switch on the other end, its a bit more complicated
with RGMII delays. Normally, the MAC does nothing and passed rgmii-id
to the PHY, and the PHY then does the delays. However, here you don't
have a PHY. So you have the MAC add the delays. This looks O.K. I
would prefer that the driver used the standardized
rx-internal-delay-ps & tx-internal-delay-ps rather than these vendor
properties. But that is probably out of scope for this patchset.

> +			port@5 {
> +				reg = <5>;
> +				ethernet = <&gmac1>;
> +				label = "CPU";
> +				phy-mode = "rgmii";

Again, this probably should be rgmii-id to correctly describe the PCB,
but i don't know if the switch takes any notice of it.

	Andrew

