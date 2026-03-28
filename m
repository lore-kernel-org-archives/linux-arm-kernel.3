Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7B410BA421
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 07:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcCUMbnn2xhlLhVQAjJxMMLH4aljs8rQ9ZN4v5JicAQ=; b=moKtI4mZLEsMqHA+U08jw1uUml
	VvA3SwebdDxzTk0blSv8khDKpip3dqfZMWAyEx6rjBlo07x5w+VwY9/DT/O5TERleVqa/bDgoj++5
	2QbtAR7Qv/ylZMyONAqzL6ZbXYZcTWlxi7aq6/0ujt8Lu3ycYoixI+DSyMNF85Ln5aRefpnU5bgtj
	iCKZp3SZo/Z/7YYTZV3/4d5ovkiKiDKCQF0cy6BCk/miIt9YidpUrPvHqK582uCttKUaVN5eOYbBc
	6guEqM5T6fxrxBx5dJI9C3k24JpcM8rr44a6caVGIe5GuYOKvMruSl60uRGcw70Ddeh2FnzHlkKQI
	wVRoyFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6OSN-00000008iIY-1LsN;
	Sat, 28 Mar 2026 07:51:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6OSK-00000008iHm-2ZiE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 07:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kcCUMbnn2xhlLhVQAjJxMMLH4aljs8rQ9ZN4v5JicAQ=; b=wbdEyCKWA3AD4xgAzskxbTq9XA
	MZZGTI34OwbhP/yFwga1b1nvz8daEXs+weOWQF+kDDRVWGsjteKf7PZALfs2F1ZNkBhn3OuEELNqt
	ukUAaaRSKU3O9kbjwZq/aU07jjhIWMoxBmIrkDPBW4IbU6cRglYIyINcoZgp9BmEKuxvTHmKSVeJl
	BosF2l3ogZCOjycMFu0LtbogLYXQN+2yOtx4Jyu+KZyGd8t2/l12vUnSJPtc9+y1gQshMUbuAkeW4
	iJqHs3hlgivtZEa4ohnzQGh5zfvWfmfqqckn7cc0PaeirfoxnOspgdeNR1h79rMVYVM4I2XJXJs5Z
	yd20lg0A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59968)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w6OS5-0000000071k-1KrD;
	Sat, 28 Mar 2026 07:51:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w6OS0-000000000Un-1IID;
	Sat, 28 Mar 2026 07:51:20 +0000
Date: Sat, 28 Mar 2026 07:51:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] net: stmmac: skip VLAN restore when VLAN hash ops are
 missing
Message-ID: <aceIeFWGAZwr1njk@shell.armlinux.org.uk>
References: <20260328-vlan-restore-error-v3-1-df47a039c6f6@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328-vlan-restore-error-v3-1-df47a039c6f6@mmpsystems.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_005140_652294_B3B604F5 
X-CRM114-Status: GOOD (  20.78  )
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

On Sat, Mar 28, 2026 at 07:51:53AM +0100, Michal Piekos wrote:
> stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
> NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
> ->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
> -EINVAL via stmmac_do_void_callback(), resulting in a spurious
> "Failed to restore VLANs" error even when no VLAN filtering is in use.
> 
> Remove the unneeded comment.
> 
> Tested on Orange Pi Zero 3.
> 
> Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
> This patch fixes a noisy "Failed to restore VLANs" message on platforms
> where stmmac VLAN hash ops are not implemented.
> stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
> VLAN hash ops presence which results in -EINVAL. 
> ---
> Changes in v3:
> - Remove the offending comment
> - Restore the original check for NETIF_F_VLAN_FEATURES
> - Link to v2: https://lore.kernel.org/r/20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl
> 
> Changes in v2:
> - Replace check for hash ops with check for HW FILTER flags
> - Link to v1: https://lore.kernel.org/r/20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 6827c99bde8c..0f3e5ac05faa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6861,19 +6861,13 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
>  
>  static int stmmac_vlan_restore(struct stmmac_priv *priv)
>  {
> -	int ret;
> -
>  	if (!(priv->dev->features & NETIF_F_VLAN_FEATURES))
>  		return 0;
>  
>  	if (priv->hw->num_vlan)
>  		stmmac_restore_hw_vlan_rx_fltr(priv, priv->dev, priv->hw);
>  
> -	ret = stmmac_vlan_update(priv, priv->num_double_vlans);
> -	if (ret)
> -		netdev_err(priv->dev, "Failed to restore VLANs\n");
> -
> -	return ret;
> +	return stmmac_vlan_update(priv, priv->num_double_vlans);
>  }

Yes, but as both Andrew and myself have pointed out, no one checks
the return value of stmmac_vlan_restore(), so why does it return
int?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

