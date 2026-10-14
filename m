Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8BDCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBvZwMjkY3SFTfW54L+/3JW1YEsME5Dm5IClIbBeKQk=; b=KG+HRPpS+YATXjPLBEkj854s+m
	RhAITQksJejdCXWJ20AmsCXC4f0je+3XXxposv7GcJ1hpSFuMyOMGUkkxr7EfCsAFzUFolM9HUXlE
	0m9WjIKsymUjeJcQ2NVpLapV+vYK3oCm48b+xdjm8ov0jOJUGvWQaWrZPslbUM+xfVVQW8k6e9iUk
	9ppVmPCrd6RmdfXCsf751SW4By+uJHyfHzo7MrYFerXgkRYEGiAePmeWV43H6LRee1rBGLOMC5Gt1
	I2GkZyZ+g04hHsl+bLtpo3r2/YMsmOA+cul8ls6c2B3JhE45tXGHMjIityv7qgoMjWWoixYYnVFq2
	eLaG3DzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxrg-0000000FPQt-0hhr;
	Wed, 14 Oct 2026 12:13:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxrb-0000000FPPw-3Wkx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kBvZwMjkY3SFTfW54L+/3JW1YEsME5Dm5IClIbBeKQk=; b=3RNTW6C3qq+Yy9VbhkvL85MEfl
	g+n8Vt2sBTZsNZ8N8u0Pi6SXJWtM5OjdMWSR9bikHwDTn2VtzwCCgW7VTpmD7PeQ3HMU7B/n/ZrgK
	25nwCzFwMHi2wa4eYssYtUCalSBjjBT4Nkh6Kcy4IrkPqzCeokZSh2QsqK+N8M5GqvEw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xGxrX-00Aj27-0o; Wed, 14 Oct 2026 14:13:39 +0200
Date: Wed, 14 Oct 2026 14:13:38 +0200
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
Subject: Re: [PATCH v2 15/24] net: mdio: Add ZTE ZX279128S MDIO controller
Message-ID: <595371a9-6b7b-4ad9-985e-66f0e659f4a1@lunn.ch>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-16-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-16-ghahramani.navid@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_051343_881292_87423CE0 
X-CRM114-Status: GOOD (  16.86  )
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

> +static int zx279128s_mdio_xfer(struct mii_bus *bus, u32 op, int addr,
> +			       int regnum, u16 data)
> +{
> +	struct zx279128s_mdio *priv = bus->priv;
> +	void __iomem *base = priv->base;
> +	u32 cmd, val;
> +	int ret;
> +
> +	/* Clear the previous command and its status */
> +	writel(readl(base + ZX_MDIO_CMD) & ~ZX_MDIO_CMD_START,
> +	       base + ZX_MDIO_CMD);
> +	writel(0, base + ZX_MDIO_STATUS);
> +
> +	cmd = readl(base + ZX_MDIO_CMD);
> +	cmd &= ~(ZX_MDIO_CMD_WR | ZX_MDIO_CMD_RD | ZX_MDIO_CMD_ADDR |
> +		 ZX_MDIO_CMD_REG);
> +	cmd |= op | FIELD_PREP(ZX_MDIO_CMD_ADDR, addr) |
> +	       FIELD_PREP(ZX_MDIO_CMD_REG, regnum);
> +
> +	if (op == ZX_MDIO_CMD_WR)
> +		writel(data, base + ZX_MDIO_DATA_WR);
> +	writel(cmd | ZX_MDIO_CMD_START, base + ZX_MDIO_CMD);
> +
> +	ret = readl_poll_timeout(base + ZX_MDIO_STATUS, val,
> +				 val & ZX_MDIO_STATUS_DONE, ZX_MDIO_POLL_US,
> +				 ZX_MDIO_TIMEOUT_US);
> +	if (ret) {
> +		dev_err_ratelimited(&bus->dev, "timeout (addr %d, reg %d)\n",
> +				    addr, regnum);
> +		return ret;
> +	}
> +
> +	writel(0, base + ZX_MDIO_STATUS);
> +	writel(readl(base + ZX_MDIO_CMD) & ~ZX_MDIO_CMD_START,
> +	       base + ZX_MDIO_CMD);

This is the same as what you did at the beginning, but in the opposite
order. Is it actually needed, and can the same order be used?

> +static int zx279128s_mdio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct zx279128s_mdio *priv;
> +	struct mii_bus *bus;
> +	struct clk *clk;
> +	u32 val;
> +
> +	bus = devm_mdiobus_alloc_size(dev, sizeof(*priv));
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	priv = bus->priv;
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	clk = devm_clk_get_enabled(dev, "pclk");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to get the register clock\n");
> +	clk = devm_clk_get_enabled(dev, "wclk");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to get the work clock\n");
> +

Is this the bus clock? Does it need setting to 2.5Mhz?

> +static const struct of_device_id zx279128s_mdio_of_match[] = {
> +	{ .compatible = "zte,zx279128s-mdio" },
> +	{ }

It needs a device tree binding. But that is mostly boilerplate.

   Andrew

