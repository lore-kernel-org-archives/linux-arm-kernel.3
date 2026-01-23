Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88873D6CFB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 01:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqCqQBJ01IQMne5KBahAyEhEAzJwQ8xXLs3vSgnf9jw=; b=Hf6POdhKHCX2BCXpT21uVsqCzH
	hUs4Ms6P8hGcI/2DBG5ZMPklTUWsqRzCjEf8pK4RsSyuLcFuFonx+3G+5qGRrDtZrJLpPEbFDlked
	KHCR6SDlm1UxzYTS+2MD8pT/zjsdIRSXSKm5p7desiRzVwS6FPbkBM15mI5Y0o+wXo3BVdgmtdrDc
	YcArlNi0IVS6BLQA7GNCOjUwoSHaOmndBeX18HbiWKpCjXosnJqKVGMUiMvSB8BxIB//ZxcEiZf/y
	qgIus3dOWtsDx5lFvvqAkFylmWeX7rxqLVPfKVgldT+Vv0uC8dyE6aT0VYMU4VjjK49L+V6P15PNd
	Nf0H5H1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6BM-00000007ymX-33rW;
	Fri, 23 Jan 2026 01:41:52 +0000
Received: from mail-m822136163.xmail.ntesmail.com ([8.221.36.163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6BH-00000007ykW-0yEG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 01:41:49 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31a9def00;
	Fri, 23 Jan 2026 09:41:40 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 1/3] mmc: dw_mmc-k3: Remove mshc alias support
Date: Fri, 23 Jan 2026 09:41:20 +0800
Message-Id: <1769132482-177365-2-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1769132482-177365-1-git-send-email-shawn.lin@rock-chips.com>
References: <1769132482-177365-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0a9be883a62e09cckunmb02720d31387e9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxgfHlYeGEpNGElJQk1MGUtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=e68KdPbiYkIKbF92hL/FOWiu7yy5bjEDbs0IcaChqXS4yDKrgMMokd79sHgmLCo+Vb0jkQVS3FKLoqVySx5u5L1pDpCTaOxjwT0i07N0Nc7BEtV8Z2BzXv+ajQqbdHxxUjtRBciZSKrIFnEUWpMsE0pJ2u3KornQXPNPSMyRj/4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=CqCqQBJ01IQMne5KBahAyEhEAzJwQ8xXLs3vSgnf9jw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_174148_041628_D9FA228A 
X-CRM114-Status: GOOD (  16.27  )
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

Remove the long-deprecated mshc alias support, as the mmc core already
provides alias functionality through the standard mmc alias. This eliminates
the redundant dual-alias system. The driver now obtains the controller ID
from struct mmc_host::index(supplied by mmc alias) instead of the legacy mshc
alias.

dw_mci_hi6220_parse_dt() which parses mshc alias is used for hi6220, hi3660 and
hi3670. Given hi6220 never assigned mshc alias on the DTS files, and hi3360
and hi3670 share the same code, so with it removed, add a return value to
dw_mci_hs_set_timing() and let dw_mci_hi3660_init() check if index exceeds
TIMING_MODE in the firs place to bail out early, the same as before.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/mmc/host/dw_mmc-k3.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc-k3.c b/drivers/mmc/host/dw_mmc-k3.c
index 23c3031..4d52033 100644
--- a/drivers/mmc/host/dw_mmc-k3.c
+++ b/drivers/mmc/host/dw_mmc-k3.c
@@ -53,7 +53,6 @@
 #define USE_DLY_MAX_SMPL (14)
 
 struct k3_priv {
-	int ctrl_id;
 	u32 cur_speed;
 	struct regmap	*reg;
 };
@@ -127,13 +126,6 @@ static int dw_mci_hi6220_parse_dt(struct dw_mci *host)
 	if (IS_ERR(priv->reg))
 		priv->reg = NULL;
 
-	priv->ctrl_id = of_alias_get_id(host->dev->of_node, "mshc");
-	if (priv->ctrl_id < 0)
-		priv->ctrl_id = 0;
-
-	if (priv->ctrl_id >= TIMING_MODE)
-		return -EINVAL;
-
 	host->priv = priv;
 	return 0;
 }
@@ -211,7 +203,7 @@ static const struct dw_mci_drv_data hi6220_data = {
 	.execute_tuning		= dw_mci_hi6220_execute_tuning,
 };
 
-static void dw_mci_hs_set_timing(struct dw_mci *host, int timing,
+static int dw_mci_hs_set_timing(struct dw_mci *host, int timing,
 				     int smpl_phase)
 {
 	u32 drv_phase;
@@ -223,7 +215,10 @@ static void dw_mci_hs_set_timing(struct dw_mci *host, int timing,
 	struct k3_priv *priv;
 
 	priv = host->priv;
-	ctrl_id = priv->ctrl_id;
+	ctrl_id = host->mmc->index;
+
+	if (ctrl_id >= TIMING_MODE)
+		return -EINVAL;
 
 	drv_phase = hs_timing_cfg[ctrl_id][timing].drv_phase;
 	smpl_dly   = hs_timing_cfg[ctrl_id][timing].smpl_dly;
@@ -260,6 +255,8 @@ static void dw_mci_hs_set_timing(struct dw_mci *host, int timing,
 
 	/* We should delay 1ms wait for timing setting finished. */
 	usleep_range(1000, 2000);
+
+	return 0;
 }
 
 static int dw_mci_hi3660_init(struct dw_mci *host)
@@ -267,10 +264,9 @@ static int dw_mci_hi3660_init(struct dw_mci *host)
 	mci_writel(host, CDTHRCTL, SDMMC_SET_THLD(SDCARD_RD_THRESHOLD,
 		    SDMMC_CARD_RD_THR_EN));
 
-	dw_mci_hs_set_timing(host, MMC_TIMING_LEGACY, -1);
 	host->bus_hz /= (GENCLK_DIV + 1);
 
-	return 0;
+	return dw_mci_hs_set_timing(host, MMC_TIMING_LEGACY, -1);
 }
 
 static int dw_mci_set_sel18(struct dw_mci *host, bool set)
@@ -407,7 +403,7 @@ static int dw_mci_hi3660_switch_voltage(struct dw_mci *host,
 	if (!priv || !priv->reg)
 		return 0;
 
-	if (priv->ctrl_id == DWMMC_SDIO_ID)
+	if (mmc->index == DWMMC_SDIO_ID)
 		return 0;
 
 	if (ios->signal_voltage == MMC_SIGNAL_VOLTAGE_330)
-- 
2.7.4


