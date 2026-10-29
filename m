Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63002606A833
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ui5pnA54;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B9Z3f71K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T/SMmhEanFf2ZRlLzrXMdAPzQTHRLaYYpOnEMjr9oaE=; b=ui5pnA54HUmY6s
	jzv4j2VjbaJoeJGWciqrGtVIvVDqM3rpriFvZ522+R33inbVJBbt83zfcM+tJWL64+BjrSOB/rq4Q
	4hFu3JD4cD0IxAl9cGWv+de9Bqa1PrOrNeJthTwXCgGDIIZgnPP/AShiQgOmPsF1MzVY6MnbJlNJO
	2jNcQY6CczVNccfKIf/3mFd40K63rlAX5nINmbHfqXS3syzHEmrZsHtgaaKIOGQpE1ynCwPBPpnU7
	dIKJoFvaLKBTBSn42a+2EVFt7AcfO+Bj04I3yl6iQYw/zARnW3edYcB59JXA0A3LkUiVdsuRZGY8a
	mDgFDpArOXM3J/gMQf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZP-00000009S6J-0BpE;
	Thu, 29 Oct 2026 13:53:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZ7-00000009Rqt-3kaZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:53:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1780576f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281991; x=1793886791; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/SMmhEanFf2ZRlLzrXMdAPzQTHRLaYYpOnEMjr9oaE=;
        b=B9Z3f71K6AhlHrfCPTkqQu74uzxgjeq+BjTiNfeV7qLH8sQ09MRNQqx5sB83cd6eIh
         pfGZO56dGn8v3X09cxXtoGrbJOnmBWUxKfv133GDhSThQMihXQn9eGIMkQDAUjn8NFpV
         c1kMTvWP5GZRUZeuI1XTo50NWNuMAjKAPOJqLzS3QX5q3Ib4yxYKJg7pzbsmoIQd5YC0
         VBNw6fOeXtM/kZ6BCeMOyXhj/W+QCRyXY29B180ZeFvrd8UZa5QcSy4N7hzJFKixlMVK
         Dis25LRgrEU7kU1oDIUwacsK4Iw2ahEjZA/5iEVLP9QEzrK9iZJzNyUZ/vVZ0NBKiZpl
         S+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281991; x=1793886791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/SMmhEanFf2ZRlLzrXMdAPzQTHRLaYYpOnEMjr9oaE=;
        b=Q94iLu9uPTbLrGxM4TN6NIoqxT4a0zMY/D/NXqwC+REYNkN7n+C+6W6jcXNouutQjA
         6KNY2bYzzDo14DikYP9KQAH8rTpZjyc0tFoKGP35FY7wKAFc+Ncg308FuYrDPF3HCRsJ
         uP3UWX6LEGKaWe8TWoV+p6qhGMNooVQzN//23xy+NzvQzufbxHdWBuC8ARAX2Gjy92Vz
         3adDDzrUUxTyr3N53iKlckndZ8yMYDScJWRLeN1MtXKwYvNexy7Sk/13NAt1KnQAmT1F
         WqWYkQHC4Ihp1bijKpJRCI75sRQWyCxmxcrRSpr2sJANyUPICegKZMv4xHTsijjIVKkF
         d2HQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMXrzDkBoaFllZqyGkOU92I+NlPZOPKt4UDmZupk6rCt3zkf/AyKwfBRa5b0DBHUXr7dQlEhcHLuvfNGtK0ufn@lists.infradead.org
X-Gm-Message-State: AFq9FYJp6qLafwDdMKfHaTkDzLoNFpPPT6+Ubp7uxbHDNwFD28ATFpKa
	otKRRXIVkToHFqrrSCBk+dcvBqpN4svbxTeL1oKQnLfNBc7Qk8STm98=
X-Gm-Gg: AYBFou2+6mo3yfQyJCpIlgHccEGgcI5pGsvjVO4btCCM2wZhfC46ZuFxlvvnQwe7Btw
	7CfiU6RtpGG08SINRExzB7Qr7WVWnpETFIja5JXv0PxkTF4qcKpgBXupy/yIa+WxX9mnmZMI5AM
	xisV2Kvcvv+VrnBs12Tf6JSR9hJiNcVK8LOsdagB3a9dxPx56ugobKjKcoCRZyTmQoG2F5B3KbM
	cxvY0XJOA3DSON56M/EV1M6zxZ6i7os3KgT3UnJSh0ewZBrUwybORN6Pg7aL+kEkYJkb4OKAbnq
	+xSbwbpHlTQbLXQMcsAOcjpAIn+EKSnGpk2t8Ed56y+sD+i4TUiQZhvBdkVTaLiPOVTDSChH/kL
	xsDkWXxhsGts3OBW9xlQWZToVs3viiEZyhqqdPweeNbPegUf0yAIDHjNvadbS5Q0gewqzsdyYKU
	t+Vg8tJRIbmOcVjYdrVJFralB2FziXvsAkrF4ZFv5AIyHtYyBVqfASKmEnYCcLOPM1YrCGvWDEL
	JpW5bcNz/BtrmRu3nYztnuAc8xM476hlm2nJNviZYzVMnaoM60wWri66MMkWrQJBx3I5JjoC/Zo
	hsnbYJ5RpiCxeESzGadPSbgNOMt7HYk0Ciepke1jmuzEBw==
X-Received: by 2002:a05:6000:989:b0:48b:123e:2f5c with SMTP id ffacd0b85a97d-48e5d2f2222mr13148384f8f.29.1793281991354;
        Thu, 29 Oct 2026 06:53:11 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:10 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:42 +0100
Subject: [PATCH RFC v2 05/14] firmware: qcom: scm: Configure LPAC aperture
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-5-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=4016;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=ivUR5Pb7Po44Alwx0ZT6ubl1ZzDqmOPjsdTHTPY8+aE=;
 b=CzZBZhvXfsPR7VJKCtyL4sntORzIwyrw5dpz/xoNsZ5uORTwXp8jhcD9HDV0cCBFD+qYUv+9N
 gi7Oj1wgVHTBJ0bjH6egCOnjdXcy2F6zKpvCrmki17UM3EuffiJgPc1
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065314_224206_7397E1DD 
X-CRM114-Status: GOOD (  15.76  )
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

In order to be able to update the SMMU registers from CP for page table
updates we need to configure the LPAC aperture to include the context
bank that will be associated with SID 1.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c        | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 include/linux/firmware/qcom/qcom_scm.h  |  1 +
 4 files changed, 26 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..92093399f20d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1204,6 +1204,7 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
 EXPORT_SYMBOL_GPL(qcom_scm_restore_sec_cfg);
 
 #define QCOM_SCM_CP_APERTURE_CONTEXT_MASK	GENMASK(7, 0)
+#define QCOM_SCM_LPAC_APERTURE_CONTEXT_MASK	GENMASK(7, 1)
 
 bool qcom_scm_set_gpu_smmu_aperture_is_available(void)
 {
@@ -1229,6 +1230,23 @@ int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture);
 
+int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
+		.arginfo = QCOM_SCM_ARGS(4),
+		.args[0] = 0xffff0000 | (1 << 8 | context_bank),
+		.args[1] = 0xffffffff,
+		.args[2] = 0xffffffff,
+		.args[3] = 0xffffffff,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+
+	return qcom_scm_call(__scm->dev, &desc, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_lpac_aperture);
+
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
 {
 	struct qcom_scm_desc desc = {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1dedeb19946e..65d34d0cfc38 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -658,6 +658,7 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
 int adreno_hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct adreno_info *info = adreno_gpu->info;
 	int ret;
 
 	VERB("%s", gpu->name);
@@ -668,6 +669,11 @@ int adreno_hw_init(struct msm_gpu *gpu)
 		ret = qcom_scm_set_gpu_smmu_aperture(0);
 		if (ret)
 			DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU aperture: %d\n", ret);
+		if (info->quirks & ADRENO_QUIRK_LPAC) {
+			ret = qcom_scm_set_gpu_smmu_lpac_aperture(1);
+			if (ret)
+				DRM_DEV_ERROR(gpu->dev->dev, "unable to set lpac SMMU aperture: %d\n", ret);
+		}
 	}
 
 	for (int i = 0; i < gpu->nr_rings; i++) {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1f201322cb6e..ec234a483036 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -64,6 +64,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_4GB_VA			BIT(6)
 #define ADRENO_QUIRK_IFPC			BIT(7)
 #define ADRENO_QUIRK_SOFTFUSE			BIT(8)
+#define ADRENO_QUIRK_LPAC			BIT(9)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 5747bd191bf1..70fb93e303e2 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -100,6 +100,7 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
 bool qcom_scm_restore_sec_cfg_available(void);
 int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
 int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank);
+int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank);
 bool qcom_scm_set_gpu_smmu_aperture_is_available(void);
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);

-- 
2.56.0


