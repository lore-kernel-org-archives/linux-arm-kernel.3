Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDD0CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 09:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eg9ggvkEkoQKR+hIDJPnP9lc/gF7VRqufBdsoqX52Vc=; b=iOdAKQ2AZoz8Hy
	9YiCYtZtpSexY7G1BKDBHQ+QGQ001+giKsgwZ47RWFt/H996QxuZKB/qriHRwkWgILR4muYlnia+D
	jQCA1TMXqvVzPQP8+EKBnV/57OcP0pgeFwvTVe8XU+zISJAGjlfOQDg/hGaMriYBd5UE8DxKKJmPh
	51HKbBhR4nZAf1Brn5aNktbNQZT6ghrnYFMRDyOFpxFzsmZMRpG03yLvpImEGd7U3o3ziMsOsyhRd
	J/8Sxhb4PgrAzXfMySGzOnIYZjklvnVxPhU+gDqcQz55DYSLyGg/v4E3aIo/HswAHTm/FcfC5cxnB
	kJz1FwqkCBx/nO0eV5hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFX-00000008ati-0ihY;
	Sat, 30 May 2026 09:44:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFS-00000008apX-0dR4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 09:44:57 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2bab82d75fdso75061025ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 02:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134293; x=1780739093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eg9ggvkEkoQKR+hIDJPnP9lc/gF7VRqufBdsoqX52Vc=;
        b=os+Tpt4Agfc9cAKsndlHPjAkf542T5rI/8B8/zjsWff1qkadnlwYbaPxVq2lX1pdPk
         FzLEdY4W4A1cXW3/S6YrVn8TabNbEYOyetPOUSOPX/7t41uGvz8TDPvP8LKo5bE6sidC
         T5qBZO2GkQ67kf94gfNiGbPg1R5SaIDxiDJ9cAkc2Og0n5lCoQmkkWolqDQf3mWp1Dte
         69kZXpFqp0aG6Hzxy/xaxNDo4OrZH/t/CJvDLrOeUhalIkbxnFJUBsUuEkGOlG6XOoIt
         QQLBaFHPXkHJlzi3TEhaSLIs5RlVV+1+MlSjH9y+2jHpwokhjoggjy2TIhOIwGmPsXo6
         VU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134293; x=1780739093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eg9ggvkEkoQKR+hIDJPnP9lc/gF7VRqufBdsoqX52Vc=;
        b=F1RBWegTdq9EOzR+OjBJ2TxfXof3Pi2MReWGRj4inqTY95NQDS+IALMxukVcjjq3nR
         F+u6SXiCNpDy2wV7Rk3e1tkWrHvHJl9F3ZeFHwybxfoQ+IcJIZRlMYapYbrAGkXvlapM
         we61O2kVQBXAUs1S4ET4KOWJmAIh5/KMsk40oOmVM3USe0I55JVno1+1DB6lf7vFKvT4
         +Xscnz3JvpQ5vuvOae3pEMmN3qAJQf4zm7TzVHlJvx/39oXgOv5zM6kNA1+0BXJJnDjR
         4vA8O8QB3DWqOo8LeHZjNAn+o1PRBHwqF6NhcQ7j6+U9HtSXI7LYNdlXVv3zmRuEsa/3
         6tZg==
X-Forwarded-Encrypted: i=1; AFNElJ+AtFWP4tZUtCImg5r8zNkPSihjlvQhP53mZC70D1pRu+Gj6YIeU68o3/I7sC6/bc4ruoLsK7FGm7aJQGjKT8pQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxeAlTrA+nBL6hb7yIW7hUCJlQrxJsPyD7MsfuS1ItXICiHP6vd
	dsY1y6IFOdr1DAuUo29v6IuboZHSht4AHXEyxJGFVP4n/PsRJ3F/bAC3
X-Gm-Gg: Acq92OFmmjz8Lojv42YqOvNtDb/NF3FYAtaiDVnxMEmW2dCMLYlOLc7UI8uLaZw5412
	LueSmGdt0Aq2pw7ZL8A6cpEoyUFOd/blBEcraS+K5Gyj9rAJsCDuMxxe4j/LYSsJ7+EcehMEjNR
	1M2CBZv0MCAzipMu25/cjrZu/ZL889VPtPfzLWQby9UVKkKXF0eqAayfEsPcc9wD2ic0+p41XqU
	yuDqVu64Yal8sGjSMB6nwycaxkdVJfaSUc0sRheO0tKbVuWrcd25gfFKIEp94Uy9j7z67QgUrDh
	GCTXI85AZx0/mTTGUIlqaiwZhTIkJhwKOn/GkrMuuf+WIagqKZHD+cqq9JQevSuZqa0Vm5hj9XL
	Ffv+UImwxtvLh9ZGci1LXk/x5eVqMx+oNlWocIfsW6bnP+7jTzGaWXAPwcT+1DWpiQHECPWAgYE
	kZA2R2XrKaSPmf6brVQuWAQgM6r+cat58=
X-Received: by 2002:a17:902:c94c:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2bf3686d1dcmr41074635ad.35.1780134293228;
        Sat, 30 May 2026 02:44:53 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:52 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v6 5/8] media: meson: vdec: Cancel esparser work during teardown
Date: Sat, 30 May 2026 15:12:51 +0530
Message-ID: <20260530094326.11892-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024454_199091_CCE29C1A 
X-CRM114-Status: GOOD (  18.62  )
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
Cc: Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The esparser workqueue could remain active during error unwind,
streaming stop, or device close, leading to use‑after‑free when
work items accessed freed session memory.

Fix this by explicitly cancelling the work in all teardown paths:

- Call cancel_work_sync(&sess->esparser_queue_work) in
  vdec_start_streaming() error unwind, vdec_stop_streaming(),
  and vdec_close().
- Ensure the workqueue is drained before releasing session
  state and buffers.
- Move codec_ops->drain() evaluation earlier in stop_streaming()
  using the status snapshot, so draining occurs before buffer
  cleanup.

Following change prevents dangling work execution, eliminates
use‑after‑free hazards, and ensures orderly teardown of decoder
resources.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 698a95566ad2..4884ee04b352 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -380,6 +380,8 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 			  sess->vififo_vaddr, sess->vififo_paddr);
 	sess->vififo_vaddr = NULL;
 bufs_done:
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	mutex_lock(&core->lock);
 	if (core->cur_sess == sess)
 		core->cur_sess = NULL;
@@ -437,6 +439,8 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	struct vb2_v4l2_buffer *buf;
 	enum amvdec_status old_status;
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	/*
 	 * Safely snapshot the status and clear the hardware owner inside
 	 * the mutex to prevent data races with concurrent STREAMON requests.
@@ -448,7 +452,11 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	sess->status = STATUS_STOPPED;
 	mutex_unlock(&core->lock);
 
-	/* Evaluate the hardware state using our snapshot */
+	if (q->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (old_status >= STATUS_RUNNING && codec_ops->drain)
+			codec_ops->drain(sess);
+	}
+
 	if (old_status == STATUS_RUNNING ||
 	    old_status == STATUS_INIT ||
 	    (old_status == STATUS_NEEDS_RESUME &&
@@ -472,16 +480,10 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-
 		sess->streamon_out = 0;
 	} else {
-		/* Drain remaining refs if was still running using the snapshot */
-		if (old_status >= STATUS_RUNNING && codec_ops->drain)
-			codec_ops->drain(sess);
-
 		while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-
 		sess->streamon_cap = 0;
 	}
 }
@@ -967,6 +969,8 @@ static int vdec_close(struct file *file)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
-- 
2.50.1


