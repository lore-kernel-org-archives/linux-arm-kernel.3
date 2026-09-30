Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBF8CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzOGn7kFlOHjQR1OKolnS+9aTa51YUymd+DOFjdZtfU=; b=BmbyXOnWD69vgxYFbihaa98+07
	JJgF7Q/RJ4Hp2qBA96ZMOP8uKo1WXFSqyKV+l+l13MGDCXYBhasY8Zp7tmddcBubzXtmXmyonHuui
	AHEa2xiy58Qr1vrZ04wpTT3+OVUASR9NZ0WywgKYSlnlRELH446Sc8fKEJIGMNoFZl/Q5POl5uBXw
	P91tmSIPkrEiDv8WEljOluHBSrwUYf0e/nj4byoUGFA6hBJD18vbZXoG74EesZ3lmhjMx8LiS+j4L
	dwO2hm3GaxaQynt63tnXTpRsDGl/epXPDoyF9B6s5jq8Q/LIUPACeratWrR/yDURSQ0F1XNMGDT73
	+gDCx04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2DN-00000007Jqu-10aJ;
	Wed, 30 Sep 2026 21:51:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2D6-00000007JnK-3usL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:51:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A16441A1088;
	Wed, 30 Sep 2026 21:51:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6248160749;
	Wed, 30 Sep 2026 21:51:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0101A103298BA;
	Wed, 30 Sep 2026 23:51:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790805089; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=vzOGn7kFlOHjQR1OKolnS+9aTa51YUymd+DOFjdZtfU=;
	b=WYNB4EVjUV26HzXoImOdERlNMCi/1F9FbbLdz0J/n2iIQHFWJkLmVhws7pZFdkoirpeMeE
	WHtF1qJ5uvZFz1Kd/bEIUbw2wsw1ccZIe6g9UfGBMwSW6L4T4Caj1jEyHxUWd8Oc02Mrqh
	NGa//iMhbHpvs0aMbrwvmBMrfjKsO/fDcFmdBI8dhYo54rNcY3NoZbl9Nt3zfFzwONIW7f
	ESdHMirkK90aVAJo+ssgPAb+VNSYYyNjIbgc3KGTKRwT+4ixZiflaXi0UXzGo2IzgiSMW2
	Cms65QhZENJcWqxNEz61EDnq/Wlzlcdv18z9/Th+haP4PFQyB9eb7ZH0FL9XAQ==
Message-ID: <f99b6e1c-c37e-4356-b6cb-e13a4eab059d@bootlin.com>
Date: Wed, 30 Sep 2026 23:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v6 5/5] net: stmmac: Disable S-Tag processing on
 dwmac4
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, recv.jo@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, jun.ann.lai@intel.com,
 yi.fang.gan@intel.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260928203441.34876-1-ovidiu.panait.rb@renesas.com>
 <20260928203441.34876-6-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260928203441.34876-6-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_145133_864894_56BE68B3 
X-CRM114-Status: GOOD (  22.43  )
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

On 9/28/26 22:34, Ovidiu Panait wrote:
> Currently, hardware VLAN stripping is broken for 802.1ad tags. vlan_rx_hw()
> hardcodes ETH_P_8021Q when putting the hardware tag into the skb, rather
> than using the actual protocol from the packet. Because of this, packets
> that contain a 802.1ad outer tag are incorrectly passed up the stack as
> having an 802.1Q tag. This causes QinQ ping between two hosts to fail.
> 
> vlan_rx_hw() is shared by dwxgmac2 and dwmac4: on dwxgmac2 the tag type
> is available in the RDES3 write-back descriptor (the ET_LT field), so the
> outer tag type can be determined based on that info. However, dwmac4
> doesn't seem to provide the tag type. The Length/Type field in RDES3 only
> indicates whether the packet is single or double-tagged, not which tag
> type was stripped.
> 
> Since dwmac4 cannot report the stripped tag type, it cannot support
> hardware S-Tag stripping correctly. Therefore, restrict the
> NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER advertisement
> to dwxgmac2 only.
> 
> With this, 802.1ad tags are left in place and handled by the software
> VLAN path.
> 
> Fixes: 750011e239a5 ("net: stmmac: Add support for HW-accelerated VLAN stripping")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

I ran your proposed QinQ selftests on stm32mp157a (dwmac4), and it correctly
fixes the problem on that core.

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
> v6 changes: None.
> 
> v5 changes:
> - Rebased on top of latest changes.
> - Added Reviewed-by tag from Maxime.
> 
> v4 changes:
> - Dropped all "double VLAN" references from the commit title/message.
> - Rebased on top of the S-VLAN rework.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b007ff120471..5af245fd9ba0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6211,7 +6211,7 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
>  	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
>  		features &= ~NETIF_F_CSUM_MASK;
>  
> -	if (dwmac_is_xmac(priv->plat->core_type)) {
> +	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
>  		if (features & NETIF_F_HW_VLAN_CTAG_RX)
>  			features |= NETIF_F_HW_VLAN_STAG_RX;
>  		else
> @@ -7990,14 +7990,18 @@ static int __stmmac_dvr_probe(struct device *device,
>  	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
>  #ifdef STMMAC_VLAN_TAG_USED
>  	/* Both mac100 and gmac support receive VLAN tag detection */
> -	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
> +	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
> +	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
> +		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
> +
>  	if (dwmac_is_xmac(priv->plat->core_type)) {
>  		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
>  		priv->hw->hw_vlan_en = true;
>  	}
>  	if (priv->dma_cap.vlhash) {
>  		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
> -		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
> +		if (priv->plat->core_type == DWMAC_CORE_XGMAC)
> +			ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
>  	}
>  	if (priv->dma_cap.vlins)
>  		ndev->features |= NETIF_F_HW_VLAN_CTAG_TX;


