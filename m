Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3AAC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UHYHoHYB3kC5RVvuD/SFjezcUsEDtCLBmv9TeE4pFp8=; b=viRuKLgyRsXlNcoAXJdrDf2ms2
	XEJO73kX9NPuafR2ys+H2C2D/QRIc+N9yG77vozf7+VNRrPPnc0CXXsuIKP0hVu9On58WxtzhN+8f
	URI03RDPLJGamRoPxJPHCDlpvDMYSEriDazoqrHeVGKWeVVUJ5bER3PpvD0UV1A/wCGiiglD8ImtL
	+BcNgLjQwxjBIDhHeKfz6aE1BNLTx3WFyGgInJ4sREppwfdSlGV8yKyu5OJ+xDPN3qV2VqQ/0IZoJ
	sRCAtUEE23YbVeUHZ/BrQeDqBaEw4UBdkQerJ9BDHp82hsvoAb39PfR84HxO36fUJsOuE1Aa2mlu0
	Le4cqOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uJ2-000000024NJ-27FK;
	Mon, 07 Apr 2025 21:47:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rfo-00000001igi-0n9s
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 18:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=UHYHoHYB3kC5RVvuD/SFjezcUsEDtCLBmv9TeE4pFp8=; b=lcVzf6RjQi6JfIv40PsbVxeIYD
	pIxsnL+PGvJfbPMspw9ivvPOZQnyQwLfq9z6qgau5Ua99BFDMtM/iAjpdFoeXgZ7CevM5l4cyUiyq
	DKV59kIIDXy5VKJFk7QyYi8JzW6jrsScWqMAFhc74yWSMEmekMtQDztyX3cqCnYeQdSHPGU10Yo0J
	jyTUsvMJ+EmF3VeBwY7+IPcgkOZ92RnZDluk6Av+0/ZllJ56lOy+te20+gUwfFKyhifHMkbefVkSx
	fw+ApfHQmStIXzzLHtqtSEbQrrulmafXK3QIsjGKBgSMps2TEJJLC7LjZSrYiI8E8cDGL4RGfDHpo
	anZfptng==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rfj-000000086ZF-2Uwj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UHYHoHYB3kC5RVvuD/SFjezcUsEDtCLBmv9TeE4pFp8=; b=X4ecTE21p9ByMpioxjJEw+5EpZ
	HXExeUz3BDYo5EPeSvpPo9pYmJ2T3f1nqrA1Jk+T9BTqqqFDL7+bSc5+iiRhYWbew4/M44WuVjiRn
	GCJnSra3zykY7rZ/14ni1YdmXb4FsOwQCPWTfmQ3j1LRI2MO6XhqicXkqryJKyRg+9Te3bTp3s3Xi
	WBcXZdMZZkvbS8Rd5/Vn7f74VtctylSz5VGJcU+PB5P7HUJB+Hw7+mbGVsYp7Gfs2WryKuR5/oqCG
	E76qeYLK2wG22HYfySSqBjKRd5FGmf7DDmqGCj1Rd6jUGnpkMQKpayz31wKF8bxkcXdjtCaD7LzKc
	vMZkOWlA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35552)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u1rfZ-00064B-0a;
	Mon, 07 Apr 2025 19:58:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u1rfV-0000dH-2H;
	Mon, 07 Apr 2025 19:58:01 +0100
Date: Mon, 7 Apr 2025 19:58:01 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next 0/5] net: =?iso-8859-1?Q?s?=
 =?iso-8859-1?Q?tmmac=3A_remove_unnecessary_initialisation_of_1=B5?=
 =?iso-8859-1?Q?s?= TIC counter
Message-ID: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_195815_747341_69E4BD55 
X-CRM114-Status: UNSURE (   7.93  )
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

Hi,

In commit 8efbdbfa9938 ("net: stmmac: Initialize MAC_ONEUS_TIC_COUNTER
register"), code to initialise the LPI 1us counter in dwmac4's
initialisation was added, making the initialisation in glue drivers
unnecessary. This series cleans up the now redundant initialisation.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 24 +---------------------
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c |  9 --------
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |  8 --------
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  1 -
 include/linux/stmmac.h                             |  1 -
 5 files changed, 1 insertion(+), 42 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

