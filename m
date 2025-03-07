Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3B3C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 04:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2AxzsjD4oNDzRPVdL936OhFvrb5cy0xPDLnLQOD+j8=; b=EMOB3wfbXgfEPSseQhVJDtmQM7
	4HXyVAbDZ0YrdUAHECE/0OzP+WxJ0VH4cz/k/AaUZqLuF2KUa6zT07rLI5MsISMo+LCGFQokZPz9q
	UtwdRwIG+XsnKuJL8ou37EUaWhQ+PAuC15wxYmhGpnIJGTxDfB5uoK0776P8y/Mgk4ZoWi2br2sHG
	PDJVIiyx8dnQkoXqE+LhavZ6BedT2VBal7Ahn6UP4AeZLdXSKL6xSnJ0/LlxxGz0bs7bB0Sa+9pCg
	hBFI68PTMrVpsFbrZi0M3po0IYDLps8bTgz5k+AJqfwzGSF9dT5AUMHp4Nq+Cdz04DLUUBm5fBcUZ
	KcIIQ2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqPIc-0000000D76f-0yoh;
	Fri, 07 Mar 2025 04:27:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOe3-0000000D23N-12Bw;
	Fri, 07 Mar 2025 03:45:08 +0000
X-UUID: 8c51ccc6fb0611efa1e849db4cc18d44-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=A2AxzsjD4oNDzRPVdL936OhFvrb5cy0xPDLnLQOD+j8=;
	b=XJLLxiEdLJhjZt0rQJHyS5WfE7eZRt0AbGcKCGDfLU5xgcu4SO26YLtV7+ku45nD8nngHWYfFl53zY6LKKRWLXEJ/mozxm0463g/7+shuggyrPzcHeI8B6jEbojsWCOebHffl1g99YcRX/1gVB+UkxHCmk7EAVJl5y4gkS20T/M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f6a6d2d2-6ea7-4e00-926b-df9a750d4209,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:160d08c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8c51ccc6fb0611efa1e849db4cc18d44-20250306
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 319422492; Thu, 06 Mar 2025 20:45:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:44:58 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:44:58 +0800
From: Guangjie Song <guangjie.song@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, Guangjie Song <guangjie.song@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 02/13] pmdomain: mediatek: Support sram low power
Date: Fri, 7 Mar 2025 11:44:26 +0800
Message-ID: <20250307034454.12243-3-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307034454.12243-1-guangjie.song@mediatek.com>
References: <20250307034454.12243-1-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_194507_310350_58FBC07A 
X-CRM114-Status: GOOD (  13.66  )
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

Support sram enter/exit low power mode.

Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
---
 drivers/pmdomain/mediatek/mtk-scpsys.c | 36 ++++++++++++++++++++------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
index d53bd07a6804..9d03249284d6 100644
--- a/drivers/pmdomain/mediatek/mtk-scpsys.c
+++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
@@ -26,6 +26,7 @@
 #define MTK_SCPD_ACTIVE_WAKEUP		BIT(0)
 #define MTK_SCPD_FWAIT_SRAM		BIT(1)
 #define MTK_SCPD_SRAM_ISO		BIT(2)
+#define MTK_SCPD_SRAM_SLP		BIT(3)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
@@ -118,6 +119,8 @@ static const char * const clk_names[] = {
  * @ctl_offs: The offset for main power control register.
  * @sram_pdn_bits: The mask for sram power control bits.
  * @sram_pdn_ack_bits: The mask for sram power control acked bits.
+ * @sram_slp_bits: The mask for sram low power control bits.
+ * @sram_slp_ack_bits: The mask for sram low power control acked bits.
  * @bus_prot_mask: The mask for single step bus protection.
  * @clk_id: The basic clocks required by this power domain.
  * @caps: The flag for active wake-up action.
@@ -128,6 +131,8 @@ struct scp_domain_data {
 	int ctl_offs;
 	u32 sram_pdn_bits;
 	u32 sram_pdn_ack_bits;
+	u32 sram_slp_bits;
+	u32 sram_slp_ack_bits;
 	u32 bus_prot_mask;
 	enum clk_id clk_id[MAX_CLKS];
 	u8 caps;
@@ -236,11 +241,19 @@ static int scpsys_clk_enable(struct clk *clk[], int max_num)
 static int scpsys_sram_enable(struct scp_domain *scpd, void __iomem *ctl_addr)
 {
 	u32 val;
-	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
+	u32 ack_mask, ack_sta;
 	int tmp;
 
-	val = readl(ctl_addr);
-	val &= ~scpd->data->sram_pdn_bits;
+	if (MTK_SCPD_CAPS(scpd, MTK_SCPD_SRAM_SLP)) {
+		ack_mask = scpd->data->sram_slp_ack_bits;
+		ack_sta = ack_mask;
+		val = readl(ctl_addr) | scpd->data->sram_slp_bits;
+	} else {
+		ack_mask = scpd->data->sram_pdn_ack_bits;
+		ack_sta = 0;
+		val = readl(ctl_addr) & ~scpd->data->sram_pdn_bits;
+	}
+
 	writel(val, ctl_addr);
 
 	/* Either wait until SRAM_PDN_ACK all 0 or have a force wait */
@@ -254,7 +267,7 @@ static int scpsys_sram_enable(struct scp_domain *scpd, void __iomem *ctl_addr)
 	} else {
 		/* Either wait until SRAM_PDN_ACK all 1 or 0 */
 		int ret = readl_poll_timeout(ctl_addr, tmp,
-				(tmp & pdn_ack) == 0,
+				(tmp & ack_mask) == ack_sta,
 				MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 		if (ret < 0)
 			return ret;
@@ -274,7 +287,7 @@ static int scpsys_sram_enable(struct scp_domain *scpd, void __iomem *ctl_addr)
 static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
 {
 	u32 val;
-	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
+	u32 ack_mask, ack_sta;
 	int tmp;
 
 	if (MTK_SCPD_CAPS(scpd, MTK_SCPD_SRAM_ISO)) {
@@ -285,13 +298,20 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
 		udelay(1);
 	}
 
-	val = readl(ctl_addr);
-	val |= scpd->data->sram_pdn_bits;
+	if (MTK_SCPD_CAPS(scpd, MTK_SCPD_SRAM_SLP)) {
+		ack_mask = scpd->data->sram_slp_ack_bits;
+		ack_sta = 0;
+		val = readl(ctl_addr) & ~scpd->data->sram_slp_bits;
+	} else {
+		ack_mask = scpd->data->sram_pdn_ack_bits;
+		ack_sta = ack_mask;
+		val = readl(ctl_addr) | scpd->data->sram_pdn_bits;
+	}
 	writel(val, ctl_addr);
 
 	/* Either wait until SRAM_PDN_ACK all 1 or 0 */
 	return readl_poll_timeout(ctl_addr, tmp,
-			(tmp & pdn_ack) == pdn_ack,
+			(tmp & ack_mask) == ack_sta,
 			MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 }
 
-- 
2.45.2


