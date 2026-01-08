Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EB0D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AA6/cU0EwaGIbDjOwCO+iFT0bluemqog3evu4aTUGBo=; b=cW3zIRbjs7YpcsFyLerGPHE+Gu
	Yvm92BjrxytBvWnRDRqee0ax+739P5voSXPRepBbUD/5sp8ghIAheax7q7XTjV6VWyb1SEpN0872U
	6D2cPu9gpnkDN/JHRwl5OPwJCMuh/V4bjWW+/KnbLvtP7pHRD/tgcz1cy0VzXuzjKdUQD7YvPdmji
	zSQhA3ZISFIAQ0Tn87Rru4qLO6mHh1bKh5U9VjEBj8KdrdbEz4bW8Ys5KTvKhqwoJ/3EEP5WAVROF
	76oli0pjF95/9cbdGe72FjhBcbmZ8cRd7dYTwW40BmgpblJ3L+pBAs6PjjdVnAUhXcicr+KFVGNCo
	2F8MZU0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtv6-00000000RWT-3z56;
	Thu, 08 Jan 2026 17:35:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtv2-00000000RT6-1t4L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AA6/cU0EwaGIbDjOwCO+iFT0bluemqog3evu4aTUGBo=; b=cAvWBzS6b/klvy0clIH5f3zzZZ
	cgWkt+jJTjSI4L7wD6TWbwt93K8ppCqM8AVVNFCcj88ezQaZBgiVC8UNlzRT4MjK/wnbSbqQJrO9H
	EfT+cwnNGkUAiZJruDCIZkrMonpXrMwwbxrGF3r4Ry7gPkWcsW9NR832EogdpCb19Lb/90wd3gSmr
	S85ItnIrIU4kTZaJ5/m7Keaut4B8pXvC9J2p/4XiNTo4lgKnjqfclSHy1niyYsyEntfxEXbjOPkCg
	lCGVwpX+VSFVDc0xnm0x5rjK8JGPJ+Vo1LegZ0pRWA/zG62p1zUAQPOl6fRd1KEqCup2EdygyMB7a
	AmjRhUQA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53814)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vdtuu-000000002yC-3dwS;
	Thu, 08 Jan 2026 17:35:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vdtuq-000000002WF-2Z4D;
	Thu, 08 Jan 2026 17:35:20 +0000
Date: Thu, 8 Jan 2026 17:35:20 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 0/9] net: stmmac: cleanups and low priority fixes
Message-ID: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093533_647153_11E3B21F 
X-CRM114-Status: GOOD (  11.70  )
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

Further cleanups and a few low priority fixes:

- Remove duplicated register definitions from header files
- Fix harmless wrong definition used for PTP message type in
  descriptors
- Fix norm_set_tx_desc_len_on_ring() off-by-one error (and make
  enh_set_tx_desc_len_on_ring() follow a similar pattern.)
  Document the buffer size limits. I believe we never call
  norm_set_tx_desc_len_on_ring() with 2KiB lengths.
- use u32 rather than unsigned int for 32-bit quantities in
  descriptors
- modernise: convert to use FIELD_PREP() rather than separate mask
  and shift definitions.
- Reorganise register and register field definitions: registers
  defined in address offset order followed by their register field
  definitions.
- Remove lots of unused register definitions.

v2:
- Add Maxime Chevallier's reviewed-by
- Improve some commit descriptions
- Fix build errors due to missed dwmac-loongson.c usage of SHIFT
  constants in patch 7.

 drivers/net/ethernet/stmicro/stmmac/descs.h        |   7 -
 drivers/net/ethernet/stmicro/stmmac/descs_com.h    |  48 +++---
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   5 +-
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   5 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac100.h     |  36 +----
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  70 +--------
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  21 ++-
 .../net/ethernet/stmicro/stmmac/dwmac1000_dma.c    |  16 +-
 .../net/ethernet/stmicro/stmmac/dwmac100_core.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c |   3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  79 ++--------
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  28 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c |  70 ++++-----
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h |   8 -
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |  40 ++---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   | 164 +++++++-------------
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h    | 172 +++++++++------------
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c    |  10 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  40 +----
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  21 +--
 .../net/ethernet/stmicro/stmmac/dwxgmac2_descs.c   |  39 ++---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  75 ++++-----
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c     |  27 ++--
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c    |  25 ++-
 25 files changed, 348 insertions(+), 665 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

