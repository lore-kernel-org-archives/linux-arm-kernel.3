Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E844606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t/sjt5Nb;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=d6BnUz4G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZRGJdN+0ZU0Q+8Po4r5uRyGAvRT/GQRrEp1MKzJo7zw=; b=t/sjt5NbgPgxJhgcLY41Sa+K+J
	C/rUR8o3Tvu3/aYyGWznJcc+GyDe54g6e/ipNu+DE+DoN/XWyKh9xuYfVBYiZXzCH/9IF4KN33AHg
	8/mOeprrauimlZcKInfWwOvE+KYgSsMvZmm2VEEFN5FtXHx8RciT8Mnf7yW+FiPcw+ny6Lh7NnjXw
	eHL9rK25LoVCIUplvA1bhaAsk+5tmjvjwd4+ADmKNPc7/C7kJcO6jko7FCRkurQHZ2PKDbpytQEL+
	/1H3586LY6d9WBSxCgLGGBofBU4dsCOZvFOuAraqkSnscFMICvYSe8l8d7zYxYsOZtoWlZXu5iBxh
	SF32PtPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtVI-00000008G28-07KA;
	Thu, 05 Nov 2026 09:11:28 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtVE-00000008G07-0T7U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:11:26 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-15dd124bbe7so944066c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 01:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793869882; x=1794474682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZRGJdN+0ZU0Q+8Po4r5uRyGAvRT/GQRrEp1MKzJo7zw=;
        b=d6BnUz4GSoDzvKXFi3nJABLaY5E0bzbh0oi80FT3ykuNyXDw7N2aCwLJ0ywZG2NLvC
         E66l/GtMaFHqdMHwnR3AY0ku7nAxxn8DBw7RbJs5uR1JYvDawM52G+ML11cw019p35N/
         9rPZ+TUD69ZRVWHkm23d8XqXAzGvydzjx3wvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869882; x=1794474682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRGJdN+0ZU0Q+8Po4r5uRyGAvRT/GQRrEp1MKzJo7zw=;
        b=DQAlMu6Smd4HWgb7/t1tyFW8cw3zTNBOXZIbG/x8QnPD1cdKwBRiu4YHynw1+aWU/u
         kccqtE3aSsQsv1hKgX/G25hqnt3kWWYUR+ks8G7V6WtMFbyfJMNQXBg5+xgHMDkYe1za
         H87tIINXhW+bPWAURbjHnQTwMtKEKByR7TYiWiikEE11n9UbqGJUDxoymVHi6hq8ObyA
         Yq4g7Pfp4wgPMIAJ/5o8ytYszaGNa8TxE3uppC5GKKH5SaX8wk8zWv+VLIWZ9AalCweO
         rQ+owfxtZTRqeQxFjZQ84Hg1bwLiNk7QX41LvPSCuIBhW9hykzSW/8mqKqm0BPxK5ws1
         HmqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBz89qR9+I7CR9B+lPSjfzwdu7t7vP9moTigAFH0IkknIEbAxmmZOb281nc8gcLQGnq0Qxbb2PaasLe5oOrNan@lists.infradead.org
X-Gm-Message-State: APuU4Z9zY3nW/nx3cAjnweraWQ1nH0YbJqqagBMnUOfk8d6962agkZ8b
	jhCfP9RV+OAweq7u4KlxWPr/E+bYIEkMrcdfaEhUUvFq+hdKRZgS7F2l3BKx5xFLcg==
X-Gm-Gg: AYBFou1yBdzHByZpkHyvb89u9zyD5gU/J3C+wynkn0dr+5cs4pQlIYWEZ2IHqdcv8dW
	ivx8ds2E0kd3qEqH303MrJllxE8m7K0KD62pmCGqFL00mRe9FTztzIRkay+Lp+g0gDTVRYrv3s/
	up0twtenZyzH6C4YpS0kn+FrLJVDhyynNGExJqrAaDxHGG4HZu7FJnpT1XJqKV+w9av8cGjTY0d
	xZujFU04afYUWX+IGj1H6w9VgMHWZGHdkQo6QDrLxJNpDes1IZUdUFou010ocp3x2oczniN61qC
	x9PNCTLWu/R38fG+k3pgFW0QX9QPm6XrEiogn24PCfjmWNDis5ONYL01gqP87WWCNQUYq9s1FPw
	KADzgcOb+a/doT9RzV5xQrLcODZj89kIE7MlSVnMHT5wUyyIcpMftlT0vEqU16GYuWaJIVmVJFL
	dIFy8C1+H1f1bQnXoLH8g9S17C9ovsQ7eo9k5+qDEeFd27GSP46WylXYY4Tohu35IlrGUftBHfY
	dvFn/dEuHaxtMaS7dOsCAIB74+odr9S4zPopPhdqB9lKqYv2rEdi2sDKWHxmPox3MPnpKCx6jEp
	ftF4y443bbhP7xFgiZPbH3QnHtwfaFUDzo4Qo8hrxyCexHWHqpEzH3H2Zw9uMQsQZeJv8BoJD8N
	4V1GLoNEhDyxVEeQhd44nl2HXlhTRSUB2Z9Misg==
X-Received: by 2002:a05:7022:eb42:20b0:186:4a57:94e5 with SMTP id a92af1059eb24-1ac5c272744mr29105381c88.34.1793869881711;
        Thu, 05 Nov 2026 01:11:21 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com.com (61.14.81.34.bc.googleusercontent.com. [34.81.14.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm20117002eec.27.2026.11.05.01.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:11:21 -0800 (PST)
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
Subject: [PATCH] drm/mediatek: Validate gamma_lut size
Date: Thu,  5 Nov 2026 17:10:43 +0800
Message-ID: <20261105091054.3993611-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_011124_163948_38162AF8 
X-CRM114-Status: GOOD (  14.13  )
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

The DRM core only checks that a GAMMA_LUT blob size is a multiple of
sizeof(struct drm_color_lut), not that its entry count matches the
hardware LUT size. mtk_gamma_set() and mtk_aal_gamma_set() then read
the blob up to the hardware LUT size, which is an OOB read when the blob
is shorter.

Add mtk_crtc_atomic_check() and reject gamma_lut with invalid length.

Fixes: 2f3f4dda747c ("drm/mediatek: Add gamma correction.")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/gpu/drm/mediatek/mtk_crtc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 2920f3198ef6..fd9b51fd00ea 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -880,6 +880,26 @@ static void mtk_crtc_atomic_flush(struct drm_crtc *crtc,
 	mtk_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
 }
 
+static int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
+{
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_property_blob *gamma_lut = crtc_state->gamma_lut;
+	unsigned int lut_size;
+	int i;
+
+	if (!gamma_lut)
+		return 0;
+
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+		lut_size = mtk_ddp_gamma_get_lut_size(mtk_crtc->ddp_comp[i]);
+		if (lut_size && gamma_lut->length != lut_size * sizeof(struct drm_color_lut))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct drm_crtc_funcs mtk_crtc_funcs = {
 	.set_config		= drm_atomic_helper_set_config,
 	.page_flip		= drm_atomic_helper_page_flip,
@@ -899,6 +919,7 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
 	.atomic_flush	= mtk_crtc_atomic_flush,
 	.atomic_enable	= mtk_crtc_atomic_enable,
 	.atomic_disable	= mtk_crtc_atomic_disable,
+	.atomic_check	= mtk_crtc_atomic_check,
 };
 
 static int mtk_crtc_init(struct drm_device *drm, struct mtk_crtc *mtk_crtc,
-- 
2.56.0.455.g6c5a503b38-goog


