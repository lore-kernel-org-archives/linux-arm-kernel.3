Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7D8CF45C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 18:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ef9uJWFZZJYJaa8UiGEDMdnQ6g9MSTSO60hpTpe7fIs=; b=LEdjNEOVz1mkBmTtyEtwms754c
	c/jiKZUTO23FGfCqh5BrNLgIBUJ/TLoi+sKAKd7D/e/kpNWKuq1XFBi3xitzJIANI0uZT/+BlU+ye
	4Eh25VzBeXyy1rsQiHviqeyNrTV7EpJS8dL1xO1pvWKw85QCD8nOxmUsFKVBfwEUfOlONdn9zkq8i
	LGUaDGMBqT53dQIWHiigvh1PQKlkmD9Fes8U1P1gWfSKnOnL7JRtErH8d1mEjlPpggGU5c3PcLvAY
	omzb1DA/N74BMFMFL5f4Aq/EYrdtrDGgS610p1Eiu64RS6Nb8JJ2aaq9NudxAZqiP5Kr/qIUSNfxF
	Hl6ZXUDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfML0-00000005uaa-107J;
	Mon, 12 Jan 2026 18:08:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMKy-00000005uZt-01PK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 18:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ef9uJWFZZJYJaa8UiGEDMdnQ6g9MSTSO60hpTpe7fIs=; b=izpSrphv+g8cCmqNORF0148Yeb
	50eCDsdtx36q+Et6RMgOwjx8Ft6oFxjcqGhzTJrwWEcwTJ9vDnD9YnCFlob3LL5su48dIXDE5Tgpv
	/qfryh+SCMOutF8/Z0uEeJD6c24TeG8SXCpW4qTa9i8gaDd/8YSUpDMxaTYZCJYXK57h3Ah2AVEXj
	0efXIhSXsDX+YVpbhsaPISaO65fYdvUqjoE3WUcJOKJeBR2qMj9Bg4h4hNzoTVMwGcueqlMUfh9Nl
	QrZGY+WMbYIkwmzvY0D7b3+dkvJM2b8nH28tk6DHZ6TxNuRDVsOshqTq/52CUKXNvOrHa98SzbElI
	yWR3f8Dg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57284)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vfMKk-000000006b8-3CQJ;
	Mon, 12 Jan 2026 18:08:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vfMKg-000000008GX-1EZT;
	Mon, 12 Jan 2026 18:08:02 +0000
Date: Mon, 12 Jan 2026 18:08:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 0/2] net: stmmac: qcom-ethqos: cleanups
Message-ID: <aWU4gnjv7-mcgphM@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_100820_041488_91C0001F 
X-CRM114-Status: UNSURE (   7.24  )
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

Two changes:
1. In a previous commit, I missed that mac_base became write only.
Remove it.

2. Switch qcom-ethqos to use the set_clk_tx_rate() method rather than
setting the RGMII clock in the fix_mac_speed() method.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

