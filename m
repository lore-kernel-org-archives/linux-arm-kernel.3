Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AA0C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 20:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olpUmT6745WQgpGrnkuUQjcDZTD+SVeluiZ5UZmg1LE=; b=KovCseH9K4sEzyzJhCJfd8evC5
	FIvu5fvnW/mDKGh1IjoDSSvOhH+w9pKcgec3I30pqBD8cok8HIgKhbiVSDwXn1Io/kD3QWJ4c1LTj
	QH72jh6LJR8qArQHxzvavRYy225OZLq7nNR2gxESmEFTki53sUr4/yhfJw2oqH5Y5zIuyL+bonk+C
	LqTwO0ZAU6/lvAoq8Uez8/n+kD3ZOndanOuEg9Tmp0wGxAC5CKrGkHc68DrAJyKiDc8RRvqhanE03
	BjcPhE30AUlbn/G0t0dAmbZYu88w/TiIKGkSGKN4LiMVsICSZB/CNWM53OrYheci37WXy30d9d3oB
	APKwCYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xACuV-0000000EQYR-2Va5;
	Fri, 25 Sep 2026 20:52:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xACuI-0000000EQSn-3AKB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 20:52:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 369E8602C5;
	Fri, 25 Sep 2026 20:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC081F00899;
	Fri, 25 Sep 2026 20:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790369553;
	bh=olpUmT6745WQgpGrnkuUQjcDZTD+SVeluiZ5UZmg1LE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cFWJRVGi1aXnRoD5Q3gO/qCs4by0qRLMf8NzhqST3889gPAgBujWX6kaigPR4KGJ2
	 PqY6Xbx43ZAQqvg8XpmBkBCiZcQNm8A+IktZ30MI8hZCZSH+XRr6qFHJKOLljvlU2U
	 kYkRO76Cr1PVx6ZkKEIGwxR9hhYYl5kqwTw40KDwHfRH+v3/w8DiMzjoO5yftdoyTH
	 56OG5iXWZ4IqAo4CHJHIq2yrIqBCFOiKnfCYtk00lSw4EbXuB3S9VPW336BKgJLBIc
	 DAgTKOgc539Uag50aG3HQ6nMAdk6ioI7dB7f1IYje+juGyx7caVhG/Ei3VhKyLc7oP
	 pVCiUrg+X3gxQ==
Subject: Re: [PATCH net-next v8 13/15] net: lan966x: add PCIe FDMA XDP support
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horatiu.vultur@microchip.com,
 steen.hegelund@microchip.com, UNGLinuxDriver@microchip.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, herve.codina@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mohsin.bashr@gmail.com, horms@kernel.org,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 25 Sep 2026 20:52:32 +0000
Message-ID: <179036955220.2160803.7046320782670912992@kernel.org>
In-Reply-To: <20260924-lan966x-pci-fdma-v8-13-201c7b707d8b@microchip.com>
References: <20260924-lan966x-pci-fdma-v8-13-201c7b707d8b@microchip.com>
X-sashiko-severity: Critical
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 1 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] Use-after-free and double free on the PCIe RX path when an
  XDP program shrinks a frame.
- [Medium] On the PCIe path the driver accepts XDP but cannot handle
  XDP_REDIRECT, and the bond driver cannot tell.
- [Medium] In lan966x_fdma_pci_napi_poll(), a poll that consumes all
  FDMA_PCI_DCB_MAX (256) RX descriptors never re-arms any of them.

--

net: lan966x: add PCIe FDMA XDP support

This commit adds basic XDP support (XDP_PASS, XDP_DROP, XDP_TX) to the
lan966x PCIe FDMA path. The IFH and FCS are stripped before the program
runs, and the pointer and length from after XDP are passed on to skb
construction or to a new memcpy-based XDP_TX routine.
lan966x_xdp_setup() now accepts programs on PCIe and skips the page_pool
reload there.

> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> index 7185e65dda435..216e9cbcd1580 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c

[ ... ]

> +static int lan966x_xdp_pci_run(struct lan966x_port *port, void *data,
> +			       u32 data_len, void **xdp_data, u32 *xdp_len)
> +{

[ ... ]

> +	act = bpf_prog_run_xdp(xdp_prog, &xdp);
> +
> +	*xdp_data = xdp.data;
> +	*xdp_len = xdp.data_end - xdp.data;
> +
> +	switch (act) {
> +	case XDP_PASS:
> +		return FDMA_PASS;
> +	case XDP_TX:
> +		return lan966x_fdma_pci_xmit_xdpf(port, *xdp_data, *xdp_len) ?
> +		       FDMA_DROP : FDMA_TX;
> +	default:
> +		bpf_warn_invalid_xdp_action(port->dev, xdp_prog, act);
> +		fallthrough;

[Severity: Medium]
What happens here when the PCIe port is a bond slave?

The PCIe ports use the same lan966x_port_netdev_ops as the platform
ports, so both .ndo_bpf and .ndo_xdp_xmit are set. bond_xdp_set() looks
only at those pointers and never reads xdp_features:

drivers/net/bonding/bond_main.c:bond_xdp_set() {
    ...
		if (!slave_dev->netdev_ops->ndo_bpf ||
		    !slave_dev->netdev_ops->ndo_xdp_xmit) {
    ...
}

This patch removes the -EOPNOTSUPP return for PCIe in
lan966x_xdp_setup(), so a bond with a lan966x PCIe slave can now install
its program on that slave. For bond slaves, bpf_prog_run_xdp() can then
turn XDP_TX into XDP_REDIRECT:

net/core/filter.c:xdp_master_redirect() {
    ...
	if (slave && slave != xdp->rxq->dev) {
		ri->tgt_index = slave->ifindex;
		ri->map_id = INT_MAX;
		ri->map_type = BPF_MAP_TYPE_UNSPEC;
		return XDP_REDIRECT;
    ...
}

It can also return XDP_ABORTED when the master is down.

This switch has no XDP_REDIRECT case. Would those frames go to the
default branch, log a "Driver unsupported" warning and be dropped?
Nothing calls xdp_do_redirect(), so the redirect info set by
xdp_master_redirect() would never be used.

[ ... ]

>  static struct sk_buff *lan966x_fdma_pci_rx_get_frame(struct lan966x_rx *rx,
> -						     u64 src_port)
> +						     u64 src_port, void *data,
> +						     u32 data_len)
>  {

[ ... ]

> -	memcpy(skb->data,
> -	       fdma_dataptr_virt_addr_contiguous(fdma,
> -						 fdma->dcb_index,
> -						 fdma->db_index),
> -						 data_len);
> +	memcpy(skb->data, data, data_len);
>  
>  	skb_put(skb, data_len);
>  
>  	skb->dev = lan966x->ports[src_port]->dev;
> -	skb_pull(skb, IFH_LEN_BYTES);
> -
> -	skb_trim(skb, skb->len - ETH_FCS_LEN);
>  
>  	skb->protocol = eth_type_trans(skb, skb->dev);

[Severity: Critical]
Can this lead to a use-after-free when an XDP program shrinks the frame?

data_len is now the length from after XDP, returned by
lan966x_xdp_pci_run(). bpf_xdp_adjust_tail() and bpf_xdp_adjust_head()
let it shrink to ETH_HLEN. Take a 14-byte frame with h_proto 0x8100
that returns XDP_PASS. eth_type_trans() then leaves skb->len == 0 and
skb->protocol == ETH_P_8021Q.

Now suppose src_port is in bridge_mask and IGMP/MLD redirect is enabled
in ANA_CPU_FWD_CFG. lan966x_port_mc_set() enables it when multicast
snooping is on, and snooping is on by default. In that case the code
after this point reaches:

drivers/net/ethernet/microchip/lan966x/lan966x_main.c:lan966x_hw_offload() {
    ...
	if (eth_type_vlan(skb->protocol)) {
		skb = skb_vlan_untag(skb);
		if (unlikely(!skb))
			return false;
	}
    ...
}

pskb_may_pull(skb, VLAN_HLEN + 2) fails in skb_vlan_untag(), so it
frees the skb with kfree_skb() and returns NULL. lan966x_hw_offload()
only returns a bool, so the caller still holds the freed pointer:

		if (!lan966x_hw_offload(lan966x, src_port, skb))
			skb->offload_fwd_mark = 0;
	}

	skb->dev->stats.rx_bytes += skb->len;

The freed skb is then returned to lan966x_fdma_pci_napi_poll(), which
passes it to napi_gro_receive(). Would that be a use-after-free followed
by a double free?

The problem in lan966x_hw_offload() is older. Before this patch it could
not be reached, because skbs were built from the hardware length and the
MAC drops runts. The frame contents can also come from the network, for
example when a decap program uses adjust_head on a minimum-size outer
frame.

[ ... ]

> @@ -312,8 +430,17 @@ static int lan966x_fdma_pci_napi_poll(struct napi_struct *napi, int weight)
>  			 */
>  			fdma_dcb_advance(fdma);
>  			continue;
> +		case FDMA_TX:
> +			fdma_dcb_advance(fdma);
> +			continue;
> +		case FDMA_DROP:
> +			fdma_dcb_advance(fdma);
> +			continue;
>  		}

[Severity: Medium]
What happens if one poll consumes all 256 (FDMA_PCI_DCB_MAX) RX
descriptors?

Every result path calls fdma_dcb_advance(), which wraps at n_dcbs. After
256 frames, dcb_index is back at the value saved in dcb_reload. The
re-arm loop at the end of lan966x_fdma_pci_napi_poll() then runs zero
times:

	while (dcb_reload != fdma->dcb_index) {
		old_dcb = dcb_reload;
		dcb_reload++;
		dcb_reload &= fdma->n_dcbs - 1;

So none of the consumed DCBs are re-armed, and they all keep
FDMA_DCB_STATUS_DONE. With a budget above 256, fdma_has_frames() stays
true and the same frames are processed again in the same call. With a
budget of exactly 256, the next poll processes them again.

Would this deliver stale frames twice, run XDP on them again, and resend
the XDP_TX frames?

Only the budget bounds the loop. __napi_busy_loop() passes the socket's
SO_BUSY_POLL_BUDGET straight to napi_poll(), and that value can be up to
U16_MAX with CAP_NET_ADMIN. The ring can fill completely, because the
hardware fills the last DCB before it stops on the invalid nextptr.

This loop was added by the earlier "net: lan966x: add PCIe FDMA support"
commit in this series. This patch extends it with the XDP_TX and
XDP_DROP results, and it does not seem to be fixed later in the series.
The platform lan966x_fdma_napi_poll() has the same pattern with 512
DCBs.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924-lan966x-pci-fdma-v8-0-201c7b707d8b%40microchip.com

