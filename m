Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9368DCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 16:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqaPKyMESMuNDx2gR8VcPpcUeEc+yXfCJL/uctMZpCM=; b=ZXLVpG8qjW2qA640IdFtQPqqun
	EPeougKsHuvkd0FGnHqbcJultc/e2MLrqvA144F7VanKALGhh5GYrMwbbNQPNALPFxTxeMNbB/Q1E
	RhHi7rZ63DaT076sgrNJnfdfGQp7ZaisIekc7Ya5VAUhQiQU/82tJZglp8aM4IEXREJ6GzDKSUt8q
	pZPDjO5sJyWaH4ZELUUuvdJRJgeV9MkH0PFtgPnBEjdgJZs+/6VI8PslWPL/c2jJV7nx/uzrkVfSr
	0tdnjbSOXD0JQnRECSTWk73V2KDJWZxfinE598hlytSKkirb76RJXeesakvEITKhc6Ttxy4J985LB
	KVlqInrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqa6Y-00000008fVn-3sNr;
	Mon, 25 Aug 2025 16:31:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZDv-00000008XDc-3YJy;
	Mon, 25 Aug 2025 15:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KqaPKyMESMuNDx2gR8VcPpcUeEc+yXfCJL/uctMZpCM=; b=riISsivLVh/A5ZukCpDigkRpwk
	Ak2jD9FDeloN6zu+/WY4Im5ZuW4dKS1OCWTCQShGfekRiV7fZZqQz6Nl1YtAvIhmRd+O/FTD24cBN
	m48ZeTA0WBYcHIxl9yCfTSBiq/PfAouRRBDdqRqtuJ+oLLQw6k/lpAKigM56tMfr57FAhMGzfUIvL
	jVnglwJJoHlEn5bKIa6glPJvBtCMvNSmqD48o5qgwTuWll/GjkAZ9hY0yH842BqK7jVL7PzBWwg4c
	RIgjRVZI/OwQWh/IhvUy9FVW5NZ0Snq/hWJbgOIsEE7z8tN0xUlHoQgNTCqNuTODuMun6bMRh/CO4
	ysnX24bg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZDs-00000001ud5-2Vej;
	Mon, 25 Aug 2025 15:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756136098;
	bh=elE7GQGxSNzaBPXUtBixgyQszkWHYaNv4E7aSCh1hn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UwB8iZ5czK+PdAkSKzMEv7hFNlF29ySQTmJ4/2qxfkd27VJX2JJD57bupTIOtJ4fz
	 I9x7KAdC1lom6GIVKX6KJX3QMNBOm9eD88m+83TGBz9NAJhbWgWtjzOJtQ2WFBXCO/
	 K1QPWarh/O9IHRyPiTNB3+i2F8HP6FwrAVYL3zdvF7UgcCOsZOVRAvCMtqoTd/Dr1g
	 7r/W8wNEq6dQSqQC3nmF2kLuOOpgu+5FDtEi+6yoCRJsTadQZm6bDpO0Ognal92YPY
	 rR2Z/9GA+SqXN9jnCgKCqwc6f2z7DhD1FLQ71U3/eScncAGacD/XYbnJS8UA45v5if
	 R8AfJQAfesAHA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f39:d9a9:8ef1:f69a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 53CE817E0963;
	Mon, 25 Aug 2025 17:34:58 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 4/6] media: verisilicon: AV1: Restore IOMMU context before decoding a frame
Date: Mon, 25 Aug 2025 17:34:43 +0200
Message-ID: <20250825153450.150071-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_163504_792071_46D10309 
X-CRM114-Status: GOOD (  13.82  )
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

AV1 is a stateless decoder and multiple AV1 bitstreams could be decoded
at the same time. Each decoding context got it own iommu domain which
need to be restored before each frame. To be sure that iommu context is
correctly set AV1 driver detach and attach before decoding the frame.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in version 7:
- add a patch in AV1 video decoder to manage per context iommu domain.

 drivers/media/platform/verisilicon/hantro.h           |  5 +++++
 drivers/media/platform/verisilicon/hantro_drv.c       | 11 +++++++++++
 .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 10 ++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 81328c63b796..a28a181013b9 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -12,6 +12,9 @@
 #ifndef HANTRO_H_
 #define HANTRO_H_
 
+#include <linux/dma-map-ops.h>
+#include <linux/iommu.h>
+#include <linux/iommu-dma.h>
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
 #include <linux/wait.h>
@@ -266,6 +269,8 @@ struct hantro_ctx {
 	struct hantro_postproc_ctx postproc;
 	bool need_postproc;
 
+	struct iommu_domain *iommu_domain;
+
 	/* Specific for particular codec modes. */
 	union {
 		struct hantro_h264_dec_hw_ctx h264_dec;
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 8542238e0fb1..feec8e6fb504 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -675,6 +675,13 @@ static int hantro_open(struct file *filp)
 	}
 	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
 
+	if (use_dma_iommu(ctx->dev->v4l2_dev.dev)) {
+		ctx->iommu_domain = iommu_paging_domain_alloc(ctx->dev->v4l2_dev.dev);
+
+		if (!ctx->iommu_domain)
+			vpu_err("cannot alloc new empty domain\n");
+	}
+
 	return 0;
 
 err_fh_free:
@@ -698,6 +705,10 @@ static int hantro_release(struct file *filp)
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+
+	if (ctx->iommu_domain)
+		iommu_domain_free(ctx->iommu_domain);
+
 	kfree(ctx);
 
 	return 0;
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4703bb6be7c..b3e52387234f 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -2095,12 +2095,22 @@ rockchip_vpu981_av1_dec_set_output_buffer(struct hantro_ctx *ctx)
 	hantro_write_addr(vpu, AV1_TILE_OUT_MV, mv_addr);
 }
 
+static void rockchip_vpu981_av1_restore_iommu(struct hantro_ctx *ctx)
+{
+	if (ctx->iommu_domain) {
+		iommu_attach_device(ctx->iommu_domain, ctx->dev->v4l2_dev.dev);
+		iommu_detach_device(ctx->iommu_domain, ctx->dev->v4l2_dev.dev);
+	}
+}
+
 int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *vb2_src;
 	int ret;
 
+	rockchip_vpu981_av1_restore_iommu(ctx);
+
 	hantro_start_prepare_run(ctx);
 
 	ret = rockchip_vpu981_av1_dec_prepare_run(ctx);
-- 
2.43.0


