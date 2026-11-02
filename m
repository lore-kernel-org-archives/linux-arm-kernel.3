Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4DA60AED3F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2H+JzsTb;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ywd9giLE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=; b=2H+JzsTb+kgXnG
	hn5HB35/GWal4d6U2H2RAKxuVXUYS/ugYPOp+45VqmavhcZMlAF0uU12/C7zee3zZoNSUtS9eG/EO
	21kp59LnUS0FFMcs/PSdA3eMd4LLIeNoX85mil9A9wJLjrrQz4lSceKs4Me57mPnGjRi/lHv7DiP+
	CWwhgH0wpaHPLWXbQnMCgY0pdCKM0IcBvZCcTkb6lT+s0tM0i6uSqoWjYgHQJPM311h993FqSVZV4
	xxksOPbm1cINaizwEjsy0EelMQzB00+jKR/p3N2zjO0gZsAJMkit73yzhYKyQbrwD/ZFEKppoHcVP
	oHkcIvwme70d7z+9ajgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRM-0000000HOBZ-0s5E;
	Mon, 02 Nov 2026 17:03:24 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRK-0000000HO8U-1fye
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:03:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so21633005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639000; x=1794243800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=;
        b=Ywd9giLE3Eu2NXEIWM16xIi7SMUa78hy3F7GeeHsa9CDliQItT4t25Hn3DbgUfiX6w
         pUH5upn1+SlbNlWVq/algGLBdr+BEVpvykrsWZ1f4RtNXmS3A3juK3/DZvLH4zOQxC5Q
         y8W9JXonqON5eyobZf7FtZF9CDXXD4hNu5Ugmx0nfwIGJ3QndqwnYDO9XeU8JAA7+Gr1
         vfWv+sam2q1jWTvBHZH4bB03MuNked18VTgzEDzE5mMTDDM2gFFVXSA44jfBFTmIjaci
         ZJC2ZOf/PlkI6lDscDzgk1u7MJFUXQecrqtDEsN2jK0OXI2hC8ptN0GhKuMp8DqjmnGS
         07EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639000; x=1794243800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5lmPxUQrehbk3MnxRPQzuHAZsqfVJpRH/eTUnAIWdE=;
        b=mM2NkkMnawjqwUs/I55VuttLv+s7vlTJWrg9gpFvwTDiQTQIIHr8yr2X6dm7VLoSjG
         8gritnWNVvmRuMlLaK2TrEwne4C4rwCCtuEUuaiIwicYHyEn26yGMpX36Oov5k54Vynj
         1EuxNLXzAcE1YafTDFvgjxPW20nTkDK6rahYTHAZsb2ftrofY7MFmXA189KOY0ddfmGy
         eyCaeG6IHv/6n1i4dAp4YVR44WzMW6obRHp8K/BeFj0cDTUw8Hr5Z6SqZ3RHlVyhoaFl
         KtONEkKfG73EydWx9l/okSnOue3+Isqrg6G7Z7dBMGqUZ4mGSj8+q6zutARHPqs1EpKO
         MQAw==
X-Forwarded-Encrypted: i=1; AKwUvBwIFEUIe42VwfG30bwly85BAw2cDNRQpaSQsfvW99hyIzppC9vZ9j0xYw3HMGZSUMYD7rZE8qMW0cyI/Wb72z69@lists.infradead.org
X-Gm-Message-State: AFq9FYJuaC6eweuIxJ9eUDrTNkyPUEfO+63J0TSScXzy/br/iO3QL+1k
	AZgh2iCTBq2ybetPHN0YitgWnAPMj9uJc5xB1//SHKwCQSXp7PmOtUDy
X-Gm-Gg: AYBFou38imzMOFC+Pa23aJsuO3gzZLdYWfAiqVRHgKUBvVXFSaCbTYeeeWJFx2JrcGl
	8cM6pEcuIazVIAU7KQIigMzkCUj74ugmyXZYynW9TlrAyllyG/TYBph/Fx94iuaLBPssTsZMoC1
	e0mN03Mre/F7a9B6/PTJ1OggTJxRjGRAwpjf44LYWaY08PYwcbSd3vvL+OQpDJ3g61Xoo4HWH5W
	8coBl+I4R2cDpjhb3Vcxs4v1ExWHBEhnQoCWp5A3gO7JeEf9buKSbwNuQLCNfLNK2lYvaoCjzY6
	QOp6j5k+N/lDTKEUciI9X1/QdQm+BrbHxRpQCPKWtHBDKRoA94GY3myVtjBi4gZSKHnpL7Z9S0A
	pTN+Hk5FS6spm3r3IwraNzWZPS5v/C8tdE3kTfiUFxqYNcoDtGRBwfaBS/UQI0APeDKQqben0tD
	wFSW5TwhM7Hu74i82KNX9xOOL41481lGjUaWQKWqRmtKYmbV91haePVb2h2BA5R9XTwclFyXvUk
	XqSAwUvKFwZs/oFdteMfyCDJA6N2oQKbo0/kE3TKMTgSOKaM4eJNUdOvXEFeyJCyouRXb6M56Jt
	MnTlMXzkrvZbguFrJmco+gX0YFwNahomGZkkyYMCSVW76lifXEaemf3kNOiRrIcKjNgNFrYKERE
	VSl2+TVmGABSjljGd8Uo0uRMhHm7/aDpKRGohtBqiIw4uEwOO3CHMh9z+sdSVD3zNdLPJ0VFpTK
	h89+MhTt/IvFS5a+J85CGKyvODGq5OeJVKsylOgvGvZjEqKIM0NucZAnE6Gg1rk7r+VeaPsRDap
	iPeZdSfM0t2MJ/S4+Ob4KC1hIUjJZgkNxpkwfR6N3pTzQlA3Q==
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr248056415e9.27.1793639000058;
        Mon, 02 Nov 2026 09:03:20 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:18 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 02/10] staging: media: cedrus: reject too large H.264/HEVC SPS
Date: Mon,  2 Nov 2026 18:02:55 +0100
Message-ID: <20261102170303.1973892-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_090322_475020_31F54BA3 
X-CRM114-Status: GOOD (  19.24  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hardware decodes whatever picture size the SPS describes. An SPS
beyond CEDRUS_MAX_WIDTH/HEIGHT, or beyond the capture buffers once they
are allocated, makes the hardware overrun memory and hang. On H616, the
JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056, 528x4216 and
4216x528) leave the hardware wedged, so that every following job times
out until reboot.

Validate the SPS picture size in try_ctrl. Move the size limits to
cedrus_video.h for that.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
 3 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index c3331b4f3f02..45deebddb630 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -28,10 +28,38 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+/*
+ * The hardware decodes whatever picture size the bitstream headers describe.
+ * Reject sizes beyond the hardware limits, or beyond the capture buffers once
+ * they are allocated, instead of letting the hardware overrun memory and hang.
+ */
+static int cedrus_check_pic_size(struct cedrus_ctx *ctx, u32 width, u32 height)
+{
+	struct vb2_queue *vq;
+
+	if (width > CEDRUS_MAX_WIDTH || height > CEDRUS_MAX_HEIGHT)
+		return -EINVAL;
+
+	/*
+	 * The hardware decodes whole 16x16 macroblocks, and all capture
+	 * formats pad the buffers to at least 16 pixels in both directions.
+	 */
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	if (vb2_is_busy(vq) &&
+	    (width > ALIGN(ctx->src_fmt.width, 16) ||
+	     height > ALIGN(ctx->src_fmt.height, 16)))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 {
+	struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
+
 	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
 		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
+		u32 height;
 
 		if (sps->chroma_format_idc != 1)
 			/* Only 4:2:0 is supported */
@@ -42,9 +70,15 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
+		height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
+		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
+			height *= 2;
+		if (cedrus_check_pic_size(ctx,
+					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
+					  height))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
-		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
 		unsigned int bit_depth, max_depth;
 		struct vb2_queue *vq;
 
@@ -52,6 +86,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 			/* Only 4:2:0 is supported */
 			return -EINVAL;
 
+		if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
+					  sps->pic_height_in_luma_samples))
+			return -EINVAL;
+
 		bit_depth = max(sps->bit_depth_luma_minus8,
 				sps->bit_depth_chroma_minus8) + 8;
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index adc7f255d7cf..2521315abdb7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -29,11 +29,6 @@
 #define CEDRUS_DECODE_SRC	BIT(0)
 #define CEDRUS_DECODE_DST	BIT(1)
 
-#define CEDRUS_MIN_WIDTH	16U
-#define CEDRUS_MIN_HEIGHT	16U
-#define CEDRUS_MAX_WIDTH	4096U
-#define CEDRUS_MAX_HEIGHT	2304U
-
 static struct cedrus_format cedrus_formats[] = {
 	{
 		.pixelformat	= V4L2_PIX_FMT_MPEG2_SLICE,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
index 8e1afc16a6a1..367e52158f01 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
@@ -22,6 +22,11 @@ struct cedrus_format {
 	unsigned int	capabilities;
 };
 
+#define CEDRUS_MIN_WIDTH	16U
+#define CEDRUS_MIN_HEIGHT	16U
+#define CEDRUS_MAX_WIDTH	4096U
+#define CEDRUS_MAX_HEIGHT	2304U
+
 extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
 
 int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
-- 
2.43.0


