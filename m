Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F96C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 16:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFrEQnPOyh3CgDK5rpfd+i/car9R4H7VSU3yUmUQiEU=; b=2tAm6KO6XVkWZILJpQxTpKwrjm
	RW3Y9NLw/woSnvhDzZ4n8SRha4HKq35dG3JGu35iR6317PrhPr9/O17NrJejesMj1dwLpRBUZurD+
	7f0kOGJBtOxX9L1nxXNBKP2gdfdCuMKG2dAxn9jMntftduAknJ+wD8RSxKA+O4XhxRja+/96KqufZ
	TW7WoqNrOLZERF2rN/qGjuyPvBiCf79IYB8TxxabUbuDGnhQChJafafo1dUhlGWkqbcVync+QQLwG
	jjNmdZL36spEWW3PgwD1hNUFSOO/LM7mAqwLLwL5KE6ff/OJaaGJRu0W0MhVvG+ISY7S3h4NqJv0v
	CE+5rILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazvX-00000000PJL-3znL;
	Sun, 13 Jul 2025 16:51:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazsq-00000000P5Q-0Q8l;
	Sun, 13 Jul 2025 16:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zFrEQnPOyh3CgDK5rpfd+i/car9R4H7VSU3yUmUQiEU=; b=IpZUWctL1A8lW/QJNZgbSTBTbj
	z3+Yzc41EDXL4gL5g8KUMsMghn4C0ELvsIgfu8sPnWKxi5nhKemu8bwFOsQXGoQto8vMZi9HOb0zW
	p/CQaiWH+RpMpavOTGX3BT6x9Y+4AvLQZiaeZVN9DHBmzLvkGYb18nQep5J+keJbQaZw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uazsT-001Nvo-Ru; Sun, 13 Jul 2025 18:48:37 +0200
Date: Sun, 13 Jul 2025 18:48:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, quentin.schulz@cherry.de, dsimic@manjaro.org,
	naoki@radxa.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add OneThing Cloud OEC turbo
Message-ID: <3387f3d1-6ede-4b71-984a-e0403d72bcec@lunn.ch>
References: <20250713163255.163669-1-jerrysteve1101@gmail.com>
 <20250713163255.163669-4-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713163255.163669-4-jerrysteve1101@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_094900_138841_8492D96A 
X-CRM114-Status: UNSURE (   8.27  )
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
> +	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
> +	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&gmac1_clkin>;
> +	phy-mode = "rgmii";

This has the usual problem with Rockchip boards. Does the PCB have
extra long clock lines to impose the 2ns delay? I guess not, so this
should be "rgmii-id"

> +	clock_in_out = "input";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1m1_miim
> +		    &gmac1m1_tx_bus2
> +		    &gmac1m1_rx_bus2
> +		    &gmac1m1_rgmii_clk
> +		    &gmac1m1_rgmii_bus
> +		    &gmac1m1_clkinout>;
> +	snps,reset-gpio = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	/* Reset time is 20ms, 100ms for rtl8211f */
> +	snps,reset-delays-us = <0 20000 100000>;
> +
> +	tx_delay = <0x4f>;
> +	rx_delay = <0x2d>;

And then these should probably be 0, or deleted.

	Andrew

