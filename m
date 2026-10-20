Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3E760A3836
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BXhSAqKp;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPCsoNHu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cSxXqVZINLaJAxubbW3o8shpEbL0tUTG34iYCI9EGw=; b=BXhSAqKpqEiQfynSMe66G+vD/E
	j58d3rNDCMBuYA3Ukp218wBxG/PCQQhLXFzJzd/Dkcel6cm7Hpmzi+NH56a+WCjySn9yx8ubQkfQF
	ERKo3cDItE9h6RLBXS9xNpmTuSvR2B5woXE6u5f89zip+mEBmfQbJ7nCTfqPsKjv+7sSOnEjGOyNj
	5ZDe3pQS4ms55NV+Z2bPd6d1BIXe+07h0ggTVlfRAQfMP2Xondz1xbDMrinjrGS3Q5mv4r4qpyQ3r
	Jmjwi2YNxmqeBJxikf1bDqMqkNlcYNlz7JDVgpAkLAOXjVrNfqxLsj5vmznH4SAV0oxfD+CGoo5FC
	tpGDAbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8UW-00000009c04-0pRf;
	Tue, 20 Oct 2026 11:58:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8U7-00000009bjk-0Bde
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:58:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E2BF60D86;
	Tue, 20 Oct 2026 11:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E243A1F000CE;
	Tue, 20 Oct 2026 11:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792497506;
	bh=3cSxXqVZINLaJAxubbW3o8shpEbL0tUTG34iYCI9EGw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mPCsoNHu8NkqOtKwnTL59BoMcQ5VHuIimMsCxFr+2x8NLW6DT0PKYBInJw/kCCBIZ
	 98tOwk6/2FuDpBdbxok4rgu5JRvjh3To/UB1124Z69O1SbHSZ5pI8VHYhAa2I5fIVI
	 cJTOFBqwzPmqXfXtsQbsDYNb2xBGTci7xrZuP+fulKZpdHW6Sw6L7KbYaDBybbfWIZ
	 6HFKVLa2sYKAWwfwjINzRyTuNfkVMI4muZJoMekMMdrmgKG2aSS84ZytaEvbqUARB/
	 usl94ajGSPaGzmkEgbf7prrhOaspifxvXDEs3DxcalPRK1NObZuo0vm46Eg7nv9utB
	 zfSWb8qLEm7Mw==
Subject: Re: [PATCH net-next v3 8/8] net: xilinx: tsn: deliver endpoint RX
 frames to DSA user ports
From: netdev-bot+sashiko@kernel.org
To: srinivas.neeli@amd.com
Cc: nagadheeraj.rottela@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, michal.simek@amd.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 edumazet@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, neelisrinivas18@gmail.com, git@amd.com
Date: Tue, 20 Oct 2026 11:58:24 +0000
Message-ID: <179249750444.3135.1692275587478159303@kernel.org>
In-Reply-To: <20261016-patches_v2_external-v3-8-e33d3960ca1e@amd.com>
References: <20261016-patches_v2_external-v3-8-e33d3960ca1e@amd.com>
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

- [Low] The new RX demux in ep_dma_rx_cb()
  (drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c) relies on a DSA…

--

net: xilinx: tsn: deliver endpoint RX frames to DSA user ports

At probe time this commit allocates one METADATA_HW_PORT_MUX metadata dst
for each of the two MAC ports. In ep_dma_rx_cb() it then attaches the
matching dst to each RX frame based on its TUSER port_id, gated on
netdev_uses_dsa(), so DSA can deliver the frame to its swpN user port.

> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> index bd8cd504cefb4..5103a3b4b018a 100644
> --- a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c

[ ... ]

> @@ -302,6 +311,10 @@ static void ep_dma_rx_cb(void *data, const struct dmaengine_result *result)
>  	}
>  
>  	skb_put(skb, rx_len);
> +	if (netdev_uses_dsa(ndev)) {
> +		dst_hold(&ep->port_md[port_id]->dst);
> +		skb_dst_set(skb, &ep->port_md[port_id]->dst);
> +	}

[Severity: Low]
Can this branch be reached at all with the tree as submitted?

As far as I can tell, nothing under drivers/net/dsa/ binds
"xlnx,tsn-switch", and net/dsa/ has no TSN tagger. The only references
are the binding in xlnx,tsn-endpoint-ethernet-mac.yaml and this Kconfig
help text:

    The three-port switch is supported by the companion DSA driver.

Without that driver, nothing sets dsa_ptr on this netdev, so
netdev_uses_dsa() is always false here. That leaves three pieces of dead
code for now: this branch, the port_md[] allocation in
xlnx_tsn_ep_probe(), and ep_free_port_md(). It also means RX delivery to
swp1/swp2 can't be tested from this tree.

Will the companion DSA driver be posted along with this series?

The commit message also says:

    guarded by netdev_uses_dsa() so it runs only while a switch is bound
    as the conduit.

netdev_uses_dsa() checks a bit more than that:

include/net/dsa.h:netdev_uses_dsa() {
    ...
	return dev->dsa_ptr && dev->dsa_ptr->rcv;
    ...
}

dsa_port_set_tag_protocol() copies cpu_dp->rcv directly from the
tagger's ops.

Every frame accepted here carries a METADATA_HW_PORT_MUX dst, so
dsa_switch_rcv() always takes the md_dst branch and never calls
cpu_dp->rcv. The tagger still has to provide a non-NULL .rcv, though,
or this code never runs.

With a tagger that has no .rcv, such as none_ops in net/dsa/tag_none.c,
every frame would quietly stay on the conduit eth%d. tag_none.c warns
against using it for new switches, so this mainly applies to whatever
tagger the companion driver adds.

Could the commit message, or a comment here, say that the tagger must
provide an .rcv callback, even though it won't be called for these
frames?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261016-patches_v2_external-v3-0-e33d3960ca1e%40amd.com

