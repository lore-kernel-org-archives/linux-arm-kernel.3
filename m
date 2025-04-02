Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAD7C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yibjlCzMj7db36Ncl+n+k08WtHR8TCTohVRGWqYmZg0=; b=oK1sqUHhbyLWAvA9vAKRFU2sIz
	CxPFAjg73jfH+JaHxwqpyf1+8UQ28VgTdO2oa5kPzGmXWkImmQpIveU5rG+ZesqnLgXIDBP9iACpa
	r3hfOLXCHHk5xioJitJF/ElrcbgRA2Lc0XH6bvcOz9kN/+gVOYQkcn/asAp8CN3pf2iWMt+TU8Gcc
	aMi2oIv5ifJ41PIdBrux4Q1CrBREE5JlwfdaSQ3F9h++yKFLvRB5jQcI+4ws/qu4e1to57Alcqcd5
	9GFrhqlhjvFWGDK8pPgw+oN+a+1ybErKnz6jx/xCagv1OzROWBSBbobO6ccblnXAu78MzouMI1rL4
	j+o4pJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxax-000000069ZF-3vr2;
	Wed, 02 Apr 2025 12:53:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxVm-000000068DV-17Nl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yibjlCzMj7db36Ncl+n+k08WtHR8TCTohVRGWqYmZg0=; b=UFpZgsLjYa47uMUX+kbAWXcqXj
	EAXRsVbFGjyOEQDht4LLsjdX2i6zX1P/detZLCGKl4B2bZqBP3vuGsDj76g6F2j2Je6VWPDl7nVYP
	UatDa/505MPVEy3wGGZrB+COxlRk+tMXa/YhSgMarkAYW4y/gXTQkgS/PzfN31YyzEdo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tzxVc-007n1N-8p; Wed, 02 Apr 2025 14:47:56 +0200
Date: Wed, 2 Apr 2025 14:47:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/4] net: mtip: The L2 switch driver for imx287
Message-ID: <8f431197-474e-4cd5-9c3e-d573c3f3e6b5@lunn.ch>
References: <20250331103116.2223899-1-lukma@denx.de>
 <20250331103116.2223899-5-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331103116.2223899-5-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_054806_315984_9BC2257D 
X-CRM114-Status: GOOD (  23.75  )
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

> +static void read_atable(struct switch_enet_private *fep, int index,
> +			unsigned long *read_lo, unsigned long *read_hi)
> +{
> +	unsigned long atable_base = (unsigned long)fep->hwentry;
> +
> +	*read_lo = readl((const void *)atable_base + (index << 3));
> +	*read_hi = readl((const void *)atable_base + (index << 3) + 4);
> +}
> +
> +static void write_atable(struct switch_enet_private *fep, int index,
> +			 unsigned long write_lo, unsigned long write_hi)
> +{
> +	unsigned long atable_base = (unsigned long)fep->hwentry;
> +
> +	writel(write_lo, (void *)atable_base + (index << 3));
> +	writel(write_hi, (void *)atable_base + (index << 3) + 4);
> +}

It would be nice to have the mtip_ prefix on all functions.

> +static int mtip_open(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	int ret, port_idx = priv->portnum - 1;
> +
> +	if (fep->usage_count == 0) {
> +		clk_enable(fep->clk_ipg);
> +		netif_napi_add(dev, &fep->napi, mtip_rx_napi);
> +
> +		ret = mtip_alloc_buffers(dev);
> +		if (ret)
> +			return ret;

nitpick: You might want to turn the clock off before returning the
error.

> +	}
> +
> +	fep->link[port_idx] = 0;
> +
> +	/* Probe and connect to PHY when open the interface, if already
> +	 * NOT done in the switch driver probe (or when the device is
> +	 * re-opened).
> +	 */
> +	ret = mtip_mii_probe(dev);
> +	if (ret) {
> +		mtip_free_buffers(dev);

I've not checked. Does this do the opposite of netif_napi_add()?

> +static void mtip_set_multicast_list(struct net_device *dev)
> +{
> +	unsigned int i, bit, data, crc;
> +
> +	if (dev->flags & IFF_PROMISC) {
> +		dev_info(&dev->dev, "%s: IFF_PROMISC\n", __func__);

You can save one level of indentation with a return here.

> +	} else {
> +		if (dev->flags & IFF_ALLMULTI) {
> +			dev_info(&dev->dev, "%s: IFF_ALLMULTI\n", __func__);

and other level here.

> +		} else {
> +			struct netdev_hw_addr *ha;
> +			u_char *addrs;
> +
> +			netdev_for_each_mc_addr(ha, dev) {
> +				addrs = ha->addr;
> +				/* Only support group multicast for now */
> +				if (!(*addrs & 1))
> +					continue;

You could pull there CRC caluclation out into a helper. You might also
want to search the tree and see if it exists somewhere else.

> +
> +				/* calculate crc32 value of mac address */
> +				crc = 0xffffffff;
> +
> +				for (i = 0; i < 6; i++) {

Is 6 the lengh of a MAC address? There is a #define for that.

> +					data = addrs[i];
> +					for (bit = 0; bit < 8;
> +					     bit++, data >>= 1) {
> +						crc = (crc >> 1) ^
> +						(((crc ^ data) & 1) ?
> +						CRC32_POLY : 0);
> +					}
> +				}
> +			}
> +		}
> +	}
> +}
> +

> +struct switch_enet_private *mtip_netdev_get_priv(const struct net_device *ndev)
> +{
> +	if (ndev->netdev_ops == &mtip_netdev_ops)
> +		return netdev_priv(ndev);
> +
> +	return NULL;
> +}
> +

> +static int __init mtip_switch_dma_init(struct switch_enet_private *fep)
> +{
> +	struct cbd_t *bdp, *cbd_base;
> +	int ret, i;
> +
> +	/* Check mask of the streaming and coherent API */
> +	ret = dma_set_mask_and_coherent(&fep->pdev->dev, DMA_BIT_MASK(32));
> +	if (ret < 0) {
> +		dev_warn(&fep->pdev->dev, "No suitable DMA available\n");

Can you recover from this? Or should it be dev_err()?

More later...

	Andrew

