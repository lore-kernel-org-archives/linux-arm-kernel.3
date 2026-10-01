Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DDCCA5FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 04:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9G+kUmxLkeukcMBztETwUt4ngGNy3h2GvEBHr1Zj4Ss=; b=zpLPyFK1FAY0x7VTsyZo7RBY6n
	hexK7Na/2azbeeo5nJFKBNEMcrmzkRj83IUTzRZat6iyeRt8GVjZZs2fGZEtbbWmQpu/9mR7rVGd/
	Hz3MJq/hnYP7PSOYhkfOUA5+O4EqzwhhYIJbF/pLHGhMW5Un5Knw2euHeFhLR6RLc7oDUqRbC0KBk
	BgyuAG72KGUXeBLLZiWdiYrsOrDtfsB4SoxVI9NTKdJSKgqH3S+kLtiwjCRD3LjK3PDrsvRrFK9ic
	PIPk2Jwnih4NzSe6KcaFuJQYBTxBbTFdi46/29wrdzFCjiMlD6wxzjK+UnrH4QT84EOrYKh5yOFA7
	28sR4jzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8gS-00000007l0r-03QP;
	Thu, 01 Oct 2026 04:46:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8fq-00000007kgs-2S6v;
	Thu, 01 Oct 2026 04:45:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DFA460A52;
	Thu,  1 Oct 2026 04:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2591F00899;
	Thu,  1 Oct 2026 04:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790829937;
	bh=9G+kUmxLkeukcMBztETwUt4ngGNy3h2GvEBHr1Zj4Ss=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dk/+SbrKttvo8bO83GzDzsnNpZCMC2SbwQ6foU7CV7/9dAORBOvpP1S1WNheTlNv1
	 kKXEG+y3X/P31/oTpsuV1SzhZcJofs+hBxk+RKHKNy54MeF0GP2hIBfcHe+DDALfhZ
	 nsCXzt4oYW/EDaFu4/fThUpbukE4o1qkYWXDNyeof1KfTnwmoyHlRDVPAGzXqsrFFe
	 8TipYbwyY0VKNrx8Ugf6d6DPjtH76ebwUJyXBtK7QfrhyJS/uQs2XRrM8VtjSN4IP+
	 w7MmGA1lAuk5RRoITMf3ZdXs+WTDLc7EPe7MzXHv7rONpdIcGIKp4SlZci6DIQKdBa
	 3Gv2//WstlVRA==
Subject: Re: [PATCH net-next v24 06/10] net: dsa: tag_mtk: add Airoha variant
 usage of this TAG
From: netdev-bot+sashiko@kernel.org
To: ansuelsmth@gmail.com
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, olteanv@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
 horms@kernel.org, joey@tinyisr.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew@lunn.ch
Date: Thu, 01 Oct 2026 04:45:35 +0000
Message-ID: <179082993591.434549.3461650830434233242@kernel.org>
In-Reply-To: <20260928194511.41878-7-ansuelsmth@gmail.com>
References: <20260928194511.41878-7-ansuelsmth@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch adds a new tag protocol, DSA_TAG_PROTO_AIROHA
  ("airoha").
- [Low] After this patch, tag_mtk.ko can register both the "mtk" and
  "airoha" tag drivers through…

--

net: dsa: tag_mtk: add Airoha variant usage of this TAG

This commit adds a new DSA_TAG_PROTO_AIROHA tag protocol ("airoha") that
reuses the existing MTK tag xmit/rcv handlers. It adds a comment noting
that AN8855 lacks the SA_DIS and Leaky VLAN tag bits. It also reworks
Kconfig and the Makefile so tag_mtk.o is built through a common
NET_DSA_TAG_MTK_COMMON symbol and registers either or both taggers.

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
The wire format here is the same as DSA_TAG_PROTO_MTK. However, the
conduit drivers that handle the MTK special tag in hardware check the
protocol ID, not the format. Will they still handle a conduit that uses
the "airoha" tagger correctly?

Later in the series, an8855_get_tag_protocol() returns
DSA_TAG_PROTO_AIROHA. No later patch updates these checks, which still
only match DSA_TAG_PROTO_MTK:

drivers/net/ethernet/mediatek/mtk_ppe_offload.c:mtk_flow_get_dsa_port() {
	...
	if (dp->cpu_dp->tag_ops->proto != DSA_TAG_PROTO_MTK)
		return -ENODEV;
	...
}

drivers/net/ethernet/mediatek/mtk_ppe.c:__mtk_ppe_check_skb() {
	...
		if (!netdev_uses_dsa(skb->dev) ||
		    skb->dev->dsa_ptr->tag_ops->proto != DSA_TAG_PROTO_MTK)
			goto out;
	...
}

With an AN8855 behind a mtk_eth_soc conduit, it looks like PPE/flowtable
offload to the switch user ports would be silently unavailable.

On netsys v1, mtk_uses_dsa() also compares only against
DSA_TAG_PROTO_MTK:

drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_uses_dsa() {
	return netdev_uses_dsa(dev) &&
	       dev->dsa_ptr->tag_ops->proto == DSA_TAG_PROTO_MTK;
}

So mtk_open() skips the dsa_meta allocation and takes the else branch:

	} else {
		...
		val &= ~MTK_CDMP_STAG_EN;
		mtk_w32(eth, val, MTK_CDMP_IG_CTRL);

		mtk_w32(eth, 0, MTK_CDMP_EG_CTRL);
	}

Meanwhile, mtk_gdm_config() still sets MTK_GDMA_SPECIAL_TAG and
mtk_tx_set_dma_desc_v2() still sets TX_DMA_SPTAG_V3 for any DSA conduit.
Does this leave the MAC only partly configured for the special tag?

On Airoha SoCs, airoha_get_dsa_tag() has the same kind of check:

drivers/net/ethernet/airoha/airoha_eth.c:airoha_get_dsa_tag() {
	...
	if (dev->dsa_ptr->tag_ops->proto != DSA_TAG_PROTO_MTK)
		return 0;
	...
	default:
		/* PPE module requires untagged DSA packets to work properly,
		 * so move DSA tag to DMA descriptor.
		 */
		memmove(skb->data + MTK_HDR_LEN, skb->data, 2 * ETH_ALEN);
		__skb_pull(skb, MTK_HDR_LEN);
		break;
	...
}

With the new protocol, the in-band tag stays in the frame and 0 is
written to QDMA_ETH_TXMSG_SP_TAG_MASK. airoha_dev_xmit() still requests
TCO/UCO/ICO checksum offload and TSO for that frame.

On RX, airoha_dev_open() sets GDM_STAG_EN_MASK for any DSA conduit, so
RX and TX handling of the tag would not match. Whether this corrupts
checksums or makes the hardware insert a second tag depends on hardware
behaviour, and the code alone can't show which.

The commit message says the change is about giving external tools like
libpcap a dedicated name. Should these conduit checks also accept
DSA_TAG_PROTO_AIROHA? One option is a helper that means "uses the MTK
special tag format".

> +
> +DSA_TAG_DRIVER(airoha_netdev_ops);
> +MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_AIROHA, AIROHA_NAME);
> +#endif
> +
> +static struct dsa_tag_driver *dsa_tag_driver_array[] =	{
> +#if IS_ENABLED(CONFIG_NET_DSA_TAG_MTK)
> +	&DSA_TAG_DRIVER_NAME(mtk_netdev_ops),
> +#endif
> +#if IS_ENABLED(CONFIG_NET_DSA_TAG_AIROHA)
> +	&DSA_TAG_DRIVER_NAME(airoha_netdev_ops),
> +#endif
> +};
> +
> +module_dsa_tag_drivers(dsa_tag_driver_array);
> +
> +MODULE_DESCRIPTION("DSA tag driver for Mediatek switches");

[Severity: Low]
This isn't a bug, but should the module description be updated here?
The module can now register the "airoha" tagger too. With only
CONFIG_NET_DSA_TAG_AIROHA enabled, it registers only the Airoha tagger,
but modinfo still reports "DSA tag driver for Mediatek switches".

> +MODULE_LICENSE("GPL");

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928194511.41878-1-ansuelsmth%40gmail.com

