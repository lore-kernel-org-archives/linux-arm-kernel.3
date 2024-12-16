Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B78E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vU+dmUIEOB3Bn235Q13lqV4rtbETnj3tLnp1CwkpGgc=; b=3m0EJA0rvXyGFIjnCJTOj1pkJq
	Q37m5+vaUbz7oBefTA3IWq56iCqFGG7ZpNrzs9+GMXrTnnuqK2v1d7CueFeyx75ya4zgWtmbkbyJD
	rX+xMD7rf2gsCfHu2PnSsmiS92+cDHp2BWqcG4WeZKmMa+zY86hJYjrTYVuad2GqisYz5OAB/X1Jp
	I7tMzq0dOv78IS3rEwoDEU14k9SE11rEUgo9LTIN1KrMw3CPAqFDL7/9YSel35dOsdPLQwFd8C9ZF
	RtT7obZwQ8/7AI6bvii3tDrBUX1StMPP30wwRwWgBbnnmoxuUp0p1HRMNVhWgl/EBieTpBU7MSZT4
	BsFujevw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEd2-0000000AjAo-2v1J;
	Mon, 16 Dec 2024 17:11:32 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEbv-0000000AixS-3p2w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:10:25 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2163dc5155fso37427035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734369022; x=1734973822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vU+dmUIEOB3Bn235Q13lqV4rtbETnj3tLnp1CwkpGgc=;
        b=QHX0uE66RuNarzytdKAjPokSLilL5WwsR6Igfd7rJj9dCAY4XZZLJN6tRKYqKUoCOj
         l4z/bXIXExtFuXr3xG4A5VWEwiR7sPgv8zBa5CuG0+gYVh4jawtu62kBH+o/AO3cLvj4
         DuZd8a5FogkJ4Hy31xqIXOKq+T7K8uv11IdmzdZR1U0qbNP/Crqbz+6WH75/Cv5rNlud
         bEo4GLPWAGJGsjNZp+aughnjdnsPgxRN0gWWfhroth67oIF/H4O+hH7py4xCzYhZk7il
         +bGVPy/WFLmC2zWPYxiFOR48SFj3IYztC3joIKSgtemUDdUCCRH6M7NLtSXSAuFPMsVU
         9NxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734369022; x=1734973822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vU+dmUIEOB3Bn235Q13lqV4rtbETnj3tLnp1CwkpGgc=;
        b=bed7BkiEo7eg3pc4ukwkGS+NOnruxV0fct+8V861ni6ncR91Xh20jB7IhDDUqBuzIK
         FMqh+xowM2E4aIxIGeF8iAxKpxrrVjsUQeRRTfkxojIM3C1alLGxmfJa9jZACLqCcx7I
         5F1RDLS7fw93o3WpDdTsme3KLwls+Y+17lEpKE6Ft16tmnSOSHk8Gw79BN7YkeNbS0Y/
         uHo6Oe9p9/8Jgsj/hUGXLPfhxIvQNoB441oUylf3Nk0kXLFnwg8B4xrfee/IFzrcP6bO
         2HoIsxk8xLmD4YNbuBAECdezecNZz+mFqxTI9pC3wQYiyQmiOx+DL8Zkq+MId37xVC4G
         xd4A==
X-Forwarded-Encrypted: i=1; AJvYcCWGkZCYNXyxPJFVHT436cm130We6jQRNHo29Dy6wL/ztLdvMsqSl4wdlfeb/kqllzh5B6XvsMCBAaYJCY+0HFiZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwEMGND+jKp8Xt3lYaIJjO3uFHXKJHYf7iwr/8M3ZjMNWpx6zZE
	p+T34lCSvWuC72yt2c4sPenrmQF3F+5dpo7Ks6E38QwTGrQuTSF7
X-Gm-Gg: ASbGncvrgWODAu3dL0piCKdwhNHVxJAbswANuFmMFhdfTuKhUzsrL3A70c1bcm1NuQO
	zX5d64OcMzjLuFdyxw4g9xlga6eAa931ML7sXMIxeDYPqBGXA//duVQfSQveeBcF0oiHqWwDlQB
	ZX4PHeeWI5xqGk5/sWTc1EDTzt2hQ35AZJbjZSS08LE5L7BSd2EtGvmcMe6inCFZLKLh2CEBndi
	UXOB+DsqJ41XQsJuj+bRgBJhi9qgH6lVNXEGoviHMbUWzspHcniZ3ljTfNxAmZdF1ZSNjjHwTYk
	rGpjAEF11RJB4xwwCRg490QqEJhowMQ=
X-Google-Smtp-Source: AGHT+IELBk5CES1wF4PHrucRwTPjdWhx8XVgyIQNlfgXs1jGjow9SanGNGa0Yz59QLbcpGn4/Q+npQ==
X-Received: by 2002:a17:902:c409:b0:215:a05d:fb05 with SMTP id d9443c01a7336-218c8dd54aamr3975465ad.32.1734369022087;
        Mon, 16 Dec 2024 09:10:22 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcb4d6sm45181925ad.80.2024.12.16.09.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:10:21 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Date: Mon, 16 Dec 2024 09:10:17 -0800
Message-ID: <20241216171017.4881-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_091023_949734_763007E4 
X-CRM114-Status: GOOD (  10.46  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rob Clark <robdclark@chromium.org>

On mmu-500, stall-on-fault seems to stall all context banks, causing the
GMU to misbehave.  So limit this feature to smmu-v2 for now.

This fixes an issue with an older mesa bug taking outo the system
because of GMU going off into the year.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index c4c52f7bd09a..1c881e88fc4d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -331,8 +331,10 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
-	priv->set_stall = qcom_adreno_smmu_set_stall;
-	priv->resume_translation = qcom_adreno_smmu_resume_translation;
+	if (of_device_is_compatible(np, "qcom,smmu-v2")) {
+		priv->set_stall = qcom_adreno_smmu_set_stall;
+		priv->resume_translation = qcom_adreno_smmu_resume_translation;
+	}
 	priv->set_prr_bit = NULL;
 	priv->set_prr_addr = NULL;
 
-- 
2.47.1


