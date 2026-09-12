Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC7EC88E65
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ogonOqpgyEB6kgacfYKnKkNjbUMkziLQ4rxvlKSZwU=; b=K6NRiyM0ZnWbi6R2EpbcpJL8wD
	y8QL05KhJVJ+JSc7f8vtqFLuQdXWuNkP8fV3DCTdo0BPzqymQoQdx9XFL6JGbOmB1+Q4yovA5V8st
	xYtzPDmclolhsu3Z2yIQdYm8L3vwS0iQX8ljsHhH3jHaVNHp96UZTb50FsFldfDGxb7+NfjJ4S9MD
	JdELrjqPE97TsrVGA2gn3QXiouduUi+AOrSfwj4pMB5UKXCnC7c5NmddpVjpXrCMvNXy1pdpZ3ZYt
	qW2KMLBEQzxYy4ILaAk8MJIxoFk3ZjVY6Y/cjEu47ZYhlS709SXufvER/jGgTAabkyHMS/mQaMICG
	M0/Z3V/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5USP-00000001AjV-12bx;
	Sat, 12 Sep 2026 20:36:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5USO-00000001Ahv-27Q2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 20:36:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED05360213;
	Sat, 12 Sep 2026 20:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5BF1F00893;
	Sat, 12 Sep 2026 20:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789245375;
	bh=7ogonOqpgyEB6kgacfYKnKkNjbUMkziLQ4rxvlKSZwU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lMQ57srTtrpfqW2athOWSwRqqV47rFYG822cWJq5wYyeRwRx0J4hgMSftYISiIsNK
	 qe6kUjghyHMKC5tXXRogV7z033J1WCtZ74B8hK8N89MYm+qF1GPzmLetyuNoJBopzq
	 fCOeG5w0i2FnZ2hyIZKIt/elOTDLx4jUcW+4uqeigo7wT/AO1KZ4d/nc+0Jq6wJIl+
	 oUFE4wMmCW3twzlTxK9YHFW8ZmFeFq1DTpyBnYtrzvNXC/TQLSWsVGOujxeIo/Rl9a
	 KsktRcgUQUG75wOdHkQo8TZx7uZ/3izgUL+pmEc0AWCkU78HwYd0IdFH4TJiZdN9w5
	 2OV5SuVCna13g==
Subject: Re: [PATCH net-next v2 6/8] net: xilinx: tsn: add the endpoint RX data path
From: netdev-bot+sashiko@kernel.org
To: srinivas.neeli@amd.com
Cc: nagadheeraj.rottela@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
 michal.simek@amd.com, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, neelisrinivas18@gmail.com, git@amd.com
Date: Sat, 12 Sep 2026 20:36:14 +0000
Message-ID: <178924537407.3125.1382925704702790504@kernel.org>
In-Reply-To: <20260909-patches_v2_external-v2-6-3a40babaff4c@amd.com>
References: <20260909-patches_v2_external-v2-6-3a40babaff4c@amd.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider:

Critical: 0 · High: 2 · Medium: 3 · Low: 0

- [High] The new RX path cannot deliver a single frame on the hardware it
  targets.
- [High] ep_rx_submit_desc()
  (drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c:169-178) records the…
- [Medium] ep_dma_rx_cb() documents and indexes the dmaengine metadata
  window as "[0] = status, [1] = sideband (TID/TDEST/TUSER), [2..] =…
- [Medium] ep_rx_refill() holds the per-channel spinlock with softirqs
  disabled (guard(spinlock_bh)(&xchan->rx_lock), line 191) across a loop…
- [Medium] The commit message states "ndo_stop() sets a closing flag
  under the same per-channel lock the refill takes", but ep_stop() (line…

--

net: xilinx: tsn: add the endpoint RX data path

This adds the RX side of the Xilinx TSN endpoint: RX buffers are posted to
every RX channel at ndo_open and reaped from the dmaengine completion
callback, which decodes a TUSER port_id out of the descriptor metadata and
passes MAC1/MAC2 frames up with __netif_rx(). A per-channel rx_lock plus a
refill timer are added to serialise refill against teardown.

[Severity: Medium]
The commit message says:

  "Serialise the RX refill against teardown. The completion callback re-arms
   the ring, so ndo_stop() sets a closing flag under the same per-channel
   lock the refill takes, and ep_free_dma_chan() takes that lock as a barrier
   before it terminates the channel."

Is the "under the same per-channel lock" part accurate?  ep_stop() looks
like this:

	netif_tx_disable(ndev);
	WRITE_ONCE(ep->closing, true);
	ep_exit_dmaengine(ep);

The store is not done under any rx_lock; the per-channel lock only shows up
later in ep_free_dma_chan() as a bare lock/unlock barrier, after the flag
has already been published.  Since this claim is the stated reason a single
dmaengine_terminate_sync() suffices, could the wording be adjusted to
describe what the code actually does?

> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> index 23a15df71baa..9ed1170794e0 100644
> --- a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c

[ ... ]

> @@ -41,6 +43,19 @@
>  #define TX_BD_NUM_DEFAULT		64
>  #define RX_BD_NUM_DEFAULT		128
>  
> +#define EP_RX_REFILL_RETRY		msecs_to_jiffies(10)
> +
> +/*
> + * The DMA descriptor sideband status word packs TID/TDEST/TUSER together;
> + * TUSER occupies the low byte, TID/TDEST sit in the upper bits.
> + */
> +#define TSN_TUSER_MASK			GENMASK(7, 0)
> +/* TUSER Input Port ID field (bits [5:4] of the TUSER field) */
> +#define TSN_TUSER_PORT_ID_MASK		GENMASK(5, 4)
> +#define TSN_TUSER_PORT_EP		0x0
> +#define TSN_TUSER_PORT_MAC1		0x1
> +#define TSN_TUSER_PORT_MAC2		0x2
> +

[ ... ]

> @@ -113,6 +132,174 @@ ep_get_desc(struct xlnx_tsn_ep_dma_chan *xchan, int idx)

[ ... ]

> +	skbuf_dma->skb = skb;
> +	skbuf_dma->dma_address = sg_dma_address(skbuf_dma->sgl);
> +	skbuf_dma->desc = dma_rx_desc;
> +	dma_rx_desc->callback_param = xchan;
> +	dma_rx_desc->callback_result = ep_dma_rx_cb;
> +	xchan->ring_head++;
> +	dmaengine_submit(dma_rx_desc);
> +
> +	return 0;

[Severity: High]
Should ep_rx_submit_desc() check the cookie returned by dmaengine_submit()?
ring_head is advanced and the slot is marked armed before the submit, and
the return value is discarded, so 0 is returned even when the descriptor was
never queued.  The provider can fail:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_tx_submit() {
	...
	if (chan->err) {
		err = xilinx_dma_chan_reset(chan);
		if (err < 0)
			return err;
	}
	...
}

If that happens, three things seem to follow.

The skb and its DMA_FROM_DEVICE mapping stay pinned in the slot with no
completion ever arriving for it.

ep_dma_rx_cb() consumes slots strictly in ring_tail order with no
correlation to the completing descriptor:

	skbuf_dma = ep_get_desc(xchan, xchan->ring_tail & (xchan->ring_size - 1));
	WRITE_ONCE(xchan->ring_tail, xchan->ring_tail + 1);

so every later completion is attributed to the wrong slot.  Can this hand a
buffer the engine never wrote, i.e. freshly allocated dev_alloc_skb() memory
with another descriptor's length applied by skb_put(), to __netif_rx()?

And since ep_rx_refill() judges success only by ring_head != ring_tail, the
falsely advanced head makes refill report success, no retry timer is armed,
and the new ep_init_dmaengine() arming check passes with nothing queued.

The TX path in this series does check dma_submit_error() and rolls the slot
back; would the same handling fit here?

> +
> +err_unmap_skb:
> +	dma_unmap_single(xchan->dma_dev, addr, ep->max_frm_size, DMA_FROM_DEVICE);
> +err_free_skb:
> +	dev_kfree_skb(skb);
> +	return -ENOMEM;
> +}
> +
> +static bool ep_rx_refill(struct xlnx_tsn_ep_dma_chan *xchan, bool arm_timer)
> +{
> +	int avail, i;
> +
> +	guard(spinlock_bh)(&xchan->rx_lock);
> +
> +	if (READ_ONCE(xchan->ep->closing))
> +		return false;
> +
> +	avail = CIRC_SPACE(xchan->ring_head, READ_ONCE(xchan->ring_tail),
> +			   xchan->ring_size);
> +	for (i = 0; i < avail; i++) {
> +		if (ep_rx_submit_desc(xchan))
> +			break;
> +	}
> +	dma_async_issue_pending(xchan->chan);

[Severity: Medium]
Does rx_lock need to cover the whole submit loop?  The guard is taken at
function scope, so with an empty ring avail is ring_size - 1 (127 with
RX_BD_NUM_DEFAULT), and each iteration of ep_rx_submit_desc() does
dev_alloc_skb(), dma_map_single(), dmaengine_prep_slave_sg() and
dmaengine_submit() with softirqs disabled.

Two consequences worth considering.  On the ndo_open path
(ep_init_dmaengine -> ep_rx_refill(chan, false)) this is sleepable process
context, yet every allocation is forced into the GFP_ATOMIC reserve and can
fail ndo_open with -ENOMEM.  A concurrent RX completion on another CPU spins
on rx_lock for the whole burst.

Would moving the skb allocation and mapping outside rx_lock, or dropping and
retaking it per descriptor, work here?

> +
> +	if (xchan->ring_head != READ_ONCE(xchan->ring_tail))
> +		return true;
> +
> +	if (arm_timer)
> +		mod_timer(&xchan->rx_refill_timer, jiffies + EP_RX_REFILL_RETRY);
> +
> +	return false;
> +}

[ ... ]

> +	metadata = dmaengine_desc_get_metadata_ptr(skbuf_dma->desc,
> +						   &meta_len,
> +						   &meta_max_len);
> +	if (IS_ERR_OR_NULL(metadata)) {
> +		if (net_ratelimit())
> +			dev_warn(ep->dev, "Failed to get RX metadata pointer\n");
> +
> +		dev_kfree_skb_any(skb);
> +		DEV_STATS_INC(ndev, rx_dropped);
> +		DEV_STATS_INC(ndev, rx_errors);
> +		goto submit_new;
> +	}

[Severity: High]
Can this drop every received frame on the AXI MCDMA channels the endpoint
binding uses?  dmaengine_desc_get_metadata_ptr() goes through:

drivers/dma/dmaengine.c:
	ret = desc_check_and_set_metadata_mode(desc, DESC_METADATA_ENGINE);
	if (ret)
		return ERR_PTR(ret);

and xilinx_dma.c only advertises DESC_METADATA_ENGINE for
XDMA_TYPE_AXIDMA:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_probe() {
	...
	if (xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA)
		xdev->has_axistream_connected =
			of_property_read_bool(node, "xlnx,axistream-connected");
	...
	if (xdev->has_axistream_connected)
		xdev->common.desc_metadata_modes = DESC_METADATA_ENGINE;
	...
}

xilinx_mcdma_prep_slave_sg() also never assigns
desc->async_tx.metadata_ops, unlike the two AXIDMA prep paths.  With
desc_metadata_modes unset, desc_check_and_set_metadata_mode() returns
-ENOTSUPP for every MCDMA completion, so IS_ERR_OR_NULL(metadata) is taken
and the skb is freed with rx_dropped/rx_errors incremented, making the
port_id filtering and __netif_rx() below unreachable.

Would a one-time capability check at open (for example
dmaengine_is_metadata_mode_supported()) be better than a ratelimited
per-packet warning here, and does the MCDMA side need metadata support added
first?

> +
> +	/* MCDMA metadata: [0] = status, [1] = sideband (TID/TDEST/TUSER), [2..] = app */
> +	tuser = metadata[1] & TSN_TUSER_MASK;
> +	rx_len = ep->max_frm_size - result->residue;

[Severity: Medium]
Is metadata[1] really the sideband word?  The in-tree provider hands out the
APP window, not the status word:

drivers/dma/xilinx/xilinx_dma.c:xilinx_dma_get_metadata_ptr() {
	*max_len = *payload_len = sizeof(u32) * XILINX_DMA_NUM_APP_WORDS;
	seg = list_first_entry(&desc->segments,
			       struct xilinx_axidma_tx_segment, node);
	return seg->hw.app;
}

and in the MCDMA hardware descriptor the status and sideband words sit
before app[]:

struct xilinx_aximcdma_desc_hw {
	...
	u32 control;		/* @0x14 */
	u32 status;		/* @0x18 */
	u32 sideband_status;	/* @0x1C */
	u32 app[XILINX_DMA_NUM_APP_WORDS]; /* @0x20 */
};

So metadata[0] is APP0 and metadata[1] is APP1, which would make the decoded
port_id below unrelated to TUSER: a zero APP1 gives port_id 0
(TSN_TUSER_PORT_EP) and every frame is dropped as an unexpected port_id,
while non-zero garbage can accept a frame and later select the wrong
ep->port_md[port_id] for DSA delivery.  The peer consumer of this same ABI,
axienet_dma_rx_cb(), indexes app_metadata[XILINX_DMA_NUM_APP_WORDS - 1],
which matches the APP-window interpretation.

Also, meta_len and meta_max_len are fetched and then never used.  Should
this check meta_len >= 2 * sizeof(u32) before dereferencing metadata[1]?

> +
> +	if (rx_len > ep->max_frm_size || rx_len < ETH_HLEN) {

[ ... ]

> +	port_id = FIELD_GET(TSN_TUSER_PORT_ID_MASK, tuser);
> +	if (port_id != TSN_TUSER_PORT_MAC1 && port_id != TSN_TUSER_PORT_MAC2) {
> +		if (net_ratelimit())
> +			dev_dbg(ep->dev, "RX dropping unexpected TUSER port_id=%u\n",
> +				port_id);
> +
> +		dev_kfree_skb_any(skb);
> +		DEV_STATS_INC(ndev, rx_dropped);
> +		goto submit_new;
> +	}

[ ... ]

> @@ -322,9 +526,19 @@ static int ep_init_dmaengine(struct xlnx_tsn_ep *ep)
>  		rx_allocated++;
>  	}
>  
> +	for (i = 0; i < ep->num_rx_queues; i++) {
> +		if (!ep_rx_refill(ep->rx_chans[i], false)) {
> +			dev_err(ep->dev, "RX channel %d: no descriptors armed\n",
> +				i);
> +			ret = -ENOMEM;
> +			goto err_free_chans;
> +		}
> +	}
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909-patches_v2_external-v2-0-3a40babaff4c%40amd.com

