Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9182C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9haV9aTUDDiNQXjFQryFZWilFLS3MvagruKpPoAm5Gw=; b=bk49PkopN6lDQ8xoDUnDypvTCF
	hbomi0c9UYQCRVOhCAHcDpN9Rdus23KZ7FCum/hWCg0M8tEhsVa5/vKn1vj460uO6HJ9dMonGw9lT
	y+GyZMoV8sDkF16TgqedpLvEZHujr5LzdF0Bvuzh/Pc4Z1NwQMBUhYgUhVgR6yCZwbShTn8wRCGeE
	Xrbow4hr2HMbzFZnxOifJPbykcsfm9qYRScmEh02cEJERkvBiSTJFttNuUeMWlwWAO6sQ0i79D3WK
	2KMEP+mNweqIEnjXHrCRLQaJ2paTyVFlQuzKTA3Hem/ihEl+S32+DF0Ut/5uwv74PX4hbb0XVkldl
	LPK0pS8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMPu-000000007Pf-1RO0;
	Sun, 06 Jul 2025 10:16:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMKq-000000006zI-0p2U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 10:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9haV9aTUDDiNQXjFQryFZWilFLS3MvagruKpPoAm5Gw=; b=ObeV/uaUNE0I4Y3/DRfwn8vH4Q
	ZO2Mv2+qO2bL4rWOb4ULI26+iN3zooJHkM6XchfBUBpBImRBZWEpcATvceTleEhvd0XWaxxmki6T1
	IZZe02lU3N2iK0PNw0UMdU8jj2Jun/gVHJhsTwttl2TwFuV1PMZaWUwozONCDhl6jcLLXW+b1JFLN
	iS8z3gVRvgSIY+FYvn4EEIKTKezufe3N75/FdjWdU6+XnWngTm4kBOSf/DtaFNis4JIUUABlgLrlX
	DBta5ZrVCu1D5499RmxhYyQZzESUgzOspnQRhVQbBb/n/wqQxP7vDnSX0ypT69mI0F4OhLVYtUUrm
	niNYX5IQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52150)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uYMKd-0003yH-1A;
	Sun, 06 Jul 2025 11:10:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uYMKa-0007zX-1h;
	Sun, 06 Jul 2025 11:10:44 +0100
Date: Sun, 6 Jul 2025 11:10:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Message-ID: <aGpLpLDPdcPByC7j@shell.armlinux.org.uk>
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
 <aGl9e9Exvq1fVI0s@shell.armlinux.org.uk>
 <TYCPR01MB11332BCE03B3533784711A5BF864DA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY3PR01MB113460004F6A57B3AAD77E86E864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113467D8E13143E412B119270864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113467D8E13143E412B119270864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_031100_234418_7D6D25A3 
X-CRM114-Status: UNSURE (   8.66  )
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

On Sun, Jul 06, 2025 at 09:55:28AM +0000, Biju Das wrote:
> Just adding some logs:
> Currently PHY resume is called twice
> [   35.754933]  kszphy_resume+0x3c/0xf0
> [   35.754940]  phy_resume+0x3c/0x74
> [   35.754949]  phylink_prepare_resume+0x58/0xa0
> [   35.754957]  stmmac_resume+0x90/0x2a0
> [   35.771296]  stmmac_pltfr_resume+0x3c/0x4c
> 
> and
> 
> [   35.771258]  kszphy_resume+0x3c/0xf0
> [   35.771263]  __phy_resume+0x28/0x54
> [   35.771270]  phy_start+0x7c/0xb4
> [   35.771275]  phylink_start+0xb8/0x210
> [   35.771282]  phylink_resume+0x7c/0xc4
> [   35.771288]  stmmac_resume+0x1ec/0x2a0
> [   35.771296]  stmmac_pltfr_resume+0x3c/0x4c

This shouldn't be a problem. Phylib will do this, and PHY drivers are
expected to cope.

For example, on non-MAC managed PM PHYs, mdio_bus_phy_resume() will
call phy_init_hw() followed by phy_resume(). If a MAC subsequently is
brought up, phy_start() will be called, which will also call
__phy_resume().

If this is upsetting the KSZ PHY, then the KSZ PHY driver needs fixing.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

