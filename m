Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC2DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ujQvCQNZoKNKilbwyxTloll25o1U/0BsukcebFRRwI=; b=I+TOKI9xicVaO+HljmQeWRkXgC
	gr8CO0P2VJ/NtdDLlku5jmwxw58XAL1FvQx3SDZyANq8qH3hjKJCPwsS0zHAoVmp7GnKTJtfOV+/r
	ms/WgfMRu3VYIlUnGx8jF2cBijpvXv/sXjMSazbs2bNk1QtNtxTWe+XWtBIj99/i4amM3X1Jgy7v/
	U5bXnNdNirhPz22F+2bUikVytXOJ0ViOY0Y/JQAEV05Cg06jCn1rjF+DQ1pKyUq7BjrdxGmnWu1Pm
	MJMEEwKV3Hy+MEPY7Y+z6E/RfJm2pM5fmH8bsLR1eYOBnKbfEBFOBOLOBPjN7xKaWEz3EP/8+B+A4
	Z5enmI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMJ8-000000084CT-3INF;
	Tue, 18 Feb 2025 12:02:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLys-00000008061-3uaV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6ujQvCQNZoKNKilbwyxTloll25o1U/0BsukcebFRRwI=; b=wvk9irEdCnJm5zqVAKZmmW2efu
	pI4Sn8Kbz4KTGPa1eHSg2k5UZfEz62IQGZSIyYYo1mem2aq7wWLfY6EFrp75rZ4xuMpY2GFYzB/Od
	BWh3C0W+iFSexNDkGJPGWaWh97Xv+3T3Z6n69D9uQmN7hXK29Yq0bj3C00NplKf0UjojfsdUCSOnp
	57Y3w0Okgb+/W15fnImNuNOWDIWbs5H6eCcdVshxfR5oqvNJfjqC0hBZrB5Auorvbvdn/OCO836sn
	smKbwMrklIhGU8Wbccc8O6zxWbMM3E+mjigJJ483hexREyl/dKN/+hFx9Gkj4CxEsft4DTuwYsYDD
	UqYyJUNw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54998)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tkLyf-0001qH-25;
	Tue, 18 Feb 2025 11:41:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tkLyZ-0007Ek-2X;
	Tue, 18 Feb 2025 11:41:19 +0000
Date: Tue, 18 Feb 2025 11:41:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 7/7] net: stmmac: imx: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <Z7Rx36FDAJk_yMQl@shell.armlinux.org.uk>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZG-004RZb-8Y@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tkLZG-004RZb-8Y@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_034138_970302_2DA4E511 
X-CRM114-Status: UNSURE (   8.43  )
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

On Tue, Feb 18, 2025 at 11:15:10AM +0000, Russell King (Oracle) wrote:
> Convert non-i.MX93 users to use the generic stmmac_set_clk_tx_rate() to
> configure the MAC transmit clock rate.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Looking at this again, this patch is not correct - imx does a few
checks before changing the "tx" clock.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

