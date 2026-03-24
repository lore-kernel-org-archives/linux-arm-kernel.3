Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF63CE9A755
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cB8TFGRfEdVX3qY2fuvGrhl4Xqk2fm3TveNGrNsWCq0=; b=hU4vxCz2wKcYyoZKrBpxBKWc+f
	WAeu3sfKYjoiRAmzN2cAkhV6KUQnR2gSjLlmwWmLwQMI7nK5BJE6q6OZ5fOyIpLBFe9dOlI94oKbw
	umV2j2BVpy/pGpxLMaDcdTemVvlhD6MovS8Afw5fxr4nPcZlcoXPhFFHVOyjmwqbdS2HzLyj2wRXf
	pEP8s++LeX/JM2rPHUpdudAAA8MfEN54s9cKduyZFnqMvVXxrFTtO2jntQtyq80yv1jKrKm3kSO/y
	FGExQ8ipER0zSWGjaelfJ+parOWe6OQ34DM2ctzpCNDdGe+yjhe89LEdfCOpdx104JOnTNKYZvwtW
	lHCRDVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yS9-000000018yZ-3mrv;
	Tue, 24 Mar 2026 09:53:37 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yS7-000000018wi-0pRc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cB8TFGRfEdVX3qY2fuvGrhl4Xqk2fm3TveNGrNsWCq0=; b=t58YdZemTOa6KNg9wCkCIlj924
	BtVeV7s+7Gmia04+AgJGiBQvWFvbagQR4CEmQ7JbSY5sZ7ETfxNDVzvwykaoVrUWtk5FwqXKzYoy7
	kD37wMf2LXs6Zoy83K28E/i+Fz99vxwQtTWSSK5nBZYJeTuQq8NUTkGqL0GESTbIM+wUONgY0WOhX
	l6kQTLAJ2+soUSXELGweLAPPCPqvjhXguGsr1vrcwFdWi633h5lIfDddh19jrkv8A5+ZpdyDdZuEA
	QPkNyp63gv6XZAWS/oGO5RgoXQpnNt3jdnTPPdokZmSLzAhZULh3HMXBXDxlNjTjo/OW7DKaCqVpG
	u+PMyUEQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41654)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w4yRv-000000001jA-0bjJ;
	Tue, 24 Mar 2026 09:53:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w4yRt-000000004yG-1hQP;
	Tue, 24 Mar 2026 09:53:21 +0000
Date: Tue, 24 Mar 2026 09:53:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 5/5] net: stmmac: dwmac-sofcpga: Drop the struct
 device reference
Message-ID: <acJfEfLzOLYN9qJ_@shell.armlinux.org.uk>
References: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
 <20260324092102.687082-6-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324092102.687082-6-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_025335_245917_EC3DD4C1 
X-CRM114-Status: GOOD (  20.54  )
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

On Tue, Mar 24, 2026 at 10:21:00AM +0100, Maxime Chevallier wrote:
> We keep a reference to our the struct device in the socfpga_dwmac priv
> structure, but now it's only ever used to produce logs in the
> .set_phy_mode() ops, that are specific to this driver.
> 
> When we call that ops, we always have a ref to the struct device around,
> so let's pass it to .set_phy_mode(). We can now discard that reference
> from struct socfpga_dwmac.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c   | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index ae40de2ed8eb..1d7f0a57d288 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -53,14 +53,14 @@
>  
>  struct socfpga_dwmac;
>  struct socfpga_dwmac_ops {
> -	int (*set_phy_mode)(struct socfpga_dwmac *dwmac_priv);
> +	int (*set_phy_mode)(struct socfpga_dwmac *dwmac_priv,
> +			    struct device *dev);

As you're changing the signature of this method, would it be more
sensible to put "struct device *dev" as the first arg, rather than
swapping the order below:

> @@ -552,7 +553,7 @@ static int socfpga_dwmac_init(struct device *dev, void *bsp_priv)
>  {
>  	struct socfpga_dwmac *dwmac = bsp_priv;
>  
> -	return dwmac->ops->set_phy_mode(dwmac);
> +	return dwmac->ops->set_phy_mode(dwmac, dev);

?

In either case:

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

