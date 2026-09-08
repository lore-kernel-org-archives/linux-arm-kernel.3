Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE3CC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZyOo+ygFnvVbouyZiGeNffeUNQ7tsTzDFqw1u+OtP0=; b=2D338zArkZ7b6IuI6qAoKkNiz+
	uxNDUZg2u/8awoYu95vMCrZKeFeGZeRRmyQkDrmjVXBef8Am6eVmNHRzDnxi06ZwkFQa8vweog0uY
	uEz8fpSSepXA0f6gpEEbKig+fIX2O5R1TE3CS3MspCB6r0cki8MuC2mo03rrQzCY8dWQRgrZnOXM5
	vhseWsomV5Har1nJJuksFNW+zzyhdeaok85npz5yXTn+vx27BVJZrGx8peAodSRwNOYhBbsQhjt68
	24Gj1MbdFJkSUDZ222U7KrLBniMuz9n7uGC9KwzVzlaoZCqk/EckKQRfGnA7DcdNudfo/Tf6k+GsE
	3Zn473tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3roP-00000008W6O-1y4m;
	Tue, 08 Sep 2026 09:08:17 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3roM-00000008W4l-2nNa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:08:15 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so5701685a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858494; x=1789463294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZyOo+ygFnvVbouyZiGeNffeUNQ7tsTzDFqw1u+OtP0=;
        b=W8bRN+xzAZ9IGjGahov+XvApMNwz3od71qaqE9Y3TsmjILJR1SvYzzeF+BNJzk7B5P
         xFrtqp8wBFuEbwavvfg+BnPChsqolsenYIx+tWR5xKGLjkHh6dQkzxXQfehX+YZvELUu
         efwj4wk1VcVODGU5BhPVL0HoxQ+jpJb94Q2eM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858494; x=1789463294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZyOo+ygFnvVbouyZiGeNffeUNQ7tsTzDFqw1u+OtP0=;
        b=YLnSf9szj+o7aPZYjNkxpXleaUw2aXdT3Km9iG2MSURPi2E8+hpxkd4PtQ9l6XAn0m
         zUjr5BEXOsdW1zh4bK+VhEERlnD1Z2Jnv+gbYxYuxt/iyjoACodHmET8GgHL7TBLNybv
         AX7u9KtPAHJ32XZRANFxX/ZEqA3Q7h9W6lXcnEmlMBvWSfqJtcjEpMw3JDgxweWwhjuB
         ovgiK8EgKpAwkdet0fkv7zN5w0NkmMKAtDgQPOX9Sc7Ido36zYQUdy8ji45YtG5uqzrm
         vKjY3svc15H0+z5Dt2QmkApqbMpOJHDpE80CfxtJdDX4VOUw/S5bg1ufk8ijb/yTLQd4
         yBbw==
X-Forwarded-Encrypted: i=1; AKwUvBwoYzwlIq5ajhj4BMTbyL8tRoJc+L7rYu4ykmb+onRjpxkXdrgKtdiGOr+Zfx34kerebnY6FynWQGAgMgnXxMsO@lists.infradead.org
X-Gm-Message-State: AFuF++kyvEuiM/PReoJm6qBOv6a6Ft1ibM2COnQCd3M145TH0v1wwZ7F
	TkD6acWpvtWihr2CRlGCK3k67D16eE9ZkZsu5L0D7Kbmr8n59ZQ51He505RxPaIwKQ==
X-Gm-Gg: AYBFou01LfdThoXEFgZbbz7GXs4e5E0va1oX38DWRFmGWldSHeE4KBV89tE0S8afLZg
	mhrGJNMfsYC1eBdPfOQ/2IE7G5V9x8tMRN1TcsCy70jXICuG3S7lQbMywqf0w39wFs58vEQg72f
	7gp/yAv+LhIjFw1EeayhqISK17W0xsFXB9GvU2AYC2OKRBweD0W/W2XMjH7axeZLTWjragdNqHe
	W/0nOXyVcbJPuLDJlgC+B3jC8TgUN5Y2crqoFU8sLKxanrx8zzv8i+I1RP28AtHsLkTTUhwzWTh
	VkZ4bE4QEyLjWRkFSmvDi1qDmCF1sU5+afyeVmNk4DiGNY6oIv1b5xN/WxmXoaSXghTRUxzsx4E
	1WkoHTvCbuPkpw176AHDfQC+tIffBptm/tT+5DIHHZb+Imw8J7b4g7y/p5lTh4SQEXRKUp8sUsA
	pLa8S/f1Bc+pVgxYRGo2QkjSbVJzEycIC0YlKUjdp6A+mqMHbmOux+ijiH38y9qyFFtuF3t8fgX
	okRY5OCcb8EwKDJ/Do3s0wc3JJOFEbmwsNB+xG+5a8TSSA=
X-Received: by 2002:a17:90b:586c:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-39b2623ef65mr47890193a91.24.1788858493952;
        Tue, 08 Sep 2026 02:08:13 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:08:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue,  8 Sep 2026 17:07:43 +0800
Message-ID: <20260908090745.1089143-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908090745.1089143-1-wenst@chromium.org>
References: <20260908090745.1089143-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_020814_709474_BD8380A6 
X-CRM114-Status: GOOD (  18.05  )
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

The i.MX DCSS driver is open coding drm_fb_dma_get_gem_clipped_addr(),
with only a slight difference of rounding down the X offset for the
first plane if the format is packed, sub-sampled YUV. This is likely
to correct the buffer address to the first pixel of the 2-pixel group.
Otherwise the hardware will start the scan-out from the second pixel,
which leads to the U/V components getting swapped around, and the
chroma component of the next pixel group being used.

Switch to drm_fb_dma_get_gem_clipped_addr(), and offset the address by
a pixel if the X offset is odd.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dcss/dcss-plane.c | 34 +++++++++++----------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 303e93fd036c..580d9cfb4053 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -219,28 +219,22 @@ static void dcss_plane_atomic_set_base(struct dcss_plane *dcss_plane)
 	struct dcss_dev *dcss = plane->dev->dev_private;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
-	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	unsigned long p1_ba = 0, p2_ba = 0;
 
-	if (!format->is_yuv ||
-	    format->format == DRM_FORMAT_NV12 ||
-	    format->format == DRM_FORMAT_NV21)
-		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
-			fb->pitches[0] * (state->src.y1 >> 16) +
-			format->char_per_block[0] * (state->src.x1 >> 16);
-	else if (format->format == DRM_FORMAT_UYVY ||
-		 format->format == DRM_FORMAT_VYUY ||
-		 format->format == DRM_FORMAT_YUYV ||
-		 format->format == DRM_FORMAT_YVYU)
-		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
-			fb->pitches[0] * (state->src.y1 >> 16) +
-			2 * format->char_per_block[0] * (state->src.x1 >> 17);
-
-	if (format->format == DRM_FORMAT_NV12 ||
-	    format->format == DRM_FORMAT_NV21)
-		p2_ba = dma_obj->dma_addr + fb->offsets[1] +
-			(((fb->pitches[1] >> 1) * (state->src.y1 >> 17) +
-			(state->src.x1 >> 17)) << 1);
+	p1_ba = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
+
+	/*
+	 * TODO fix address until helpers know packed, sub-sampled YUV format block size
+	 *
+	 * The buffer address for packed, sub-sampled YUV formats such as DRM_FORMAT_UYVY
+	 * need to be on the first pixel of each pixel group or block. Otherwise the first
+	 * pixel of the next pixel group is read and the U/V values get swapped around.
+	 */
+	if (drm_format_info_is_yuv_packed(format))
+		p1_ba -= ((state->src.x1 >> 16) & 1) * format->cpp[0];
+
+	if (format->num_planes > 1)
+		p2_ba = drm_fb_dma_get_gem_clipped_addr(fb, state, 1);
 
 	dcss_dpr_addr_set(dcss->dpr, dcss_plane->ch_num, p1_ba, p2_ba,
 			  fb->pitches[0]);
-- 
2.55.0.979.g7e5102b832-goog


