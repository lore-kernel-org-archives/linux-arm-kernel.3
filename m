Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F4ACDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKUs6CELJR/1Q1bIKn9jYUW7U/GC0CCNgQj6pM1EaDs=; b=TKCEvbQu7kbq+WHI52MzFwakaz
	95cLqYyEX6mJU6Rd6SYVC5a5LeC6ZIxGbyj7669qeUVHFfb4VUQavamn072GquhXgUupDXqCKO1YN
	z1ojaG8iITWCJlJDdYlq/0LYHJ6L6NM+3P/9H0cDiSZU/HN+L+PZyM/rzRiLyE5hpBAvr2LowbcO7
	LGZXtOHqu8KdL5/b2OJjKLdObjizGuwMmuoRkgN990UI7uegwDiGDbXjyy4W7aybq9NiTP4UrM05k
	LZSHGbYb1hddrIl0T05QIvRBypSydMCw5/oVhc6lETl9n9Nttc30+acDLYseKyTTvmSGk5kOS2nH2
	YffuVV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0aD-00000006Hhp-1vKT;
	Tue, 23 Jun 2026 12:50:29 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0a9-00000006HgB-1Wq1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 12:50:26 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-697e96dd8d2so128351a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782219023; x=1782823823; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKUs6CELJR/1Q1bIKn9jYUW7U/GC0CCNgQj6pM1EaDs=;
        b=RoOrK0PoPZtkt2TvDgop1E6muIUvqAdu1M9TcLu2weJToNxtFBeELjvdoi/wIpHKtt
         djOFIh80Vyn8PVvrvUzNxSytcQAeQGR6zDRXbM7jcZh/e37qTZKr7kX7spZWByoTAPca
         KjAw+NJ9NSpVGXQDcQ5Ez7k1pCGvLdIHe+rTb7NvHLudZRLfKTjzDyNSuRJ6vod3QUiU
         OqUWCbLnNMb1Hg7IUxViZroIPxkChASTtr7CzAmyDzJR54stf8BYJxsAT1c1Ff3Qyvh9
         1HgCWwAzy6wF8UmMBjuZrTBIArQdpZXnQWTQeZXJwcF+fssbkrMzpSKSSpj5PDV/OTbX
         2H2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219023; x=1782823823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UKUs6CELJR/1Q1bIKn9jYUW7U/GC0CCNgQj6pM1EaDs=;
        b=a6YtLovyaT/gu6aPrMUo7G1pkXcS5+Pg2o2LwW0nUITZr7BnWnU/Ad5qW+7TRB2Dj9
         DGAUcb7qHoqpBIoDmoeidtAd466Ep2D6fQOvpckGjz7tAMuq6i1xMCuFKcOP4eEsu/Pe
         z1EacC6mC9k+NkvCxYAZ9A2azHb9xAaOqbMzjaTRU5UkSQ4jKNvoH+jpQmNvriCP3Ovd
         TJ9T1AGxpbLUAFpDKxklRJhGkQk/W3itT8OcHbxGa4IdJPZZN0Sp5Wei2jPvJ2lGCHkg
         bFXu98X1GKjerdatYTpQzdNmB4c4VzW+ri1NIqivn7W6kqECTG/0GYaUyJxV0l8iP3Zh
         nMSQ==
X-Forwarded-Encrypted: i=1; AFNElJ92vmhGuxJiDigCjJ3xlTpJGGB2BSxld8rLDWsOeEskOhNzMJ4oRG0PHHFCv3xucuSjcOmAzdJE+uMaydg7MZ0r@lists.infradead.org
X-Gm-Message-State: AOJu0YwnGdIXKGqUAu9mgfzoYeTbeJcLiRtZhXACzT4/VTTjsUrxwp/o
	zyBqtMXqSk9GfJ1CytYzMzc5aEEna47dvdIIZ0+3yZwjuFPmv2a6dCUK
X-Gm-Gg: AfdE7cmi51S4leU/YcOzeimTBDMDuNVoQTCqoW1WiX9VsVhWcxHnKjHGSHoh5IMFgRL
	/8ErdhMpkQEEwcEqu+MzgX84Q5WVov3MnPQRFVbFIKSucXMP5mHJfDzRzoEQxiguAD4VgRZ/71O
	DOoZnZmCZ6oqTrgInewx2vMclPEhQ+m2eWRz8xjX+Fs56FFTcCKO+qEOJe4cVYU+bIdHH4I6GGv
	u2TuuF6XeDxw34pqrHr1DEboEsaEOPKAvkWwm0bDOb5a1Tj04wxEu8pd71e0UkC7YSREMbVUQ4n
	IdtrMzqpt+zOd1NpiqZIScNoqOoJZT2p2FgNEyZwOoUSoz/2/n8/FyDK8VLN4Qx46czy5fhffFl
	+zAf4pa5spRJ4J/Se8cMLkIihXq9vIEmby3nN4l5sw9NzV3REDfuOL20S3VQBI9TUCak0p4YUem
	wEJwwp4700akk5tYnufy9t
X-Received: by 2002:a17:907:ec0a:b0:c0f:cbe9:9e7a with SMTP id a640c23a62f3a-c10309ba1acmr182459466b.15.1782219023302;
        Tue, 23 Jun 2026 05:50:23 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82fd6fsm5153967a12.2.2026.06.23.05.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:50:22 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 23 Jun 2026 14:49:44 +0200
Subject: [PATCH 2/2] drm/exynos: Add error handling to drm_encoder_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-exynos-drm-simple-v1-2-bb52f098b1ee@gmail.com>
References: <20260623-exynos-drm-simple-v1-0-bb52f098b1ee@gmail.com>
In-Reply-To: <20260623-exynos-drm-simple-v1-0-bb52f098b1ee@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_055025_432633_7AFAFBC6 
X-CRM114-Status: GOOD (  15.10  )
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

Not handling the return code on drm_encoder_init can lead to silent
failure and/or a drm_encoder_cleanup on a non-initialized encoder.
This patch adds error handling to the drm_encoder_init calls to prevent
that from happening.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c       | 6 +++++-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 7 ++++++-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 4 +++-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 7 ++++++-
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 7 ++++++-
 5 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index a2095fb43483..3311674aa32a 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -99,8 +99,12 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		dev_err(dp->dev, "Failed to initialize encoder\n");
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 4a3d443a15e6..495fcabca0a1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -198,8 +198,13 @@ int exynos_dpi_bind(struct drm_device *dev, struct drm_encoder *encoder)
 {
 	int ret;
 
-	drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
+	ret = drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(encoder_to_dpi(encoder)->dev,
+			      "failed to create encoder ret = %d\n", ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_dpi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 25c438cdc744..73f7c9fe611a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -83,8 +83,10 @@ static int exynos_dsi_bind(struct device *dev, struct device *master, void *data
 	struct drm_device *drm_dev = data;
 	int ret;
 
-	drm_encoder_init(drm_dev, encoder, &exynos_drm_dsi_encoder_funcs,
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_drm_dsi_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ret;
 
 	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index b0f3cfc2a283..a639f2ee4933 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -449,8 +449,13 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(ctx->crtc);
 	}
 
-	drm_encoder_init(drm_dev, encoder, &&exynos_vidi_encoder_funcs,
+	ret = drm_encoder_init(drm_dev, encoder, &&exynos_vidi_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to initialize encoder ret = %d\n",
+			      ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_vidi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 26baf5357997..17323c9233ad 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1867,8 +1867,13 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	hdata->phy_clk.enable = hdmiphy_clk_enable;
 
-	drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to initialize encoder ret = %d\n",
+			      ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_hdmi_encoder_helper_funcs);
 

-- 
2.51.2


