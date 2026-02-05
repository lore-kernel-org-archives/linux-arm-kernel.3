Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7889EC1E84
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpdEjTwUa2nIvssyS9tGP8C8RHluBGKgaX0/8wOSLqY=; b=oGkFef1m0qdpQDVmV3YE/GzNqt
	CFZNP+17QFKo56afJiWqZIlX7GFqsESJ3DqjjXABTbw5u/S0hJ4b1Z5SzW0Sb7T3rd7Jufv04GsrF
	qjqwdx7k5sJT7fy1kjyfKOapXHe+eZ+KCPpEP8iOgz78GGuUe+x0odQw41GUsf/jnAdwYj8CokP5H
	OH3zKYMXyaV3igeg+w4os8fU/nc2/vZ8e19Wh+mPtztVExq3qbl+YuBQ+sEdXNUeo3zb3qujLPKfc
	iNmCaEO1DCxjqZjM8kyE3W2tLHQ+rGU6CrAu2jF9kVKgSl83U+RGMLyIOuz9OmM465cejkItKVLlM
	BSCgGBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvpZ-00000009iYc-3IpV;
	Thu, 05 Feb 2026 09:39:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvpW-00000009iYC-35F4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 09:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dpdEjTwUa2nIvssyS9tGP8C8RHluBGKgaX0/8wOSLqY=; b=QHr++8aDpN/fqF0E0cSew5phMI
	eOaaHQaJem+IazKxQZH7RxAdBMUpjfUNxVqyhuRscxO36yvJg+GRBQyAoHUH0WcBLhHyiRRsh1RgQ
	beaCJEKCRn3JxrS1R7cpvCkJXtetHGrGo0Fd9ettY94gAuW7M50+Jt2adpl6dnSqhCPom978IV6W7
	VAEnODHHo+wjSFRjfnNdunhiVM15F0PIx9pI57/uRyKMaVfYVz/JtqMEmNchlvHblcysBhFfLMpOz
	s2/Onlz03KvzKqJ2rFt/pZcWV8xcYc2aTEb33F0p+axybcHjHIBmTrf0MB+Ma6NM4tdfDXmJzFoID
	xij5+MNw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43544)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vnvpA-0000000077B-0RIT;
	Thu, 05 Feb 2026 09:38:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vnvp4-000000006FN-2Zn1;
	Thu, 05 Feb 2026 09:38:50 +0000
Date: Thu, 5 Feb 2026 09:38:50 +0000
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
Subject: Re: [PATCH net-next v11 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
Message-ID: <aYRlKk-cCIhqGWX7@shell.armlinux.org.uk>
References: <20260205014006.735408-1-a0987203069@gmail.com>
 <20260205014006.735408-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205014006.735408-4-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_013918_798146_856A792C 
X-CRM114-Status: GOOD (  21.01  )
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

Hi,

On Thu, Feb 05, 2026 at 09:40:05AM +0800, Joey Lu wrote:
> +
> +struct nvt_priv_data {
> +	struct platform_device *pdev;

This looks to me like it's write-only, does it serve a useful purpose?

> +	struct regmap *regmap;

This doesn't seem to be used outside of nvt_gmac_setup().

> +};

Given the above two comments, do you actually need struct nvt_priv_data ?

> +
> +static struct nvt_priv_data *
> +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct nvt_priv_data *bsp_priv;
> +	phy_interface_t phy_mode;
> +	u32 macid, arg, reg;
> +	u32 tx_delay_step;
> +	u32 rx_delay_step;
> +	u32 miscr;
> +
> +	bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv), GFP_KERNEL);
> +	if (!bsp_priv)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bsp_priv->regmap =
> +		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
> +	if (IS_ERR(bsp_priv->regmap))
> +		return ERR_PTR(dev_err_probe(dev, PTR_ERR(bsp_priv->regmap),
> +				     "Failed to get sys register\n"));
> +	if (macid > 1) {
> +		dev_err(dev, "Invalid sys arguments\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
> +		tx_delay_step = 0;
> +	} else {
> +		if (arg <= 2000) {
> +			tx_delay_step = (arg == 2000) ? 0xf : (arg / NVT_PATH_DELAY_STEP);
> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay_step);
> +		} else {
> +			dev_err(dev, "Invalid Tx path delay argument.\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +	}
> +	if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", &arg)) {
> +		rx_delay_step = 0;
> +	} else {
> +		if (arg <= 2000) {
> +			rx_delay_step = (arg == 2000) ? 0xf : (arg / NVT_PATH_DELAY_STEP);
> +			dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay_step);
> +		} else {
> +			dev_err(dev, "Invalid Rx path delay argument.\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +	}

Each of these could be moved into a separate function:

static int nvt_gmac_get_delay(struct device *dev, const char *property)
{
	u32 arg;

	if (of_property_read_u32(dev->of_node, property, &arg))
		return 0;

	if (arg > 2000) {
		dev_err(dev, "Invalid %s argument.\n", property);
		return -EINVAL;
	}

	if (arg == 2000)
		return 15;

	return arg / NVT_PATH_DELAY_STEP;
}

then:
	int ret;

	ret = nvt_gmac_get_delay(dev, "tx-internal-delay-ps");
	if (ret < 0)
		return ERR_PTR(ret);

	tx_delay = ret;

	ret = nvt_gmac_get_delay(dev, "rx-internal-delay-ps");
	if (ret < 0)
		return ERR_PTR(ret);

	rx_delay = ret;

> +
> +	miscr = (macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;
> +	regmap_read(bsp_priv->regmap, miscr, &reg);
> +	reg &= ~(NVT_TX_DELAY_MASK | NVT_RX_DELAY_MASK);
> +
> +	if (of_get_phy_mode(pdev->dev.of_node, &phy_mode)) {
> +		dev_err(dev, "missing phy mode property\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	switch (phy_mode) {
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		reg &= ~NVT_MISCR_RMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		reg |= NVT_MISCR_RMII;
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported phy-mode (%d)\n", phy_mode);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (!(reg & NVT_MISCR_RMII)) {
> +		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, tx_delay_step);
> +		reg |= FIELD_PREP(NVT_RX_DELAY_MASK, rx_delay_step);

You can move this inside the switch above under the RGMII case. Theses
delays are, after all, only for RGMII.

> +	}
> +
> +	regmap_write(bsp_priv->regmap, miscr, reg);

Consider:

	regmap_update_bits(bsp_priv->regmap, miscr,
			   NVT_TX_DELAY_MASK | NVT_RX_DELAY_MASK |
			   NVT_MISCR_RMII, reg);

> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return PTR_ERR(plat_dat);
> +
> +	/* Nuvoton DWMAC configs */
> +	plat_dat->core_type = DWMAC_CORE_GMAC;

Is the hardware not compatible with any of the compatible types that
devm_stmmac_probe_config_dt() will automatically set this for you?
Which version of the core do you have?

> +	plat_dat->tx_fifo_size = 2048;
> +	plat_dat->rx_fifo_size = 4096;

There are tx-fifo-depth / rx-fifo-depth properties that can be used to
describe these in DT.

> +	plat_dat->multicast_filter_bins = 0;
> +	plat_dat->unicast_filter_entries = 8;

If this core is v3.50, v3.70 or v3.72, then there are
snps,multicast-filter-bins and snps,perfect-filter-entries which
can be used to describe both of these.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

