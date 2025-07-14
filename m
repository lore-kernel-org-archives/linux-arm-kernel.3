Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99EFC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 08:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pibqHWwNcdcvRYYK0KgxZrhmvn+mbad1mOTgYibqKTY=; b=3D7HA6TsqJkpxYIDmprYUWcvEJ
	JLnEbLQc/GryyIQk/XJWskGvH+wDO/WV4PnpfSJj6dAjLOMH3ico8GMpNxYS3J3wlDS7cgd9ezDRN
	bycTNiGulzOExXh+jZnu/ljrmlyPd76OuHDCb+wPQBfN5r+U4s+kcnM26dmzZqggtpkc7KmVqPzMm
	j8aDPxuErgZkpwLsZ3Sh8eAx/V5zmReXUnjG/WnQUeSMnsaF5U9z4QVDHthymaXMev9vsK4YoOYsj
	Hm0CPoyH4CqNvizDwwBnQ88Z70TdBVlHEAEPlkeVEoEFijqg9VLRhMmrR5Us8euYlq4tiaTnJn4po
	4qrHSE9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEN5-00000001bQV-3lDY;
	Mon, 14 Jul 2025 08:17:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubE6u-00000001YC9-2Rk1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 08:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0186245C91;
	Mon, 14 Jul 2025 08:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAB46C4CEED;
	Mon, 14 Jul 2025 08:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752480027;
	bh=x7tBS5TJxVqQ22cB02A2Vi0xzr6SLrJTnF6VPCHBuUc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WUUqJAx/sxPwfUHZBKTN/pEBNRu+2xugoe5P+8CKGVR9znodPsnWpP8n8QTKaP39h
	 kB/vr5SfJSW6bbAb8jt45oga+JRojaoB/ZziIDudTu8z0+ZDHDX3gVuAWxPKtP4lZZ
	 1v7qz4k4K6dL14tDN6S0ru2GXlQW37t41BQlHS9hN3V5kgVhniHvKSO9WfsmEjatvL
	 2Q7kbCF370XwJFdD6XpGxfnxb148k6Vc9qZt9e1SmEGxIXWs9jy7cazCYVsjVUwi68
	 NqXFTJLpYZPm6yLKSduqCnqVIZaDhTTwn75lVwe80WStfd/uxZVm4L0s9wLAevHtMr
	 Ie12TrVwJdsig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7A9C83F1A;
	Mon, 14 Jul 2025 08:00:27 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Subject: [PATCH net-next 0/3] net: stmmac: xgmac: Minor fixes
Date: Mon, 14 Jul 2025 15:59:16 +0800
Message-Id: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANS4dGgC/x3LQQqDMBBG4auEWTuQDBZLr1K6CPHXzsKxJCIBy
 d0NXX483kUFWVHo5S7KOLXobh1hcJS+0Vawzt0kXh5+CiPXdYuJN7U986IVhUcvz2kRCXMC9e+
 X8Q99e5PhYEM96NPaDauDp35tAAAA
X-Change-ID: 20250714-xgmac-minor-fixes-40287f221dce
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Romain Gantois <romain.gantois@bootlin.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752480026; l=990;
 i=rohan.g.thomas@altera.com; s=20250415; h=from:subject:message-id;
 bh=x7tBS5TJxVqQ22cB02A2Vi0xzr6SLrJTnF6VPCHBuUc=;
 b=eOyvh3AjlRrzHzO8kmZyoZOWk31VG+/F2coZiafOWwdLSJAK9xzmHqHbMMCpIaCjoQYXDcbwX
 o0FxciB5jAlCR/+aFZH/hv6+9wY3JRJfY2tV2ejIrqE2psmZwydwODO
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=TLFM1xzY5sPOABaIaXHDNxCAiDwRegVWoy1tP842z5E=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250415
 with auth_id=460
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_010028_649114_5EF32EEF 
X-CRM114-Status: UNSURE (   6.79  )
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
Rohan G Thomas (3):
      net: stmmac: xgmac: Disable RX FIFO Overflow interrupts
      net: stmmac: xgmac: Correct supported speed modes
      net: stmmac: Set CIC bit only for TX queues with COE

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 14 ++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c  |  5 +----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   |  6 ++++--
 3 files changed, 17 insertions(+), 8 deletions(-)
---
base-commit: b06c4311711c57c5e558bd29824b08f0a6e2a155
change-id: 20250714-xgmac-minor-fixes-40287f221dce

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>



