Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57940C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 08:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIabp6CH5t9ZE/Ru7LEzq8hTIT/4p00+D5QTlAX3D7g=; b=pcwa35CelmWr9ZsJbvl+CL1Dpd
	hG2reNlsbYWs1xJYWVPcgpLJMZjdFJQLOWlUq3P7D8iDZiUKAwdcGwLmkG2Nvae9ulpSLE1ETGWdY
	YsB8c13tbfXEtVZSwgOpuRZ+vbTB5AO4uSPRPyQxomaw1P3wYpJMtxd2LLjr7aVd+wfdF+BCnDjBI
	v4zhSYGA6RA86wRvAp4D0AXR+2SqFONXZWH6fp/GmFwA8fsJumhyK71zUHtFoPFIk3k5ykuARjiOC
	XKs77j8RwBJSxjc93d388BtrVdq/Rxc7AOOc/Yh3ijAP9U8Mudarnr0icutXCD4InNBvkIEfu46AQ
	FZwSqV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVR2k-0000000GZ2M-1Xz8;
	Sat, 28 Jun 2025 08:36:14 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVR0S-0000000GYrR-0A4p;
	Sat, 28 Jun 2025 08:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751099625;
	bh=b7u6Bwt2ZNSo2618uyhqFbiGYaGohf8fOBCJfzXeq9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qa0Ud+B+6b9dNWaEi9O95+hKP+rTkjJNpVCcAMW9KiKHVw2XrN7E5ApXmAFc7Tiya
	 qTSkyFNOLsK3HL9jCiH5ZDkh23GpMXuH0BuxHRLNSXAQ/neriRsm1CNKXlOEwYLDLu
	 ACKUuPkED8q09senM2ahGCO4A8ZRzYI1HQ8P2Rlo=
Date: Sat, 28 Jun 2025 10:33:44 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v15 08/12] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <9f60809e-ad8c-4f97-961a-d13fa5031981@t-8ch.de>
References: <20250626212321.28114-1-ansuelsmth@gmail.com>
 <20250626212321.28114-9-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626212321.28114-9-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_013352_228949_77FE34CA 
X-CRM114-Status: GOOD (  14.36  )
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

On 2025-06-26 23:23:07+0200, Christian Marangi wrote:
> Add Airoha AN8855 5-Port Gigabit DSA switch. Switch can support
> 10M, 100M, 1Gb, 2.5G and 5G Ethernet Speed but 5G is currently error out
> as it's not currently supported as requires additional configuration for
> the PCS.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/dsa/Kconfig  |    9 +
>  drivers/net/dsa/Makefile |    1 +
>  drivers/net/dsa/an8855.c | 2386 ++++++++++++++++++++++++++++++++++++++
>  drivers/net/dsa/an8855.h |  773 ++++++++++++
>  4 files changed, 3169 insertions(+)
>  create mode 100644 drivers/net/dsa/an8855.c
>  create mode 100644 drivers/net/dsa/an8855.h

<snip>

> +static int an8855_switch_probe(struct platform_device *pdev)
> +{
> +	struct an8855_priv *priv;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	/* Get regmap from MFD */
> +	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!priv->regmap)
> +		return -ENOENT;
> +
> +	priv->ds = devm_kzalloc(&pdev->dev, sizeof(*priv->ds), GFP_KERNEL);
> +	if (!priv->ds)
> +		return -ENOMEM;
> +
> +	priv->ds->dev = &pdev->dev;
> +	priv->ds->num_ports = AN8855_NUM_PORTS;
> +	priv->ds->priv = priv;
> +	priv->ds->ops = &an8855_switch_ops;
> +	devm_mutex_init(&pdev->dev, &priv->reg_mutex);

Check the return value of devm_mutex_init().
This will become a compile error soon.

> +	priv->ds->phylink_mac_ops = &an8855_phylink_mac_ops;
> +
> +	priv->pcs.ops = &an8855_pcs_ops;
> +	priv->pcs.poll = true;
> +
> +	dev_set_drvdata(&pdev->dev, priv);
> +
> +	return dsa_register_switch(priv->ds);
> +}

<snip>

