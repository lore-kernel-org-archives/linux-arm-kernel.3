Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6906D44C63
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 15:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOLovP1nf5K8/XFRLq/JOQI95IJezXEIyYwgpMIfHxg=; b=fHvSgamLTxrpn0WG7Aoo5MaGkn
	upgptxifkaAgB8vexbwRp87DCNCwJObBTXY/iDAARSlUs5iUfWG3NxOpCD23EE/DQNNOWTikJXc9H
	/qoJ58XPByNtBaW9xGphRh18hrYulSKwlpzEjMrG0ex4TnlgaRM3Zz5GTJUsU63QCADWAdM1gNCvK
	tA0XuTvphYYtAnRhOSsK7oy4ncna0tepXfgYj6NMyVWbEyvLSUwz/4yTDq0dLdI85/IBPsbYo6iav
	CWqQO2n/0nbS11ky8qE6+B9tUORXw1InN0afNb0UGAAB3xiJv25zr5sGMjtOZ0kRbCirz4JPyxNzT
	XNxaWkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgP4q-0000000CZSy-11ZP;
	Thu, 15 Jan 2026 15:16:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgP4k-0000000CZSB-2pSi;
	Thu, 15 Jan 2026 15:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QOLovP1nf5K8/XFRLq/JOQI95IJezXEIyYwgpMIfHxg=; b=RrA0c2Crm8jwm+G3tWPYeyiqT7
	zErC1h99cNML2NBK9REG2mW04hcq38xBMii0CtX5baQwyTf8qSB+aKaO+QM16CHsyH9H/x2aTuxXM
	ILfkpky1HEd40uBy+7wNq7YihR+5WgT3rnxPGL3ikENUP57iAluJPkWrrF+YrdYlpNbGPFz8tsnbm
	m2rGB7I1S1E8qmyGtbzKZZuc1Ow0GJno4sJnG6IV9aMMxUZzPXN+MAEceecT5UJxepEK9pPRiWEUf
	nTa3+MGFhxPa6YurSLP0sHO2oC5Q9T0m8M4LzafOZ69dGyIIToW9uQSqyf8XcRUdBk9k0K86Gmyfl
	UaBs1WYw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59658)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vgP4Z-000000001PW-0scZ;
	Thu, 15 Jan 2026 15:15:43 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vgP4U-000000002kl-1vG7;
	Thu, 15 Jan 2026 15:15:38 +0000
Date: Thu, 15 Jan 2026 15:15:38 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 05/14] net: stmmac: add stmmac core serdes
 support
Message-ID: <aWkEmockEyLsZKMd@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4w2-00000003SG5-2FH5@rmk-PC.armlinux.org.uk>
 <a91a0937-93cd-40f2-9759-8823fb08f48c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a91a0937-93cd-40f2-9759-8823fb08f48c@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_071557_589758_EEE2DD51 
X-CRM114-Status: GOOD (  15.28  )
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

On Thu, Jan 15, 2026 at 03:48:40PM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 14/01/2026 18:45, Russell King (Oracle) wrote:
> > Rather than having platform glue implement SerDes PHY support, add it
> > to the core driver, specifically to the stmmac integrated PCS driver
> > as the SerDes is connected to the integrated PCS.
> > 
> > Platforms using external PCS can also populate plat->serdes, and the
> > core driver will call phy_init() and phy_exit() when the administrative
> > state of the interface changes, but the other phy methods will not be
> > called.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Unfortunately I have no way to test. But still,

I am hoping Mohd Ayaan Anwar will be able to do at least some testing
on the qcom-ethqos hardware.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

