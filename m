Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41128606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KhPPPu2c;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WHZk1HBA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rFW0YNxgIXO3yK9W7NnNeF63YsxO45UeDwCNLoLZDXE=; b=KhPPPu2cxxSly6
	Tm6DNqrpvI6jarUTjAe79kdfcbnfVGTUHpoBjEjATo5Ptk1ZQ2mFBQCDSOGYg9961xd1hQhw05frI
	z7iBner6AqlIvwxmPUbuLlSfdJI9RGk0FYdudkSQy5voL5WwDNyzuJehnjyzr8WgsSzVlANbx8sDN
	iY10y6EJC9AOYfX46F19nO3bctTxz3CUjKfce4HVCb4yzF43QxAQ5lyKpUr4KHjocYm5BvMPfyjfG
	pWR/wLM2tsyrZMV/zkBVYfipKLXrmEmmC0wLfaYwHHbYQhYrD0VxhXMfBQ46IxrQEwH6o09cWau8C
	SdGKQGe+RjbEN25zF0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZb-00000009SIw-3ML8;
	Thu, 29 Oct 2026 13:53:44 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZC-00000009Rw1-3O85
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:53:19 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so455272f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281997; x=1793886797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFW0YNxgIXO3yK9W7NnNeF63YsxO45UeDwCNLoLZDXE=;
        b=WHZk1HBAclv+FaeKWNkQErqqQYT86/RoUCITNeqRRp2t+jIfDrBnG0quwiJf3Dvu9d
         HT0DIB16t/b2jNm31fB+V4UvyurCAX7fnnSxMFIuVzimi+jPiLjOv1SaL6uF2nKMKFA2
         GlpC79b8gkmxA2AJnpBVN5XaG+y2bMUVn0So1MtCH0fEMxQY3wmOTjN+GXES0srF0cpF
         oEsC6Vtf3Q7sd8IOtNoY+uRKANOYjSz5oMsQqbL0R/HjjGz++681isEwStNCxyCzSHkC
         NRpd9JX/XzTLmSYCWb6IrxfCiGOVssjAln0oDpwN7toq7T59ok+Z9lSSQ+sIniUaR7cM
         P7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281997; x=1793886797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFW0YNxgIXO3yK9W7NnNeF63YsxO45UeDwCNLoLZDXE=;
        b=uZf9/EAb5oBk0zjvtSQs//3GRzB0W7gRhlhmzsUIB0IncRzQ3NvsZ1CInqPbizMmhn
         WKb/znXj46ZB5p4ZMwRs6DOG9dG6GeP5kur1op48YKLajQAE3J0e3wRkRIt/4fdl60Zh
         t9Nbsr+JNG4N6w7HSs/ihIR0YLXlpPNyA1Q2vHwukVrkY4hg0Y6ZvmsoeHAKH5/Hqlvu
         oX/C9KplRndzhjahHVq/7NYRos8oQ10VoSouF5Q/GowDHJQJmumsPJIkGAaLrsla0kFl
         YUJjiDwaw4eun8DKjZzQIUhB3uF8TSsBndkwVQxpv2Hlud/bB9hegi9MyZZRXNW685WB
         /Uog==
X-Forwarded-Encrypted: i=1; AKwUvBwsYrmlfiktkcUqrkS+Mgg5uzEQ+Uo9mUYImkexxMGTnKhKT5E9Fn4GdJyeA/ReSxvjlCravIBLvEJHk2e4aVoP@lists.infradead.org
X-Gm-Message-State: AFq9FYJKFCAzaIsahct5eKHCMuuV2Oytf1HVpiS2A77w3XIW+GL2/BqU
	3Qi9JeH+MnbQthAozoPWEapDA8605czNqMeRTQL3ddgMdwtgcxW5SkA=
X-Gm-Gg: AYBFou3BFZzvzL4LrDT83RTTDDsJp+iPdRcWpc9h64+POv98R4k3zJgkSMrDfaU3zo+
	08fTgwzXZlpDpsF/akvwpUQaXVG0wkuq1ErlAQz8jwWF2ZtvFCDlycdtdeiyg5iew9XWP68rTjt
	fAys3nAQHCmGGUTwAYeKRCXQB60xDJea58Kc6NoOARfpBW5g48IFVtkDia9AWWRoXcDEQ7NDkQV
	SM6jG19v1unJp4FbmxDBcFlzifiEy371F5iDNRH7StHNsBkaToyA9ThWI1v2bcjVcd24nrJ2nqW
	roI7LwBxwkOgBuFC0mlMF+MVGCOJozlyoAtinhuyymltrd0J+k0Sh/ZxTfNXML3sQhs+WIgcbYA
	nICqQLhQ5aOysij7LuPH8eMMbxzRQaV5oIXSD/jy/hMVu6P2gs4Yyw+VSwE+LuPH/ICg87dRQ8V
	EaX/7/ZnQ512nCcJza424TIcmINHSOHD6bpWBBM9mltV/OwM878njieJsOiTEI14+UTF+oZjNXk
	HKEPaECv8oLp7IVIrfl4URDYKAG5x+I6B1m/sJ1/fwDJEmxZGyaIlSb2UvWlUdbwxI6PGLqWLxZ
	pec6nS7qtqa0mEitRcbAHcViPhfxISIQt8h/EhkSjUQBbQ==
X-Received: by 2002:a5d:5b91:0:b0:48e:60a7:e0bd with SMTP id ffacd0b85a97d-48e649933c7mr5094994f8f.17.1793281997067;
        Thu, 29 Oct 2026 06:53:17 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:15 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:44 +0100
Subject: [PATCH RFC v2 07/14] iommu: arm-smmu-qcom: Fixed mapping between
 sid and cb for gpu and lpac
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-7-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2537;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=ddmhwqAVzi4UvZ7es6VT6qKlZqL0nH2dFG7G9BUrboU=;
 b=bSLxcYA1Hg7TlJKZ47oBfv1YRksocS8fOUT+GDiqsMJuS2PEP6fGuu8UQ7sr0kvqrRp2ErWZv
 hi5jOvHNIWgDaeJxu8pdrMCwt9FmVwlER2SJfgdk1R9+hQIkj2UjR5Z
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065318_882029_E8D63814 
X-CRM114-Status: GOOD (  17.82  )
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

We want to map context bank 0 to SID 0 and context bank 1 to SID 1 as it
makes it simpler to deal with.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 31 ++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index ae6152bddf8f..9413b748e79d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -225,6 +225,24 @@ static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_a
 #define QCOM_ADRENO_SMMU_GPU_SID 0
 #define QCOM_ADRENO_SMMU_LPAC_SID 1
 
+static bool qcom_adreno_smmu_is_lpac_device(struct device *dev)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	int i;
+
+	/*
+	 * LPAC will always use SID 1
+	 */
+	for (i = 0; i < fwspec->num_ids; i++) {
+		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
+
+		if (sid == QCOM_ADRENO_SMMU_LPAC_SID)
+			return true;
+	}
+
+	return false;
+}
+
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
@@ -237,8 +255,7 @@ static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 	for (i = 0; i < fwspec->num_ids; i++) {
 		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
 
-		if (sid == QCOM_ADRENO_SMMU_GPU_SID ||
-		    sid == QCOM_ADRENO_SMMU_LPAC_SID)
+		if (sid == QCOM_ADRENO_SMMU_GPU_SID)
 			return true;
 	}
 
@@ -313,12 +330,14 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 	 */
 	if (qcom_adreno_smmu_is_gpu_device(dev)) {
 		start = 0;
-		count = 2;
+		count = start + 1;
+	} else if (qcom_adreno_smmu_is_lpac_device(dev)) {
+		start = 1;
+		count = start + 1;
 	} else {
 		start = 2;
 		count = smmu->num_context_banks;
 	}
-
 	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
 }
 
@@ -363,8 +382,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	if (client_match)
 		qcom_smmu_set_actlr_dev(dev, smmu, cbndx, client_match);
 
-	/* Only enable split pagetables for the GPU device (SID 0) */
-	if (!qcom_adreno_smmu_is_gpu_device(dev))
+	/* Only enable split pagetables for the GPU and LPAC devices (SID 0 and 1) */
+	if (!qcom_adreno_smmu_is_gpu_device(dev) && !qcom_adreno_smmu_is_lpac_device(dev))
 		return 0;
 
 	/*

-- 
2.56.0


