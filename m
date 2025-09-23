Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C658CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqqitcQCkxhV32rTsJ+uCNxHvhC6YeG2qjPkLgt2EmY=; b=ptOJSygymemawnmFrn8qrxHUnU
	Vfe3TbE4zUxg4A71QyQsupwDNY2ERqMo+dfbu3EdtWSu8j/O4VvMvRylV6x5st7+7Y3LBmzzjC54S
	v8p2q/nnq0YGh2KSe0rLnrzhPBf7SPtToUJHeFq2baH+nXOOMCHbI+dzHeDC6kHfMk+7xUq8Fagvj
	sO2j7/d0nTKbb64HJ1nFmJ21Sy859aesH0i3jxEw1nn0oGQufmBdqO8Goc4CDdclpPsLoKz+QT9ZS
	/ypZ/hEZ19Ez96sX62W/6QchnoDyzLaxinQaM6DtINfwC4POGO0C6fs9/uIB8fYGvRNtZlfitxj1Q
	zXks8LFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11FA-0000000DBoO-21mV;
	Tue, 23 Sep 2025 11:31:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11F7-0000000DBmC-2yh9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 11:31:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FqqitcQCkxhV32rTsJ+uCNxHvhC6YeG2qjPkLgt2EmY=; b=V2Xf7M/44Zue2oMyR0jrB+6qMg
	7ZAh961BrfLS0ajhseeoLhfyHCGNfHPNryrtiAnligon5imjUELBnAYYeYvGEq8HyMCjvXGG18NeR
	xX45bLWzxrnwcB0j2Yuoglb08+J7TKgm0LM9hQOtYHtqGNt/4LLi/I5MvXUR0NQgnNiUhEG5hUbCb
	JDYoTT3RoUIm3MA855yGNesZCF5JUQgQT8BS9MXHIxnoViLqZaISaVBU/hb0hizZXSiz2+qH5qEXO
	pgg/MesL/bYJCJJnAnbqqg0IgZRGp7D8trqHGNCTboXfcIhzp4fb1h7R3YigLmTnbHn8DxIhHllQS
	q3C2v+Fg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54658)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v11F2-000000007BP-0BY1;
	Tue, 23 Sep 2025 12:31:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v11Ez-0000000066T-3bkC;
	Tue, 23 Sep 2025 12:31:25 +0100
Date: Tue, 23 Sep 2025 12:31:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 0/6] net: stmmac: yet more cleanups
Message-ID: <aNKFDW_aaSZl2NFE@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_043133_746101_91AFF3C6 
X-CRM114-Status: GOOD (  14.81  )
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

On Tue, Sep 23, 2025 at 12:25:30PM +0100, Russell King (Oracle) wrote:
> Building on the previous cleanup series, this cleans up yet more stmmac
> code.
> 
> - Move stmmac_bus_clks_config() into stmmac_platform() which is where
>   its onlny user is.
> 
> - Move the xpcs Clause 73 test into stmmac_init_phy(), resulting in
>   simpler code in __stmmac_open().
> 
> - Move "can't attach PHY" error message into stmmac_init_phy().
> 
> We then start moving stuff out of __stmac_open() into stmmac_open()
> (and correspondingly __stmmac_release() into stmmac_release()) which
> is not necessary when re-initialising the interface on e.g. MTU change.
> 
> - Move initialisation of tx_lpi_timer
> - Move PHY attachment/detachment
> - Move PHY error message into stmmac_init_phy()
> 
> Finally, simplfy the paths in stmmac_init_phy().
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   1 -
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 111 ++++++++-------------
>  .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  32 ++++++
>  3 files changed, 73 insertions(+), 71 deletions(-)

Should've added: tested on nVidia Jetson Xavier NX.

However, observed a failure changing the MTU with the link down - our
old friend, failure to complete the DMA reset.

Once that's been triggered, taking the interface down or changing the
MTU again results in more problems, with the thread spinning in
napi_disable_locked() with RTNL held (as we effectively end up calling
napi_disable() twice on the same napi struct.)

This basically makes the platforms networking unusable - and needs to
be hard-reset.

These issues pre-exist all my cleanups.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

