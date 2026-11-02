Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3F1606A599
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dN5y6nv1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fxE86qUZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=; b=dN5y6nv1FsaHYu
	DDrEGfRLr1gO5UjuHY5dka0DY7uKger3B9qwxyr5sn5vNqXphfikmDJA4w0D6IvuGgDltGY0A07+2
	gaAG83SYMYRQos5Dda4Atyc14Oqub+n5MmFl8T9p1raji0LWDUH1xXbeAo+2GRWedfUYqZ5r/9nIQ
	kpxJDHgGWagMaJF9aRY3/kW5g2P1oYUPdtvnW0VvWlf9LegQb7znb6WIWHXKVZGe6nRag99uVeU83
	HiX5BettSy1TKp4vSmD1iRAod9WLKWOrmqdhW532lJ0GqmPXTCG3obfHbdNl1vaA/9Q0YbJjM6kEO
	fCMDTI+00MB4443XZjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRQ-0000000HOFZ-3hXU;
	Mon, 02 Nov 2026 17:03:28 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvRN-0000000HOBF-09HW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:03:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1917732f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639003; x=1794243803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=;
        b=fxE86qUZAyV0B9GCaPN5VQiW0yQzYzMgFGI8o6IlIeXV0aEvHNSBrLdcTTNECA8Dry
         bvRdK2qnIwdJN5SbvGQto5ChRQfHC7alNZ4IjEPRw+71h6lBhEolt9k/s9FKRycBZ0nN
         2q5k6S/w8lF+Rv23sKOKDhT3clDlx9IIstb/5S60I988POC05aLbc4fTQT8LGekfNQA6
         Ga+Af28xcxtoh4zJ+H/COErt+Q/a9t8wQXXlLXU6Da1MQLpmL6fW+KHjgvh3BFx7wiEu
         +++ri0K+LSMPGs8AH81nqIp6ZWo8WKZQUA/c+zuHJKB7x48tyFca5Y97MGGJmrF+TS2Y
         SgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639003; x=1794243803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=;
        b=Xo7Tg8jkMdjHZFdMx3SVebh6S39vhVl/8Gw4OmGjYvhKOq+WbvC6IrKU7CDeh4FqXv
         BpNugUGS5sx8qvUelBfw54b+PK25Rwz8CXsvpN/EuKbF6ciWpFFlXJsDyuiM8d5UYBDI
         ugAuCzfbqygXoYOmN1ckWOsT1TsS/CNj3yHBbAtW4iNW/cZbllHL2ABAG/Imj1cTFjBw
         n8BlMkfOYJt6gf6ZJKI9evtzoWCf8pTVxuMcMse1v7PlVh1idx5UY079e+Vb6XWCJwFc
         Tq+ZzCoJtnErnS212d0g7nYikX5NWz9G4m32MhJNPihDtOH8QiZS2AeAT97UaxC3YhYP
         UDQw==
X-Forwarded-Encrypted: i=1; AKwUvBwI4zJTlDZLSn+dbP3UgErt3aSf1To0MbtoHKcm1gNb5aufxI11SiWybgp0Av7R0WYBFEWya9+GOxDdCf9LEufq@lists.infradead.org
X-Gm-Message-State: AFq9FYKQU206c5qKothWrz6MSiiKKtXPXf1HvZaT/YfOl91YO3XWKYAd
	Bbcz/toKKH1Tzt1L96sZ15VxFbuwq9MOmSCwQd93zYucQxKF3hzETgLN
X-Gm-Gg: AYBFou2b7ypFDxrr7qV4fRoj+2wwepaA9mBsaBJlSyKh0Ob+YSlM1f8lQ9EzB+EiVoD
	uRokq1gQ7+tt1IENX/Aq0ymGSDXJruMJHPxO9/jU4DKJEec6vOMOorwIe5fHu4daoGEiyFFngXc
	9xzOBNsrNx9mbtUPJOMOIZjZ5P0w1a4HKAYwmnU1Yip+SEChUsBs6HNkxRods5sp6mTtY8o5xCI
	Kx59WdTQ/mS2kfi09njmRRnzz/Vy227w/LSjhPQF9qvT56j3UZCCo0RZj2aXoFdRFYsSgJd9KB+
	+a+bcF4DVNCuq7CXX22afFtqVPlHCQh8kShPTKfcb2l4mANOc4CAykUOL3ryvoNiBM9LEhryAsr
	zlYw0xL5rV8v3P1dR8LtJFUFt2kckUAaNZbaDhykdZSUhIjjVEb9UcGywSmOaynzEQwlNBy4CvA
	Sv07+cAkugd5XbgU4PosHvXQNlFPdJoaZvMnQFXqeds4IV1a2spN5PEcU+E6lE2xxMsZ9Ow/2aw
	x7ZQs5f7qoVDE1qETVul0LlaRnfM4VDRFBHd/cHsLuE5gLvcpPtYv0dhiN2bkr//e5lh0dt1AAT
	VzHXe5uP2YQIollrUWbt5v4o2whQmjAlo2McERdtwcDIbv+Gj8Ta5i5Y4+SMxVMn8bVumWqd/Gh
	CRBj+2HpXJA0fOmvxcixLERbzDF1uktlUgs+m/kACxNw8AzzJ3126hA83ie3mRLj164w8vT2PiJ
	T4kx839WA4v95/A1FnHzVNRTsMU8UxJOXsf2MbuoFRN90DNsxIh6Er8mOjP0m8uTuEWB0MzIVdP
	/ZcJkGVohi67dI1KQ807Gvgk1ByS55GYXzAwyNT5xyZJUxRIQ==
X-Received: by 2002:a05:600c:a012:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4ac17b2ce18mr241875865e9.27.1793639003332;
        Mon, 02 Nov 2026 09:03:23 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:22 -0800 (PST)
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
Subject: [PATCH 04/10] staging: media: cedrus: mpeg2: use the field height for field pictures
Date: Mon,  2 Nov 2026 18:02:57 +0100
Message-ID: <20261102170303.1973892-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_090325_100649_0350BBF2 
X-CRM114-Status: GOOD (  15.05  )
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

A field picture covers only half of the macroblock rows of a frame, but
the driver programs the coded and the boundary size of the whole frame
for it, as for a frame picture.

Program the height of a field for field pictures, like the vendor
library does.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 10e98f08aafc..ca66a3c6b830 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
+	bool field;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -108,13 +109,21 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Set frame dimensions. */
 
+	/*
+	 * Field pictures cover half of the frame's macroblock rows; the
+	 * vendor library halves both the coded and the boundary height.
+	 */
+	field = pic->picture_structure != V4L2_MPEG2_PIC_FRAME;
+
 	reg = VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
-	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
+	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
+			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
 
 	reg = VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
-	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
+	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ? ctx->src_fmt.height / 2 :
+						   ctx->src_fmt.height);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-- 
2.43.0


