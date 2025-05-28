Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76F9C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBbrn7eQDWJVCAKImqv3Knw41beS2cHZDNUxETDEwfM=; b=wpXelmBuORamXdmaoBomxUIZG9
	UhpehCWup57S0OlT/5dlppzQ9s8UN6WeTBJW0FoPD/rMMWL5ddnkdBJg2XHiW1D9hJzJj8+8oEyjM
	s6M8Qa2f1fH3+2CB+DVlyKnYkqyjYlz/RrhuuKUpIftQ7A5Qcss6mkv0G82XT1bZWUuTN9Gf3QMm3
	tWAaij8BQ5xyvHnW0Zukm/kB6fX256ofbVfZMzKQ82diea3uF0Kztz6kzSD03HH3aAI8UpfybsNFR
	K3jbdn3BcUD+zSfIx80dYjy2052bmb35PCAo121/hq+trxpgrtQQA2c0dg6Wncfa0+B3iD4PQPFP6
	aiAbvzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHQ4-0000000DK04-0a32;
	Wed, 28 May 2025 14:06:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKH5S-0000000DH8j-4Bsq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 13:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MBbrn7eQDWJVCAKImqv3Knw41beS2cHZDNUxETDEwfM=; b=O8iQQ/V8bHl6lOCEVTlkgRjo44
	gcgAFR2K9InA3NJSn5okPeS35of+VlF+V2w7viINNPtJbrMNDgEsU6GQ4isK4scegHzenw8YdCiSd
	nVUaAEytpdXsvMKdXFQTmALESkOqOSgRjHyrC+sjcGoTmnR9KapDaflyr9RjgT+u0MrU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uKH55-00EBEE-SV; Wed, 28 May 2025 15:44:31 +0200
Date: Wed, 28 May 2025 15:44:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: weishangjuan@eswincomputing.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	vladimir.oltean@nxp.com, rmk+kernel@armlinux.org.uk,
	yong.liang.choong@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
	jan.petrous@oss.nxp.com, jszhang@kernel.org, p.zabel@pengutronix.de,
	0x1207@gmail.com, boon.khai.ng@altera.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, lizhi2@eswincomputing.com
Subject: Re: [PATCH v2 2/2] =?iso-8859-1?Q?ethernet?=
 =?iso-8859-1?B?OqBlc3dpbjqgQWRkoGVpYzc3MDCgZXRoZXJuZXSgZHJpdmVy?=
Message-ID: <2c2dc4cb-57aa-476a-8668-c0b358f0ee0c@lunn.ch>
References: <20250528041455.878-1-weishangjuan@eswincomputing.com>
 <20250528041634.912-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528041634.912-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_064455_040402_B61A0B2D 
X-CRM114-Status: GOOD (  19.64  )
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

> +/* PHY default addr in mdio*/
> +#define PHY_ADDR				-1

PHY addresses are 0 to 31. How can -1 be a default?

> +static struct clk *dwc_eth_find_clk(struct plat_stmmacenet_data *plat_dat,
> +				    const char *name)
> +{
> +	for (int i = 0; i < plat_dat->num_clks; i++)
> +		if (strcmp(plat_dat->clks[i].id, name) == 0)
> +			return plat_dat->clks[i].clk;
> +
> +	return NULL;
> +}

Please look at the cleanup work Russell King has been doing the last
couple of months. Is this still needed?

> +static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
> +				   struct plat_stmmacenet_data *plat_dat)
> +{
> +	struct device *dev = &pdev->dev;
> +	u32 burst_map = 0;
> +	u32 bit_index = 0;
> +	u32 a_index = 0;
> +
> +	if (!plat_dat->axi) {
> +		plat_dat->axi = devm_kzalloc(&pdev->dev, sizeof(struct stmmac_axi), GFP_KERNEL);
> +
> +		if (!plat_dat->axi)
> +			return -ENOMEM;
> +	}
> +
> +	plat_dat->axi->axi_lpi_en = device_property_read_bool(dev,
> +							      "snps,en-lpi");
> +	if (device_property_read_u32(dev, "snps,write-requests",
> +				     &plat_dat->axi->axi_wr_osr_lmt)) {
> +		/**
> +		 * Since the register has a reset value of 1, if property
> +		 * is missing, default to 1.
> +		 */

Is that described in the binding? Please fully describe all the DT
properties, including what happens when they are not present.

> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,phyaddr", 0,
> +					 &dwc_priv->phyaddr);
> +	if (ret)
> +		dev_warn(&pdev->dev, "can't get phyaddr (%d)\n", ret);

Are we talking about the Ethernet PHY here or a generic PHY? You
should not need any vendor properties for an Ethernet phy, phy-handle
points to the PHY on an MDIO bus.

> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "dly-param-1000m",
> +						  &dwc_priv->dly_param_1000m[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay param for 1Gbps mode (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "dly-param-100m",
> +						  &dwc_priv->dly_param_100m[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay param for 100Mbps mode (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "dly-param-10m",
> +						  &dwc_priv->dly_param_10m[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay param for 10Mbps mode (%d)\n", ret);
> +		return ret;
> +	}

        rx-internal-delay-ps:
          description:
            RGMII Receive Clock Delay defined in pico seconds. This is used for
            controllers that have configurable RX internal delays. If this
            property is present then the MAC applies the RX delay.
        tx-internal-delay-ps:
          description:
            RGMII Transmit Clock Delay defined in pico seconds. This is used for
            controllers that have configurable TX internal delays. If this
            property is present then the MAC applies the TX delay.

The RGMII standard only talks about 2ns delay. There is no delay per
link speed. This is something specific to your hardware. Please figure
out how you can map these standard properties to what you need for
100Mbps and 10Mbps.

    Andrew

---
pw-bot: cr

