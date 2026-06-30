Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3A1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 14:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0GmV8HGMiBxPZojHC/TPgWc17DSdtLcrq8m1XBeG5k=; b=XEcKt3xCvDVFohEFFBR7mFRUcJ
	cLjYhU/3N1QV2LtILr+eg9Q2RHU8bVBL+PH+AmaYn76gEUA7e6TVp4fjTQU0mDEm43h08O8HzfJd1
	xzxk0WhMO8Fv6N8Mdt74BJ6X1N4a6yqFqm7m0zN4wyQuUSbgXh5Z5lfcEFjY9RRe9/7qUep4KGcIe
	UFEV6QhDz4UhVoyUSRITEADye6u44ibwe3s+DP78giPKtOvrbyPNDxpBfwNk4XTV6uMrpvtvaRHXS
	uRDuW0nUdcoy4JLOuyX/IDDMzbhVTQaa4ClbuJUJtGzDm4oFOs/TCGX+/dsUiWEnwIbd/xyDWsixg
	zglJuqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZ3I-0000000HEye-0dhL;
	Tue, 30 Jun 2026 14:03:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZ3F-0000000HExo-2fDP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 14:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=u0GmV8HGMiBxPZojHC/TPgWc17DSdtLcrq8m1XBeG5k=; b=duh0gbDGUnCmyAvCUFlAJkhKWV
	iTyDb85hcDckWkn7WAkdUmluWcry2+GWkvIJ020qOXnJtQV130jn18fzVSkWbmk17qokRZEkIFbG6
	A7+wORvIdThNF7mYpvjN95NpgMsRolUW0byZAx3+OZjF27BkkMkR1h0bRcV1CVwOYxbk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1weZ37-009zHK-Nm; Tue, 30 Jun 2026 16:02:53 +0200
Date: Tue, 30 Jun 2026 16:02:53 +0200
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
Message-ID: <4c285993-978c-4d9e-a8c5-c3b36baa6840@lunn.ch>
References: <20260630133108.27244-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260630133108.27244-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630133108.27244-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_070301_675170_CE6D6790 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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
> RGMII, so mac-mode and phy-mode differ.

Maybe you need to represent the hardware block which magically
converts GMII to RGMII in DT?

	 Andrew

