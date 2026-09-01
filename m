Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04FCC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 10:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOIlfymRRQuD+AKwih1MHgi5PjvBRnijLeOrE+nYjUo=; b=h5EpQwnqj4sqI2bVgW8HkxqBuS
	bowXyyAKORAt/EODRsF6Gjh1IEXqqWOYrrFPzMnzzQIXin7QK2zHOO+cpHOpgrMWKx7ps624SOWSK
	7HXBxus16W28At247knPBBge5/0XI8MkDOWwKPwxyI2GNWx5fkRDvsYQviH6aP+aoXbVKx1KLLYaX
	5GIDEkdShUjiEDwWxT3S3QwC4vWbp3XYxpH946P6rlk+WyS1FS4OEV4DV5qFPjdfzrH/9UbZdeKlq
	ZfQu9AkPC6BPY7+VQiRxxBXdHmi8Wy6fxxA/SCQgGSCK8/3q00W2n2VVRpn5POyGLADO3piQuLFyz
	CzSKxnLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1LJS-0000000BUb1-1RWL;
	Tue, 01 Sep 2026 10:01:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1LJO-0000000BUZu-3cIz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 10:01:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D48524E414A5;
	Tue,  1 Sep 2026 10:01:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D04F6053C;
	Tue,  1 Sep 2026 10:01:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2943111C7925D;
	Tue,  1 Sep 2026 12:01:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788256902; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=hOIlfymRRQuD+AKwih1MHgi5PjvBRnijLeOrE+nYjUo=;
	b=aHp+F/LtDLLQwsM08nnqDhONT8wglljSLAYzRgeESJJ95PcvuDT/gS6vlHuNUbLjCfXBTK
	BmUKdgPREtS94t+GGt6+9tNGPTayfBL+JMdVAEsGfZJ9luYwCqV3wktCqlZKVrsXXODLxU
	l5An57UyRSuaH0Iz5u/56w9p97ixp5yC2EKXgMFYsCsBEKswgJ1vdH91PotXCynzTuLI/i
	L5jZSZU/lBBlVtz4nn/Zg0p7EpHVlyuyxjQ9E0mP9drE67oaspnDiUD9E4N1ROVC+fgd+D
	+fVaaeKOadyilp78fGqSnerF9p3AdK8vZvrpB302mDD26zzNPykBI2TtApwahA==
Message-ID: <bd192fda-f609-410e-9a45-9aaa77828c6a@bootlin.com>
Date: Tue, 1 Sep 2026 12:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux next v3] net: stmmac: remove software VLAN tag
 stripping
To: he.peilin@zte.com.cn, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 vbridgers2013@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: jiang.kun2@zte.com.cn, xu.xin16@zte.com.cn
References: <20260901172851033O5o7viiEDPAm8g6Mkqe-G@zte.com.cn>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260901172851033O5o7viiEDPAm8g6Mkqe-G@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_030151_188104_21AB2B24 
X-CRM114-Status: GOOD (  17.87  )
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

On 9/1/26 11:28, he.peilin@zte.com.cn wrote:
> The software VLAN stripping logic in stmmac_rx_vlan() was originally
> introduced in 2014 by commit b93819854d6e ("stmmac: Add vlan rx for
> better GRO performance.") as a workaround to improve GRO performance,
> since at that time GRO could not handle frames with VLAN tags. However,
> this limitation was resolved in 2015 by commit 66e5133f19e9 ("vlan: Add
> GRO support for non hardware accelerated vlan"), which added GRO support
> for non-hardware-accelerated VLAN frames. Keeping a software fallback
> path for VLAN stripping is no longer necessary and only adds complexity.

Thanks for the followup, but please slow down, you must wait 24h between
submissions :

https://docs.kernel.org/process/maintainer-netdev.html

While at it, please take a look at the rules about the topic name, must be
either 'net' or 'net-next'

I'll review after the 24h cooldown,

Thanks,

Maxime

> 
> Fixes: b93819854d6e ("stmmac: Add vlan rx for better GRO performance.")
> Signed-off-by: Peilin He <he.peilin@zte.com.cn>
> Reviewed-by: xu xin <xu.xin16@zte.com.cn>
> Reviewed-by: Jiang Kun <jiang.kun2@zte.com.cn>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 28 ++-----------------
>  1 file changed, 2 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b2b7d0242dd3..2e3b0cf10d66 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5021,24 +5021,6 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
>  	return vlan_features_check(skb, features);
>  }
> 
> -static void stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
> -{
> -	struct vlan_ethhdr *veth = skb_vlan_eth_hdr(skb);
> -	__be16 vlan_proto = veth->h_vlan_proto;
> -	u16 vlanid;
> -
> -	if ((vlan_proto == htons(ETH_P_8021Q) &&
> -	     dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
> -	    (vlan_proto == htons(ETH_P_8021AD) &&
> -	     dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
> -		/* pop the vlan tag */
> -		vlanid = ntohs(veth->h_vlan_TCI);
> -		memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
> -		skb_pull(skb, VLAN_HLEN);
> -		__vlan_hwaccel_put_tag(skb, vlan_proto, vlanid);
> -	}
> -}
> -
>  /**
>   * stmmac_rx_refill - refill used skb preallocated buffers
>   * @priv: driver private structure
> @@ -5407,9 +5389,7 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
>  	if (priv->hw->hw_vlan_en)
>  		/* MAC level stripping. */
>  		stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
> -	else
> -		/* Driver level stripping. */
> -		stmmac_rx_vlan(priv->dev, skb);
> +
>  	skb->protocol = eth_type_trans(skb, priv->dev);
> 
>  	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
> @@ -5901,9 +5881,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  		if (priv->hw->hw_vlan_en)
>  			/* MAC level stripping. */
>  			stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
> -		else
> -			/* Driver level stripping. */
> -			stmmac_rx_vlan(priv->dev, skb);
> 
>  		skb->protocol = eth_type_trans(skb, priv->dev);
> 
> @@ -7964,9 +7941,8 @@ static int __stmmac_dvr_probe(struct device *device,
>  	ndev->features |= ndev->hw_features | NETIF_F_HIGHDMA;
>  	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
>  #ifdef STMMAC_VLAN_TAG_USED
> -	/* Both mac100 and gmac support receive VLAN tag detection */
> -	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
>  	if (dwmac_is_xmac(priv->plat->core_type)) {
> +		ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
>  		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
>  		priv->hw->hw_vlan_en = true;
>  	}


