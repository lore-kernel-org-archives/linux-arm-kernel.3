Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFF1D3517C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAJkGlVFFT5U5e9C33pZw9eYz6tOfkAlvygEpeiNyAc=; b=CHidvDol4+kF59ulEPK/c0v1jr
	T3SgZT3NaUhbH9wb0xpuICXXGGiaCt5bsc95pLRwXqnB52Bn+DZAucPgAJqdXAHFUkYwuVt8Wf918
	TgKv1/d8Hs7J/8IfgAh59tBTXvH0hArA0ppQJ+lmf0F1dqXcQKO9K5NqpbCZSJNtDu9nDeXTGNSwm
	zTpSg7v3BtmMSEuK+BV/kBEhp+UWMFijD/qjUysZJjujxJrtAhOlM2sR5+ZDMTB9WUy9ppgKh0GiH
	FCQ6dADpvhv/Lf86NbHFChDwLCPKLkWAFHgDAyLafE1OlSleuLk9wq/TocqwkOojhQAyP2M45szK1
	eVENYJvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7utK-0000000FF0E-2h9C;
	Wed, 01 Apr 2026 12:41:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7utI-0000000FF06-2XWD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 12:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CAJkGlVFFT5U5e9C33pZw9eYz6tOfkAlvygEpeiNyAc=; b=NfVNkbI52OJ6iFX5jcJiM+x2R2
	XK34fXWu0ETWiz+rFdaLHP8D8tjYPEns/781FbuFsB1vNZPpz/8Bx/NCAcTmPP/AEy4B5YKuL/laO
	uib1aYPI/oMHEEzoKKV9YlRMOQEChonMmGm5zXFFMHcsC+SapNx0R0y6K0ziYpZaAjqWNvlMRVYMn
	4IgHgF6f3CjhOD3lH5GcSJ6JaBheaZ7Kc+2StF3zDbNsniILT+yw1a3XNsMuoIFuhInVaMsYUwErO
	WniAZHP5rLiXTRBkZ+N775PlK6p5WIVt2TAHnrUqQJAt2VaI00nL4xC6D6Mj0dFQwTwdmVJTrry6u
	flrb36Fg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7utE-00000000N4S-3ghO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 12:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CAJkGlVFFT5U5e9C33pZw9eYz6tOfkAlvygEpeiNyAc=; b=QqZ3P5kKTng55RSp24e8WL9pFp
	kxxW945wya/yGkD+OCYaakgseH/ZLXGnV283N2MPWp6TxGMv4Lw01haT3O1T9Lt3gLNlmh2LYyM33
	gHu4CsanYmckmO/ihT6vvfAOdAT4ZWU9ahKlx3+kHAeuuQChhuttI2GauljtmgObYM9rCBbtKYjab
	zluwYonWg29mn8hu/jGaU+3i02JhK3C+8LoWZBoXyGRyryYXsUU3v3YNgVEmKjc9x0tXhkxYVC1Kj
	gN90iub/NLhGtqLuWDGuRs9KgUkh+KS4g/B+XiIoF2XFYAkzzZtBBWRiEaTEleyUUpwVQOokhIDZ2
	j9yh3goA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56488)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w7ut7-000000003Ay-0Wt2;
	Wed, 01 Apr 2026 13:41:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w7ut3-000000004nl-1sY8;
	Wed, 01 Apr 2026 13:41:33 +0100
Date: Wed, 1 Apr 2026 13:41:33 +0100
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
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: TSO fixes/cleanups
Message-ID: <ac0Sfd5E00Z8RjDX@shell.armlinux.org.uk>
References: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
 <420f910f-523d-4a74-a255-2fe48909283a@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <420f910f-523d-4a74-a255-2fe48909283a@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_134144_980747_3B22F90F 
X-CRM114-Status: GOOD (  14.55  )
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

On Wed, Apr 01, 2026 at 02:19:27PM +0200, Andrew Lunn wrote:
> > I'm moving the setup of the GSO features, cleaning those up, and
> > adding a warning if platform glue requests this to be enabled but the
> > hardware has no support. Hopefully this will never trigger if everyone
> > got the STMMAC_FLAG_TSO_EN flag correct.
> 
> Is this:
> 
>   snps,tso:
>     $ref: /schemas/types.yaml#/definitions/flag
>     description:
>       Enables the TSO feature otherwise it will be managed by MAC HW capability
>       register.

Like much of stmmac, this description is totally wrong.

snps,tso sets STMMAC_FLAG_TSO_EN in priv->plat->flags, and priv->tso in
unpatched stmmac:

        /* Disable tso if asked by ethtool */
        if ((priv->plat->flags & STMMAC_FLAG_TSO_EN) && (priv->dma_cap.tsoen)) {
                if (features & NETIF_F_TSO)
                        priv->tso = true;
                else
                        priv->tso = false;
        }

and:

        if ((priv->plat->flags & STMMAC_FLAG_TSO_EN) && (priv->dma_cap.tsoen)) {
                ndev->hw_features |= NETIF_F_TSO | NETIF_F_TSO6;
                if (priv->plat->core_type == DWMAC_CORE_GMAC4)
                        ndev->hw_features |= NETIF_F_GSO_UDP_L4;
                priv->tso = true;
                dev_info(priv->device, "TSO feature enabled\n");
        }

So, basically, TSO is only enabled when both the hardware supports it
_and_ snps,tso is specified.

Whereas the description suggests that snps,tso overrides the hardware
if it's specified, otherwise the hardware capability is used.

Given that the hardware capability says whether the hardware is, umm,
*capable* of TSO... yea, DT binding is basically wrong.

Now, how many of those snps.tso in DT are ignored because the hardware
doesn't support TSO... I guess we'll find out!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

