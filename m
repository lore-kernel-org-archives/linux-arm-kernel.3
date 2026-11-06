Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FD2606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x4eZTsHO;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WEBPeHl2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0jFx9X9ijYmEuuqlS+6ReLoSBlbDgO7KnvPAxuJX2v0=; b=x4eZTsHOvI+MQC4lk3LgTDHG0B
	6BG9E3/HMcvAeHxb5Eavfo/2DwodkwJ17eOjz8kp2BE79IpWemv4oOZA9RXaBFfL/yQVWXVHNO54x
	xfU/B78Ueklt4BY8McyqngamuMQ//OXue4fcSTvVbx5bqVzBV85IJFq8sUpt17tksb2aO4lJblBAT
	w7A2pOKnMG6SLwQmvbbu8yM7hn3mndQllqpd4lP/TR+fos4VD6LtxP4IT8S/6y8FhqkRNKDVSMm2D
	wi9bPZIl9hRCXgUgWOyIU0stzLkAunHAiWowTd5yqlJBrCbcQZAQZnVeJKzF20dOyL7a4gwG5QdKa
	lKFQr/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHML-0000000BySd-2TAS;
	Fri, 06 Nov 2026 10:39:49 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHMJ-0000000ByRi-2c0s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:39:49 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so682719c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 02:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793961586; x=1794566386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jFx9X9ijYmEuuqlS+6ReLoSBlbDgO7KnvPAxuJX2v0=;
        b=WEBPeHl2clFAhV3FvhFyJjIgaRfIsP20aIGOwMyxhVBg2m6jMvKt4T+RHWXT7HH7zF
         PjjsET6qsXmmAsYqri+Xmm4m2OYUcbxb7G4Fe21Y1lbRyui366xz/PaAp3VOfBkz83GC
         BmaryIL2nsGQ5+WlpMPjG2CBFGb9adrMyWTfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961586; x=1794566386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jFx9X9ijYmEuuqlS+6ReLoSBlbDgO7KnvPAxuJX2v0=;
        b=THG3/cI/7Ye1iJFHCxKay2++fw6JLinwIRvNsJKQadkSRadxG4ZTAlEL+S5yDKq82/
         GvNAGnNBXwqgWyuEtW4voYTTgT6yAJwbTTadZ0+E6RmxFM8c5ssGw6xYP/5iM5CDKMZS
         VIhditX6LewQRmZuLt5ckJw9Gyt1vdcknphCwcv/pgF8bVX6sB/JOalaw67NjaaCuFAY
         TKPZIy6K+GunkGWQX9Je154+OtkF7vIeScw42FEQT6mgp1I6GJkbnl99lLl0skAghrbO
         NsYUFzZZweKILU4NcoL+LpYfvb657hIwjSOvk5bfVbBV/0Z2yXjOVxhwOfzv1788go8X
         ISIA==
X-Forwarded-Encrypted: i=1; AKwUvBwGe8oNZIN60baNzgdDk/A/C7koX7NtBeuoQuqZ4xJu2QorxzsDAsIgiXgFKHfP/cwsFjyI0K7ll0NrcrZshqoT@lists.infradead.org
X-Gm-Message-State: APuU4Z+LCOlykU0kiPXHKFhRCW8meCtM8bVcJF2/aJi3U3RR6nvl9v+b
	/l1URZAA0oti2YAGZbkueVOKEv+Tv91szbmNkK+uajRq0KCgD1iMQFSeXvedpJvwOA==
X-Gm-Gg: AYBFou1lO77UlUoOmSAi5BuPE6uHuF+6jukyOXcXQ+3wFmNVzdBspxvKLwFsLOSkOAL
	TDmSyfipkuQDPt49DrZak8ZlTJuwVZYgn1bJpSZZLe1gb5ckKfkCHIqTiI2hjX+ktV4jTtxH2Ux
	y0nkLfkKU4hXPg5PHSFB5Q9HGPL5F/t0HPmiqJUAQrcSRCQuNlk7ocisLN1w9jI+9r1imFnxWpk
	o1zOtNrmjFqBZaFlKwwU8z7Zrz0uFJy9knKWND0UFw8tYctw+bVQeNjZ+76nMkpgCn+lcgGKdMg
	/PgsrsnDjwW7mvAPHfCtt8KBfemehdAVozhhY+l5NuuId3U6y69B7gC/0I8u6zKtQmT0ekIvjyY
	f5Dp+ppC14VRb2UR5zLAooeq7mniVO8s39IAh2EfQ136HVb/6Td20veiwyHrGugv1NsalZM7kMd
	WGvR1gIppeXykg92U4VU7yRm3fasZC0qYr03tlfyeEHnl8+l4ZeKrz2Gs8N+V2HjNNuG53qHOfk
	vtVns/ylBgpu6I74yMdyTMcWwLKzudcb7fHMGlTCDGeLwc5sc515ZxRwzQPfqQ+ZsKYMEYtVWaL
	uW2c0laFMODKID5pGL0651ec8PAVjugsQeMeTYyj2uyTxPEdiHIwgxwcMR/dbTuoQudOsOrf7C5
	09iKZxEJpBGgvgMpL
X-Received: by 2002:a05:7022:fc0b:b0:16a:c6f2:60c2 with SMTP id a92af1059eb24-1b25d315d2emr2054258c88.12.1793961586179;
        Fri, 06 Nov 2026 02:39:46 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com.com (61.14.81.34.bc.googleusercontent.com. [34.81.14.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4c1df6sm5133779c88.14.2026.11.06.02.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:39:45 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fei Shao <fshao@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] drm/mediatek: Validate gamma_lut size
Date: Fri,  6 Nov 2026 18:39:05 +0800
Message-ID: <20261106103932.1219696-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_023947_699380_BCB38D6F 
X-CRM114-Status: GOOD (  12.65  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DRM core checks that a gamma_lut blob is aligned to
sizeof(struct drm_color_lut) and at most GAMMA_LUT_SIZE entries, so
shorter blobs still reach the driver. mtk_aal_gamma_set() and
mtk_gamma_set() read up to the fixed hardware LUT size, which is an OOB
read when the blob is shorter.

Add mtk_crtc_atomic_check() and reject gamma_lut if its entry count does
not match crtc->gamma_size.

Fixes: 2f3f4dda747c ("drm/mediatek: Add gamma correction.")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
- Use drm_color_lut_size() and check against crtc->gamma_size, which
  mtk_crtc_create() already sets for the pipeline. This drops the
  ddp_comp[] loop and avoids the NULL conn_routes slot before enable.
- Move mtk_crtc_atomic_check() before mtk_crtc_atomic_begin() so the
  patch applies cleanly both to linux-next (next-20261104) and on top of
  the mediatek-drm restructuring series.
  https://lore.kernel.org/r/20260714114414.184512-1-angelogioacchino.delregno@collabora.com

 drivers/gpu/drm/mediatek/mtk_crtc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 2920f3198ef6..67c2288ab8e0 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -841,6 +841,17 @@ static void mtk_crtc_atomic_disable(struct drm_crtc *crtc,
 	mtk_crtc->enabled = false;
 }
 
+static int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_property_blob *gamma_lut = crtc_state->gamma_lut;
+
+	if (gamma_lut && drm_color_lut_size(gamma_lut) != crtc->gamma_size)
+		return -EINVAL;
+
+	return 0;
+}
+
 static void mtk_crtc_atomic_begin(struct drm_crtc *crtc,
 				  struct drm_atomic_commit *state)
 {
@@ -895,6 +906,7 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
 	.mode_fixup	= mtk_crtc_mode_fixup,
 	.mode_set_nofb	= mtk_crtc_mode_set_nofb,
 	.mode_valid	= mtk_crtc_mode_valid,
+	.atomic_check	= mtk_crtc_atomic_check,
 	.atomic_begin	= mtk_crtc_atomic_begin,
 	.atomic_flush	= mtk_crtc_atomic_flush,
 	.atomic_enable	= mtk_crtc_atomic_enable,
-- 
2.56.0.455.g6c5a503b38-goog


