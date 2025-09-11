Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD59CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 18:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOf/scVy2/G7nPu4vUJje7URYboKIf5FDPfqbmkuw4I=; b=r1zxxOg/a2H3+ktS+rIKKs+dMO
	ZK23Ad4b48Qg1xNrDytiWgyvMtVBptMTLp79d6bWD/N0nOWufo4A0uCJm9gE05W5VwSreueZ99JyB
	cSn31DzGjZ+iqW/Cx7HOMYOZenGPlqtdw/64DnWGzsyWrGFpD35OMVmlAmaBwGC5PB/1gQak7V6bJ
	oDdASi44GXUHZjhmF1x+rDZN7N4MZxN3JIKZwvGE1R3ipHY2iVXOxGZfsTtUZmOp2QWjDguDu7hOq
	D3rjVZCH138tsYor+qVtxnPCdBWd1XmgCk0oOtoLPiaPtUG7TBswd/l03T5W04LgCYS8kLkQpUG7H
	oJt6RZgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwljm-00000004e2b-2DPC;
	Thu, 11 Sep 2025 18:09:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwljk-00000004e1S-0qT9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 18:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VOf/scVy2/G7nPu4vUJje7URYboKIf5FDPfqbmkuw4I=; b=yrojD4qbElqBAA+wqTnlfX3xdH
	tDMGY8wVO1Lpn3f53UpM/T2uQ1OSY2ePxsyvi/UQjR8SqTMVg6ZPMCpMrc0QgPFLBx0Xj2bDEdqIq
	0EYxG60KEWIh5KFszlghcXAswWB6OLonPDIhtEwbOEa8cBfJeym1PdxqdJyUodql16E8vb1DlINni
	xhzLu2bjiSb5tBnZ++rO44wmSq5DOJLviLdvfno3H9e1R4Kq4tybrImmuGHLPjEvV4qNcoLO5Iodw
	/pyHPI/IQcmHZiGHOQCgptmRJqk8XCn6j1D50gAzuFWbt6SAHFBbmYTtmoDxjZx7VjtMZ2QW5hPsf
	Y7SxxKIA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53308)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uwljS-000000003Rb-0HkQ;
	Thu, 11 Sep 2025 19:09:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uwljN-000000002Y4-3cKS;
	Thu, 11 Sep 2025 19:09:13 +0100
Date: Thu, 11 Sep 2025 19:09:13 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v4 02/10] net: stmmac: Add support for Allwinner
 A523 GMAC200
Message-ID: <aMMQSR7yYBQkY4CI@shell.armlinux.org.uk>
References: <20250908181059.1785605-1-wens@kernel.org>
 <20250908181059.1785605-3-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908181059.1785605-3-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_110936_240923_7032E960 
X-CRM114-Status: GOOD (  10.83  )
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

I drafted this but never sent it and can't remember why, but it's
relevant for v5 that you recently posted. Same concern with v5.

On Tue, Sep 09, 2025 at 02:10:51AM +0800, Chen-Yu Tsai wrote:
> +	switch (plat->mac_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		/* default */
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		reg |= SYSCON_EPIT | SYSCON_ETCS_INT_GMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		reg |= SYSCON_RMII_EN;
> +		break;
> +	default:
> +		return dev_err_probe(dev, -EINVAL, "Unsupported interface mode: %s",
> +				     phy_modes(plat->mac_interface));

I'm guessing that there's no way that plat->phy_interface !=
plat->mac_interface on this platform? If so, please use
plat->phy_interface here.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

