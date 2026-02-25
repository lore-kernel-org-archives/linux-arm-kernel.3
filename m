Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2950FCEE8E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 11:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ol8ts1DOuNnxPmgjbmwwA3kl00RvyOz9cJHuYK4vjBA=; b=S89UH9JVV9Bk6/yKp5QiuClBHN
	grvuQOknQPIUgLWxTqFm0wJJUc4k9h61u0uxtJk1kbaXZAhIMfBfFtuONdab8DZi4RWEeXlLHNvEm
	fv17B0Tl9mfuxRPqGM4Di8TofockxcmawoJA47OVBcSd59k1ReQsD0X2j1GGX389jLQUiXUO7cbsG
	yaNTNFZnStPg1LnJtkO8PcBAClBudbLYXVR+S8dteAxeSsDO8CPlGkNMM8gdhmIjJQdRYf3qaUC3a
	fmhslWV3Kk4yz+mVrQ/b2ABYqd5lukr3bGJyuy7eNhe+zuTGwNkO1IOnpmq9XWTMyZ6xZkyh773+w
	m925nXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDJU-00000003w6m-3BMt;
	Wed, 25 Feb 2026 11:44:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDJQ-00000003w6S-2l9q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 11:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ol8ts1DOuNnxPmgjbmwwA3kl00RvyOz9cJHuYK4vjBA=; b=Ou12iFe72MgqNIztS7wLmZoywZ
	jDPBqY2AaCSiPyDU+ig/x+N6n9aR99VLrW81tuKlkn4/EudaFTBdqHM49r9da2+e76bXQz9NkU+fN
	gbkUfkuR/LwMRAL15S+9a0Ujp+3giXXFK22XiDVoeEOx6PqO6vtXLQzVB9vfc64CaPknFyZOHLFGi
	BC15Jkb4y5LULBQ82Ht3CaGC6FigdmR1bpg10H/z0m0ex6pUWJ4fKiuxAhw9127uQQusAldK0zzJ6
	G2NE1OXKvaT+oKgabTU9MCZN+0k5MmGznWohzLIC715W/TslQFtvrqdxHBEuQouSupPUBvRNvQZz9
	yVgS6YHw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60644)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vvDJH-000000006Yt-0PbI;
	Wed, 25 Feb 2026 11:44:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vvDJB-000000000vA-2EeJ;
	Wed, 25 Feb 2026 11:44:01 +0000
Date: Wed, 25 Feb 2026 11:44:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RFC net-next 0/7] net: stmmac: improve PCS support
Message-ID: <aZ7ggfQanc8jeCb9@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_034416_697132_CDB46F70 
X-CRM114-Status: GOOD (  15.45  )
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

This series is the final of the three part series sorting out the PCS
support in stmmac, building on part 2, which was posted earlier today:

	net: stmmac: qcom-ethqos: further serdes reorganisation

Similar patches have been posted previously. This series does away with
the common SerDes PHY support, instead using a flag to indicate whether
2500Mbps mode is supported (STMMAC_FLAG_SERDES_SUPPORTS_2500M.) At this
time, I have no plans to resurect the common SerDes PHY support - the
generic PHY layer implementations are just too random to consider that,
and I certainly do not want the extra work of fixing that.

I've also changed the last patch which prints warnings when qcom-ethqos
changes the PCS state - this will now indicate in a readable form
whether the ANE or SGMRAL bits have changed state, rather than having
to refer back to the definitions in the code or the databook.

I am hoping that - subject to this working for qcom-ethqos - we can
drop this last patch in the final submission, along with the
dwmac_ctrl_ane() and ethqos_pcs_set_inband() functions and associated
definitions. This will also mean that stmmac will finally be driving
the PCS correctly from a phylink point of view.

 drivers/net/ethernet/stmicro/stmmac/common.h       |   4 -
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  12 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  11 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  10 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  10 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   8 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 160 +++++++++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  29 +++-
 include/linux/stmmac.h                             |   1 +
 10 files changed, 200 insertions(+), 46 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

