Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175B010BA421
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 08:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBGUIi2ACXBs5dBa+ZwVmMxZ7q4HBlEgRbUeEupBh9U=; b=oGJ8t4tT860o3Z/Z+fkBqcHUGm
	1oSH5C851D5d8oxuTqhRVmVUwgjSsEVrVmG/Pj9x0Mrh/HGEl/WM4Xzw1ERHIY+nQQgyE2EKMvYtF
	9p4ia3cPeDqWLS3RSVYB+DfhhevDJIm65i2Kl6iAE3sGUgXuuG8MTseGoyllzEyyF/IfiXCkhdPqT
	sizMznloeVqB1ST8pOktWuzxv1IYZJX0pvcSxfquhEWQujv2vG5BbttpAmfed0J/tnLVaoUpNWR+/
	mVnVBGjIGojGLjepAxsfvEKarIbNU0/YripwGlFKsdrYN7r26YH5qFa5/sJIMca61Pin/FXKfI1Ny
	lK9knZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6OyM-00000008jcc-3ybw;
	Sat, 28 Mar 2026 08:24:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6OyK-00000008jbp-1LXf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 08:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dBGUIi2ACXBs5dBa+ZwVmMxZ7q4HBlEgRbUeEupBh9U=; b=zeXZhzLgUiuIiTK8dL2wHfYuQ4
	twJPvaZEpu/cCswIQPutnepzFsLq/3cT2sqneczANqSdaUDxO5BFOnB/I3hzp9oNxr4MaknA4Zlfb
	dtWGiOscalNfC8nNPuMZAjjQ0eyPEFGHd9JEf5R0ots+a6iC6NgO8ItOb2glUMYkMImzwsMfwBrz8
	ufb/8adgE1SGKZzcG7g0+ePe66kPFxRCipXUr+arTfB5b/x/wl/uoWAbshn5t8m6aTW1O26/kkGc+
	YzyJMdLESbM1u3d1qt9sDv5eXys6OufyDAxI1xRX7XSqibcdRcPWOFCiOR5Hr0/QJm+9dT8LHqMOt
	/5lhlXFA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60066)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w6OyF-0000000073T-0W0n;
	Sat, 28 Mar 2026 08:24:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w6OyD-000000000WK-1f02;
	Sat, 28 Mar 2026 08:24:37 +0000
Date: Sat, 28 Mar 2026 08:24:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: simplify GSO/TSO test in
 stmmac_xmit()
Message-ID: <aceQRSc5o4D-HHmq@shell.armlinux.org.uk>
References: <acZQaDeCoib5S5UA@shell.armlinux.org.uk>
 <E1w63fl-0000000E3Vb-3JkY@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w63fl-0000000E3Vb-3JkY@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_012444_386577_66E81C39 
X-CRM114-Status: GOOD (  19.80  )
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

On Fri, Mar 27, 2026 at 09:40:09AM +0000, Russell King (Oracle) wrote:
> The test in stmmac_xmit() to see whether we should pass the skbuff to
> stmmac_tso_xmit() is more complex than it needs to be. This test can
> be simplified by storing the mask of GSO types that we will pass, and
> setting it according to the enabled features.
> 
> Note that "tso" is a mis-nomer since commit b776620651a1 ("net:
> stmmac: Implement UDP Segmentation Offload"). Also note that this
> commit controls both via the TSO feature. We preserve this behaviour
> in this commit.
> 
> Also, this commit unconditionally accessed skb_shinfo(skb)->gso_type
> for all frames, even when skb_is_gso() was false. This access is
> eliminated.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

AI review of this patch regurgitates Jakub's point that was discussed.

> @@ -3700,7 +3700,7 @@ static int stmmac_hw_setup(struct net_device *dev)
>  	stmmac_set_rings_length(priv);
>  
>  	/* Enable TSO */
> -	if (priv->tso) {
> +	if (priv->gso_enabled_types) {
>  		for (chan = 0; chan < tx_cnt; chan++) {
>  			struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[chan];
>  

...

> @@ -7828,7 +7834,7 @@ static int __stmmac_dvr_probe(struct device *device,
>  		ndev->hw_features |= NETIF_F_TSO | NETIF_F_TSO6;
>  		if (priv->plat->core_type == DWMAC_CORE_GMAC4)
>  			ndev->hw_features |= NETIF_F_GSO_UDP_L4;
> -		priv->tso = true;
> +		stmmac_set_gso_types(priv, true);

Clearly, the issue it is regurgitating has been there for a long time
and isn't a new issue introduced by this patch.

AI needs to stop doing this, because it is encouraging multiple changes
in a single patch, which is against the normal kernel process.

As already pointed out, there are multiple issues with stmmac TSO
support, particularly with glue drivers that enable TSO on some
queues/channels and not others, since netdev core TSO support is
global across all channels.

So, won't the AI response in this patch - it's just another pre-
existing issue that needs fixing in a separate patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

