Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B211FC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 07:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7ahfJ6Vb5Xp0Pi/9OQdn/7dRAiZpZZ2JFkAmtvnbdw=; b=Qs+EiGVCaNBhs4fKREYo4EHWIe
	Rzqnki5xGibCt6XmDJngxBHNsECz7xCabMGtEKFMBQNOMYr1o9ZPrau5gmrcDkAsLYfPPr2ov85jf
	+ebJbzspOHduqvSygm8L/uA1ozPFZUQ4RK8PUCWvZCmFQwVVc+nQBgpt3oSASVOyUMk374Lq9+wAB
	pDS1RTb6vy2bhOzh51EsYg4gOz3Rw23cSPTec3ULTBYdlPezcb2SQSl+X2jc7taUzLZ+pmHcmQ66k
	0WN3KAkOYB+aQegelgnOBTcUwIEpSazc9cuJdVPlOXDyIo4g7D9Y3Wl7cSteWgvunPXWYStL2JOZS
	BRmFHH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OQM-00000001FMm-39as;
	Fri, 04 Sep 2026 07:33:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OQJ-00000001FMM-2giR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 07:33:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 73C394E41505;
	Fri,  4 Sep 2026 07:33:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E3E66057F;
	Fri,  4 Sep 2026 07:33:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1835B11C7A463;
	Fri,  4 Sep 2026 09:33:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788507194; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=w7ahfJ6Vb5Xp0Pi/9OQdn/7dRAiZpZZ2JFkAmtvnbdw=;
	b=i/Fj8PRVMkcLoaeSRbp2JL/sWG9GbMAhEiMIPIRV2ULTpp4HgQHyd3V+wYMe+DtFYhHcOz
	F1cE0n0q+BK1QQCvgKfZkvkTFA5rzPKMVgfISY8KnYW8fKFasvAUc1l2p3/kWGzJHOkf8s
	xfKnwOy6zTrhTTaeUwzI06+4ANJKAm+WvTORF67cpSWlj/q3v3FA/GUlTuk5kE1+FWWhqI
	9nxhQNrfE7fx6YcXQqKk+xjth/tByGpCRV5Dy3hJczl9ZZuAeMkst38muocoGOJtbCyWOb
	UiCVtZgYQ2fRHKNwrGUaybzIVUK41kC1pWVVY0t3T1umBrf5Mp26fLZA0iHgCg==
Message-ID: <b7fb71f8-ba1b-4d6b-b5bf-b1afab32a66b@bootlin.com>
Date: Fri, 4 Sep 2026 09:33:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5] net: stmmac: remove software VLAN tag stripping
To: he.peilin@zte.com.cn, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 vbridgers2013@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: xu.xin16@zte.com.cn, jiang.kun2@zte.com.cn
References: <202609040845307827XHaxAT2PmgJc9jjPqfAP@zte.com.cn>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <202609040845307827XHaxAT2PmgJc9jjPqfAP@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_003319_829389_094BA29F 
X-CRM114-Status: GOOD (  14.61  )
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

Hi,

On 9/4/26 02:45, he.peilin@zte.com.cn wrote:
> The software VLAN stripping logic in stmmac_rx_vlan() was originally
> introduced in 2014 by commit b93819854d6e ("stmmac: Add vlan rx for
> better GRO performance.") as a workaround to improve GRO performance,
> since at that time GRO could not handle frames with VLAN tags. However,
> this limitation was resolved in 2015 by commit 66e5133f19e9 ("vlan: Add
> GRO support for non hardware accelerated vlan"), which added GRO support
> for non-hardware-accelerated VLAN frames. Keeping a software fallback
> path for VLAN stripping is no longer necessary and only adds complexity.
> 
> Fixes: b93819854d6e ("stmmac: Add vlan rx for better GRO performance.")
> Signed-off-by: Peilin He <he.peilin@zte.com.cn>
> Reviewed-by: xu xin <xu.xin16@zte.com.cn>
> Reviewed-by: Jiang Kun <jiang.kun2@zte.com.cn>
> ---
> ../net/ethernet/stmicro/stmmac/stmmac_main.c | 28 ++-----------------
> 1 file changed, 2 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b2b7d0242dd3..2e3b0cf10d66 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5021,24 +5021,6 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
> return vlan_features_check(skb, features);
> }
> 
> -static void stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
> -{
> -   struct vlan_ethhdr *veth = skb_vlan_eth_hdr(skb);
> -   __be16 vlan_proto = veth->h_vlan_proto;
> -   u16 vlanid;
> -
> -   if ((vlan_proto == htons(ETH_P_8021Q) &&
> -        dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
> -       (vlan_proto == htons(ETH_P_8021AD) &&
> -        dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
> -       /* pop the vlan tag */
> -       vlanid = ntohs(veth->h_vlan_TCI);
> -       memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
> -       skb_pull(skb, VLAN_HLEN);
> -       __vlan_hwaccel_put_tag(skb, vlan_proto, vlanid);
> -   }
> -}

This is still not looking right, make sure you use the correct tools to
send your patches, either "git format-patch + git send-email" or "b4" :

https://docs.kernel.org/process/submitting-patches.html#submittingpatches

For b4 :

https://b4.docs.kernel.org/en/latest/contributor/overview.html

Thanks,

Maxime

