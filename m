Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBC6F3D5FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIAIfKdjfZ9D4330UHAm2Itp7N2ZuoxDtpoyKFVIDuQ=; b=AP3ufPhptx/spb2nWhO4hCYyCL
	le5CJCvi6EdjRirkVI4CPHnLtfxGmQATWlkXyltdJCCOrVVuOQvJlKqIJlE24Uu6d2sIdJhet6JKi
	m+tB4XMmIMcQEQjQTNYyi3CyRpV7+X2qyZU52drYG1CZJL2PVo5z0fNHH72Tlvgs052K+FLZNj9WD
	edGXPaQvPKGW4oEcy8BUhqTBbaoYdysZWZnUc/w7wT2LHoYUVbnQzYp9I6E+6jIJs43rvz/O/2S0F
	x6xec/2gpS6QOAs7J0Rxaus6krGSJPEDQHtQM85YgIvvcHXqMps2wryW105RxK5fzZjhAI8s9/DZl
	A88M+C7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6m9t-00000009luh-1ytA;
	Sun, 29 Mar 2026 09:10:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6m9q-00000009luD-2G6c
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 09:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bIAIfKdjfZ9D4330UHAm2Itp7N2ZuoxDtpoyKFVIDuQ=; b=DwvvAKqwSmDZiTn+EP8l1kK0az
	5IjGAbasoS17h7/jIYQOHjK5wfhtORIx2vX/AAfsZA/5qFblc2A7k2BYjXxYO6+RKElzPptK4uZK0
	k3ofQGHFouVABlTcj7uklZyI7HwrlJbBOnenpg1/2o7HLUkRCSIyh0M+uTb8Q6sf+qoVuaDrjzrOP
	SMcEudc+tlbpvzO2EoNLVrprcwnmb2ra0fZubqFTdTONODqvlsOz1V67gX5FyLNEq+rhYRV/z0oy+
	hUzEiNDTkITz0fAwc8Ul79NQu60V0CHQ6iwHMKLUPO3fyBLz8DkIwOK36eOQk8S5XvknVJ1FLJjS2
	pq8gmlbw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59684)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w6m9f-000000007oH-2tJx;
	Sun, 29 Mar 2026 10:09:59 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w6m9c-000000001bQ-01Th;
	Sun, 29 Mar 2026 10:09:56 +0100
Date: Sun, 29 Mar 2026 10:09:55 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 03/10] net: stmmac: move TSO VLAN tag insertion
 to core code
Message-ID: <acjsY4HtQbtvNtV-@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
 <E1w6bKu-0000000ELtr-0U6v@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w6bKu-0000000ELtr-0U6v@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_021010_596342_5283EFC1 
X-CRM114-Status: GOOD (  16.36  )
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

On Sat, Mar 28, 2026 at 09:36:52PM +0000, Russell King (Oracle) wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index e21ca1c70c6d..ed3e9515cf25 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4419,19 +4419,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>  	u8 proto_hdr_len, hdr;
>  	dma_addr_t des;
>  
> -	/* Always insert VLAN tag to SKB payload for TSO frames.
> -	 *
> -	 * Never insert VLAN tag by HW, since segments split by
> -	 * TSO engine will be un-tagged by mistake.
> -	 */
> -	if (skb_vlan_tag_present(skb)) {
> -		skb = __vlan_hwaccel_push_inside(skb);
> -		if (unlikely(!skb)) {
> -			priv->xstats.tx_dropped++;
> -			return NETDEV_TX_OK;
> -		}
> -	}
> -
>  	nfrags = skb_shinfo(skb)->nr_frags;
>  	queue = skb_get_queue_mapping(skb);
>  
> @@ -4932,6 +4919,14 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
>  	features = vlan_features_check(skb, features);
>  
>  	if (skb_is_gso(skb)) {
> +		/* Always insert VLAN tag to SKB payload for TSO frames.
> +		 *
> +		 * Never insert VLAN tag by HW, since segments split by
> +		 * TSO engine will be un-tagged by mistake.
> +		 */
> +		features &= ~(NETIF_F_HW_VLAN_STAG_TX |
> +			      NETIF_F_HW_VLAN_CTAG_TX);
> +

I'm wondering whether this is the correct place to do this. If as a
result of the following tests we fallback to software GSO, then we
will be submitting "normal" frames to the driver to transmit, which
means it can insert the VLAN tag in hardware.

So, I'm thinking this isn't the correct place for the test, but it
should be after the tests that disable NETIF_F_GSO_MASK and only be
masked out when the features mask still contains any of the
NETIF_F_GSO_MASK features. Anyone concur?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

