Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A044F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Plscvsm4;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0rauaIkc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nPodO5AP64Dsdsqfhq9Y2o6KomJ/G83kxL2GrW1whbI=; b=Plscvsm4MxDRGX
	3s6e3u1th0wI0GaNuc8mn5b34JUSH0rIk+Zmswzq8IZc+lIcWVidM3YEDgMy+8f1K+N86u+lr0bBj
	81+zeQQq/v6n9vtUIoCXK0A9qwWqnpDayXlB9EjN2Ax0wFqg5qOS9etNgnNOlFCgbhmcoiqvUE0J9
	X3hpX1ohjfRKIAdJ8qwFEpeUdJLq5zN5BumS+nXyHvVX3vVw2KlosPpRjp4V8ZoYerv1ACnIKvPBA
	3Wf7w0QCWKMpLB8VN1x7Qo7O5wH7krMMqD2ZnOUFYp6C8qvjvE3rT+Cz85GaXkhg0xdyjUYYCGfSa
	OcceW+GDSjetcJ89PB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsVU-000000086G9-1p4V;
	Thu, 05 Nov 2026 08:07:36 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsVR-000000086FP-46bo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:07:35 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so313596a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793866053; x=1794470853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nPodO5AP64Dsdsqfhq9Y2o6KomJ/G83kxL2GrW1whbI=;
        b=0rauaIkcDvqG0XWFwfygnPVbXTNhDAUUBOubPM5fZ31eoXtjwsr4H2JVsTEVwPIKxM
         Hq+GNluXEsiSa4/vpnS3p5P4WMNXxwVuDM7Rzio2uk0Eg6oxsilw/9F0wbFktHLgtRIq
         eKKEScTCaiuaqsnRB6hqnW4VYZcVAfyEDRH+KKHKvkvwu+Vzuf3yrF/NrjcROpR3EfnF
         BbQ9wuz1HaK72G/3ZLJgWCnm92VDvwS5YHsQbKR/gEi5Pal73UpZ2Puem9UI83wzA84u
         XVKxj7FPUE9SgMeOj3TKaqf1asaSjo6T2FpUuwTK6fogkQPBCzq2jBXC246UdoPFcM5U
         YDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866053; x=1794470853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nPodO5AP64Dsdsqfhq9Y2o6KomJ/G83kxL2GrW1whbI=;
        b=T8FpRfJAa7LHQtGJAqua4ALvKnucdtUaGPjiDySnhtaiJauGG+yy/9PCEKee6UOkF7
         fXcD8YL4HuJMOegpk/K7/Jx7Z1s3fEMAPUs2/GYYTLohQ00ftMQXaL2HccDIdNizasZK
         FkuYR5dLqfMOHSonKvpBnWOvGJcIXuU2AuOxKcR+2yOZHzbmR+i6qwTU0Vqx+1HmfKhZ
         V+RxerMw0lcyGor/+TOCX1+1AvmiT9ON4iNMwGijw/m9WIZg7THntTE3I9urXTZi+tM+
         3EUZGVP7oggfgySMB0kC56i6VyiW7fyubXKokfF0LgTwmmltS6O1apzWb3xNV/GUZLyN
         xspA==
X-Forwarded-Encrypted: i=1; AKwUvBy2yd3H007GeOqLow/cYr7vjlKvehAM5Zg1I8TgMtSnSDkR0MQszfaAjK3iikVXOVHq0nbTK9MG7fh9lg68CTC9@lists.infradead.org
X-Gm-Message-State: APuU4Z/sGBu+nAjeZtEGFOJQm4UGgUm//kL79LRcmzFM/uRap2PMJJJi
	BVfXOJCgZksqVqe3/tPzP9l1gGSZfXKTSfQjUWLkzHZNG7o6wd/xnvYfEDyVirA=
X-Gm-Gg: AYBFou0ozc6AXaBWzFv7USdOHaI6LxzOAU2UrDRYNYPl4eQqX1MWyuzg2R5VcxFwN/F
	A73cVqNj+XQzdH2WcNSEBErFP84xwkjzru+/6YkBeb7RH2Avqp2L6KNfDDpTrh+u+QpEoVGdnRl
	DNN2dGvzn5H3qtrrKy3dMl1haoeu/T19vqlNLCS20+E2g4zLGMS/aZ5v9/SxSA+Y0RHS/Rm1e2q
	hy4747z2TAJPL24IFXyCDGdrQLpqRVtGhR3kCYjtxjXqmHHU3luDX+WiHJ/WxjV7T6skaF7XQeJ
	haAYE6X9EM62+BITU+uorPSDMx9cse5a2u5ri4/0vx4uabkOvi4I2TVlaNjkwJS2i5jfvWFPWE6
	nkjrRH810/42vFYgagPmoXtLqw/WLZgdLExSg5zW/CnnWQ3YOCVnSSEbsfu4ls9t+N5XlLjwlx+
	Rb2WaQjyjbl6Tq+G3LFfSE8o2iCkBffGWUgRtyM8qzlovPLXpWPSC6puemoIwjr3vAdnOCFUaGi
	xLbHu6ePTmTXvwKAAjt+t//s8uTfzXECjD30stEzH8igdTYszwCCOHJdoxQM3gDzUPvWAz6+o8u
	j+viv2KyB7hdJWKdS+nSAUvoUo6IiY2svpE7W1BITMeekyEjFDLslHJXoA==
X-Received: by 2002:a17:90b:3bd0:b0:3b0:ad59:7199 with SMTP id 98e67ed59e1d1-3b0ad59732fmr2113248a91.32.1793866053007;
        Thu, 05 Nov 2026 00:07:33 -0800 (PST)
Received: from localhost.localdomain ([202.51.247.22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3163383sm2689684a91.7.2026.11.05.00.07.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 00:07:32 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] drm/exynos: dpi: release the node after looking up the panel
Date: Thu,  5 Nov 2026 16:07:24 +0800
Message-ID: <rc-review-20261105-14-00955ac4adbd@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260916072012.1967169-1-vulab@iscas.ac.cn>
References: <20260916072012.1967169-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_000734_040689_E7606844 
X-CRM114-Status: GOOD (  13.26  )
X-Spam-Score: -1.9 (-)
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

exynos_dpi_parse_dt() acquires the remote panel node. The posted
display-timings fix releases it on that branch, but the panel lookup
path still retains it on success and failure, including deferred
probe. of_drm_find_panel() does not consume the node reference.

Put the node immediately after the lookup and clear the unused
pointer. This covers both lookup outcomes while leaving the
separate panel reference and its existing remove-time put unchanged.

Fixes: 14b6873a0198 ("drm/exynos: restore parallel output interface support")
Link: https://patchwork.kernel.org/series/1166158/
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance was used for analysis and patch preparation.

This is an incremental patch based on the following posted fixes:
  [PATCH 10/20] drm/exynos: dpi: Fix OF node leak in exynos_dpi_parse_dt()
  <20260916072012.1967169-1-vulab@iscas.ac.cn>

 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 92e8bbe9d35b..e98a9be0a705 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -243,6 +243,8 @@ struct drm_encoder *exynos_dpi_probe(struct device *dev)
 
 	if (ctx->panel_node) {
 		ctx->panel = of_drm_find_panel(ctx->panel_node);
+		of_node_put(ctx->panel_node);
+		ctx->panel_node = NULL;
 		if (IS_ERR(ctx->panel))
 			return ERR_CAST(ctx->panel);
 	}

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
prerequisite-patch-id: 8f90819fd9f71f55560dc3af57c5a0bad07bc568

