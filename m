Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88149606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vv4DVgDM;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YGxDBQkU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6d6z90kujskdu9Nq7+vIIcl4GoA3T1K6qt7oPYIti/k=; b=Vv4DVgDM0wWBcgPSnCbH4lgihM
	i1XgLNzkpTPfJJIqnGnoUP0ujDLtj9lUju/DZgHBKVjBv0sNtBGoJzdfA3+POzZPJGSz2WUKwpdAr
	6NvToFVZ+DBaNPkMEBm4Yru5ZS8f3AAjymGFPmuh7UgiOhmdLBfcs0BEkUL26d4UMPozyPLu1d+rc
	FjhWSgf4j9/4xtlxycQpEBDo3zOYxUSSfIo0UDpatJcWlsTI6RUAcJemvG4pbTdtEBri/NTnvPLtk
	8jqyc+AQEn456yPTC9eOyjoEpxEFa6cqdA+tcR0HBZq3LWSudthsYqSEeQA3wxo1HvGcLbexNQlJB
	Imec4b3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8U1-00000009beQ-2huH;
	Tue, 20 Oct 2026 11:58:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Tx-00000009bcK-27gv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:58:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBAB360220;
	Tue, 20 Oct 2026 11:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604281F000C5;
	Tue, 20 Oct 2026 11:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792497496;
	bh=6d6z90kujskdu9Nq7+vIIcl4GoA3T1K6qt7oPYIti/k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YGxDBQkUvKZwAULI5HrvGzRai3ZG0YuPxSnj3ToS4Iljs9LvcvnVujkIrgaPFQtan
	 X8jOWeh6JCLFnBA/+yMju1EOm7wTiaTXieaG4qCYeRqY5OhR90P4A7s8khvC7pm31A
	 l6xopzVc24mRghYbnplN9+INGcw6DAf5ngXF8FVFnnOLiAxFoRxUYm+R9rw3WKmANc
	 /sJbQcThKK+hoU2Ecu5lcGNmvEscuokfWd5H/gFnOS4tBwnlH1Fjx/TccBWBaOGUO9
	 s8laMiB7oLBNEHYedv/NA9WYocJzKUWrfXmksBLgRmNiufvVHYLPN7JzPvVcKYjFEq
	 v7F9vxThlZweg==
Subject: Re: [PATCH net-next v3 3/8] net: xilinx: tsn: add endpoint MAC driver
 skeleton
From: netdev-bot+sashiko@kernel.org
To: srinivas.neeli@amd.com
Cc: nagadheeraj.rottela@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, michal.simek@amd.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 edumazet@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, neelisrinivas18@gmail.com, git@amd.com
Date: Tue, 20 Oct 2026 11:58:14 +0000
Message-ID: <179249749490.3135.16050500473575890674@kernel.org>
In-Reply-To: <20261016-patches_v2_external-v3-3-e33d3960ca1e@amd.com>
References: <20261016-patches_v2_external-v3-3-e33d3960ca1e@amd.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] xlnx_tsn_ep_probe() in
  drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c (line 80) open-codes…

--

net: xilinx: tsn: add endpoint MAC driver skeleton

This adds a platform driver for the "xlnx,tsn-ep-mac" endpoint MAC. The
endpoint MAC provides the conduit netdev for the TSN DSA switch. The driver
registers an eth%d netdev, sets its MAC address from DT or a random one,
and provides minimal netdev/ethtool ops where xmit just drops frames.

> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> new file mode 100644
> index 0000000000000..609d444c68356
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c

[ ... ]

> +static int xlnx_tsn_ep_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct net_device *ndev;
> +	struct xlnx_tsn_ep *ep;
> +	u8 mac_addr[ETH_ALEN];
> +	int ret;
> +
> +	ndev = alloc_netdev(sizeof(*ep), "eth%d", NET_NAME_UNKNOWN, ether_setup);

[Severity: Low]
Should this be NET_NAME_ENUM rather than NET_NAME_UNKNOWN?

With the "eth%d" template the kernel chooses the number. The standard
helper for that case uses NET_NAME_ENUM:

net/ethernet/eth.c:alloc_etherdev_mqs() {
	return alloc_netdev_mqs(sizeof_priv, "eth%d", NET_NAME_ENUM,
				ether_setup, txqs, rxqs);
}

The DSA user port fallback in dsa_user_create() in net/dsa/user.c also
pairs "eth%d" with NET_NAME_ENUM. The v2 changelog gave that as its reason.

With NET_NAME_UNKNOWN, reading /sys/class/net/ethX/name_assign_type for
this device returns -EINVAL:

net/core/net-sysfs.c:name_assign_type_show() {
	...
	if (READ_ONCE(ndev->name_assign_type) != NET_NAME_UNKNOWN)
		ret = netdev_show(dev, attr, buf, format_name_assign_type);
	...
}

Netdevs from alloc_etherdev() and the DSA user netdevs stacked on top of
this conduit report 1 there.

The v3 changelog says:

  "Register the netdev with the standard eth%d name (NET_NAME_UNKNOWN)"

That doesn't match what the standard helper does. Would alloc_etherdev()
work here instead? It would also drop the open-coded ether_setup.

Later in the series, "net: xilinx: tsn: parse endpoint DMA channel
configuration" changes this call to alloc_netdev_mqs(sizeof(*ep), "eth%d",
NET_NAME_UNKNOWN, ether_setup, ...) and still uses NET_NAME_UNKNOWN.
alloc_etherdev_mqs() would cover that multi-queue version.

> +	if (!ndev)
> +		return -ENOMEM;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261016-patches_v2_external-v3-0-e33d3960ca1e%40amd.com

