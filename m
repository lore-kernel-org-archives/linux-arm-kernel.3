Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A45C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBCvyH3YtvkpXtOPlGLQiWEsgokOQEtClJ0E/kQYkoU=; b=CsJYG664wSKy46Ih2nn7A6hT4r
	/zlp0p1W/FdxNX3TOavOqzhyp/kxwlBB/d0SgvIx8qmpMLyJZrNRwAyOJG0oK6guzhNwd/OSEmbPo
	ksSu6wn8eMvBlnfFiegrIbMH+oqhGRTnIT7e0V6j5B6uAwLtLZpyw/+TpAIPIAfjbxLYRc2kbQC/u
	sdkac62/c16XSyj+dS2bRG+5uz4QSOS3JwmYSVaM9Os7omBEBKGHn3VT+QNQzQSMyUgJvD1c9p6L7
	KtxPeeQoS/1NOi8rPXXFMhRm72ARDjG+JGGR/WZjy63uOlnSGfMFvSWcoMGGEFzTvuXnemcLEjD+8
	57BzBymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew9j-00000002Kjv-0GaJ;
	Wed, 01 Jul 2026 14:43:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew9g-00000002Kj8-1xr4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 14:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GBCvyH3YtvkpXtOPlGLQiWEsgokOQEtClJ0E/kQYkoU=; b=OPGqidVoJyb+oeiZIjLeJI+cwy
	fYnYlX2dPelUiaiwKyYW64KtiZmA/kbKqOlxmGSTuC6yoQKnzJ9dEqJVcuVEAJCaiQAXxKvW0Wz4f
	Wx+wdVPn6cMWpxWZeuB3Jp8aryxD+9en+Rn6MmCWIkuOyglGxITpTaOXC1daGb03QYK0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wew9X-00ABS3-J4; Wed, 01 Jul 2026 16:43:03 +0200
Date: Wed, 1 Jul 2026 16:43:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: dinguyen@kernel.org, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org, conor+dt@kernel.org,
	robh@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] net: stmmac: dwmac-socfpga: Add mac-mode DT property
 support
Message-ID: <e489be4a-5940-46e5-ae06-b78f1c919352@lunn.ch>
References: <20260630133108.27244-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260630133108.27244-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630133108.27244-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_074312_511026_CFB7AE34 
X-CRM114-Status: GOOD (  15.33  )
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

On Tue, Jun 30, 2026 at 06:31:08AM -0700, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Russell King's commit de696c63c1dc ("net: stmmac: socfpga: convert to
> use phy_interface") replaced mac_interface with phy_interface in
> socfpga_get_plat_phymode(), noting that no upstream DTS files set the
> "mac-mode" property, making the two values identical.
> 
> The Agilex5 SoCDK TSN Config2 board is an exception: its gmac1 TSN
> port uses GMII internally in the MAC while the PHY-side interface is
> RGMII, so mac-mode and phy-mode differ. Without restoring mac_interface
> support, the MAC is configured with RGMII instead of GMII, causing
> connectivity failures on this board.
> 
> Add socfpga_of_get_mac_mode() to read the optional "mac-mode" DT
> property and store it in a new mac_interface field. When the property
> is absent, mac_interface falls back to phy_interface, preserving
> the existing behaviour for all other boards.

I don't actually see a need for mac-mode. From what you are saying,
there is no choice. The MAC is hard wired to the converter block. So
you can just look at the compatible. You are going to need to use the
compatible anyway, to mask the phy-mode to handle the "MAC" doing the
RGMII delays.

      Andrew


