Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC422C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB+qPympDgej2P0RT4awNqENmPN0DVLN9Y0lFyxzCw8=; b=4cWB5H05c/kBRB1iuChaa/kIj8
	w++NQPVBQckwBc7S1L6E9Tm7nfHApx6X/XV9tO3+S8+E5dfscMYX5Ewwk3lS8AMa2PvUz1UIxrCVV
	y7GkmSZmuSI3lnkJz2jxe+k6CHjX9jdp99C4WS2lOoeu0ryj+cB4Y1yF8ibbp+vj5x9+yS5diDmeD
	34Qb3/nupFfQOILE7iUYQ7PSDicwg8a8dhrzL7b6LsIWfVWNRZuNStUPWgNYnMX5sjdFc979fqEhM
	RKVrnE932a6+NEgXl/CToimLaQmQu5aovfralOjPvYmWvfZ7uRyX69fa16ZP6LqdV1TW+b3cqTeaj
	0RvwB2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5USO-00000001AiP-3kb0;
	Sat, 12 Sep 2026 20:36:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5USJ-00000001Age-0fIk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 20:36:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 610E3447F7;
	Sat, 12 Sep 2026 20:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29221F00898;
	Sat, 12 Sep 2026 20:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789245370;
	bh=yB+qPympDgej2P0RT4awNqENmPN0DVLN9Y0lFyxzCw8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oZjr33ASNsZqqvhPztx3+hVwun5yHxMJZckJ0Yk0Qo2yfn2QtGEu5jfAHvZ3PTRZx
	 ZC8QkVr2XnPZit1LQ9jjZqyMlW2eLpYRBIkv0fZIJdBCGC9GG9n8EUvL8fRBNKzOJw
	 t3bLvXHMMLnM9yPNU7rPVxe3NQS37V5rjsn37Q7yAAWUX/8dIzYc3OTt24yN2EHCzo
	 K9acrCJfKv0eWS7vS7rkr3fxaRLSULlV0me0NPBx9r+kXeSt+8LRLEvxl/dyN/kgef
	 mQVkluRYAuT8kk95j32tjiqWQwsLNLWfWxkRV/8vcBvQP6dIdZHVdTKAT+Az2+AOGr
	 te/Hy9bNuhPtw==
Subject: Re: [PATCH net-next v2 3/8] net: xilinx: tsn: add endpoint MAC driver
 skeleton
From: netdev-bot+sashiko@kernel.org
To: srinivas.neeli@amd.com
Cc: nagadheeraj.rottela@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
 michal.simek@amd.com, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, neelisrinivas18@gmail.com, git@amd.com
Date: Sat, 12 Sep 2026 20:36:08 +0000
Message-ID: <178924536843.3125.9655255476131138078@kernel.org>
In-Reply-To: <20260909-patches_v2_external-v2-3-3a40babaff4c@amd.com>
References: <20260909-patches_v2_external-v2-3-3a40babaff4c@amd.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 2

- [Low] Commit message contradicts the code: the message body states
  'Register the netdev named "ep"', but xlnx_tsn_ep_probe() calls…
- [Low] Reported concern (validated as NOT a defect at the end of the
  series): the binding Documentation/devicetree/bindings/net/xlnx,tsn-…

--

net: xilinx: tsn: add endpoint MAC driver skeleton

This adds a platform driver for the "xlnx,tsn-ep-mac" endpoint MAC that
registers an enumerated netdev with minimal netdev and ethtool ops, sets
the MAC address from DT or a random one, and drops all transmitted
frames.  The new driver is registered alongside the existing TSN
platform driver.

Two questions below, both minor.

> Add a platform driver (compatible "xlnx,tsn-ep-mac") for the endpoint.
> Register the netdev named "ep", set its MAC address, and provide minimal
> netdev and ethtool ops. ndo_open starts the queues and ndo_start_xmit
> drops frames.

[Severity: Low]
Should "the netdev named "ep"" say ep%d here?  xlnx_tsn_ep_probe() uses:

	ndev = alloc_netdev(sizeof(*ep), "ep%d", NET_NAME_ENUM, ether_setup);

so the interface shows up as ep0, and ep1 for a second IP instance.  The
kernel-doc for struct xlnx_tsn_ep in the same file already says '("ep0"
for the first IP instance)'.

The rename is described in the v2 changelog below the "---" separator,
which is dropped when the patch is applied, so the permanent log would
keep the old name.  Can the message body be updated to match?

> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> new file mode 100644
> index 000000000000..089f17a126f5
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> @@ -0,0 +1,143 @@

[ ... ]

> +static int xlnx_tsn_ep_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct net_device *ndev;
> +	struct xlnx_tsn_ep *ep;
> +	u8 mac_addr[ETH_ALEN];
> +	int ret;
> +
> +	ndev = alloc_netdev(sizeof(*ep), "ep%d", NET_NAME_ENUM, ether_setup);
> +	if (!ndev)
> +		return -ENOMEM;
> +
> +	SET_NETDEV_DEV(ndev, dev);
> +	ndev->netdev_ops = &ep_netdev_ops;
> +	ndev->ethtool_ops = &ep_ethtool_ops;
> +	ndev->features = NETIF_F_SG;
> +
> +	ep = netdev_priv(ndev);
> +	ep->ndev = ndev;
> +	ep->dev = dev;
> +
> +	ret = of_get_mac_address(dev->of_node, mac_addr);

[Severity: Low]
This isn't a bug, but of_get_mac_address() is the only DT property read
here, while the binding
Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
lists reg, dmas, dma-names and tx-queues-config as required for this
node.

The later patches in this series ("net: xilinx: tsn: parse endpoint DMA
channel configuration" and the MCDMA/RX/TX data path patches) do add
ep_count_dma_queues() and ep_parse_tx_queue_config(), so dmas,
dma-names, tx-queues-config and xlnx,num-priorities all end up parsed
and enforced with dev_err_probe() by the end of the series.

The one property that is still never consumed at the end of the series
is the required reg region, since the v2 changelog notes the ioremap
comes back with QBV support.  Is reg intended to stay documentation-only
for the node unit address until then?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909-patches_v2_external-v2-0-3a40babaff4c%40amd.com

