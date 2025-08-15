Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C212ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 18:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LAbI5gwavZuawK387dtiXkLFUcYQKTpS6lN1ukIuZ6o=; b=eA9tlYbnPrCVdCHiOo+CwLhqZQ
	I9dY+FKeWBErKORlR92KoLq7URt9VTNws8XEDrT4TupCXHy8gRn1IXUJ9PUmteuKtIvOoiR9xa9KJ
	3ZVCKE1zwb6yCoJUQeqyYILjWzz4xssJ4MHm4y2gaAMXIxUixDupjByrtX6p4cbRtcuxLK8j+wCKX
	vGqSw10+c3Kz97wfM+AH/6sDQzn6Wd3ZAS6U3561SscLQQcSq9rGU3ZF/m3honZWDdmc76L4pHzfq
	k9UxYPoal1TrNSafAt1IwxYZLwm0oFHV+3yXzvrliLg7ql13xvAsUl+YUz+nmg/1gM78xnlrJw/J3
	oCjfIVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umzeA-00000003Ium-21XJ;
	Fri, 15 Aug 2025 18:59:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxiB-000000031Ye-3Cg7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 16:55:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA1B841A5A;
	Fri, 15 Aug 2025 16:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF2B4C4CEF1;
	Fri, 15 Aug 2025 16:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755276925;
	bh=zl87QclcDa3DKTevz342RWsdUkmKZ3kWOu2bPgZotaQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=d+DXsfzwZz/1607mPnylsjSqtFkdljLyHXb1M+0KtScK3u3fJozABnYjf/4A3v1dF
	 /KPUafe1k1W61UwDtCQfnE5wiGCr3A+l9Ybnr+dqfTSmwFfmCV2e5xFUe7Lm73HaRu
	 TyWnrpEwdjBWkoRwatOzNR9m7qSTFV3YdiXTQ65CX8wDPk62E5/jdutbvOEGzM/MAz
	 vugEwC/22T+7oWvoqexFFvFGQajpA6+vMs+2ArxZ8aJxn7SkYj8wmIxoTNwIg6YdRN
	 hNkXmV+a4CNEuBjX0sB14Rfyd9B+dTcVWcrcUwghHkYuLhZS++QczJ3H30abbYPhKi
	 GG/a29Q1cf4NQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B349CCA0EE6;
	Fri, 15 Aug 2025 16:55:25 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Subject: [PATCH net-next v2 0/3] net: stmmac: xgmac: Minor fixes
Date: Sat, 16 Aug 2025 00:55:22 +0800
Message-Id: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHpmn2gC/32NQQqDMBBFryKz7pRkatF25T2KixBHHahJSYKki
 HdvyAG6fDze/wdEDsIRns0BgXeJ4l0BujRgV+MWRpkKAym6q063mJfNWNzE+YCzZI7YKuq7mUh
 PlqF0n8BVlOwFjhM6zgnGYlaJyYdvPdt19X92d40K7a1VDzJ9bzoazDtxMFfrNxjP8/wBtwHLZ
 70AAAA=
X-Change-ID: 20250714-xgmac-minor-fixes-40287f221dce
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755276924; l=1234;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=zl87QclcDa3DKTevz342RWsdUkmKZ3kWOu2bPgZotaQ=;
 b=e07IJKlqLpRHehRFXDj41qKkESxMxzz5NMzfNCTXpgPDuowY+O4sUC/gPBXEZ9NWseGEfNinm
 rkO9woTy9UxBhgwURhP+g6fPGdtebSJAlvhGr6DwzbJJ1lwj9/FqhuN
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_095527_851188_C3E68E41 
X-CRM114-Status: UNSURE (   6.50  )
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
Reply-To: rohan.g.thomas@altera.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series includes following minor fixes for stmmac
dwxgmac driver:

    1. Disable Rx FIFO overflow interrupt for dwxgmac
    2. Correct supported speed modes for dwxgmac
    3. Check for coe-unsupported flag before setting CIC bit of
       Tx Desc3 in the AF_XDP flow

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
Changes in v2:
- Added Fixes: tags to relevant commits.
- Added a check for synopsys version to enable 10Mbps, 100Mbps support.
- Link to v1: https://lore.kernel.org/r/20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com

---
Rohan G Thomas (3):
      net: stmmac: xgmac: Do not enable RX FIFO Overflow interrupts
      net: stmmac: xgmac: Correct supported speed modes
      net: stmmac: Set CIC bit only for TX queues with COE

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 13 +++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c  |  9 +++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   |  6 ++++--
 3 files changed, 20 insertions(+), 8 deletions(-)
---
base-commit: 88250d40ed59d2b3c2dff788e9065caa7eb4dba0
change-id: 20250714-xgmac-minor-fixes-40287f221dce

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>



