Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6337060A3834
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K+ZHjWjl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9FY147c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Rr4i7xRJAxgPG+93hBg/VQGAgwo9yxXU9tfEwt3+0E8=; b=K+ZHjWjlpncnHM
	TochKwJYiP8msNQV1CDgtIlHxLA0F6Wv5Z85yNZqkDddC0vEHQIPuBsrvxLpD8mDHXXbcPRsB+SOb
	wWilEQYfEIEa9ucNrR8OkMGPZrDVe1yquyizYLRjGwtad91XJ3/3h7wk0MuGExZsow8ki5lVTpbCP
	2mN5Fd1wD+3IebfrpUPNfnoPWXstWGhURZa/+Ej7QkBHeS0/F/PFBzz8D5VbKgjIBGdtWNP8zoxSr
	VhmBOBhVNtZ+3TXv2h/1t8RV9BNgadK/qiDS8WLEf+9o4ryEZNyYyWm6yzUPTskGvWPeewMTkgR6v
	tdJq1Kt6Iz9dhsFraJcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZ7-00000009RrO-1656;
	Thu, 29 Oct 2026 13:53:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQYy-00000009RkZ-1epC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:53:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so15749845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281982; x=1793886782; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rr4i7xRJAxgPG+93hBg/VQGAgwo9yxXU9tfEwt3+0E8=;
        b=u9FY147cCP5SV2qVuTQhi5yiwDh/7jGhzlE/sUScVDOvWNDo8AoFWUy1icA3yogwX6
         hW/TWmDCOgBE/knNj45Sdn//MEQ/WaRiqL3umZbl4JrhwqxIxOuzfyNgJSmqa5q0eMWY
         rbSPtlYoSLyGnEE0rzNHfuKM/HOtGQIyakwGViGYUucP0hUx9hpq8a0tYZz5vAnZELgJ
         RU2s0/0ISqW3u/qu9+un7CnG6Gka12oOtzxS0TXU18IFf0wJB8hxJCUoRSO7iDGFdUtb
         VwV3pFtgMotv7VPixDCprb3JEMd2pM2grZbrEqAeZpkHXnAL1yVRHvJ+6+eoRk0Gt+22
         2yZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281982; x=1793886782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rr4i7xRJAxgPG+93hBg/VQGAgwo9yxXU9tfEwt3+0E8=;
        b=rA1UG/0VAGNjvuAQGLblLAh5Cx07mEBX+9H45ypVuoPP/a/RNfwIPaSUWjnC1JuJzl
         EQZt45NfUpd2O29USPEuzIgadCX3K4xRwpYQThG+oJtNlXfK6ptgeDZJDElOC92FJ7vU
         VE/AxlWmB3mAwjhAPQL5kAll99ZfsV16BVponJWtkxGMUHsodmaVU+k984T25A1VSKQc
         lmQPn5zdk5y+hS+DoQ8q2y4Sxlc6z/MY0MA6Ctyrx8P+l32mljat8oykF/daXtCbXB2u
         uxIC99wksgrMidFiNQiBUGkxiV1pyCr6r8u6FxlNVummfSGaz1EZLCeGWJvFwEqdVt/9
         g7CA==
X-Forwarded-Encrypted: i=1; AKwUvBwXf6bDqc98BEuZAjd5wPb2K+95lBfo+Xuwkep/Lk4Kx6PHGMctltJ4kcTtgZvJD5CB7w41pU1FWV7QijY1eecK@lists.infradead.org
X-Gm-Message-State: AFq9FYIVvrpRNpiOf0Qf9WaOt1nrPqpIdznTWRBit5nOX9Cs1mxKwkcJ
	qH3L6DjX6h65AoTNWzCX2XctbvIiNe63lumC2K8wXIX/pOjITRL6MoI=
X-Gm-Gg: AYBFou1fzreRs0IxxAwN0/NY7yLADitk0JKpOLgd/jRlN1kBC8JPvQMnNNGBCEXc1dU
	bZVrM7BdPF7oItZR1QUq2SWwqtFRRxtOuin2EfKJ4Nv82iorQmUsTEDxMkZdZudh7vmThXTjLM9
	PdPgxNp8MhdJrRnVI0TF0gu/yyrPs5YgG7kplBag/h5T1K/NWrD2+pUWG6y/PcMWWJLuwT7WwYS
	PETurCR2QupT5lVqynGS5f4pIUI+VIICMFSC7xRm8jHwopd4YdD1YXHKDDkfNrWGTC+0Qm1BWOk
	AeTS1DxYHWh7mgHVTx83bTV/ORJzvXpZA4uRSyBZLMEkiNQN13hOarbcE7qEePzYUXpyEWe02nc
	yJ4fViCvKWVpPXGTPEsxZlQyRf8DeeJINeNZ97OuZotAFXxc5rPgZca2JE7eN87kj2D7CaTdUXR
	YnEoahnDVefVd2YY7JcO/iXfkhJVWDHN+NdOt58dILc0sYuo2iHlz3ap6Ethh0p8eCm9URTj8Aw
	24IAVQxj2Isn8rZgNK5Sg9CsB7Sh35gjXJVImSCFe2kTb8gXI9af2S19e+Gg845DvjNyuij2YRx
	pZAczFvc5qXfxk7G56cGjMm4muH8Ko8YbU/FQhMSau/bWg==
X-Received: by 2002:a05:600d:8496:20b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a96677324cmr86595655e9.16.1793281981611;
        Thu, 29 Oct 2026 06:53:01 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:01 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:38 +0100
Subject: [PATCH RFC v2 01/14] iommu: arm-smmu-qcom: Configure lpac device
 with split address space
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-1-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2309;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=NJ73RVOWEiPlPH9Z7PnLGwHMRejJoPZBM69o25lxk5E=;
 b=gj8sBR9N8QG04JyrcmUt5R2oXuziVAr6kQLdSMm6i0TlFKl87Gop8V8EHKny6NTxmbotiGmJc
 fs65LYDtGd6Dd5piBIpN6ZzqbLECs9zGbUWlcBT96BceUkWcOkEDLhv
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065304_468383_A1BFA612 
X-CRM114-Status: GOOD (  14.14  )
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

We want the context bank used by LPAC (Low Priority Async Compute) to
use split address space just like GFX in order to be able to handle
userspace submissions with per context page tables.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index edd41b5a3b6a..48a590aaeb5e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -35,6 +35,8 @@
 static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 	{ .compatible = "qcom,adreno",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,lpac",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-gmu",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-smmu",
@@ -217,6 +219,7 @@ static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_a
 }
 
 #define QCOM_ADRENO_SMMU_GPU_SID 0
+#define QCOM_ADRENO_SMMU_LPAC_SID 1
 
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 {
@@ -230,7 +233,8 @@ static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 	for (i = 0; i < fwspec->num_ids; i++) {
 		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
 
-		if (sid == QCOM_ADRENO_SMMU_GPU_SID)
+		if (sid == QCOM_ADRENO_SMMU_GPU_SID ||
+		    sid == QCOM_ADRENO_SMMU_LPAC_SID)
 			return true;
 	}
 
@@ -305,9 +309,9 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 	 */
 	if (qcom_adreno_smmu_is_gpu_device(dev)) {
 		start = 0;
-		count = 1;
+		count = 2;
 	} else {
-		start = 1;
+		start = 2;
 		count = smmu->num_context_banks;
 	}
 
@@ -394,6 +398,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 
 static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,lpac" },
 	{ .compatible = "qcom,adreno-gmu" },
 	{ .compatible = "qcom,glymur-mdss" },
 	{ .compatible = "qcom,mdp4" },

-- 
2.56.0


