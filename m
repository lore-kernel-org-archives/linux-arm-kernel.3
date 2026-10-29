Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036F560A2620
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dcdQyvt9;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhCLpZ5W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gaJ4+9mmPD4lBBlHsni916fB1brqPSLNtulQU+Q8NCs=; b=dcdQyvt9PvvQqE
	RRStPWVCuJdGQ6toPL7dRHJ3glugFtwEDbJQh+t2d5tWoJ274lQvKvCUh5vVlfu9LjFn64mzgk2hi
	cYTlMHipx7kTakLC/berXkGdIGxMQ0y/4TRbDFeeURgE5C+8j4cl/xwhHisz4j2veW5rppx+J9Tl7
	hL3ByqwzUoKm1GGIxNf0A1RvPLE6w3QV8f+Gqx8mPSyuUpp3EZKQDiUbpv9XzxZPDlruAkOAMA+FS
	qfz+kFCWBj6G1g0G2lU78Z9GWWdRyYedIUhFNDGIBjdbRdlNLwSlVAf4HAmYD8I8aGcumqzLX/Umt
	oESenEgtWm3zhWDkn7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZ8-00000009RsX-11F5;
	Thu, 29 Oct 2026 13:53:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZ1-00000009Rn3-1vK9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:53:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1249511f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281986; x=1793886786; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gaJ4+9mmPD4lBBlHsni916fB1brqPSLNtulQU+Q8NCs=;
        b=UhCLpZ5WVjPgS/ubUH6tnLzix+pMwSAOPoCG9f6gi2KNH/WPn5ihE9TuNDnMYQIoWD
         uXGpgeZu1g/mdy2H0ModM9kUsURsM3wU0H3NGQZIis86O4nIQZx0FRSytg6ykmV9ewo6
         kuNsaWk0v6vV5ikrLOu5+9kE1lVzCgd9b5ukPghNictpyEzCzEBe1V9gjwXwy3yoj0j5
         dhbpyZ47X6Knirzoza/w5QczinxD1R9075VXv4E9qc2dcDDYfuyCJfFTAJa4+gmiTHFI
         j8gkh3owg3luwS4L8v1ftKVX+pMufniNx7LDy4j4eolKjbgClbHR1EHVZSvu415s52dn
         OpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281986; x=1793886786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gaJ4+9mmPD4lBBlHsni916fB1brqPSLNtulQU+Q8NCs=;
        b=ZTw3aPtt4HTqbUTBmGedAUtoXNz3H8pppdFWS0yxP/PqIecYUvrIuLVqqRqw/BVbMN
         ihheERqzRuPHM54/nJ+GxUPvz1mWNWJZsj1Wdd8RhLU+Qko2DarNPPYA7PByFYlkUsYz
         zqfKen10w8HCjZGotiwxk8tKGTeB2EppuC0s0fLYvEHZKr1Xth+kGAgym8q8b6ms/0lA
         4qeJA8z0Ltu+ifI/cZ6Q53VExfy1hzZgpU8gg/jwn6z+2++JpuWX+eYVDtMK+d3eMEI2
         RZWdz7WQuW59IjgxFujf6uQ10BXn3/WxTK+7soRj+hAc2VvKWZO4nP9ujb1O9lB87Lce
         bZmA==
X-Forwarded-Encrypted: i=1; AKwUvByqqaag2f9kBPAfaZT9X0pTT6Pkxd7mc/ykiO7LdEOR3BfqTm+BWmsQvmPUeCkUjhK4LdWTRvXBHAaV1SDF183K@lists.infradead.org
X-Gm-Message-State: AFq9FYIfO+5AI9GG4vS4xl154iBtJPT2ZXSt1aSfwvDSt9YWNta0AhlV
	MXINK1zY7wMbbzYGSiuh3LGQTaTihqynAwuHOBVkMolzHCrlybw1rmg=
X-Gm-Gg: AYBFou1Q/BgoF67MVrGkzdbCx4Ln6M9QWEdNdoeEN5cpL4GS6Vt/5/xMmT+DipudzZl
	hEKWL458278XYTo+LUNsMwrvO7SECxzDHkaDEFfcjmgbRvJHnxwflaHD241ytj/RHEjG4JpmKzB
	YNLVfg3kERXnEi7azzJvVnxkvkQ44ouUir9RKxeuL8PoVd5QKU3/HIw0g5TB9YGQdCjgh0hFA5S
	BMDCHsbg+hr7p62PKchNcPA5ziVguKwDwoPqAXveBr8bb9juxYFy0CZs6YL5QhsopZ6T7VD2pe1
	f9SC+M/BG3ul6nJrOAvflTrgTiMWN58cYOXqBO+e8Gnh6zdEKq6/DYieeertQU52WGu3ZX+0IrS
	pBYYg6G2fAMK0UHaZh002Eg8IsAEjD/qtjl4Ow4VOyBr3VAwtqQR4BTSzKdA0Qt/YyGGiyGbYyu
	2TA8ROIJ6NOcElF8/m34gixlTFawBN4DnBXx+Z13Cv+g6rXI0V5sTvS+316jzSav0P/El/phVBt
	r0Mw73ul4tXQuBBfgiPyqI53HV4jm2y6hDHmReWlscljEV6UHznv7rGoJ6lg+TMHPmzmM12w584
	N/L/RDfHxwSfjErT6Ar4NoRkHCerc3BvhtLFZwfXs3WsYw==
X-Received: by 2002:a05:6000:200c:b0:48b:116d:56fb with SMTP id ffacd0b85a97d-48e5d567e85mr13366844f8f.1.1793281985638;
        Thu, 29 Oct 2026 06:53:05 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:05 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:40 +0100
Subject: [PATCH RFC v2 03/14] drm/msm: look for lpac from dts
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-3-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=6436;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=XpQ9AteTwMtLcsxYohB2gJNeRwk7JfV+tvwdBjYtlVM=;
 b=qJvSiqvDD9GrBlIaJ1RKA9o8A4IaM3JohySZtd/JVEOLdgV49X0tKEgfd5R3pjwNDTF4Zh1r/
 nkMzJe2orBYCYxYltUajmFOI3R3Mior3UrbO69vtb5EGuRS9UYNb5Ry
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065307_563801_7EF00118 
X-CRM114-Status: GOOD (  22.95  )
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

In order to associate the SID used by LPAC to it's own domain and
context bank we need a separate node on the DTS.

Add the code to look up that node on initialization.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 36 ++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_gpu.c              |  6 +++++
 drivers/gpu/drm/msm/msm_gpu.h              |  1 +
 4 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7f20320ef66a..4d22223c3323 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -6,6 +6,8 @@
  * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/of_platform.h>
+
 #include "adreno_gpu.h"
 
 bool hang_debug = false;
@@ -271,6 +273,12 @@ static const struct component_ops a3xx_ops = {
 
 static int adreno_probe(struct platform_device *pdev)
 {
+	int ret = 0;
+
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (ret)
+		return ret;
+
 	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
 	    msm_gpu_no_components())
 		return msm_gpu_probe(pdev, &a3xx_ops);
@@ -282,6 +290,8 @@ static void adreno_remove(struct platform_device *pdev)
 {
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 
+	of_platform_depopulate(&pdev->dev);
+
 	if (priv->kms_init)
 		component_del(&pdev->dev, &a3xx_ops);
 	else
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f3fc7032fadc..1dedeb19946e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -11,6 +11,8 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/kernel.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -201,7 +203,9 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	struct drm_gpuvm *vm;
 	u64 start, size;
 
-	mmu = msm_iommu_gpu_new(&pdev->dev, NULL, gpu, quirks);
+	mmu = msm_iommu_gpu_new(&pdev->dev,
+				gpu->lpac_pdev ? &gpu->lpac_pdev->dev : NULL,
+				gpu, quirks);
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
@@ -1187,6 +1191,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const struct adreno_gpu_funcs *funcs, int nr_rings)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *lpac_node;
 	struct adreno_platform_config *config = dev->platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
@@ -1200,6 +1205,18 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
 	gpu->pdev = pdev;
 
+	lpac_node = of_get_compatible_child(pdev->dev.of_node, "qcom,lpac");
+	if (lpac_node)
+		gpu->lpac_pdev = of_find_device_by_node(lpac_node);
+	if (gpu->lpac_pdev) {
+		pm_runtime_enable(&gpu->lpac_pdev->dev);
+		if (!device_link_add(&pdev->dev, &gpu->lpac_pdev->dev,
+				     DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_CONSUMER))
+			dev_err(&gpu->lpac_pdev->dev, "failed to link to lpac device\n");
+	}
+	if (lpac_node)
+		of_node_put(lpac_node);
+
 	/* Only handle the core clock when GMU is not in use (or is absent). */
 	if (adreno_has_gmu_wrapper(adreno_gpu) ||
 	    adreno_has_rgmu(adreno_gpu) ||
@@ -1221,8 +1238,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
 			ADRENO_CHIPID_ARGS(config->chip_id));
-	if (!gpu_name)
-		return -ENOMEM;
+	if (!gpu_name) {
+		ret = -ENOMEM;
+		goto err_put_lpac_pdev;
+	}
 
 	adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
 
@@ -1230,7 +1249,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	ret = adreno_get_pwrlevels(dev, gpu);
 	if (ret)
-		return ret;
+		goto err_put_lpac_pdev;
 
 	init_completion(&adreno_gpu->fault_coredump_done);
 	complete_all(&adreno_gpu->fault_coredump_done);
@@ -1241,6 +1260,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
 			gpu_name, &adreno_gpu_config);
+err_put_lpac_pdev:
+	if (gpu->lpac_pdev)
+		put_device(&gpu->lpac_pdev->dev);
+	return ret;
 }
 
 void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
@@ -1256,4 +1279,9 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 		pm_runtime_disable(&priv->gpu_pdev->dev);
 
 	msm_gpu_cleanup(&adreno_gpu->base);
+
+	if (gpu->lpac_pdev) {
+		pm_runtime_disable(&gpu->lpac_pdev->dev);
+		put_device(&gpu->lpac_pdev->dev);
+	}
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 18ed00e5f143..20581be10ca7 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -963,6 +963,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		gpu->gpu_cx = NULL;
 
 	platform_set_drvdata(pdev, &gpu->adreno_smmu);
+	if (gpu->lpac_pdev)
+		platform_set_drvdata(gpu->lpac_pdev, &gpu->lpac_adreno_smmu);
 
 	msm_devfreq_init(gpu);
 
@@ -1032,6 +1034,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
 	platform_set_drvdata(pdev, NULL);
+	if (gpu->lpac_pdev)
+		platform_set_drvdata(gpu->lpac_pdev, NULL);
 	return ret;
 }
 
@@ -1062,4 +1066,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 	msm_perfcntr_cleanup(gpu);
 
 	platform_set_drvdata(gpu->pdev, NULL);
+	if (gpu->lpac_pdev)
+		platform_set_drvdata(gpu->lpac_pdev, NULL);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e2291dfe3ca8..271956e7f870 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -172,6 +172,7 @@ struct msm_gpu {
 	const char *name;
 	struct drm_device *dev;
 	struct platform_device *pdev;
+	struct platform_device *lpac_pdev;
 	const struct msm_gpu_funcs *funcs;
 
 	struct adreno_smmu_priv adreno_smmu;

-- 
2.56.0


