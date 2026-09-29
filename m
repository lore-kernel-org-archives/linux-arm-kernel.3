Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AF1CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 20:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYAeqnRybt0kiN4We0ygptairZiQyHzDtLGhGCd9jOU=; b=rhHSROZArUUM9dKjTR5N1jdOUv
	pY5lMZcplkJABFfgI+tHNLlN+oqXDc8Gla+kjrVmQoQVn7mLwJ54a8moMysOBNC5/s4vgoEbgiow9
	pqB0BIv7kgnhtZoSq4DjbvhO8nebtfQ082IM83OeTSJe6jRt6SN/oLB9MAY0aTgaNFdiwtBewk/St
	Ph0LFLwQgxulTUu+0hnD+LjFmf6O0LA/At1qkJKvM7iZ76DNfmcJ+KPPklT4oQO/4iXJ5Yr4Oq9EQ
	GaXYJ+hVs01Qn2gaStGn46RlzCWk/bW2Uo70uqZeeZsQLJDlS6y7gy+t5hWYUNl5/OrZAc46r4DZ9
	QT1hB9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeY7-00000004VKH-22rk;
	Tue, 29 Sep 2026 20:35:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeXe-00000004V6F-02x0;
	Tue, 29 Sep 2026 20:35:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 12E2B60234;
	Tue, 29 Sep 2026 20:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933A41F00898;
	Tue, 29 Sep 2026 20:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790714108;
	bh=SYAeqnRybt0kiN4We0ygptairZiQyHzDtLGhGCd9jOU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Hin+PlPTQ5Sgfe/l4hrMhR9vY4p/Wj6VC1sFiXd3nsGg6xTcFUHHFbOQL5OG5lVmo
	 C9VWNHaQGuPF+braDuk/CGzOZEpkvC2m2k0rq5kXgYdORlF/c/XvSXewS92gUeeh/G
	 WQLZN/E4xnYdsAt+fUhS/jvWNaAeVF23gVRNhRE+NsN8XK5p6jG0fMmYRbWQ6t1xiG
	 mfqXbbGFM6RuRZjaM+swtXrvujRynzQ1ntWJtLtSAPuHcywIpR1R3GIQQcP9Y6ZPng
	 ElBPaobhxw89gWjn35qTn9ohIjVcFOoSA8oQRC8glIktgfmmGdtqKflttlGEnch6dT
	 0sEKRSJseEWrQ==
Subject: Re: [PATCH net-next v23 6/9] net: dsa: tag_mtk: add Airoha variant
 usage of this TAG
From: netdev-bot+sashiko@kernel.org
To: ansuelsmth@gmail.com
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, olteanv@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
 horms@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 20:35:07 +0000
Message-ID: <179071410719.434549.3145176036907505667@kernel.org>
In-Reply-To: <20260925182435.21207-7-ansuelsmth@gmail.com>
References: <20260925182435.21207-7-ansuelsmth@gmail.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch adds DSA_TAG_PROTO_AIROHA (37) and gives it the same
  handlers as DSA_TAG_PROTO_MTK (mtk_tag_xmit/mtk_tag_rcv, MTK_HDR_LEN…

--

net: dsa: tag_mtk: add Airoha variant usage of this TAG

This adds a DSA_TAG_PROTO_AIROHA protocol ID and an "airoha" tag driver
that reuses the MTK xmit/rcv handlers. It also adds comments on how the
AN8855 tag bitmap differs from the Mediatek one. Kconfig and the Makefile
now build tag_mtk.o through a shared NET_DSA_TAG_MTK_COMMON symbol.

> diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
> index c7dc7731675ec..f8087d768da6d 100644
> --- a/net/dsa/tag_mtk.c
> +++ b/net/dsa/tag_mtk.c

[ ... ]

> @@ -107,8 +112,33 @@ static const struct dsa_device_ops mtk_netdev_ops = {
>  	.needed_headroom = MTK_HDR_LEN,
>  };
>
> -MODULE_DESCRIPTION("DSA tag driver for Mediatek switches");
> -MODULE_LICENSE("GPL");
> +DSA_TAG_DRIVER(mtk_netdev_ops);
>  MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_MTK, MTK_NAME);
> +#endif
>
> -module_dsa_tag_driver(mtk_netdev_ops);
> +#if IS_ENABLED(CONFIG_NET_DSA_TAG_AIROHA)
> +static const struct dsa_device_ops airoha_netdev_ops = {
> +	.name		= AIROHA_NAME,
> +	.proto		= DSA_TAG_PROTO_AIROHA,
> +	.xmit		= mtk_tag_xmit,
> +	.rcv		= mtk_tag_rcv,
> +	.needed_headroom = MTK_HDR_LEN,
> +};

[Severity: Medium]
Frames on the wire are identical for DSA_TAG_PROTO_AIROHA and
DSA_TAG_PROTO_MTK. What about the conduit Ethernet drivers that check for
the MTK tag format by comparing against DSA_TAG_PROTO_MTK? None of them
are updated here.

Later in this series, an8855_get_tag_protocol() returns
DSA_TAG_PROTO_AIROHA. For an AN8855 behind a MediaTek or Airoha SoC
conduit, dsa_ptr->tag_ops->proto would then be 37, and these checks
would stop matching.

drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_uses_dsa() {
	return netdev_uses_dsa(dev) &&
	       dev->dsa_ptr->tag_ops->proto == DSA_TAG_PROTO_MTK;
}

On NETSYS v1, mtk_open() would then take the else branch. It clears
MTK_CDMP_STAG_EN and skips the dsa_meta allocation, so hardware special
tag untagging is turned off.

drivers/net/ethernet/mediatek/mtk_ppe.c:__mtk_ppe_check_skb() {
	case htons(ETH_P_XDSA):
		if (!netdev_uses_dsa(skb->dev) ||
		    skb->dev->dsa_ptr->tag_ops->proto != DSA_TAG_PROTO_MTK)
			goto out;
}

drivers/net/ethernet/mediatek/mtk_ppe_offload.c:mtk_flow_get_dsa_port() {
	if (dp->cpu_dp->tag_ops->proto != DSA_TAG_PROTO_MTK)
		return -ENODEV;
}

These two checks mean PPE entries are never bound for DSA frames, and
flowtable hardware offload through the switch ports would be refused.

drivers/net/ethernet/airoha/airoha_eth.c:airoha_get_dsa_tag() {
	if (dev->dsa_ptr->tag_ops->proto != DSA_TAG_PROTO_MTK)
		return 0;
}

On the Airoha conduit, this returns before the VLAN TPID is restored and
before the special tag is moved into the QDMA descriptor. The comment in
that function says the PPE needs that move. airoha_dev_xmit() would then
send the frame with the inline tag and SP_TAG=0.

airoha_get_dsa_port() in airoha_ppe.c has no proto check, though, so the
Airoha PPE would still accept flow offload for these ports. Can the TX
path and the PPE path then disagree about how the tag is handled?

The commit message describes this as giving external tools like libpcap
a dedicated "Airoha" name. It doesn't mention these behaviour changes on
the conduit side.

Should these call sites accept both protocols in this series, for
example through a helper that checks for an MTK-format tag?

> +
> +DSA_TAG_DRIVER(airoha_netdev_ops);
> +MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_AIROHA, AIROHA_NAME);
> +#endif

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260925182435.21207-1-ansuelsmth%40gmail.com

