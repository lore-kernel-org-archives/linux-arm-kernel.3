Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9B560A382B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d8sDSye8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cnUcpCPj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syc3GYQ5HvVy0QHYkXhBl6da7phjefuxw0j+dRWKLBw=; b=d8sDSye8AwjtvPxnJO0ZR5BKsO
	PMHS5SDNJVfRa2hW9yZ4YpcVLv9phuZTlfx2+yS9WJgUIeLavux0ZHMzU+rxbI06PgBq8JhcfjRXD
	rO2Zsctp4oNz61hYhxvdlJt2xHoQJnIFgqoTmApBUzWinApVGMK8lx/uX261mVm50ukZikfo12p8o
	pN1JC5zANOljZzr68TVCo1OiT+EIVTzcddWBa1AJLgFUXx8sRMuOysTOijx8PX6cHRhMSFNaElllt
	LRon2zp0mOnL1sa4pK1bLdt3N1UolrdVdXB8IBX6Nt93XLCAeg8Ue/p7iGlZ2cMEOLrw0s7DqtM9M
	6TJYxn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8U1-00000009bef-39uG;
	Tue, 20 Oct 2026 11:58:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Tz-00000009bcx-02Sq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:58:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BFF7140783;
	Tue, 20 Oct 2026 11:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5674E1F000C5;
	Tue, 20 Oct 2026 11:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792497498;
	bh=syc3GYQ5HvVy0QHYkXhBl6da7phjefuxw0j+dRWKLBw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cnUcpCPj39aSwUbTJl2ImdBjxR7PcPSlyyhK2fmIidXWub5mBTFxmVd9heKYG4QTJ
	 nkmZeZhbiLSpXv2u66P9YRvX8U0pCQxqjnthY+cgsEIPop88eiO92TTlmxSPT/w8wJ
	 UsKOMxfBGs9+VTWHu0qaHvqmS6ZtZRjf3iKc5kfvwf5K/wIQoFBqG6aj9vF/zj8SEY
	 NghsPBP0ICykBe0HZ51DRfl5en/V+3+v0jKbcqTw4PJZ/w4xKLib3oupdOnJfEFqZ9
	 oz8V7/5Hn+jhooaS9MLh9YZxtQeDob0VLJEuyO0/nkhfK9pGInGgOCF7ImO4Dq3JKH
	 puZkQgbj/2cuA==
Subject: Re: [PATCH net-next v3 4/8] net: xilinx: tsn: parse endpoint DMA
 channel configuration
From: netdev-bot+sashiko@kernel.org
To: srinivas.neeli@amd.com
Cc: nagadheeraj.rottela@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, michal.simek@amd.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 edumazet@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, neelisrinivas18@gmail.com, git@amd.com
Date: Tue, 20 Oct 2026 11:58:16 +0000
Message-ID: <179249749685.3135.16300213883821767663@kernel.org>
In-Reply-To: <20261016-patches_v2_external-v3-4-e33d3960ca1e@amd.com>
References: <20261016-patches_v2_external-v3-4-e33d3960ca1e@amd.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The driver enforces DT rules that the in-tree binding
  (Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-…

--

net: xilinx: tsn: parse endpoint DMA channel configuration

This commit counts the TX and RX MCDMA channels listed in dma-names and
allocates the conduit netdev with that many queues. It also parses the
tx-queues-config child node to map each logical TX queue to a tx_chanN
entry. Probe fails if the mapping is not one-to-one, or if the TX
channel count differs from xlnx,num-priorities.

> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> index 609d444c68356..2adee07f6f51c 100644
> --- a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c

[ ... ]

>  static int xlnx_tsn_ep_probe(struct platform_device *pdev)
>  {

[ ... ]

> +	ip_np = of_get_parent(dev->of_node);
> +	if (!ip_np)
> +		return dev_err_probe(dev, -EINVAL, "missing parent IP node\n");
> +
> +	ret = of_property_read_u32(ip_np, "xlnx,num-priorities", &num_prio);
> +	of_node_put(ip_np);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "missing xlnx,num-priorities\n");
> +
> +	if (num_tx_dma_channels != num_prio)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "TX channel count %u must equal num-priorities %u\n",
> +				     num_tx_dma_channels, num_prio);

[Severity: Medium]
Do these rules match what the binding in
Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
allows?

Here xlnx_tsn_ep_probe() requires the number of tx_chanN entries in
dma-names to equal xlnx,num-priorities. ep_parse_tx_queue_config() adds
three more rules:

	if (!str_has_prefix(qnode->name, "queue") ||
	    kstrtou32(qnode->name + strlen("queue"), 10, &queue) ||
	    queue >= ep->num_tx_queues)
	...
	if (test_and_set_bit(chan, chan_seen))
	...
	if (count != ep->num_tx_queues)

The binding only has:

	dma-names:
	  items:
	    pattern: "^(tx|rx)_chan[0-7]$"
	  allOf:
	    - contains:
	        pattern: "^tx_chan[0-7]$"
	    - contains:
	        pattern: "^rx_chan[0-7]$"

	tx-queues-config:
	  patternProperties:
	    "^queue[0-7]$":

The allOf blocks at the end of the binding only require queue0 through
queue(num-priorities - 1). The binding does not tie the tx_chanN count to
xlnx,num-priorities. It does not forbid queueN nodes at or above
num-priorities, and it does not require each queue to use a distinct
channel.

Its description reads as a general mapping:

	For example, queue0 with xlnx,dma-channel-num set to 5 means
	priority queue 0 uses tx_chan5 for data transfer.

So some device trees pass schema validation but would make probe fail
with -EINVAL. For example:

  - xlnx,num-priorities = <4> with all eight tx_chanN entries listed and
    queue0..queue3 mapped to channels 4..7
  - xlnx,num-priorities = <2> with queue0, queue1 and queue2 nodes
  - xlnx,num-priorities = <2> with two tx channels and both queues
    mapped to channel 0

The binding also sets minimum: 2 for xlnx,num-priorities, and the driver
does not check that.

Later patches in the series do not change the binding, so the mismatch
is still there at the end of the series.

Should the binding describe and enforce the one-to-one queue/channel rule
and the num-priorities rule? Or should the driver accept the general
mapping that the binding describes?

>  
> -	ndev = alloc_netdev(sizeof(*ep), "eth%d", NET_NAME_UNKNOWN, ether_setup);
> +	ndev = alloc_netdev_mqs(sizeof(*ep), "eth%d", NET_NAME_UNKNOWN,
> +				ether_setup, num_tx_dma_channels,
> +				num_rx_dma_channels);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261016-patches_v2_external-v3-0-e33d3960ca1e%40amd.com

