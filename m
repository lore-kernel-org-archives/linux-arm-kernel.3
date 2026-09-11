Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB251C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 03:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqgSoIBESDHLyR7I67daLRSr3Iyho5ADiCyaj7jEfiU=; b=Zaf22AOyVKhWEMez7wradXG/PO
	ocxsyzjyD/flqfOQtQrHv3CBkxc04ftT594IiQ7pPlV1rM7b8ApCPXh8aRTwmbGEde+dVgZ50k8qy
	XnA1cgra7J9QDybrD4RAVbE2VNiR6sbgh5Edt4bpbomhGqw6woPgoUTVJDEEVFbdL81QkxAEO3Kre
	sQEQfBDyWgQhzHTfR+74S3d5VHM1+icYoAtWb2CSBw+dAYYmgRb6LffNpIL/2zUPdt2kawkVFtokW
	NhdDIxIUrH2r8jxfL8EypauP4eG7FbT4PqZX+lt+MZoZujf+63SgLCB1CNV4wDgCiG2OV4UXMrznP
	y9f28WRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rwG-0000000FlUi-108v;
	Fri, 11 Sep 2026 03:28:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rwF-0000000FlTi-2ZhR;
	Fri, 11 Sep 2026 03:28:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57B2941724;
	Fri, 11 Sep 2026 03:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6EA1F00893;
	Fri, 11 Sep 2026 03:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789097311;
	bh=JqgSoIBESDHLyR7I67daLRSr3Iyho5ADiCyaj7jEfiU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KNRZ9go1qR8L7JRb9Xn3RhWpeR8GUiFEVCXwjQ82DsyIfAayNiE8/5RN45cUt1Zqi
	 8OMUYuVX/CpqposqTctGjdM+wf+x1T/6rysS/QuaBbfqLiA8bXNNK1odnylHZReKX9
	 A6q1lNPCitZ97TLfkNkQIEAznSUwT8V3IQ6m/OTLVFZFkYuu+LcUWju489LHfveTY0
	 ZiQz31TI+rPNLUBXmBvB+OXL7u/IfV+WdkytlAJosNU0dPl2z5bJW1unnvAPGyb9iJ
	 mKe3jw3PIVq6Fm6Pde8OTQzYqgxNfrS+8gJBm9xjKDmIcFOQLeBcR16N4oItKnShAX
	 RiCd0Oj1cQbrg==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Fri, 11 Sep 2026 03:27:14 +0000
Subject: [PATCH v2 6/6] media: mtk-vpu: rename IPI_MAX to IPI_VPU_MAX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ipi_max-v2-6-a77826ff189e@kernel.org>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
In-Reply-To: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Anup Patel <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0
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

The last enumerator of this driver's firmware IPI id list is a bound
for the VPU mailbox protocol, not a generic host IPI limit. Follow the
existing naming in this header: IPI_VPU_INIT already carries a VPU
prefix, so the terminator should match.

The same convention is used by the SCP IPI enum, which ends with a
prefixed SCP_IPI_MAX rather than a bare IPI_MAX.

Rename IPI_MAX to IPI_VPU_MAX and update the descriptor table bounds
and range checks. No functional change.

Link: https://lore.kernel.org/linux-riscv/20260908222349.GA2324870@ax162
Cc: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 12 ++++++------
 drivers/media/platform/mediatek/vpu/mtk_vpu.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..b3e9f8c4ab7a 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -211,7 +211,7 @@ struct mtk_vpu {
 	struct vpu_regs reg;
 	struct vpu_run run;
 	struct vpu_wdt wdt;
-	struct vpu_ipi_desc ipi_desc[IPI_MAX];
+	struct vpu_ipi_desc ipi_desc[IPI_VPU_MAX];
 	struct share_obj __iomem *recv_buf;
 	struct share_obj __iomem *send_buf;
 	struct device *dev;
@@ -221,7 +221,7 @@ struct mtk_vpu {
 	struct mutex vpu_mutex; /* for protecting vpu data data structure */
 	u32 wdt_refcnt;
 	wait_queue_head_t ack_wq;
-	bool ipi_id_ack[IPI_MAX];
+	bool ipi_id_ack[IPI_VPU_MAX];
 };
 
 static inline void vpu_cfg_writel(struct mtk_vpu *vpu, u32 val, u32 offset)
@@ -296,7 +296,7 @@ int vpu_ipi_register(struct platform_device *pdev,
 		return -EPROBE_DEFER;
 	}
 
-	if (id < IPI_MAX && handler) {
+	if (id < IPI_VPU_MAX && handler) {
 		ipi_desc = vpu->ipi_desc;
 		ipi_desc[id].name = name;
 		ipi_desc[id].handler = handler;
@@ -319,7 +319,7 @@ int vpu_ipi_send(struct platform_device *pdev,
 	unsigned long timeout;
 	int ret = 0;
 
-	if (id <= IPI_VPU_INIT || id >= IPI_MAX ||
+	if (id <= IPI_VPU_INIT || id >= IPI_VPU_MAX ||
 	    len > sizeof(send_obj->share_buf) || !buf) {
 		dev_err(vpu->dev, "failed to send ipi message\n");
 		return -EINVAL;
@@ -748,7 +748,7 @@ static void vpu_ipi_handler(struct mtk_vpu *vpu)
 	s32 id = readl(&rcv_obj->id);
 
 	memcpy_fromio(data, rcv_obj->share_buf, sizeof(data));
-	if (id < IPI_MAX && ipi_desc[id].handler) {
+	if (id < IPI_VPU_MAX && ipi_desc[id].handler) {
 		ipi_desc[id].handler(data, readl(&rcv_obj->len),
 				     ipi_desc[id].priv);
 		if (id > IPI_VPU_INIT) {
@@ -934,7 +934,7 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 #ifdef CONFIG_DEBUG_FS
 	debugfs_remove(vpu_debugfs);
 #endif
-	memset(vpu->ipi_desc, 0, sizeof(struct vpu_ipi_desc) * IPI_MAX);
+	memset(vpu->ipi_desc, 0, sizeof(struct vpu_ipi_desc) * IPI_VPU_MAX);
 vpu_mutex_destroy:
 	mutex_destroy(&vpu->vpu_mutex);
 disable_vpu_clk:
diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
index 3951547e9ec5..44ab631ec904 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
@@ -49,7 +49,7 @@ typedef void (*ipi_handler_t) (void *data,
  *			 handle VP8 video encoder job,, and vice versa.
  * @IPI_MDP:		 The interrupt from vpu is to notify kernel to
  *			 handle MDP (Media Data Path) job, and vice versa.
- * @IPI_MAX:		 The maximum IPI number
+ * @IPI_VPU_MAX:	 The maximum VPU IPI number
  */
 
 enum ipi_id {
@@ -60,7 +60,7 @@ enum ipi_id {
 	IPI_VENC_H264,
 	IPI_VENC_VP8,
 	IPI_MDP,
-	IPI_MAX,
+	IPI_VPU_MAX,
 };
 
 /**

-- 
2.43.0


