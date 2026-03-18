Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971CE107BCF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pk5nclcW+6iifoD+wiY2hL2mIge4xLaV5a7mcWnT1EY=; b=T3TZLTMiLVNruo2tyxCXinFlKY
	TrFYVD2X/Q1AAqJuvJIz9rWumMQ5EnDWK8vfOomOj5CI83ch0Lish5LOPWVHU0EaO00h9KcDwieSZ
	TqPwSA4d/+I4OtSWTmBQv/xZGRMa4svHy6CEY+VT6za4X1EggoLklIKVNFKUY6A/6VMOqgqxblWL0
	4BtaGW7IOcvGTIAXOX8ItVDCJz2grLNsUetZvMXqH2BeHtf+AAeXdP0TS4kBgdniCa/jeR1TAplZr
	LSbwchMsUQS+Kvu0hBM+BgyHJnLe/jtnqHN0hnLakBWjcxiZic3F9uyqW2WrMYvd3DGehvG+dhx1u
	IkxjqZ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tPO-00000008sx8-1dVy;
	Wed, 18 Mar 2026 16:06:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tPL-00000008swj-24N4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Pk5nclcW+6iifoD+wiY2hL2mIge4xLaV5a7mcWnT1EY=; b=x+ArvTIhdWq2+6kaZOZjYe3TYm
	DXe5hgScMMEUzGWzPg3xECJK6RXUDKzOiYjzY/8U3T53w0ivjclMZ/q3Ppi2DPCryo8Mpa/W3sDDz
	aMTS3n196VQShi4l3vjiPyXjiacf4JJ3leZbVSoeVyxxIORCppNiZXmsmieOdpI5EpHbskeYGfqnN
	zfuq48lyznPdb3X/vRk5SCnrMlZs3E+Qhmu0Hh23gq6y/gmbw93oxCWq0/+c+XYTyA1b20YD3Z9wp
	oM2zjd2eYqLavk7rj3uEm9eHzddmMlRonyugp4mEqpAfzayWOBGmg68BI0tv1AZ5Rj/qtm1x0YWbt
	vPnyHJFA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38190)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w2tPB-000000003e2-2F64;
	Wed, 18 Mar 2026 16:05:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w2tP8-000000007Cp-0Sn6;
	Wed, 18 Mar 2026 16:05:54 +0000
Date: Wed, 18 Mar 2026 16:05:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 maybe? 0/5] net: stmmac: improve PCS support
Message-ID: <abrNYVfZ1Iwff2EI@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_090607_840330_9999A378 
X-CRM114-Status: GOOD (  17.70  )
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

I am losing track of what version we're at, because each time the
series is reworked, changing the approach, which changes the
patches quite a bit, it makes it difficult. We've gone RFC to non-RFC
back to RFC and then to non-RFC again.

This series is the next of the three part series sorting out the PCS
support in stmmac, building on part 2:

	net: stmmac: qcom-ethqos: further serdes reorganisation

Similar patches have been posted previously. This series does away with
the common SerDes PHY support, instead using a flag to indicate whether
2500Mbps mode is supported (STMMAC_FLAG_SERDES_SUPPORTS_2500M.) At this
time, I have no plans to resurect the common SerDes PHY support - the
generic PHY layer implementations are just too random to consider that,
and I certainly do not want the extra work of fixing that.

Changes from RFC v3:
- only set default_an_inband if using SGMII/2500BASE-X mode.
Changes from previous non-RFC posting:
- add a patch moving default_an_inband to struct plat_stmmacenet_data
- only include the first four patches from the previous posting
- add pcs_an_restart() support for BASE-X, but only if we have
  TBI/RTBI support.

The reasoning here is that these patches should be safe to merge and
should not impact qcom-ethqos in any way.

We can then figure out how to work around qcom-ethqos hacks without
having to keep re-posting these same patches time and time again.

 drivers/net/ethernet/stmicro/stmmac/common.h       |   4 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |   4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  12 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  11 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  10 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  10 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  13 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 156 ++++++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  14 +-
 include/linux/stmmac.h                             |   3 +-
 10 files changed, 186 insertions(+), 51 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

