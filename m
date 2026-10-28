Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C4B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cPzIIxst;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=V+Q2zBFc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fJDTYkE2YZ8PG/A+DXCn/A9p4GFLWYNYpfuX/w3z+V0=; b=cPzIIxstTUE2TM4iYLjb1m8KMA
	TqVYgpms/V5fvyUQKHtR7ZqFFB/GSRQcjWgTN5PegfozX3qee0qeE7BACgg/70yXhoBKjSI2KbEVD
	wvqBoEEVI0dpjQf+vdcCUUBK3Oepo1LC6cKFEaoVN0Z/LKqyRs2OVRVTnQOUXMeF24Eh1CkQU526/
	eCfcL9iTKscBLiSvULsM5dpD0f8N4toTuaIrMYh4iWtN+CfpxDjGzzbjhVrJsFnFHmOsPl4gLLv91
	A5D+7pPthvcV+8Yd/YUqG27+iKNGa6+RT3z0/FpYCWDqUAHhE2M3EFDVrAVBaKDWEaCTi7+VdasKb
	Af+LOtlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Y1-000000072Cg-2Idh;
	Wed, 28 Oct 2026 13:18:33 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Xy-000000072CJ-1oVC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:18:31 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c37b612635bso121204766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793193508; x=1793798308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJDTYkE2YZ8PG/A+DXCn/A9p4GFLWYNYpfuX/w3z+V0=;
        b=V+Q2zBFcfdnJNXu7gxaaTHV1HCRv69DBCU1SmMXM+mO/8K9Zaci2u+dY+E5a4pi4W7
         gDJQPPS/mAGbSi0HgdRM0uMKusD5Yb/Y2htVL0R6mbDyWm9hxCtqFcT5nhSNEmPMFQun
         5NeZB2wGs64w+pBVzWPY28cIgrkPanBZ0P3c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193508; x=1793798308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJDTYkE2YZ8PG/A+DXCn/A9p4GFLWYNYpfuX/w3z+V0=;
        b=t5HwICercdEr4BMVO9hi/fMhxQqfvQbMOpgBYUcAvRU9+tWTuXcsEAR5DQGFyKwgTm
         PSyeA27hia7dM9RNTvvMygo2AGqiDZJcfSCesmgKdaCi+vaM6UbGxgO+MUGGLP7AbNtY
         1FJAnKsXRrkPv2V3Yov+YR2+K5pyKQuhKseTNOiRNfVQtz6ELSGJOJvJYKWJZ5P2SOJb
         zE3X42xQVYrddSnFdE+6wIqMWvZ9eSf6nT4acytVJS7SjzaEP3/lCOb20ObW5+E9jeIp
         m7TKWV8qLHkm3jrM8V6/Xi5MaaJ/WFkPSulZafSfvDy5RlSiazD/YDIdDRQD5IfI0E9n
         cghw==
X-Forwarded-Encrypted: i=1; AKwUvBx5Iyf4L2WeNLwTJtu4rOQlcs6mJ9VNpL8XYDmXui3oRMOrExzTmPaVg17HvPsnptyxlWv4Q5/+4OVpD6OyKuUE@lists.infradead.org
X-Gm-Message-State: AFq9FYIKHNxzP6YCv412MMIhY1J8xKj14cBWDBQ/5zrIhhQT2DmVZEsn
	/Tyzj1ZdCUauxufwq0G7UaiyBy2DlTE++pUVGKuWekifjmCqVq4B3WBFDsIV6TRDpBg=
X-Gm-Gg: AYBFou09yzI5Bma77XwJGeUu3bHs97U18HE4u/5TVR3xT5BPzW2x8rEap9EQyvMohg9
	/3DBDx7hx3y/hLEuOD4yJiZpLv3qKPQhrEgGuCtDvdya80cz/J9bKwQRoVyQAFApo2q7kvItikw
	6XH5HOyN/hV2yiLICG9khwUDXI5V/vx7HbDVyJBpWLag3dekIs3SJGtxSpKpAdXWgUkviWjF3UI
	pGGBT3kipR4si2iHpF/ab/FDQ36iXjbLFzuxgox5L03CVoMJXwX6BovyqUG2jwrhysmW/BX65Mw
	k+b1/Q6s4xOFnObeoEWtR/sTbYCT1jnQOP93bi+t5yGWM0IObWAc2Lvj+s9v13d/nOmlBCTXcrZ
	sJ5yD/mZsH/VljDsDOLVOaIu5vsf4FqqphAKECR/bbTF0K//8NX+0VKG7ivkXyyVm9a89BayNXn
	qu6ACTaKR0foEMEya3/WsLCkjFnyypK0qAToIrabJmYi0FV4wET85Mpn1JyLljUStoCRkiX1u/D
	8JyCX7N7wOEyk+Z2p9XWPqX7Qaq9KHGW6a+AOCQojJEiG896tcwq55wsaoewuiSMZ9BjsKy65/t
	K4SOgI8N4cQVnax3CIBurNofqP0LGXt7vDYDJeqIxKSk6m4oLJsxM/0B/OpyDo++Wz+odfczXYU
	0KIit4WGub4PWcaHixS4nT9vLuKKsXilHokV8PCI3nJX+/Ip7
X-Received: by 2002:a17:907:80d:b0:c45:b99:f282 with SMTP id a640c23a62f3a-c49bdda6ee2mr203173666b.7.1793193508300;
        Wed, 28 Oct 2026 06:18:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650a56sm602252766b.50.2026.10.28.06.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:18:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Daniel Stone <daniels@collabora.com>,
	David Airlie <airlied@gmail.com>,
	Leandro Ribeiro <leandro.ribeiro@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] drm/stm: ltdc: create blend mode property
Date: Wed, 28 Oct 2026 14:18:18 +0100
Message-ID: <20261028131823.2649142-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_061830_490246_94E9AB79 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

After commit 860e748bddcc ("drm: ensure blend mode supported if pixel
format with alpha exposed") we get warnings at boot:

stm32-display 48010000.display-controller: [drm] [PLANE:37:plane-0] pixel format with alpha exposed but blend mode not setup. Please fix.

The LTDC blends the pixel formats with alpha by straight alpha, the
only mode implemented in the driver. Create the blend mode property
with DRM_MODE_BLEND_COVERAGE only.

Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/gpu/drm/stm/ltdc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 5311e0b3e8dc..3b6e680c1c61 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1642,6 +1642,7 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
 	drm_plane_helper_add(plane, &ltdc_plane_helper_funcs);
 
 	drm_plane_create_alpha_property(plane);
+	drm_plane_create_blend_mode_property(plane, BIT(DRM_MODE_BLEND_COVERAGE));
 
 	drm_dbg_driver(plane->dev, "plane:%d created\n", plane->base.id);
 
---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
branch: stm32-ltdc-blend-mode

-- 
2.43.0


