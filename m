Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E4BCA9EC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 16:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBqycIfsWSTg5AKYE2ZXqo2Wk5PYKRyd2TjAONqVFxY=; b=NQ8Zigsi0fq5pd7y2iCCql/fki
	TyhF4diu9EVEZ10UZZmR4eq4zqt5gImKbb8GJZt+IvpTGkIaQP+dzoEAoStUg6s7XW6PGB3cYyqil
	kT6pRYYyDAv+8rnHQ6vrSVWj/G1k0szeRHfzoW7f+/jbS0oCjaai7AlHJNbBBBQRl3R3XDnTgHFLZ
	x7qbNWdL6QJ+KsUwA3da3DsCrPEeVDbbM1sT3Sb2rXRXS2olrLItMvKwpDJCTpeuo57THJO6afsrB
	o/6wrMu/dBSe960/T7PKQkF3S1Ibvgn9kytTgc8kqITqWxIKj0ARa2+zsa9yCel3+W+S5CciUSLmY
	4DbPxofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZnX-00000008G7V-0r2R;
	Sat, 10 Oct 2026 16:19:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZnA-00000008Frx-2q1E;
	Sat, 10 Oct 2026 16:19:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 96EBA60232;
	Sat, 10 Oct 2026 16:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE471F0089A;
	Sat, 10 Oct 2026 16:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791649163;
	bh=VBqycIfsWSTg5AKYE2ZXqo2Wk5PYKRyd2TjAONqVFxY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZeUkyjXXrGcYmE8+cDWCDXQFsOe8o6E55ey7mGWSHP+YsN17x6WWkgLmK+vDZzYU6
	 eGJH7DG7vwR+GUSHvSngwFlS/wrvG602+MURt7y5ByUT/gYFoSftnD1kvfhwJhZJvr
	 Q/0PNOVslLWeqw7mZS6XoSHLhgQl1qEmlpt3N2fdbto38zVsOyTUCU5nEj+Bmi6cRO
	 UOw0GkAU3xtV4S9olau0+CP9Wz0sfTgWQS8/S6b4SWI/o0JLHOMCuJjCh2ZEJluQ4q
	 Ho5xP52W4fJS1PHvPolCqN4GLVu0DwAITtDjRQrnwqknyOzVKMJU1ZlXG81XCnhOZe
	 pC7wRtlmyP/JQ==
Subject: Re: [PATCH net-next v25 06/10] net: dsa: tag_mtk: add Airoha variant
 usage of this TAG
From: netdev-bot+sashiko@kernel.org
To: ansuelsmth@gmail.com
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, olteanv@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
 horms@kernel.org, joey@tinyisr.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew@lunn.ch
Date: Sat, 10 Oct 2026 16:19:21 +0000
Message-ID: <179164916112.434549.6895848060469565753@kernel.org>
In-Reply-To: <20261009161102.38961-7-ansuelsmth@gmail.com>
References: <20261009161102.38961-7-ansuelsmth@gmail.com>
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

- [Medium] The patch adds DSA_TAG_PROTO_AIROHA as a second proto ID for
  exactly the same wire format as DSA_TAG_PROTO_MTK.

--

net: dsa: tag_mtk: add Airoha variant usage of this TAG

This commit adds a DSA_TAG_PROTO_AIROHA tag protocol. It reuses the MTK
tag xmit/rcv handlers under a separate "airoha" name. The Kconfig is
split into NET_DSA_TAG_MTK and NET_DSA_TAG_AIROHA, and both select a
common NET_DSA_TAG_MTK_COMMON symbol that builds tag_mtk.o.

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
This adds a second proto ID for the same wire format as
DSA_TAG_PROTO_MTK. Several conduit drivers handle this tag format in
hardware, but they only check for DSA_TAG_PROTO_MTK. None of them are
updated here or later in the series.

Once an8855_get_tag_protocol() returns DSA_TAG_PROTO_AIROHA, will AN8855
switches behind these conduits lose that handling?

In drivers/net/ethernet/mediatek/mtk_ppe_offload.c:

mtk_flow_get_dsa_port() {
    ...
	if (dp->cpu_dp->tag_ops->proto != DSA_TAG_PROTO_MTK)
		return -ENODEV;
    ...
}

After the -ENODEV, *dev is still the DSA user netdev. That means
mtk_flow_set_output_device() fails every eth->netdev[] comparison and
returns -EOPNOTSUPP.

Would this reject nft flowtable hardware offload through AN8855 user
ports, even though mtk_foe_entry_set_dsa() would build the same tag?

In drivers/net/ethernet/mediatek/mtk_ppe.c, mtk_ppe_check_skb() skips
PPE binding for ETH_P_XDSA frames:

	case htons(ETH_P_XDSA):
		if (!netdev_uses_dsa(skb->dev) ||
		    skb->dev->dsa_ptr->tag_ops->proto != DSA_TAG_PROTO_MTK)
			goto out;

In drivers/net/ethernet/mediatek/mtk_eth_soc.c, mtk_uses_dsa() would
return false:

	return netdev_uses_dsa(dev) &&
	       dev->dsa_ptr->tag_ops->proto == DSA_TAG_PROTO_MTK;

On NETSYS v1, mtk_open() then takes the branch that clears
MTK_CDMP_STAG_EN. That turns off hardware special tag untagging and RX
VLAN offload.

In drivers/net/ethernet/airoha/airoha_eth.c, airoha_get_dsa_tag()
returns early:

	if (dev->dsa_ptr->tag_ops->proto != DSA_TAG_PROTO_MTK)
		return 0;

So the 4-byte special tag stays in the frame and is not moved into the
QDMA descriptor. That goes against the driver's own comment:

	/* PPE module requires untagged DSA packets to work properly,
	 * so move DSA tag to DMA descriptor.

The RX side of that driver still turns on hardware special tag
stripping (GDM_STAG_EN_MASK in REG_GDM_INGRESS_CFG), based only on
netdev_uses_dsa(). TX and RX handling would then no longer match.

The DSA user netdev also inherits the conduit vlan_features
(AIROHA_HW_FEATURES). If the QDMA/FE cannot parse L3/L4 headers behind
an in-frame MTK tag, could CHECKSUM_PARTIAL or TSO frames end up with
bad checksums? I couldn't confirm that hardware behaviour from the code.

Should these conduit checks accept both DSA_TAG_PROTO_MTK and
DSA_TAG_PROTO_AIROHA, maybe through a shared helper? If not, is a
separate proto ID needed for an identical tag format?

> +
> +DSA_TAG_DRIVER(airoha_netdev_ops);
> +MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_AIROHA, AIROHA_NAME);
> +#endif

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009161102.38961-1-ansuelsmth%40gmail.com

