Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36649606A322
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ujn37e8c;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tIkdV2lO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SJAvZIZ6+wa++rRxCrb9LV21I8oimG6NFA16/NhWSCc=; b=ujn37e8ceKyph+
	ERamZZLEqHoSnsqkreLxRjgV7TJZ2LW9VKZZkpj3t2cEp77jakry0YfjX7yl4n0jMaqvyBlaS1zLh
	G64RrVuoChSxtVkMBsY2tK0Z8oig+ABWmmnohLuQ9dmLuO+Xq5Gh0Xm2xBzF+yQCncT4YTZ82aoi1
	qbXKyMV7HYnb/CuxD3B+cQuYjwO4tJkjcZV4FyxLwVlkp8cR8N6TlNoKBrUN8NCcf48moz3m255Bh
	AivSzOSaGWWkVmSWVXk5MhqAKLaElQ3CpaL1iZffkjZBhne92+gBexV2Hu/jdJ2gzWmg6brKIg/Ku
	5QNhaa/U1vcdPjYTBx8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZd-00000009SLR-1Y1A;
	Thu, 29 Oct 2026 13:53:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZK-00000009S2R-3LNd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:53:28 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1251879f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282005; x=1793886805; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJAvZIZ6+wa++rRxCrb9LV21I8oimG6NFA16/NhWSCc=;
        b=tIkdV2lObrkYF98eUDVw04ZDA5PwVM6ByQ9EW/rhVj+c4Mi5NDvGGypYESJ6JdhCq3
         VXg5lpgXuo1hzJNZXAM7amZ+R/UhDIC9yPYblfLXOPW+6Hk47jRnWUSPJOt2HDG3axFC
         SbQ/6pViETl277Wc4hWTICtYVsXvhYbX8w4NbrXS/MqQInfHvroOLPJEE1CRuyxuk0Ab
         DxbYrFGBGa3qxuYLOyQpKSvrWiIEr4BD/w0SV7MxzAkr8Q19RPDX1zNBsRC2Wp/zTHBC
         rSXVIEWzQfptALI15ni+jB9TYPtn5PxSaNU+bfx5czdq0MyDHYSgDgr5nNBOWvBDWdba
         K/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282005; x=1793886805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJAvZIZ6+wa++rRxCrb9LV21I8oimG6NFA16/NhWSCc=;
        b=D3Gl1QCX8q96CLQknyqkA/MLK/YG/h+/Xj+hADKBIa97jFSs/e4FP14dLK1xmTzMWc
         THEqyMPwYRABbCxPd2LNE+OopAWQXOHmTkDC8jTjWEluTLZNDORU9f4fZap3/S2iSNAp
         Bzxa5sAApBI9EbmR03r1TsG3ftdZjqNFcSC7ZSOFKYVZSKNPfTTYVAwah2FG7Okg3NVy
         xQzL1Rk8pUeClKBbnN/pV8eQXwbd4kYh56weBDFt2Rayxc+cHbMB/Nslmi6gW+dxcPKJ
         UqwrQ9K5y31I5cJftn664hlzRmtEPH/T/xwCjYw5E+c7u6/LQPWtdY7wXbnPMRkeGOkO
         rsLA==
X-Forwarded-Encrypted: i=1; AKwUvBwsPt95yxKvuwN3xl/K6WEYYjc17xIv64FCCntpIGqiA7AekT/o50jjCfZxfijHN5b14bT5I7UawCBtPAyDSc8v@lists.infradead.org
X-Gm-Message-State: AFq9FYIsJoa8HFo8ChPvB9r86QPot9xxGikbz6PdglXLqMEibh9z5f4M
	HI9Pa8kj52xr/Zit6xW9YVeLVyULKP2O25Q3Jl9xmLMEYcCHDBY5QEQ=
X-Gm-Gg: AYBFou345LKyaFzxZ/FMb+ZGjJqPMY7cKpnSNo+Jyuoyp9eW5pUfJQyiL+VucQY6v3/
	W+NYR06cUdDsm7hh/wJEpL0js4pWBogmnK+bB2QQVdvzf+qGhG6Hal95DgE6NfgkL+gvDbfbuCB
	qYWZm0ytS5ol9PBE2Am5DxLsVKocg5hlbjuAEOFFKV6HqqHkTVuVaW/WFuUFl9dGpKsTanhjBDM
	FY0z1MgLTt3mErwjmWJZSKjSKS5gb3csQd3zdw74QWJkM8xGoayBAfVC0ad+Efh8zRdLYWJLID6
	07hhSgoCsoOY5l6xeLAoIwY2uEozEuTNUrs/vAZ9KBhcr+fRfc7QvQ8if4860qnwVW5svFfgsi3
	TkJ2s0D9KmfplHfM4c894rbAe8c0ICFSsuhVvevWRGN9fRq+fqY46DxOGaXbkRc83u7nwc5q9zK
	eWzo04At8vZPfbZ8BjEmCI84JgaEP/+wyjStops4RwlJ7IdkbGIQMlMgKiZ0lpKXRWpbjrmcCEx
	Zgi2G1OJoEeNHlj/91IQdBSyYdeaU695AyyH8rqHLt7b2TNIp9zTNbriKSzLKDDtxPImjUvkJEW
	7Dma8ZmLYVol+ZtpOcl0ndHFtaJ/wnNgIQoY5oTiQcsbn6T+tfNGSO6kFeCvi6O73cA=
X-Received: by 2002:adf:fc8b:0:b0:48d:ca32:e90f with SMTP id ffacd0b85a97d-48e5d5e0167mr10244342f8f.55.1793282004707;
        Thu, 29 Oct 2026 06:53:24 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:23 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:46 +0100
Subject: [PATCH RFC v2 09/14] drm/msm: initialize LPAC ring
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-9-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=14622;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=f8EvJqvvdp9FH4cgz4FrbTlGR+xPFycpbVbUqPhx1jA=;
 b=Dt6OFL2N3Hv33O2Q7m2QaCUpf7vR3F1zmc22Rbocf4QOj1Ni08wUyfKwBRJ9AX87bi2o7FRZP
 ZJyGCj3p0NwBn4HXCGLny+j9LZG3AZ3XzaMUQMlYRDodxwuZO930j9z
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065327_034968_F27DE0C5 
X-CRM114-Status: GOOD (  27.26  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Program all the register needed to start up LPAC and send initialization
sequence.

Additionally, now that the LPAC ring is live, make the code aware of it.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 107 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_device.c |   6 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  34 +++++----
 drivers/gpu/drm/msm/msm_gpu.c              |  47 ++++++++++---
 drivers/gpu/drm/msm/msm_gpu.h              |  10 +++
 6 files changed, 179 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..5ee00eead14c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1394,6 +1394,7 @@ static const u32 a750_ifpc_reglist_regs[] = {
 	REG_A6XX_SP_NC_MODE_CNTL,
 	REG_A6XX_CP_DBG_ECO_CNTL,
 	REG_A6XX_CP_PROTECT_CNTL,
+	REG_A6XX_CP_LPAC_PROTECT_CNTL,
 	REG_A6XX_CP_PROTECT(0),
 	REG_A6XX_CP_PROTECT(1),
 	REG_A6XX_CP_PROTECT(2),
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8b3bb2fd433b..e7bc12de650c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -168,6 +168,18 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 
 	update_shadow_rptr(gpu, ring);
 
+	if (ring == gpu->lpac_rb) {
+		/* Copy the shadow to the actual register */
+		ring->cur = ring->next;
+
+		/* Make sure to wrap wptr if we need to */
+		wptr = get_wptr(ring);
+
+		a6xx_fenced_write(a6xx_gpu, REG_A7XX_CP_LPAC_RB_WPTR, wptr, BIT(3), false);
+
+		return;
+	}
+
 	spin_lock_irqsave(&ring->preempt_lock, flags);
 
 	/* Copy the shadow to the actual register */
@@ -730,6 +742,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 		  A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN |
 		  A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE);
 
+	if (gpu->lpac_rb) {
+		gpu_write(gpu, REG_A6XX_CP_LPAC_PROTECT_CNTL,
+			  A6XX_CP_PROTECT_CNTL_ACCESS_PROT_EN |
+			  A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN |
+			  A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE);
+	}
+
 	for (i = 0; i < protect->count - 1; i++) {
 		/* Intentionally skip writing to some registers */
 		if (protect->regs[i])
@@ -972,6 +991,53 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
 	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
 
+static int lpac_cp_init(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct msm_ringbuffer *ring = gpu->lpac_rb;
+	u32 mask;
+
+	OUT_PKT7(ring, CP_ME_INIT, 7);
+
+	/* Use multiple HW contexts */
+	mask = BIT(0);
+
+	/* Enable error detection */
+	mask |= BIT(1);
+
+	/* Set default reset state */
+	mask |= BIT(3);
+
+	/* Disable save/restore of performance counters across preemption */
+	mask |= BIT(6);
+
+	/* Enable the register init list with the spinlock */
+	mask |= BIT(8);
+
+	OUT_RING(ring, mask);
+
+	/* Enable multiple hardware contexts */
+	OUT_RING(ring, 0x00000003);
+
+	/* Enable error detection */
+	OUT_RING(ring, 0x20000000);
+
+	/* Operation mode mask */
+	OUT_RING(ring, 0x00000002);
+
+	/* *Don't* send a power up reg list for concurrent binning (TODO) */
+	/* Lo address */
+	OUT_RING(ring, lower_32_bits(a6xx_gpu->pwrup_reglist_iova));
+	/* Hi address */
+	OUT_RING(ring, upper_32_bits(a6xx_gpu->pwrup_reglist_iova));
+	/* BIT(31) set => read the regs from the list */
+	OUT_RING(ring, BIT(31));
+
+	a6xx_flush(gpu, ring);
+	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
+}
+
 /*
  * Check that the microcode version is new enough to include several key
  * security fixes. Return true if the ucode is safe.
@@ -1096,7 +1162,7 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 	if ((adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami) &&
 	    !a6xx_gpu->shadow_bo) {
 		a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
-						      sizeof(u32) * gpu->nr_rings,
+						      sizeof(u32) * (gpu->nr_rings + !!gpu->lpac_rb),
 						      MSM_BO_WC | MSM_BO_MAP_PRIV,
 						      gpu->vm, &a6xx_gpu->shadow_bo,
 						      &a6xx_gpu->shadow_iova);
@@ -1289,6 +1355,9 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
 	}
 
+	if (gpu->lpac_rb)
+		gpu_rmw(gpu, REG_A6XX_UCHE_DEBUG_CNTL_1, BIT(30), BIT(30));
+
 	if (adreno_is_a640_family(adreno_gpu) || adreno_is_a650_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
@@ -1386,6 +1455,13 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, BIT(24));
 	}
 
+	if (gpu->lpac_rb) {
+		gpu_write(gpu, REG_A7XX_CP_LPAC_CHICKEN_DBG, 0x1);
+
+		gpu_write(gpu, REG_A7XX_SP_CHICKEN_BITS_2, BIT(4));
+		gpu_write(gpu, REG_A7XX_SP_LPAC_CHICKEN_BITS_2, BIT(4));
+	}
+
 	if (adreno_is_a690(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x90);
 	/* Set dualQ + disable afull for A660 GPU */
@@ -1437,13 +1513,19 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Set the ringbuffer address */
 	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
 
+	/* Set the ringbuffer address for lpac */
+	if (gpu->lpac_rb)
+		gpu_write64(gpu, REG_A7XX_CP_LPAC_RB_BASE, gpu->lpac_rb->iova);
+
 	/* Targets that support extended APRIV can use the RPTR shadow from
 	 * hardware but all the other ones need to disable the feature. Targets
 	 * that support the WHERE_AM_I opcode can use that instead
 	 */
-	if (adreno_gpu->base.hw_apriv)
+	if (adreno_gpu->base.hw_apriv) {
 		gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
-	else
+		if (gpu->lpac_rb)
+			gpu_write(gpu, REG_A7XX_CP_LPAC_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
+	} else
 		gpu_write(gpu, REG_A6XX_CP_RB_CNTL,
 			MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
 
@@ -1451,7 +1533,10 @@ static int hw_init(struct msm_gpu *gpu)
 	if (a6xx_gpu->shadow_bo) {
 		gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR,
 			shadowptr(a6xx_gpu, gpu->rb[0]));
-		for (unsigned int i = 0; i < gpu->nr_rings; i++)
+		if (gpu->lpac_rb)
+			gpu_write64(gpu, REG_A7XX_CP_LPAC_RB_RPTR_ADDR,
+				shadowptr(a6xx_gpu, gpu->lpac_rb));
+		for (unsigned int i = 0; i < (gpu->nr_rings + !!gpu->lpac_rb); i++)
 			a6xx_gpu->shadow[i] = 0;
 	}
 
@@ -1469,9 +1554,17 @@ static int hw_init(struct msm_gpu *gpu)
 	for (i = 0; i < gpu->nr_rings; i++)
 		gpu->rb[i]->cur_ctx_seqno = 0;
 
+	if (gpu->lpac_rb)
+		gpu->lpac_rb->cur_ctx_seqno = 0;
+
 	/* Enable the SQE_to start the CP engine */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
 
+	/* Enable the LPAC SQE_to start the CP engine */
+	//TODO is this needed? Doesn't fw do this at init?
+	if (gpu->lpac_rb)
+		gpu_write(gpu, REG_A6XX_CP_LPAC_SQE_CNTL, 1);
+
 	if (adreno_is_a7xx(adreno_gpu) && !a6xx_gpu->pwrup_reglist_emitted) {
 		a7xx_patch_pwrup_reglist(gpu);
 		a6xx_gpu->pwrup_reglist_emitted = true;
@@ -1481,6 +1574,12 @@ static int hw_init(struct msm_gpu *gpu)
 	if (ret)
 		goto out;
 
+	if (gpu->lpac_rb) {
+		ret = lpac_cp_init(gpu);
+		if (ret)
+			goto out;
+	}
+
 	/*
 	 * Try to load a zap shader into the secure world. If successful
 	 * we can use the CP to switch out of secure mode. If not then we
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 4d22223c3323..6e2333466d7f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -359,6 +359,9 @@ static void suspend_scheduler(struct msm_gpu *gpu)
 
 		drm_sched_wqueue_stop(sched);
 	}
+
+	if (gpu->lpac_rb)
+		drm_sched_wqueue_stop(&gpu->lpac_rb->sched);
 }
 
 static void resume_scheduler(struct msm_gpu *gpu)
@@ -370,6 +373,9 @@ static void resume_scheduler(struct msm_gpu *gpu)
 
 		drm_sched_wqueue_start(sched);
 	}
+
+	if (gpu->lpac_rb)
+		drm_sched_wqueue_start(&gpu->lpac_rb->sched);
 }
 
 static int adreno_system_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 4389559e1d17..085e1b9044bc 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -655,6 +655,22 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
 	return bo;
 }
 
+static inline void init_ring(struct msm_ringbuffer *ring)
+{
+	ring->cur = ring->start;
+	ring->next = ring->start;
+	ring->memptrs->rptr = 0;
+	ring->memptrs->bv_fence = ring->fctx->completed_fence;
+
+	/* Detect and clean up an impossible fence, ie. if GPU managed
+	 * to scribble something invalid, we don't want that to confuse
+	 * us into mistakingly believing that submits have completed.
+	 */
+	if (fence_before(ring->fctx->last_fence, ring->memptrs->fence)) {
+		ring->memptrs->fence = ring->fctx->last_fence;
+	}
+}
+
 int adreno_hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -682,20 +698,12 @@ int adreno_hw_init(struct msm_gpu *gpu)
 		if (!ring)
 			continue;
 
-		ring->cur = ring->start;
-		ring->next = ring->start;
-		ring->memptrs->rptr = 0;
-		ring->memptrs->bv_fence = ring->fctx->completed_fence;
-
-		/* Detect and clean up an impossible fence, ie. if GPU managed
-		 * to scribble something invalid, we don't want that to confuse
-		 * us into mistakingly believing that submits have completed.
-		 */
-		if (fence_before(ring->fctx->last_fence, ring->memptrs->fence)) {
-			ring->memptrs->fence = ring->fctx->last_fence;
-		}
+		init_ring(ring);
 	}
 
+	if (gpu->lpac_rb)
+		init_ring(gpu->lpac_rb);
+
 	return 0;
 }
 
@@ -1253,6 +1261,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	adreno_gpu_config.nr_rings = nr_rings;
 
+	adreno_gpu_config.has_lpac = !!(config->info->quirks & ADRENO_QUIRK_LPAC);
+
 	ret = adreno_get_pwrlevels(dev, gpu);
 	if (ret)
 		goto err_put_lpac_pdev;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 20581be10ca7..aa3d6ff456fd 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -739,8 +739,8 @@ static void retire_submits(struct msm_gpu *gpu)
 	int i;
 
 	/* Retire the commits starting with highest priority */
-	for (i = 0; i < gpu->nr_rings; i++) {
-		struct msm_ringbuffer *ring = gpu->rb[i];
+	for (i = 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
+		struct msm_ringbuffer *ring = i < gpu->nr_rings ? gpu->rb[i] : gpu->lpac_rb;
 
 		while (true) {
 			struct msm_gem_submit *submit = NULL;
@@ -782,6 +782,9 @@ void msm_gpu_retire(struct msm_gpu *gpu)
 	for (i = 0; i < gpu->nr_rings; i++)
 		msm_update_fence(gpu->rb[i]->fctx, gpu->rb[i]->memptrs->fence);
 
+	if (gpu->lpac_rb)
+		msm_update_fence(gpu->lpac_rb->fctx, gpu->lpac_rb->memptrs->fence);
+
 	kthread_queue_work(gpu->worker, &gpu->retire_work);
 }
 
@@ -975,21 +978,21 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	}
 
 	memptrs = msm_gem_kernel_new(drm,
-		sizeof(struct msm_rbmemptrs) * nr_rings,
+		sizeof(struct msm_rbmemptrs) * (nr_rings + config->has_lpac),
 		check_apriv(gpu, MSM_BO_WC), gpu->vm, &gpu->memptrs_bo,
 		&memptrs_iova);
 
 	if (IS_ERR(memptrs)) {
 		ret = PTR_ERR(memptrs);
-		DRM_DEV_ERROR(drm->dev, "could not allocate memptrs: %d\n", ret);
-		goto fail;
-	}
+			DRM_DEV_ERROR(drm->dev, "could not allocate memptrs: %d\n", ret);
+			goto fail;
+		}
 
-	msm_gem_object_set_name(gpu->memptrs_bo, "memptrs");
+		msm_gem_object_set_name(gpu->memptrs_bo, "memptrs");
 
-	if (nr_rings > ARRAY_SIZE(gpu->rb)) {
-		DRM_DEV_INFO_ONCE(drm->dev, "Only creating %zu ringbuffers\n",
-			ARRAY_SIZE(gpu->rb));
+		if (nr_rings > ARRAY_SIZE(gpu->rb)) {
+			DRM_DEV_INFO_ONCE(drm->dev, "Only creating %zu ringbuffers\n",
+				ARRAY_SIZE(gpu->rb));
 		nr_rings = ARRAY_SIZE(gpu->rb);
 	}
 
@@ -999,6 +1002,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 		if (IS_ERR(gpu->rb[i])) {
 			ret = PTR_ERR(gpu->rb[i]);
+			gpu->rb[i] = NULL;
 			DRM_DEV_ERROR(drm->dev,
 				"could not create ringbuffer %d: %d\n", i, ret);
 			goto fail;
@@ -1008,6 +1012,20 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		memptrs_iova += sizeof(struct msm_rbmemptrs);
 	}
 
+	if (config->has_lpac) {
+		gpu->lpac_rb = msm_ringbuffer_new(gpu, nr_rings, memptrs, memptrs_iova);
+
+		if (IS_ERR(gpu->lpac_rb)) {
+			ret = PTR_ERR(gpu->lpac_rb);
+			gpu->lpac_rb = NULL;
+			DRM_DEV_ERROR(drm->dev,
+						  "could not create lpac ringbuffer %d\n", ret);
+			goto fail;
+		}
+
+		//IMPORTANT when rebasing on preempt aware hangcheck initialise lpac_rb hangcheck_timer
+	}
+
 	gpu->nr_rings = nr_rings;
 
 	refcount_set(&gpu->sysprof_active, 1);
@@ -1031,6 +1049,11 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		gpu->rb[i] = NULL;
 	}
 
+	if (gpu->lpac_rb) {
+		msm_ringbuffer_destroy(gpu->lpac_rb);
+		gpu->lpac_rb = NULL;
+	}
+
 	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
 	platform_set_drvdata(pdev, NULL);
@@ -1050,6 +1073,10 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 		gpu->rb[i] = NULL;
 	}
 
+	if (gpu->lpac_rb)
+		msm_ringbuffer_destroy(gpu->lpac_rb);
+	gpu->lpac_rb = NULL;
+
 	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
 	if (!IS_ERR_OR_NULL(gpu->vm)) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 271956e7f870..2f6a96e560b9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -30,6 +30,7 @@ struct msm_perfcntr_stream;
 struct msm_gpu_config {
 	const char *ioname;
 	unsigned int nr_rings;
+	bool has_lpac;
 };
 
 /* So far, with hardware that I've seen to date, we can have:
@@ -181,6 +182,8 @@ struct msm_gpu {
 	struct msm_ringbuffer *rb[MSM_GPU_MAX_RINGS];
 	int nr_rings;
 
+	struct msm_ringbuffer *lpac_rb;
+
 	/**
 	 * sysprof_active:
 	 *
@@ -323,6 +326,13 @@ static inline bool msm_gpu_active(struct msm_gpu *gpu)
 			return true;
 	}
 
+	if (gpu->lpac_rb) {
+		struct msm_ringbuffer *ring = gpu->lpac_rb;
+
+		if (fence_after(ring->fctx->last_fence, ring->memptrs->fence))
+			return true;
+	}
+
 	return false;
 }
 

-- 
2.56.0


