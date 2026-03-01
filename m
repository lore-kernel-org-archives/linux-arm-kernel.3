Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACDEFD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nVwhOzXK0AYZBbQf7mg4OPy8EJ5QI7Jy6cFMhrWBj7g=; b=YUD5lEKjwIKjcHDtPxRmITq4yF
	2hHTrXmdpaXmtqiyHsdQLwq5yTD/oH9keUa0DFMJ1f7e5sKxkdilza0Yj/RETDpiCwrxp1K/wc1EF
	IUohR6w3d+THu8n0dDsnWtiNKsFze7ljG8KLEWvp/IZ3rIGQybejdc5eCtDT2hpuGd/jMkk4kotzl
	bL9xTKkmFhjexfyKWCDWGQ87eY/KrAW+pahougsCYcW7j1OHtDGayg0Rpzx+dXScVyRUzvNZUYP1v
	LEuazwVRx/2RR3QrVyAMs1vlIseHVxV3wfqatJ4+EZKS/WA/gpMKmU3d3Nwq1r/fOhQOjVYhtgtR3
	OO46zHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVZS-0000000AWcr-0UCc;
	Sun, 01 Mar 2026 01:26:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVZR-0000000AWcQ-1Z6L
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE64760008;
	Sun,  1 Mar 2026 01:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991B6C19421;
	Sun,  1 Mar 2026 01:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328368;
	bh=v8r0r61V7sOUudpDidvPc28v8OAq06IbucMIeZXZhOk=;
	h=From:To:Cc:Subject:Date:From;
	b=SUJ/0ktv3h9b4B2/PJ3/h8Nq8Layyh2gCPB5PkadWhazQqpUS37lrsuQCQHCrTBxc
	 nvLZ0FFbQpjdmOrEjNhZaFMuCdew5Ke5+fxrDlvni/oe30oK8E8iGidugo8ZYKPxNe
	 xME13IiU2dRul/qhIRwC8E6Fg+5bOPd11nqvKziROhQgMiZ63O45MK3J23l1cMOzV5
	 06Y9xRYQfTnj7UKYU4T60YFzIKKAbIjaq0gbUapLxL9GyQoORUD1Qu2OpSy1xxW6w4
	 NO2swlkagwXVieE1zGJyyUkKpH7b46ULhisB7wZiKs+tKCYOU1wf7UUIS6NaHwjKIo
	 6yoCbiv5kkTQA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	chenhuacai@kernel.org
Cc: Hongliang Wang <wanghongliang@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "net: stmmac: dwmac-loongson: Set clk_csr_i to 100-150MHz" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:26:06 -0500
Message-ID: <20260301012606.1683431-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
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

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From e1aa5ef892fb4fa9014a25e87b64b97347919d37 Mon Sep 17 00:00:00 2001
From: Huacai Chen <chenhuacai@loongson.cn>
Date: Tue, 3 Feb 2026 14:29:01 +0800
Subject: [PATCH] net: stmmac: dwmac-loongson: Set clk_csr_i to 100-150MHz

Current clk_csr_i setting of Loongson STMMAC (including LS7A1000/2000
and LS2K1000/2000/3000) are copy & paste from other drivers. In fact,
Loongson STMMAC use 125MHz clocks and need 62 freq division to within
2.5MHz, meeting most PHY MDC requirement. So fix by setting clk_csr_i
to 100-150MHz, otherwise some PHYs may link fail.

Cc: stable@vger.kernel.org
Fixes: 30bba69d7db40e7 ("stmmac: pci: Add dwmac support for Loongson")
Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Link: https://patch.msgid.link/20260203062901.2158236-1-chenhuacai@loongson.cn
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 107a7c84ace80..c05e3e7a539cf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -91,8 +91,8 @@ static void loongson_default_data(struct pci_dev *pdev,
 	/* Get bus_id, this can be overwritten later */
 	plat->bus_id = pci_dev_id(pdev);
 
-	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
-	plat->clk_csr = STMMAC_CSR_20_35M;
+	/* clk_csr_i = 100-150MHz & MDC = clk_csr_i/62 */
+	plat->clk_csr = STMMAC_CSR_100_150M;
 	plat->core_type = DWMAC_CORE_GMAC;
 	plat->force_sf_dma_mode = 1;
 
-- 
2.51.0





