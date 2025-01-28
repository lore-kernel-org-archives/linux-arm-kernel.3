Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2673C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 20:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8MTyUlPh3gZbGYt+/m2sUV5tFwW7lwH2zL30YhNj3E=; b=30RcJONnpoAg3g0nZhfIU7/+Sw
	ejufZOegJNdti8r4BiZoN6+3G79bytg6nA99spS3UrelJr6ViXw4gC4lXJazu8FfklSjAEp3xw2dP
	Qkv9NFGrJoEcrlpo+yqs+0eossJnlTs2p94rHiQOSbPwIor5OO2DQqYxcbVZ59OyShh1v4XObbD5q
	r8SKDKc8KTXunA/T7tYgZTX2GDo/YnteVmplWVETfR6wM4ZNGqFrfJmBrO2bsKjm9FR4HS/obofG+
	QXfGD7U/5KpYX1MU3a7f6z2Zy2ObeJLBT9019n05JMvu9SScI7IzCokVCwkPkv21NeUDMscwM4anO
	Z3moBAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcsMV-00000005oEH-1w2x;
	Tue, 28 Jan 2025 20:39:07 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcsJs-00000005o1L-3Dhy;
	Tue, 28 Jan 2025 20:36:25 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5439e331cceso7361506e87.1;
        Tue, 28 Jan 2025 12:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738096583; x=1738701383; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8MTyUlPh3gZbGYt+/m2sUV5tFwW7lwH2zL30YhNj3E=;
        b=UIph82cJvcVq/+9c3lwXsN4+t2BeRy4UxB/z0ekreSwe23mhzUVHzKLPORUJerTnEt
         1bDdr4fnthTf+cV+bo26PtYCAGShRepXDyI90j0A8aq5jqmuX2qXUf7qP6AWRSQNGhfj
         kpxF1Fg4am/3BPN7fPgddwfnMO74dlsEP0xf5VzghQSyYiZk99AmnXMu378SovVq4pci
         mtkkkhzty7xE3hdcstcav1GbKGOW8mbvUngNdmXteonCm7qm/ilVChaByJECHIE08fmJ
         FzZTZ8VJDNKqGX6+8SoQ/yqIMdTr9wGV8AVKYGxsexU8p2Zu3bPmqSyqWHRLBiWqK/No
         mViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738096583; x=1738701383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8MTyUlPh3gZbGYt+/m2sUV5tFwW7lwH2zL30YhNj3E=;
        b=fIWXqFIUeP3zQ0xaRFMBJpVPxDezWz0tq1XrYWqidg4oBDEjS+xtMJ1AetZ37SXR6O
         qp0IyF4I10kbyI2pT2E6alD8iyLx9XE+jfgnQ/C0EA/GrGGLp5Kl8n+UB+o570aazmI2
         uTnBaBR//4vjVBw8WDkzBnTTdWNdBYFIUp9COfaMFuKD1FGfV36z/MLHl9hU6wrksDRs
         2QwKm84FYn/T4W+0iwymEr80SUGsvHh6FhOkyWg0l2e4XBRVl5l3tsDy5lKEJ96PyQ2Y
         2SHtyRR4g7b0JbGNCxqatnIbGVlAjnQ0A1+mrEJY/u365jxHIHZxphoEkBcC9bWvVQLa
         SKdA==
X-Forwarded-Encrypted: i=1; AJvYcCWD8uixDaP9PUtXQUIeVLAeb52BoXmE5ard65qxmuCHoz0p8m5NQorJqPZozUf/GlNm3lJfocikqEUT+qZygOR0@lists.infradead.org, AJvYcCWZ5Zv8N09/PWJrxgiEO5LQlHXuQYjzEG1yjC7AZH2d/D+mRb8SpmK+7ilBNCFdrpg/Ysh1G55a1RYm+UkVH1g=@lists.infradead.org
X-Gm-Message-State: AOJu0YzI5XNAvrzAHB7hyky1eTI745B0Unu0lnkyYabjbduXujJPmdyO
	Iwhvu6rvcmckN0NhRwm/6gQc6sJlx1WyjzC3lvGwiXNsf8U4Rs+/
X-Gm-Gg: ASbGncsyTbOspbD+ijmfB1Q1hcRNRrnhlIXE2IF3EZz4lAjZoMVO9wHghQa6agrJzNn
	teqV6/sXZdDmmr4CWoyAOf9dhL/RI88CHoASExb0fEwM2Evt+pijk22slNtBJW2vLvUKjSK0lBi
	Np6vAr2Wa/ILDkNOw2FBJDtHZmxIchUHJS1ZaFyJdTw7Ot+lR0URFa7k6uEVyeV5+N/BOtIoCmt
	cemSIquKW7cG+30yFSnxFwqKXSUWQHhNyV5aAENR5JgpnOsJvCNfQnXFFSsTv8jkCW9IKuH48hH
	G0O612ozNPLma10XGV7V5zOgLq2nkbL3Ndj8/StueXcEVQs2w3HNEu4vUP53jklHeB2p/XoPEGd
	R3Gi5OxTpuQ4=
X-Google-Smtp-Source: AGHT+IGXx8ir1+EZxeY6N5v7kjSeoMSS2MCJ9pG/fcIMmWsjx/6j0N5nIJirlOL33zDZIryOayb8uQ==
X-Received: by 2002:ac2:43bb:0:b0:540:1a0c:9bac with SMTP id 2adb3069b0e04-543e4c32548mr129480e87.34.1738096583093;
        Tue, 28 Jan 2025 12:36:23 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c822fcb0sm1778361e87.55.2025.01.28.12.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 12:36:21 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Date: Tue, 28 Jan 2025 23:35:51 +0300
Subject: [PATCH v3 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com>
References: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
In-Reply-To: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_123624_821189_65A0CBBB 
X-CRM114-Status: GOOD (  10.92  )
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

When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
commit 129134e5415d ("media: media/v4l2: remove
V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
no-ops, making cache maintenance for non-coherent dmabufs allocated by
dma-contig impossible.

Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
{flush,invalidate}_kernel_vmap_range calls to
vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
buffers.

Fixes: c0acf9cfeee0 ("media: videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT flag")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 .../media/common/videobuf2/videobuf2-dma-contig.c  | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..146d7997a0da5989fb081a6f28ce0641fe726e63 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -427,6 +427,17 @@ static int
 vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
 				   enum dma_data_direction direction)
 {
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (!buf->non_coherent_mem)
+		return 0;
+
+	if (buf->vaddr)
+		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
+
+	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
+
 	return 0;
 }
 
@@ -434,6 +445,17 @@ static int
 vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
 				 enum dma_data_direction direction)
 {
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (!buf->non_coherent_mem)
+		return 0;
+
+	if (buf->vaddr)
+		flush_kernel_vmap_range(buf->vaddr, buf->size);
+
+	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
+
 	return 0;
 }
 

-- 
2.47.1


