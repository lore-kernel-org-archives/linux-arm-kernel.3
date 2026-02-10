Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E676EA8112
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 13:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1pl4mFVhB9hfg+ucrkFR1J2Wb0obC6F6Knh+u+mA90=; b=CSP41RQuH63S3z3a5k4uUCNG6f
	X00n8oDV/axkVY24G3WgGvAkchzmYiejn0EIDckIn7evPKikeShFbJy9SAhkEmK2/D67EJKqJexAz
	iDyLtSl0dYGnmHh77As6et41l72Ru4xs9yrhtPhRFwS62FkVNXPvXbgLwZB38ZLZvaWfwfAhE5Qxf
	nQo9qSMdTA6y504UuOwA7x4VMrsNocWOCUFuLbeUo83SXqZjJHbEilsugTKV9YQioYkqcr7DflI6F
	l/ACbu+En+eTyWXym1dJRPTyAILt3fDZNbODajq54SeP+hZxEv/T6i5KggJLHC9+YhhLIvgLJxtic
	/9Oco2kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpnXi-0000000GylG-1UzD;
	Tue, 10 Feb 2026 13:12:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpnXf-0000000GykU-0hy6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 13:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z1pl4mFVhB9hfg+ucrkFR1J2Wb0obC6F6Knh+u+mA90=; b=p6PGcWlyiQfZAFkq2CZ+DOPR3o
	h8dLZjcP61+iJDGRA9jqOxwbGjzEQvoPfMKLFu6cl+4ZTbmUae/ie2be/hV324xdFXfMgnyI9kfvN
	6mmD/xKm5og586Bacuz15OkBozwx4aUblkAIQaevvIVE9Gz0M+hczb6Kw8TI8p6/pJvU3VfDl38+f
	WyiHBYIiJ0decwdMgxUe/cC9sIMtplYQIz3agdqanOGbAp3crSidrbMaA9VqvCV7PPrvig0u/jQZA
	HYh4Y5fSp4kVQMahQPLQjPaV97j7/ahH3s97WNQYc7XPY5ytOtqt5XZGASd3nDJeQGFRjmNEfXyEl
	iY1nb29Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34334)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vpnXM-000000002Zp-3rxj;
	Tue, 10 Feb 2026 13:12:16 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vpnXI-000000002og-2bsV;
	Tue, 10 Feb 2026 13:12:12 +0000
Date: Tue, 10 Feb 2026 13:12:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v12 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
Message-ID: <aYsurPBMnzWDZCco@shell.armlinux.org.uk>
References: <20260210052226.3005666-1-a0987203069@gmail.com>
 <20260210052226.3005666-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210052226.3005666-4-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_051235_231116_7AC03DE6 
X-CRM114-Status: GOOD (  15.45  )
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

Please note that net-next is currently closed, so you should be sending
net-next patches with "RFC". See section 1.4 of:
https://docs.kernel.org/process/maintainer-netdev.html

On Tue, Feb 10, 2026 at 01:22:26PM +0800, Joey Lu wrote:
> +static int nvt_gmac_setup(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	phy_interface_t phy_mode;
> +	struct regmap *regmap;
> +	u32 macid, miscr, reg;
> +	int ret;
> +
> +	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
> +	if (IS_ERR(regmap))
> +		ret = dev_err_probe(dev, PTR_ERR(regmap), "Failed to get sys register\n");
> +
> +	if (macid > 1)
> +		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
> +
> +	if (of_get_phy_mode(pdev->dev.of_node, &phy_mode))
> +		ret = dev_err_probe(dev, -EINVAL, "Missing phy mode property\n");

If you pass in the plat_dat to this function, then you have access to
plat_dat->phy_interface. I went through all the dwmac glue code and
removed such PHY interface gets, so please don't introduce new
instances.

> +
> +	miscr = (macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;

I find the use of "miscr" to be the register offset, and "reg" to be
the register value is confusing. Normally they're the other way around.

> +
> +	switch (phy_mode) {
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		ret = nvt_gmac_get_delay(dev, "rx-internal-delay-ps");
> +		if (ret < 0)
> +			return ret;
> +		reg = FIELD_PREP(NVT_RX_DELAY_MASK, ret);
> +
> +		ret = nvt_gmac_get_delay(dev, "tx-internal-delay-ps");
> +		if (ret < 0)
> +			return ret;
> +		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, ret);
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		reg = NVT_MISCR_RMII;
> +			break;
> +	default:
> +		return dev_err_probe(dev, -EINVAL, "Unsupported phy-mode (%d)\n", phy_mode);
> +	}
> +
> +	regmap_update_bits(regmap, miscr,
> +			   NVT_RX_DELAY_MASK | NVT_TX_DELAY_MASK | NVT_MISCR_RMII, reg);

Please consider programming the NVT_MISCR_RMII bit via the
plat_dat->set_phy_intf_sel() method.

Is this register preserved over suspend/resume ?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

