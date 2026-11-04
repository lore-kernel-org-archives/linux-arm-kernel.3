Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D645606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3bmMenso;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KpNZA4Eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5MryvWougc8oZCTNV6AOfjFxzrIHneZrJJ6z1cTNnJA=; b=3bmMenso3OnNWDu913ptHbdJnc
	+hEuGeX2zBPv3KFS1GsCAZoy4Tz1ipQXesU7DzlJGOFTVae5NtnMensLwpRBh+LqIcTrrPWCuPDpo
	MhJtD6OmFuv3xU0F8eNAd5r8ccFdEtli8PtKw8D37eJjbw9hEUA0cr5w4Fdg2c4PTVbY7orsenXuQ
	wAdzVHWbs6myAbssF60trFZa1BrMJXAFP8vKNWTxDhhRWnJ91D/tIceDyFLvIAlLkb/ACR+5zyoHA
	/OQxqLEMvMQIh7JrXcmBjEBM2/pNhoKcAwRaEtx+UADLaduknjlywKkdhRp1poSxAb8Fb2RtnD5cJ
	ijlqAn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdGs-00000005qTl-4995;
	Wed, 04 Nov 2026 15:51:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdGp-00000005qS8-2nDT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:51:29 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48b060ec084so582575f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 07:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807485; x=1794412285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5MryvWougc8oZCTNV6AOfjFxzrIHneZrJJ6z1cTNnJA=;
        b=KpNZA4EulL+kH4wd/Ba0cg5wfV9IRubQ+nYyN7ypexM+PClZh/2IXZVyaRd9SF6DoJ
         0DMGrhBtMv6bguDHosHxavjQX0a/CT4sYqW8yZ/AaQe0+KCSe5j/GVVPGpVi8UMJfn5b
         HkIYdsAT2Mot9EKBETLd5v0XhG4Cjsm9wHT6RGydZ++NvzGlh3oQIBwIICyTjTlNTiSf
         BxSJ8qA6JZGg2b3s8wEkx05TKKt05iOL04uS8O+B7q9KAA/fHDx60EZRFEZk3FlfEi0f
         20g453gcmJvE1POWSClbLCl6oPTFDbFaan5XmB/MISQ0jO9gkOBJBg3vMRxpxqytm1Ix
         IW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807485; x=1794412285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MryvWougc8oZCTNV6AOfjFxzrIHneZrJJ6z1cTNnJA=;
        b=SB2f8rGUtBsSaXnN77KngCdsIgT1Oq+MBiih2ANGtpD5V3Dm1IbsGzplTcylrCjbiL
         4vHlgEyu/j5uhaR1q2EsChNZXJP36LxYwxnrGN88S/X2Ez1uGgsVAOSDVby8RJG2J2W+
         Acb7+NGehlwidmlbsQu+TOcx2xQxOahZgWPGOdJGLuv4kl1Hnq3mCfulARXJIkOcqj6X
         1Re4Hi5BYvw4IHLQncW8NDq8aoDIAcKf3SPgCCEKi2F13SW+JqoemBvZlWFyT746vn0S
         8bcgJ3MCWB8Wjfd8RFyl1h3emnRlWzKkwnPXhTGQXCVLtUry9chPFmiYgEUxbsKDtQp8
         erog==
X-Forwarded-Encrypted: i=1; AKwUvBxx47drsKy2K8VPXCsq9EQ5+jRMErYEC8V2b+YDHPRzrKSqDK0yu5ZpBdSNw1aUyemkfYrDC2pB6CwK3awORpEw@lists.infradead.org
X-Gm-Message-State: APuU4Z9/rAuiC0bPrVEF+3m0ZguHk/SHc+gSvssj38m4OaslEaLjrPqk
	fGK/vSq/5rRPXLXBesUddeeRmRKx0my8yxpJQoOdXTi7HrFlE5J/fOAK
X-Gm-Gg: AYBFou35gzvvtktI8Od/EMk4xkCUuSqhlAW+rgttvzaEmRQdVD6gni4E4SYvKT8cwJY
	EWsso9Bci0io1JsUKrU02Huo+o06yIcPEtjLbW2QBRE6IPGoTuy0Rv6HSY7A5tIRWUizpMwTWrR
	EAhBmefIPSok+vX69zsCG35Ss7xnKR2vUHURmXb78Uu0Hhf2g956HfRAUHnXlGt6OKM5hI2fw9P
	RP+g6VWikTpFhejHzw396MhX07N28wUPt2Z6FSpzuRh8scCnfc9nopcLN1gVmBkrSz6kTrr14aR
	eu36bb6gusIWMsxtipp0t5nXb+9+QxkZDfpjeXzVVzpbO3MyrnjZfMAFc3yOiDrCEUzVrtJextS
	Srx19CxHNDBzcpLT8tccpaFFstbDyt6buuQAu5gTRTpQUVij4nuS8En4LOytSMMllJaRy8F54hH
	BJC4pzohUExfP2zqDs1rO6eDxqcM1fef5VpVFP/vu9zGVbfdx81DR4nunUzBU7dEvxr/pLASS6i
	LnLgeHKjnO6g2wInZ90zuuTyXMduKLOcROaPZVcocLoyaUxLKcLkbrqehXQFlABIhqA+m2ZUIad
	2Djj9F1Ctq/J2DVuRQpLtV0tAQPU7ON+TjBmFy7ZqfFNbA==
X-Received: by 2002:a05:6000:402c:b0:48e:76ab:7906 with SMTP id ffacd0b85a97d-48e76ab7f39mr33469456f8f.9.1793807485352;
        Wed, 04 Nov 2026 07:51:25 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac2772sm4394985f8f.18.2026.11.04.07.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:51:24 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH] drm/meson: plane: add pixel blend mode property
Date: Wed,  4 Nov 2026 16:51:19 +0100
Message-ID: <20261104155119.284708-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_075127_717588_2ADCE7BE 
X-CRM114-Status: GOOD (  14.93  )
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

The primary plane exposes ARGB8888, a format with alpha, but never set up
the pixel blend mode property. This makes the DRM core warn at boot:

  [PLANE:...:meson_primary_plane] pixel format with alpha exposed but
  blend mode not setup. Please fix.

Advertise PIXEL_NONE and COVERAGE and derive OSD_REPLACE_EN from the
requested blend mode. Formats without alpha (e.g. XRGB8888) keep the
previous opaque behaviour.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/gpu/drm/meson/meson_plane.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index cf8c90158fcf..115849a0b0c8 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -233,18 +233,13 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 		}
 	}
 
-	switch (fb->format->format) {
-	case DRM_FORMAT_XRGB8888:
-	case DRM_FORMAT_XBGR8888:
-		/* For XRGB, replace the pixel's alpha by 0xFF */
+	if (!fb->format->has_alpha ||
+	    new_state->pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
+		/* Ignore the pixel's alpha */
 		priv->viu.osd1_ctrl_stat2 |= OSD_REPLACE_EN;
-		break;
-	case DRM_FORMAT_ARGB8888:
-	case DRM_FORMAT_ABGR8888:
-		/* For ARGB, use the pixel's alpha */
+	else
+		/* Use the pixel's alpha */
 		priv->viu.osd1_ctrl_stat2 &= ~OSD_REPLACE_EN;
-		break;
-	}
 
 	/* Default scaler parameters */
 	vsc_bot_rcv_num = 0;
@@ -536,6 +531,7 @@ int meson_plane_create(struct meson_drm *priv)
 	struct drm_plane *plane;
 	const uint64_t *format_modifiers = format_modifiers_default;
 	int ret;
+	unsigned int blend_modes = BIT(DRM_MODE_BLEND_PIXEL_NONE) | BIT(DRM_MODE_BLEND_COVERAGE);
 
 	meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
 				   GFP_KERNEL);
@@ -566,6 +562,10 @@ int meson_plane_create(struct meson_drm *priv)
 	/* For now, OSD Primary plane is always on the front */
 	drm_plane_create_zpos_immutable_property(plane, 1);
 
+	ret = drm_plane_create_blend_mode_property(plane, blend_modes);
+	if (ret)
+		return ret;
+
 	priv->primary_plane = plane;
 
 	return 0;
-- 
2.47.3


