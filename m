Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11126105F78C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PPt4n11Wo/S9hRlGUV2kynAxDiBlLfFjx/Ch8r1+pdg=; b=d3bMxUs/jMpmtaQoUqtV0zhHox
	bvWh6EwBCFm2YIH1AWvvrUIRCeqLrKYQHOfgAtZu8WSkz3STy24tkVv7L0LyZZHB3kj76LRN+FLnA
	hHy5KKP3UFtoBp9d6JUHd427jA4FqtP9BkdggN7qtHBcJwlSZG/5GpF9cWXUS46R9tfHIM5pwtL4m
	jnke+hMDZSIYySqD1WcZEkAobSqFtnQP6Jzic9PaQIp9248hV3HDCp69Zgooc0sYYMBwyy5zo77zV
	CpsYbJUvZJyfqu72jYralGJ5icbmv16RVyFk0XJzNiWSkHtC36HUz8imjLX1h03Uz7ADFYPXUeUUM
	aG49kifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11dE-000000006d0-3pqU;
	Fri, 13 Mar 2026 12:28:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11dD-000000006ce-0gDK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 12:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PPt4n11Wo/S9hRlGUV2kynAxDiBlLfFjx/Ch8r1+pdg=; b=VA0Ph9jUYkB7fUd1THREroZgFR
	sAhZngmquEBkAtJA+LVdLytWDeEpL7wOG7bmk/kts0Y/0smSXBUkfTssh+pP/nBYc//1flSAkUHxs
	Zr1iUb1CFIQ2aaaXTqrf1N73VmX0vONriTGBDPds+arRhKDeorVzWR8Dwss/cEsNMXPM4D6M72Of2
	QuBnjTsVz8fCHx1g3OvgPNGvtzE3e9XNBNJXEV8aCPB8fkzb6eft/RkhgkQuGBaxGS8QSIQ7oh+Tp
	nIgipLr+lAClR7qpagWuRbta70hJdfas6nCjaRi7PTrvnXwRMf99Zgx1hmA2ye0iFo1IDVzgqIj36
	au+nruow==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48808)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w11d4-000000000uI-3Ulc;
	Fri, 13 Mar 2026 12:28:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w11d0-000000008DR-1o7q;
	Fri, 13 Mar 2026 12:28:30 +0000
Date: Fri, 13 Mar 2026 12:28:30 +0000
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
Subject: [PATCH net-next 0/8] net: stmmac: improve PCS support
Message-ID: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_052843_205127_4E11EFE1 
X-CRM114-Status: GOOD (  10.80  )
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

 drivers/net/ethernet/stmicro/stmmac/common.h       |   4 -
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |   2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  12 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  11 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  10 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  10 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   8 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 156 +++++++++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  29 +++-
 include/linux/stmmac.h                             |   1 +
 10 files changed, 197 insertions(+), 46 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

