Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE7CCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcDK/pebo2mPEMQZ0p0oqr6UiazZd9GFCzRu+HIk0DU=; b=R9jYZaIhBU6Atd0YY374utZVVF
	3RaeNP3fTGmIrxgR9cNiuij5ZhivhoydhU7IPnq9akXyu0adivm4abyJfzBXyrQxo3VJlBm13juuf
	lLP4K1kbhXpnf+DqI95jAy5+u0ElUwMy9fDA6rqvjxVPIPmymTcv3ph7NrK3ayQzXn4725IqqWq3c
	F7CbuMWWIsRr66eePtJoN1YF9Vqy3Jwl1a2pQH02Qn3so6Vlw/Gh8h7hQClWfreoi36hcfGf5mpqr
	FPfj5+AE0VyiJtXf9c47naHpx0yiCoqNV8mq6e3iPqkxN8vdYgvb9p0cEjMs4yGbVXfIbbuz+Njeq
	oRTvYu+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyEE-0000000FRX1-4BVd;
	Wed, 14 Oct 2026 12:37:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyEB-0000000FRVX-2kf8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zcDK/pebo2mPEMQZ0p0oqr6UiazZd9GFCzRu+HIk0DU=; b=M2NhgmN1lO9irghBDCYlbRM8SS
	w0CY12HmYRITG6PK2i7bv55vNs8IktqgyMX08xWIk9fzIwULJQ0FsZkUDhxiEPA1qz2uPxjiV36vX
	MkoO9uhvcxx08tJpKPAV79mFlUDIsdab+9ApuLGKZkGsf+6EY1LCqQ+KJ3z4E+F7KUzM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xGyE9-00AjBI-BM; Wed, 14 Oct 2026 14:37:01 +0200
Date: Wed, 14 Oct 2026 14:37:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	stefandoesinger@gmail.com, krzk@kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 16/24] net: phy: Add Sanechips ZX5201 PHY support
Message-ID: <788c9b01-473e-4c45-b6f0-b2ba054da8e9@lunn.ch>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-17-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-17-ghahramani.navid@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_053703_695582_EF294D4A 
X-CRM114-Status: GOOD (  17.21  )
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

> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Sanechips ZX5201 Ethernet PHY
> + *
> + * The ZX5201 answers on two MDIO addresses: the copper PHY on its own
> + * address and its MAC-side SerDes interface on the next one.

What do you get when you read registers 2 and 3 of the SERDES? Is
there an ID in them?

If the mdio bus is scanned, and there is an ID, phylib will try to
probe a PHY driver on the SERDES.

> +static int zx5201_sds_read(struct phy_device *phydev, u32 regnum)
> +{
> +	return mdiobus_read(phydev->mdio.bus, phydev->mdio.addr + 1, regnum);
> +}

I would suggest adding a probe, and validate phydev->mdio.addr is not
31. ENODEV, or EINVAL, to indicate the setup is invalid.

> +static int zx5201_config_init(struct phy_device *phydev)
> +{
> +	static const u16 led_regs[] = { 0xb409, 0xb407, 0xb406, 0xb408 };

> +	/* LED control registers, all cleared as the vendor firmware does */
> +	for (i = 0; i < ARRAY_SIZE(led_regs); i++) {
> +		ret = zx5201_ext_write(phydev, led_regs[i], 0);
> +		if (ret)
> +			return ret;

It would be nice to reverse engineer what these bits do. And then add
proper LED controls. However, that can be later.

Ah, now i'm confused:

https://www.sanechips.com.cn/en/ProductEn/WiredEn/ethernetConnectivityEn/index.html

This says it is an RGMII PHY. Why does it have a SERDES? That suggests
SGMII?

We need to understand this, because if it is an RGMII PHY, we need to
address the RGMII delays, which that page says it can controller.

	Andrew

