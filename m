Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D29C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 21:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9SjiiEJ5CBwLN0Flq395P6nvTylfhJws1GFCWFkO+w=; b=nLbTTn2NYLiLd5gg72vaRotz9X
	vp7TtN9OLt+kLI1QfMSSn+AvezYK7NuHqLXYOgvjTjJ2y6iu0lf+rLp1H0Jmc5ySqiFc3Lug5qUes
	1nz3zhK6yUNCQw9Iwv9nxOOCGAhKwjpBfG+A6FVaa/b6jwR21UAVjQa7POKyB16vGUUlJX9GTA4vs
	KkKIf6eYLSX8YupItDo1VLIYfnWgd9Qo4m7OgvV5gxQNN4FxhZhR8s4ZuOXYnmRxBQgzOh7hy5d4U
	rTTDo/YS6XJPQO3ErxGN30PlbWQgcKFHz58Onh4KAP9V3eJ3xE6lzE2AEaXR9O163sWUC+h9h57I9
	9tDBDDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAyKh-000000036cn-07xk;
	Fri, 02 May 2025 21:54:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAyIj-000000036FE-2ydK;
	Fri, 02 May 2025 21:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=V9SjiiEJ5CBwLN0Flq395P6nvTylfhJws1GFCWFkO+w=; b=2bHeTLMWmrEKsZTabi9IKqJnaq
	5rTdIhkvQosr2AG6CUNGOchjzNLxWtTfUSeyet/qYES8qLELeboaz/c3+CU6/QbP7GRlXicop3JzL
	R5cK6DoVo14nhbpju3mvydkOucbj4eQXDN7yTIMoAB2kbX5m8rhQYpV8EO1g4zTPlEt8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uAyIZ-00BRxh-Ba; Fri, 02 May 2025 23:51:59 +0200
Date: Fri, 2 May 2025 23:51:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: John Clark <inindev@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: rockchip: Add Luckfox Omni3576
 Carrier Board with Core3576 Module
Message-ID: <7c01712f-776d-4073-9829-f18a51df6d4c@lunn.ch>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250502205533.51744-4-inindev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502205533.51744-4-inindev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_145209_745117_E920F487 
X-CRM114-Status: UNSURE (   8.17  )
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
> +	phy-mode = "rgmii-rxid";

This is unlikely to be correct. It probably works, but that does not
make it correct.

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&eth1m0_miim
> +		     &eth1m0_tx_bus2
> +		     &eth1m0_rx_bus2
> +		     &eth1m0_rgmii_clk
> +		     &eth1m0_rgmii_bus
> +		     &ethm0_clk1_25m_out>;
> +	snps,reset-gpio = <&gpio2 RK_PB4 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 20000 100000>;
> +	tx_delay = <0x20>;
> +	status = "disabled";
> +};

Please see the discussion about rgmii delays with other rockchip
boards from the last week, and

https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/

	Andrew

