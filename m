Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEEACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 07:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFX01VJY+mONJhtkTUSxkKaT0H5G139ZB0xMXIf93pU=; b=Mgzc0cpKhgKwkY/qq84HpXDx7Z
	dcZpYfgQ5m63MAIAnKE0sGAgaWJXkKA5+shLVcmtUyjxoaTrpFGSS2JoPpwHLTo9OevLYbf6Fq+fM
	coCWcVaxzLnwt5z8gXgWKYmPQP//FGXrpTLZvFfDb+OcaqK8YlqAq25UuI3Etl3DMB3peLlby8DS/
	FtnPrSEbfgVS/ETUbQGsZFAePn+g1b2ergf6Nsw3WIrPnwph2ncthJgknF5qumP7wthz4SohlsogV
	TUzIrJIUn5gTcJc3pW/G7X2HnBe2kLbRlTs2ZfN/T7+oSsmgWRAzM1oHbJcd8N6oS04mDMdvVjHcD
	BWKmMbtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBoQ-0000000BMEg-2Xz3;
	Tue, 04 Nov 2025 07:50:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBoO-0000000BMEG-1vEa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 07:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zFX01VJY+mONJhtkTUSxkKaT0H5G139ZB0xMXIf93pU=; b=wIlEtaBuc6pk0JydqUtkiAPcMk
	HwzT8yrzhnGYhaJ77ceqr0R1uX6nmiTza8Ew6/zLqvmB9oGEK/a5xbrMUJZ6+g8Ie6ZhiPnWChxJT
	3Ay5bztyapqiwUL8TY2VBasG5z9rfn0o++CpnI9WgkcrAm9BOB5UsaULfBdapeSSuL4/5zUZ4NYRT
	Z8c/7ki/T4w/hXf598eUAbvxyE0Xg2pQmiYfUy1MfRANUr7nnvQlGrGYT5/GoX6OPzP3KrU5ORlwz
	HN8tuTD9OVq2t830RD2CIAPUHoUzcw05FHEToxxkO6gvSUAS4sYKRNgGt+aQBDVaF/DOk12yX3xcD
	kaqsOJ9A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40358)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vGBoE-000000001p2-3uhA;
	Tue, 04 Nov 2025 07:50:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vGBoB-000000004b2-0Cf4;
	Tue, 04 Nov 2025 07:50:27 +0000
Date: Tue, 4 Nov 2025 07:50:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: imx: use phylink's interface mode
 for set_clk_tx_rate()
Message-ID: <aQmwQoxn5CwS9988@shell.armlinux.org.uk>
References: <E1vEn1W-0000000CHoi-2koP@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vEn1W-0000000CHoi-2koP@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_235040_498884_7C7F35C4 
X-CRM114-Status: UNSURE (   9.22  )
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

On Fri, Oct 31, 2025 at 11:10:26AM +0000, Russell King (Oracle) wrote:
> imx_dwmac_set_clk_tx_rate() is passed the interface mode from phylink
> which will be the same as plat_dat->phy_interface. Use the passed-in
> interface mode rather than plat_dat->phy_interface.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

While checking patchwork this morning, this patch was unexpectedly
marked as superseded. It appears I accidentally posted it as part of
the multi-interface stmmac series. This should not have happened.
Please apply _this_ patch as it has Maxime's attributations on,
whereas the mistakenly reposted patch does not.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

