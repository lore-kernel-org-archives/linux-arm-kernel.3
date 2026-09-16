Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BED2C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlCJSKLUS9B63fmKa0acz9npjUMvdKnN6lO3guHAid8=; b=uBh7paYs129SQPt9UPh8RapK7g
	gHJaA10adcNUkz5P/uRlIzd561hemqBMFJOmUXbMKS7mYzs1G2lzhV+rB+uCBe9MQzVipsZCHYY+K
	sld+3LeCj7nf/udI0XkLi9oo2gnOX5JqZVp72keR9QF3i/DaKRqTTTklwTwWJ/Ya2vSjPhsxKPxYk
	pXYYNes48sVIjXAG8y5oi3wT2cxzuZ2PJgwBPdW8qOLIGMSOsBrKhVEqgmJT9f4eOLhwrxtwMGmuV
	zSCo8/+FLAMNEDxkeUkQkjOp/EljFrWqAmSyE9m3YWqYoKjdEHLAZqGdXoWKurgk8v6j7X7bbRjNA
	Ry0OlgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rCw-00000009V2l-1Tw7;
	Wed, 16 Sep 2026 15:05:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rCu-00000009V29-1fQO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qlCJSKLUS9B63fmKa0acz9npjUMvdKnN6lO3guHAid8=; b=oN5thaAGSofYCg8N66dhpPqX3O
	9KVghMxg+yCffRUadxPNqKnEsvMizdKky/aQ/PcTXbC4gWjD0jUQlJKNymPjarclSRq2ZnaLCaT93
	1sgksytLC4JKdLrJbMe16FKNWf8Q1jfg6saOKLV9vfmuoILWw/295GYJFH7oVMXuImNc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6rCe-005Uwr-IB; Wed, 16 Sep 2026 17:05:40 +0200
Date: Wed, 16 Sep 2026 17:05:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH net-next 2/4] net: phy: Add Allwinner AC300 EPHY driver
Message-ID: <18bb9de4-38bf-48ba-bb24-2b0564474945@lunn.ch>
References: <20260916044119.475666-1-alastair@d-silva.org>
 <20260916044119.475666-3-alastair@d-silva.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916044119.475666-3-alastair@d-silva.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_080556_436136_4CA40389 
X-CRM114-Status: GOOD (  12.01  )
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

> +static int ac300_phy_config_init(struct phy_device *phydev)
> +{
> +	struct ac300_phy_priv *priv = phydev->priv;
> +	int ret;
> +
> +	/* Write page-based EPHY transceiver and signal path optimizations */
> +	ret = phy_write(phydev, 0x1f, 0x0100); /* Switch to Page 1 */
> +	if (ret)
> +		return ret;
> +	ret = phy_write(phydev, 0x12, 0x4824); /* Disable APS */
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_write(phydev, 0x1f, 0x0200); /* Switch to Page 2 */
> +	if (ret)

Please implement .read_page and .write.page in struct phy_driver.

> +	/* Disable 802.3az EEE */
> +	ret = phy_write(phydev, 0x1f, 0x0200); /* Switch to page 2 */
> +	if (ret)
> +		return ret;

Is it broken? phy_disable_eee()?

> +	return phy_clear_bits_mmd(phydev, 0x7, 0x3c, BIT(1));

MDIO_MMD_AN, MDIO_AN_EEE_ADV.

With those magic numbers replaced with macros, i then have to ask what
is going on with EEE.

I also hope you see why magic numbers are bad and should where ever
possible be replaced to meaningful macros.

> +	/* Read calibration data from NVMEM/SID */
> +	ret = nvmem_cell_read_u16(dev, "calibration", &priv->caldata);
> +	if (ret) {
> +		if (ret == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		dev_warn(dev, "Failed to read EPHY calibration (%pe)\n", ERR_PTR(ret));

Take a look at dev_err_probe().

> +static int ac300_phy_match_phy_device(struct phy_device *phydev,
> +				      const struct phy_driver *phydrv)
> +{
> +	return of_device_is_compatible(phydev->mdio.dev.of_node,
> +				       "allwinner,sun50i-h618-ac300-ephy");
> +}

Why?

	Andrew

