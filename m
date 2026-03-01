Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ED3FD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q5qcbdjTymVA2CioktcLpGcVc4AkJdpk6k56zeDZjoQ=; b=EhUjD08GEjCkLqfclw9oOwbbuA
	nPccrh9D825k8NzAgsHqMlTW7kRE0V/bKDFvIkp4AhocxS57eHZs43heScCXUSkHa1VmDko+Ubn95
	bkAW4TkmSABzCQR29ge5apll5X3Qm8U4ZTtpaDfMIN/tNXeybtunhwZV3P+bkeMyke52Aq7BV1GDK
	SUJF8sjutUGOmIC/pcfXWwrlTiyqAb9waza+3Cm5pMy650LLeXrF7+K1EvedRAd6v0vFROz5idj4t
	qE12nsEw7D7kautK+EZI/6hMj822qoaxeztNDukEQunSCbmWoWlXhbLziySC6IsrI1zxKq2mGBzev
	+afuX7UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVsE-0000000AduI-0bFz;
	Sun, 01 Mar 2026 01:45:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVsC-0000000Adss-0Qo0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:45:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 873626013C;
	Sun,  1 Mar 2026 01:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CE7C19421;
	Sun,  1 Mar 2026 01:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329531;
	bh=Pc5vhfN54WSwHYV2oCkYMI+X5MUGXMab0QMlE50DqZ4=;
	h=From:To:Cc:Subject:Date:From;
	b=f1j16JssnsGe4AaifCxn4vi47qnRruxscyRKJrQCiTXn3CNZNg/3iIjb6fWZPu/gc
	 S/d4stYux/ooF/BDCgGMUYCsgYm1kx7zIvemwFBtJaBvQRL82ad6MQx0ltZYpfBLZG
	 2OSWmR8LD1ceCTxbXfHsFnucClaxhyIlKpBiJZfk3NSv3Y2KeZaWuaFOGfWKaZPtcF
	 9jHTciMuwbML2+ys6s2QR+I85iyoN+/BbdFIfzTj0OkyWc1P8nbBY5VkH2iPNFNOJr
	 137z2E/I966YxS7YTDsRaCMtal4L7mtV7cx9d0zK2JH5Laq5XL7vcr06BaF97jRqah
	 W2idGnqih52oA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	chenhuacai@kernel.org
Cc: Hongliang Wang <wanghongliang@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "net: stmmac: dwmac-loongson: Set clk_csr_i to 100-150MHz" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:45:29 -0500
Message-ID: <20260301014529.1708098-1-sashal@kernel.org>
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

The patch below does not apply to the 6.1-stable tree.
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





