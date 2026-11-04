Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2221606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PEEo4hVE;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qusBEhAY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=R3r6XsLge/zZ3OKpgQUjrLyEgNz14EMMNXZOviFfiAM=; b=PEEo4hVEC2z/0DHY/IiCl5rakw
	Af20DcBYA3Sp0klSrrY6fxo0jLlLz/GeOmZQkOpYiTjJsuwLiJfT9LrN9TOFqFBr1TOYshlrtimTm
	DUEZCPVxfr0NfQpoh2YdctK67wmPgWneaHvT08BIm2/U4MToQooI2Ldrz95M8tClvp9DEWfOdtgE0
	L5cDEogGOibgR2DRJKLP9ejwL0oCkpZaMdZUusmCTO/ttiaCppNko1zra+WEXCHWIeSUl56Vbr/CZ
	zgpvFtRS0QBkcR3/wkxWI+/9MpXhaw3uaYupf9Lm0j2eAG7+MkR4f5daAYM9TONrFx+i9IFHOTeb5
	KuM+Umag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgD2-00000006VCu-34RF;
	Wed, 04 Nov 2026 18:59:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgCw-00000006V7d-1XOJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:59:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so10096065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 10:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818776; x=1794423576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3r6XsLge/zZ3OKpgQUjrLyEgNz14EMMNXZOviFfiAM=;
        b=qusBEhAYYCVSuIsB0q2mvDd6/qEVaPsi5k7ltwvdtuNuSqIYYUd6nJx9WZL0yV5cc9
         eijkLeCUIyEJQANTQJoM5lLQn2srbS4Boy2+Cd68COBDwD+4qm3td0k6obGzsSd0vPqn
         F9yp4H8hxcki0w8Lt/VNt8UwHIEtgS6JhCyFa4lfDYz7FgXwuJw+bzE/2zu7MjM3864D
         mPvbSd+3pXQ+hMBTQh4guPcaWD1sD3dNEwZ1Xy3HNoIBmDstGvutfHg3gI/2Hc7cvRU2
         WJYgiw/cufYElDkgVxG/Iy87Cd3nT7T9QaNty8cFChuEnq94EvAq9e2ByncH7fYTCbVb
         0eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818776; x=1794423576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3r6XsLge/zZ3OKpgQUjrLyEgNz14EMMNXZOviFfiAM=;
        b=akexv1vnba5bKA2oK0ZbSAMavSfzv7+M0sNb2dm7ZyyLSo9Y4QoFdkywxX/npdAYCW
         TcOa9gse1KzMPN0gPfwF+0FObW7AuQTF33/wIbWZpyqa+Pohr1burwMLcJOikxlHKk5P
         7jLZzOJq88ZAgx6P3qA26gjeCIoxmr2imlRYhaqgcoZxMwnMSR42ivo9dmbPIbVvu431
         SiVYz/8w0wTQ+0hGcr0LYcQiWjP12gl99D5zygPe7lJWW1J3L2NgJvep2HtGF3FPD6Wb
         70pHS2TcDsy97CXI2l/RM+aY7Sp4SfNi5WBJdcVAMN9I8AcjqMQXzguqtpKw39Sn6MKl
         hzBg==
X-Forwarded-Encrypted: i=1; AKwUvBwo/815s/pgPQbe/MrID5ZdlPDxfFICV4XNtf6+fz1Oi5BAZMwgDLkqh8E4h0Eayy4+fe3ALVUI3CCd0r/dWlbk@lists.infradead.org
X-Gm-Message-State: APuU4Z8cK9SFKs3BL8kMmmLqgwojKR/bJ5m22CrZB6CIRJ9JRiaSKF4P
	x8u/PWHgvY3m3ZZu4TXsAMI9A/Sm5yE60bZX68AJfCBVhKwtxs5+HjZd
X-Gm-Gg: AYBFou0InQ5Gou3Cu2Wb7ajDqEms40p0ugae0lFe9hkmzDHwrp4Tbd8X//CrE5VGiTA
	qLRfVo6sQgLBZRIj1O/iKPyKcY2ALO611R3/3HH8A5UstodlK6f5+eMXyzF73Zp8l3ZM58VXXas
	VsXR8Yhy/hZu4dYQku/bkWfhig6XwC2a35LlwhT7ddhzs7WP0M++wLNfxT0gdlEgwd8wmk1U/9R
	vjGe8BI6YVb85Y25xd19lZ/U0oM5vit/t1vW+gu7wd3890e+AdZIYz4owbEyehjlcqw9o4uOa+A
	+lBeH1+MhWbcIIOBcsKV4otObrza0QwgV2k3cYbte+jvoQowfWXuf1QzHl2/0xsB7ryTnki0kDr
	/piiBB/wK1vYYEucQIm2w9aYIvHDXV9PwqeUalGr5njJ5/IZz7JYQ0v0o3RqNL9AZzFr1bHjeIv
	CffG6Nf7Qc5Ne37Fd2PXG9cPZjvSE4uFlIdotyW0mdM0Y834dnTH21Z+CFjhzPQuMtj66bKLhDa
	HxCTHwRKUh8dhiJuhdPYulfhTwl44ia/NMvAazrSia+Xa5XqNxS4HVz/IatoQGhtA9Kk8iFJepk
	+frsHY8i43uIVP9sB352e7jLB/8gzjP76eSWQpWkfowWYqUs/pL3ZwMC63iBhXlWDo59xYLHdK/
	2nyZ/Vu5L7iyN9U7xliMzTHatRhIruC2plowUMWJyOFNhKGXWqwDZufDt8rUkyuBrTFus1x0EWX
	0q9cItFBMhGVs46N/lx82eOnL8MRxT45ZukSkcmQsItx5/b0TFpp2TzGwvDbPG1Cq1UpixwNTTb
	+PSR+HVJNc62rhiVTVEKQnlJGv+mHDodsES2bc0I1nP
X-Received: by 2002:a05:600c:a00b:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4ac1765d8abmr383629925e9.22.1793818776367;
        Wed, 04 Nov 2026 10:59:36 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba207sm3598795e9.10.2026.11.04.10.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:59:35 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] media: sun8i-di: Don't sleep while waiting for coefficient access
Date: Wed,  4 Nov 2026 19:59:30 +0100
Message-ID: <20261104185930.885203-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105938_433737_C225EE93 
X-CRM114-Status: GOOD (  13.56  )
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

deinterlace_irq() calls deinterlace_device_run() to start processing
the second field, so it runs in hard interrupt context. However,
deinterlace_device_run() waits for coefficient access with
readl_poll_timeout(), which may sleep.

Use readl_poll_timeout_atomic() instead.

Fixes: a4260ea49547 ("media: sun4i: Add H3 deinterlace driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index 65bc426e5aac..bb90e0efa4d1 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -163,8 +163,8 @@ static void deinterlace_device_run(void *priv)
 	/* neutral filter coefficients */
 	deinterlace_set_bits(dev, DEINTERLACE_FRM_CTRL,
 			     DEINTERLACE_FRM_CTRL_COEF_ACCESS);
-	readl_poll_timeout(dev->base + DEINTERLACE_STATUS, val,
-			   val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
+	readl_poll_timeout_atomic(dev->base + DEINTERLACE_STATUS, val,
+				  val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
 
 	for (i = 0; i < 32; i++) {
 		deinterlace_write(dev, DEINTERLACE_CH0_HORZ_COEF0 + i * 4,

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


