Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385576070CA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tR+pyEb4;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NivwLGAa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=; b=tR+pyEb4iAAF64
	4X75Sib1JaXw9yIdz2RDKSvfE7V1DONhqVP1vPYunsFh5EEGXvJTlxKY2mlkWMVXfsmgfj78jaPAs
	eB2Lvos11pFIMZaRs6ny49yo48nRWGG9NL3J+0p/LQqsrIDNG2wxtIcVTeMUmK8xd2Kge+YYuIRot
	2Gtf2EhYCQ6t/5JnhLn/erUqls1oGpDj8AcqaYmMaYwbXOyMqMSVlxyybgr4axx6ljREgcT/WDsLK
	TSFUWaumzYLCMfiiAcfvCf1yCDDjl0elmbbGzVoYhRXsmvqmSGbAzlOcMCi68KFuELWujmaNocPFg
	7FpNV3wbjbohC5ckQ3Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRW-0000000HOOL-1ZPn;
	Mon, 02 Nov 2026 17:03:34 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRS-0000000HOGj-2h8E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:03:33 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e0d885929so2678884f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639008; x=1794243808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=;
        b=NivwLGAatpOzbFaOeYpnvdG+LAznvMWTBbHkvlSh6b5YC4Qg52I4iOE22kb3/7yjlY
         PiiByS0gXS7Fn7Hr4pw4srhyOvtglCFCFceTz1kSq7f1xZ7WrRkmMeLovUFK70lpmWIE
         q6nW9SM7CWhjK8fQr3pemHvK2x2r8mZth7J3L7GZJBrQkNkizbU9N+HLg7LIl/Dq/8Tu
         gGMSFJfVZwJ6lZmFQ03GdCaFiv5BY/hMVq/+wldWJjOCHzBUJRAX2mXtNLM9IXENTcY4
         2St2Rw+O4Bx3w2aHtFKMZCPhj3GHtF81iTCgvWKRCdKh7AG4lie/PQFtOXGDKo0cnnsE
         djQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639008; x=1794243808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=;
        b=Fg+M3vpAgb08aJ0zbWQbO7V069SB02DkvyWH9Ye69MqUa2qvw4ZbnwkHwPkgXEsX/q
         ZL8vlFyiUxyGkioCZVgsvjNbLoOagxjXWQ4otcpj9apEUEvLXhJHimw4COw2C0id1DrW
         8J7lYGF9H0e3PuMJWdx8gndDCTS585085pNw3FBjO0nMI6VSzQ5qqpKLx6SO2lFw4YGT
         1OuczG7w1A8NMmjnVxkMI7f5y47dgzXLXmGeSrSGzHZ91mMskYdlrnVUmxuol2NazgcD
         Gj+RRCFVqMromneS1tE5sdmPUzRHcZBHlZVbmgUbwdySrwGBj1yDo0uQSIC9ynPT+Z2a
         e+Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxBLUvO+9ytyUaJI0R8cqKWpkj4ldhOGPV2H7fVJczigi4pOWFFrI0vsyLs2pKfeA2cGWad7aq2mt+hbQTChGo9@lists.infradead.org
X-Gm-Message-State: AFq9FYI/GP7/KUsS6IXjKqOEL6d2G/85YoWA1qGCkkFeNuAa5TVG2aSq
	HB0Pc4RramI1W+yqJbS0tGNyW+ijbrRc8BT+IVNklSrIIKoS6MQ64obI
X-Gm-Gg: AYBFou1L4nrseQVmW5x2D6lO9LndQGO2KlX9xTudaiOffIYNbSSug72WksPFwEIozrj
	N+NkGc+s9F9yLCILA6CsVZJ4q5Fm/TMRLxmpjaDFhe9EUYk42StAX/YIKmpGS8udV+v+cE/NY21
	aBcU2f2aB+GZ/6IXSQQrg0SNBliNAPcnfjIJoU0IhJURCa05PbxH0yGyoatdVbRhUeFKn8M8pr8
	4RRsY3zqTuBnANc1Ep73w0Q78RBXBnW9PMp1Ufxq7e1QTCTAY1E2sV5hSD0BseLA4ogLHF0kb5U
	G6GdwjCLPVMqdIKqZsyQW/QvENQ/jaQrAGVK+V658gQ318r3Pb2t6vZVd8N2zNZd4jZeU7i0pBn
	1gNCWXgWCS11vPs96+D3et/TPh9HwZ89uOgzT4tyOwjMkbRTW/1fqu+ZlbkF7UV7zQsgQCuX4h6
	hNZQoAo4puT+8LNvjOjlhacbYiOfUVtkVaODx3AG0MKl5VctPPeCgKFVrwpw7p2nDlstczc4uGY
	hhJkgBkljiVkZR7ZfgYMrrjFL62zfKIBjEzKU9g7iO/RBSGnkiGY8mmRum4rij9Frt34ckiS+wC
	ZRzmuHFnNxZVLdbcQlDL3LVpCFkYu8k7x9o6KvCS8hWdsL/Nvr4W4YbCEvMSIElqJCevu+hv9gn
	8P7g1wxPwHMv2ANbQebMddozHRSiafRJ7mbQkJOlkclCMYu1GBfYp0XqVatxfp+VS//S3qNK6KE
	wGowSBYYrCY75SQdaenqdAirMS2XGlUn4gPN3A7kdxk19FA1MBoMQpgnq0ZRGsML+QK0dqReEcS
	92ubu8Qlz2+hWWmmxnp+9ZcY4gjAZGmytXy73dteOYm1qTvog==
X-Received: by 2002:a05:600c:1385:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4ac182dc0a1mr261716365e9.16.1793639008306;
        Mon, 02 Nov 2026 09:03:28 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:27 -0800 (PST)
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
Subject: [PATCH 07/10] staging: media: cedrus: validate VP8 frame size
Date: Mon,  2 Nov 2026 18:03:00 +0100
Message-ID: <20261102170303.1973892-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_090330_763507_94B4C11C 
X-CRM114-Status: GOOD (  14.99  )
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

A VP8 key frame can change the frame size. If userspace doesn't
reallocate the capture buffers, the hardware writes and reads past the
buffers, which shows up as IOMMU page faults and decode timeouts.

Check the frame size in try_ctrl, like for the H.264 and HEVC SPS.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 45deebddb630..756243795de8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -77,6 +77,11 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
 					  height))
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_VP8_FRAME) {
+		const struct v4l2_ctrl_vp8_frame *frame = ctrl->p_new.p_vp8_frame;
+
+		if (cedrus_check_pic_size(ctx, frame->width, frame->height))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		unsigned int bit_depth, max_depth;
@@ -270,6 +275,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_VP8_FRAME,
+			.ops	= &cedrus_ctrl_ops,
 		},
 		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
-- 
2.43.0


