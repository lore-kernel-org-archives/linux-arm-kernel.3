Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68041093172
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 03:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NT4VoMEkut88E7L5xM3Nk57RkG041neRyZ4yAKpbst8=; b=fReYihb9oEsW8gAMtzLI8QBsPT
	UwqrBV5CzI6BLV3VG0lPUk+uKtJHokeZYDSRJ1B13PxNIetC48Pgma8lmrLSWlchKAwktBzKpw3uq
	6a2RhzQ4GhpWT4FFo8nplNh/AihgYt+BrHkaRD4Boow/fyFyo2jRqqRi5Ki//R7HdPdeKy7aXcwbO
	3deH72XVDpgmssjeXo2z5QqqSLOoqmiZEnOktbNJEkJaP6L4Fl3JqfM1DK7itDztq/SC+PjxHNWm/
	b4Jrcixf/mJrXqmZYsM9hB1Uy3hAk3UjH5+/CtsDFG28HqO3IfcD5fE/e5iYmBdA+J7EcBwjUZE4v
	kPCSIx1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QQJ-0000000Bzyb-26Ze;
	Fri, 20 Mar 2026 03:21:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QQ9-0000000Bzqs-3cEd;
	Fri, 20 Mar 2026 03:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NT4VoMEkut88E7L5xM3Nk57RkG041neRyZ4yAKpbst8=; b=i6FcXc/hLf2dufMeel4T56YBbv
	c+I+vypvh5O2ziom5pL5jOk6IcKV/dbDd23R8h+85aInDpEz9hpQDBxU8R3mXqblMJmzMJV+Nh/7w
	rvmUBYAHcFrgortKaaQD4IxJEUxQRhR4YVed2Y6O9+BfSP+VlqKurqphMtVsGWjgCV4iWioYCXJ0n
	pUHh69JtYPa4+iVq7/6HiET8SWlC5zpmn/CJtsoFiFeTTj8qXNZXaSRMqB3wNJZRVAPyLg1XbPrkY
	T52zNpgmZTa0dzJ1uIdAodLRqijXBxMxP4qJt+Mzf5tv4q2ePG1qFe0Lzq7GdkAudA7tjp1DcVjdh
	jh8aLobQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QQ6-0000000Er3e-0Vyp;
	Fri, 20 Mar 2026 03:21:08 +0000
X-UUID: d18baeae240b11f19e7563141e833ce8-20260319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NT4VoMEkut88E7L5xM3Nk57RkG041neRyZ4yAKpbst8=;
	b=C1F5f+F0KrYlp/bLJrHyq9W41F6j9AM+EuBOEOr1sSpvWKUZqtmQ8aEb+dIoLe+d0u39ZqTAbC6Dk33Q1Us8p+p0SkhyYntMlh+ysU3YWniZdns/WLx0kPrMtAJVNyXGGVefD9tPWJNO8aw/3MiAxN5rShajikYOIi0oONVbFko=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:bf352e04-1285-4109-b696-1acefefddcc7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:2e1bb54c-9183-487b-8624-e74f2dd98990,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d18baeae240b11f19e7563141e833ce8-20260319
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1113968304; Thu, 19 Mar 2026 20:21:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 20 Mar 2026 11:20:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 20 Mar 2026 11:20:56 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiangzhi Tang
	<Xiangzhi.Tang@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hailong Fan
	<Hailong.Fan@mediatek.com>, Huayu Zong <huayu.Zong@mediatek.com>, Xiangzhi
 Tang <xiangzhi.tang@mediatek.com>
Subject: [PATCH v3 6/6] remoterpoc: mediatek: vcp: Add vcp suspned and resume feature
Date: Fri, 20 Mar 2026 11:18:08 +0800
Message-ID: <20260320032014.13608-7-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260320032014.13608-1-xiangzhi.tang@mediatek.com>
References: <20260320032014.13608-1-xiangzhi.tang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_032106_610470_F85F9A98 
X-CRM114-Status: GOOD (  17.58  )
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

1.Add vcp suspend and resume callback

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 drivers/remoteproc/mtk_vcp_common.c       | 114 ++++++++++++++++++++++
 drivers/remoteproc/mtk_vcp_common.h       |   6 ++
 drivers/remoteproc/mtk_vcp_rproc.c        |  59 +++++++++++
 drivers/remoteproc/mtk_vcp_rproc.h        |   2 +
 include/linux/remoteproc/mtk_vcp_public.h |   1 +
 5 files changed, 182 insertions(+)

diff --git a/drivers/remoteproc/mtk_vcp_common.c b/drivers/remoteproc/mtk_vcp_common.c
index f3b506034e95..f4952fbace3c 100644
--- a/drivers/remoteproc/mtk_vcp_common.c
+++ b/drivers/remoteproc/mtk_vcp_common.c
@@ -190,6 +190,11 @@ bool is_vcp_ready(struct mtk_vcp_device *vcp,
 	return vcp_is_core_ready(vcp, core_id);
 }
 
+bool is_vcp_suspending(struct mtk_vcp_device *vcp)
+{
+	return vcp->vcp_cluster->is_suspending ? true : false;
+}
+
 int wait_core_hart_shutdown(struct mtk_vcp_device *vcp,
 			    enum vcp_core_id core_id)
 {
@@ -252,6 +257,95 @@ int wait_core_hart_shutdown(struct mtk_vcp_device *vcp,
 	return ret;
 }
 
+void vcp_wait_core_stop(struct mtk_vcp_device *vcp, enum vcp_core_id core_id)
+{
+	u32 status;
+	u32 stop_ctrl;
+	int ret;
+
+	stop_ctrl = (vcp->vcp_cluster->twohart[core_id] ?
+		     (B_CORE_GATED | B_HART0_HALT | B_HART1_HALT | B_CORE_AXIS_BUSY) :
+		     (B_CORE_GATED | B_HART0_HALT | B_CORE_AXIS_BUSY));
+
+	switch (core_id) {
+	case VCP_ID:
+		ret = readl_poll_timeout(vcp->vcp_cluster->cfg + R_CORE0_STATUS,
+					 status,
+					 (status & stop_ctrl) == (stop_ctrl & ~B_CORE_AXIS_BUSY),
+					 USEC_PER_MSEC,
+					 CORE_HART_SHUTDOWN_TIMEOUT_MS * USEC_PER_MSEC);
+		if (ret) {
+			dev_err(vcp->dev, "wait [%s] core stop timeout, current status 0x%x\n",
+				core_id ? "MMUP_ID" : "VCP_ID", status);
+			return;
+		}
+		break;
+	case MMUP_ID:
+		ret = readl_poll_timeout(vcp->vcp_cluster->cfg + R_CORE1_STATUS,
+					 status,
+					 (status & stop_ctrl) == (stop_ctrl & ~B_CORE_AXIS_BUSY),
+					 USEC_PER_MSEC,
+					 CORE_HART_SHUTDOWN_TIMEOUT_MS * USEC_PER_MSEC);
+		if (ret) {
+			dev_err(vcp->dev, "wait [%s] core stop timeout, current status 0x%x\n",
+				core_id ? "MMUP_ID" : "VCP_ID", status);
+			return;
+		}
+		break;
+	default:
+		dev_err(vcp->dev, "%s(), No Support core id\n", __func__);
+		break;
+	}
+}
+
+static bool vcp_get_suspend_resume_status(struct mtk_vcp_device *vcp)
+{
+	if (vcp->vcp_cluster->core_nums > MMUP_ID)
+		return !!(readl(vcp->vcp_cluster->cfg_sec + R_GPR3_SEC) & VCP_AP_SUSPEND) &&
+		       !!(readl(vcp->vcp_cluster->cfg_sec + R_GPR2_SEC) & MMUP_AP_SUSPEND);
+
+	return !!(readl(vcp->vcp_cluster->cfg_sec + R_GPR3_SEC) & VCP_AP_SUSPEND);
+}
+
+void vcp_wait_suspend_resume(struct mtk_vcp_device *vcp, bool suspend)
+{
+	bool status;
+	int ret;
+
+	if (suspend) {
+		writel(B_CORE0_SUSPEND, vcp->vcp_cluster->cfg_core + AP_R_GPR2);
+		writel(SUSPEND_MAGIC, vcp->vcp_cluster->cfg + VCP_C0_GPR0_SUSPEND_RESUME);
+		if (vcp->vcp_cluster->core_nums > MMUP_ID) {
+			writel(B_CORE1_SUSPEND, vcp->vcp_cluster->cfg_core + AP_R_GPR3);
+			writel(SUSPEND_MAGIC, vcp->vcp_cluster->cfg + VCP_C1_GPR0_SUSPEND_RESUME);
+		}
+	} else {
+		writel(B_CORE0_RESUME, vcp->vcp_cluster->cfg_core + AP_R_GPR2);
+		writel(RESUME_MAGIC, vcp->vcp_cluster->cfg + VCP_C0_GPR0_SUSPEND_RESUME);
+		if (vcp->vcp_cluster->core_nums > MMUP_ID) {
+			writel(B_CORE1_RESUME, vcp->vcp_cluster->cfg_core + AP_R_GPR3);
+			writel(RESUME_MAGIC, vcp->vcp_cluster->cfg + VCP_C1_GPR0_SUSPEND_RESUME);
+		}
+	}
+
+	writel(B_GIPC4_SETCLR_3, vcp->vcp_cluster->cfg_core + R_GIPC_IN_SET);
+
+	ret = read_poll_timeout(vcp_get_suspend_resume_status,
+				status, (status == suspend),
+				USEC_PER_MSEC,
+				SUSPEND_WAIT_TIMEOUT_MS * USEC_PER_MSEC,
+				false, vcp);
+	if (ret)
+		dev_err(vcp->dev, "vcp %s timeout GPIC 0x%x 0x%x 0x%x 0x%x flag 0x%x 0x%x\n",
+			suspend ? "suspend" : "resume",
+			readl(vcp->vcp_cluster->cfg_core + R_GIPC_IN_SET),
+			readl(vcp->vcp_cluster->cfg_core + R_GIPC_IN_CLR),
+			readl(vcp->vcp_cluster->cfg_core + AP_R_GPR2),
+			readl(vcp->vcp_cluster->cfg_core + AP_R_GPR3),
+			readl(vcp->vcp_cluster->cfg_sec + R_GPR2_SEC),
+			readl(vcp->vcp_cluster->cfg_sec + R_GPR3_SEC));
+}
+
 void vcp_A_register_notify(struct mtk_vcp_device *vcp,
 			   enum vcp_feature_id id,
 			   struct notifier_block *nb)
@@ -416,6 +510,16 @@ static int vcp_enable_pm_clk(struct mtk_vcp_device *vcp, enum vcp_feature_id id)
 	bool suspend_status;
 	int ret;
 
+	ret = read_poll_timeout(is_vcp_suspending,
+				suspend_status, !suspend_status,
+				USEC_PER_MSEC,
+				SUSPEND_WAIT_TIMEOUT_MS * USEC_PER_MSEC,
+				false, vcp);
+	if (ret) {
+		dev_err(vcp->dev, "%s blocked by vcp suspend\n", __func__);
+		return ret;
+	}
+
 	if (vcp->vcp_cluster->feature_enable[id]) {
 		dev_err(vcp->dev, "%s feature(id=%d) already enabled\n",
 			__func__, id);
@@ -443,6 +547,16 @@ static int vcp_disable_pm_clk(struct mtk_vcp_device *vcp, enum vcp_feature_id id
 	bool suspend_status;
 	int ret;
 
+	ret = read_poll_timeout(is_vcp_suspending,
+				suspend_status, !suspend_status,
+				USEC_PER_MSEC,
+				SUSPEND_WAIT_TIMEOUT_MS * USEC_PER_MSEC,
+				false, vcp);
+	if (ret) {
+		dev_err(vcp->dev, "%s blocked by vcp suspend\n", __func__);
+		return ret;
+	}
+
 	if (!vcp->vcp_cluster->feature_enable[id]) {
 		dev_err(vcp->dev, "%s feature(id=%d) already disabled\n",
 			__func__, id);
diff --git a/drivers/remoteproc/mtk_vcp_common.h b/drivers/remoteproc/mtk_vcp_common.h
index 8b19fcb78a79..eff2199c7610 100644
--- a/drivers/remoteproc/mtk_vcp_common.h
+++ b/drivers/remoteproc/mtk_vcp_common.h
@@ -16,9 +16,12 @@
 #define VCP_READY_TIMEOUT_MS 3000
 #define VCP_IPI_DEV_READY_TIMEOUT 1000
 #define CORE_HART_SHUTDOWN_TIMEOUT_MS 10
+#define SUSPEND_WAIT_TIMEOUT_MS 100
 
 /* VCP platform definition */
 #define DMA_MAX_MASK_BIT 33
+#define RESUME_MAGIC 0x12345678
+#define SUSPEND_MAGIC 0x87654321
 #define PIN_OUT_C_SIZE_SLEEP_0 2
 
 /* VCP load image definition */
@@ -269,5 +272,8 @@ int vcp_A_register_feature(struct mtk_vcp_device *vcp,
 int vcp_A_deregister_feature(struct mtk_vcp_device *vcp,
 			     enum vcp_feature_id id);
 
+bool is_vcp_suspending(struct mtk_vcp_device *vcp);
 int wait_core_hart_shutdown(struct mtk_vcp_device *vcp, enum vcp_core_id core_id);
+void vcp_wait_core_stop(struct mtk_vcp_device *vcp, enum vcp_core_id core_id);
+void vcp_wait_suspend_resume(struct mtk_vcp_device *vcp, bool suspend);
 #endif
diff --git a/drivers/remoteproc/mtk_vcp_rproc.c b/drivers/remoteproc/mtk_vcp_rproc.c
index 833a0dc69d9c..a44a8081e7a3 100644
--- a/drivers/remoteproc/mtk_vcp_rproc.c
+++ b/drivers/remoteproc/mtk_vcp_rproc.c
@@ -11,6 +11,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/suspend.h>
 #include <linux/remoteproc.h>
 
 #include "mtk_vcp_common.h"
@@ -67,6 +68,57 @@ struct mtk_ipi_device *vcp_get_ipidev(struct mtk_vcp_device *vcp)
 }
 EXPORT_SYMBOL_GPL(vcp_get_ipidev);
 
+static int mtk_vcp_suspend(struct device *dev)
+{
+	struct mtk_vcp_device *vcp = platform_get_drvdata(to_platform_device(dev));
+
+	vcp_extern_notify(VCP_ID, VCP_EVENT_SUSPEND);
+	vcp_extern_notify(MMUP_ID, VCP_EVENT_SUSPEND);
+
+	for (u32 id = RTOS_FEATURE_ID + 1; id < NUM_FEATURE_ID; id++) {
+		if (vcp->vcp_cluster->feature_enable[id]) {
+			dev_err(vcp->dev, "%s Check feature(id=%d) statue(%d)\n",
+				__func__, id,
+				vcp->vcp_cluster->feature_enable[id]);
+			return -EINVAL;
+		}
+	}
+
+	if (!vcp->vcp_cluster->is_suspending) {
+		vcp->vcp_cluster->is_suspending = true;
+		vcp->vcp_cluster->vcp_ready[VCP_ID] = false;
+		vcp->vcp_cluster->vcp_ready[MMUP_ID] = false;
+
+		flush_workqueue(vcp->vcp_cluster->vcp_workqueue);
+
+		vcp_wait_suspend_resume(vcp, true);
+		vcp_wait_core_stop(vcp, VCP_ID);
+		vcp_wait_core_stop(vcp, MMUP_ID);
+
+		pm_runtime_put_sync(dev);
+	}
+	vcp->vcp_cluster->is_suspending = true;
+
+	return 0;
+}
+
+static int mtk_vcp_resume(struct device *dev)
+{
+	struct mtk_vcp_device *vcp = platform_get_drvdata(to_platform_device(dev));
+
+	if (vcp->vcp_cluster->is_suspending) {
+		pm_runtime_get_sync(dev);
+
+		vcp_wait_suspend_resume(vcp, false);
+	}
+	vcp->vcp_cluster->is_suspending = false;
+
+	vcp_extern_notify(MMUP_ID, VCP_EVENT_RESUME);
+	vcp_extern_notify(VCP_ID, VCP_EVENT_RESUME);
+
+	return 0;
+}
+
 static int mtk_vcp_start(struct rproc *rproc)
 {
 	struct mtk_vcp_device *vcp = (struct mtk_vcp_device *)rproc->priv;
@@ -436,6 +488,7 @@ static struct mtk_vcp_ipi_ops mt8196_vcp_ipi_ops = {
 static const struct mtk_vcp_of_data mt8196_of_data = {
 	.ops = {
 		.vcp_is_ready = is_vcp_ready,
+		.vcp_is_suspending = is_vcp_suspending,
 		.vcp_register_feature = vcp_A_register_feature,
 		.vcp_deregister_feature = vcp_A_deregister_feature,
 		.vcp_register_notify = vcp_A_register_notify,
@@ -458,6 +511,11 @@ static const struct mtk_vcp_of_data mt8196_of_data = {
 	},
 };
 
+static const struct dev_pm_ops mtk_vcp_rproc_pm_ops = {
+	.suspend_noirq = mtk_vcp_suspend,
+	.resume_noirq = mtk_vcp_resume,
+};
+
 static const struct of_device_id mtk_vcp_of_match[] = {
 	{ .compatible = "mediatek,mt8196-vcp", .data = &mt8196_of_data},
 	{}
@@ -471,6 +529,7 @@ static struct platform_driver mtk_vcp_device = {
 	.driver = {
 		.name = "mtk-vcp",
 		.of_match_table = mtk_vcp_of_match,
+		.pm = pm_ptr(&mtk_vcp_rproc_pm_ops),
 	},
 };
 
diff --git a/drivers/remoteproc/mtk_vcp_rproc.h b/drivers/remoteproc/mtk_vcp_rproc.h
index 600715b77124..e3a76e368fd7 100644
--- a/drivers/remoteproc/mtk_vcp_rproc.h
+++ b/drivers/remoteproc/mtk_vcp_rproc.h
@@ -23,6 +23,7 @@
  * @msg_vcp_ready1: core1 ready ipi msg data
  * @slp_ipi_ack_data: sleep ipi msg data
  * @feature_enable: feature status count data
+ * @is_suspending: suspend status flag
  * @vcp_ready: vcp core status flag
  * @share_mem_iova: shared memory iova base
  * @share_mem_size: shared memory size
@@ -46,6 +47,7 @@ struct mtk_vcp_of_cluster {
 	u32 msg_vcp_ready1;
 	u32 slp_ipi_ack_data;
 	bool feature_enable[NUM_FEATURE_ID];
+	bool is_suspending;
 	bool vcp_ready[VCP_CORE_TOTAL];
 	dma_addr_t share_mem_iova;
 	size_t share_mem_size;
diff --git a/include/linux/remoteproc/mtk_vcp_public.h b/include/linux/remoteproc/mtk_vcp_public.h
index b9e1d86685fd..dbdcf5aa0f99 100644
--- a/include/linux/remoteproc/mtk_vcp_public.h
+++ b/include/linux/remoteproc/mtk_vcp_public.h
@@ -100,6 +100,7 @@ struct mtk_vcp_ipi_ops {
 };
 
 struct mtk_vcp_ops {
+	bool (*vcp_is_suspending)(struct mtk_vcp_device *vcp);
 	bool (*vcp_is_ready)(struct mtk_vcp_device *vcp,
 			     enum vcp_feature_id id);
 	int (*vcp_register_feature)(struct mtk_vcp_device *vcp,
-- 
2.46.0


