Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4F760A382E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X+IXXfE3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bxmMbrP0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tQ4bsfIGp4xsebuBqH7Tc36g3dw1OgT8NV+OEdsp1MI=; b=X+IXXfE3QDO0HhvSvHVNnc0BrO
	g9ElOMGKnd8ARTEjiI5MipIMyIyamuaJf15YWTigyKU+do6WdjEOxfIv8ETEZHwA0gwgGMPgjLb3T
	catua8TovNWigecCD4aS/1nUL5VLoJ0JVoqlCIj36RWGMSOhJCHdEHArMyZdejhd0KMRoAfeRphvW
	bZlVy0KBp3EuQmAHHGD2BHAALmBe89+jvGFylUexnFSq6DHqx+JWww82Fk53O8WXyDbjwEHnpGupn
	F4OePbTVEBSR8jhYbfZW9D45gJ2Xeuq53HMFiRvHL2oDw8+gmkOYfufme29WxXR932VNUE1lOe/ke
	Dsaf9P3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZ0-00000009Rmh-0YwW;
	Thu, 29 Oct 2026 13:53:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQYw-00000009Rjn-2DBZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:53:04 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1809753f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281980; x=1793886780; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tQ4bsfIGp4xsebuBqH7Tc36g3dw1OgT8NV+OEdsp1MI=;
        b=bxmMbrP0N9uWi0iaZW+YPt+/EbBWxR+EglWjGN+7RFPy+MeRrEIlkLHkcUpcTp9WGM
         meJycgu805ztUnpLp5XiZ6cEONVD02dVvvj99nejDFHa0fR5qydArdT1KdGFA5uS5q4j
         quLVicSQL4NX99AQ6jp0t2G5lcbRQhZ01zKK6bdPfmA95iXihVa8GTbDweQmz9+WKw5g
         5whmcFKF4en/r2u8Bsf6jbaRznSE3D/7VtTpipHj9rWuuKSKDtZDb5LhveUahqcjO6a3
         C4c0AtjVzuPguOMuwYh6Xfd+wdA1/kUXifKf3er8NgjU2Hwttj+EwbheR/jb26uOsa4g
         xAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281980; x=1793886780;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tQ4bsfIGp4xsebuBqH7Tc36g3dw1OgT8NV+OEdsp1MI=;
        b=X2RjIUKYcag4skyvqOna5D8P8wqULa3Tr3a0+LrL4ZjNw0eXrkY27F0cbrFWHrzyjp
         KJWthBa7VhlOa2nfbnnN95Jf9sveitg/u6CxeFCT797Mu3DkLg28saQCTYHnT3xsXp5e
         emRF2x61RZNuHBIde8JHCtM63dmo8q5a9ucn5RM3Jrnh1pH42PIDwvdD0vTwcbhsGYid
         mHkZ57kSglXiioJ5ev29vI1bWK+plxAI93rH1Wr1UdmXDyRucDqjFtrvku3E8yJfbyZX
         osvRo40qA9Vp3islJRIgsZZYMPrq7WwUEnJ/Sv8LyZiR3utLnXK48KgCaE6vT/C8JHJ3
         LjmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUAIDuXu6eD/g8qqWHQheijJm+kr78DWzlKr3qyPS+OsGr9U6ILIj5QKcEB+1XGOEk+Xs62+IxkSIUo2OhnP6R@lists.infradead.org
X-Gm-Message-State: AFq9FYJq7oXdRlyxnhc/s8nmrEgwPq3XvbJSsUKoKSsSERWAZkvRa+0h
	1xaajZ5VN9V4olMHFLD8w254jLPzhcYNgeNhGOdvnMh2sCIgDG9mfkU=
X-Gm-Gg: AYBFou3XcVSWttSfLNonGtyixpxZGeQBtgIgzOhl3IeMmpd2iR+kPcAM4yzalxyAqKE
	5+FtDMnGp+YHmpr8IKl5zYKAR2HSbQux+Pl01SiJaaQKnugAOlwSOcoUkQOH39XroHrmlT1eZSx
	+YwdklN28H8eYgQileKofPpt3Tk2iFlGMbN8MH8BBf0JlppdmGOjtuWpWzHT2V9nn32xLxB7lYE
	jykkWiZJDqnjD8aJpj32sK1YG/L4F/2z+u5j5zksUwL//6B1hVwC/WPt2sNZGoAcdFMlIYDTe+3
	hKnaGnvQQ3FaRm7lXjUs8s06W8z/qQ7ENYJELRC4YiWB3PsuhCj29dFKv6ld9/5uF6gfBCY8YUX
	Lv6Y9ouhF4nPZhpgR16uBPoBFnAH/JU50qw2bU6f1avJxdbpIC2Ac6/muv1TVqvHW9VC9ijpDD+
	KgdeKSzb1/casZK6LJ6/wG3Bi7pmMpgQx0N8SuGzlhbWK8mkRPvxIYT8Xwj4vE32+MZEx4Wmjs3
	vxUBtWHYR3SykLReXMVeYVKVwAzWG4ofXKPsVexMkLs84lmlM4u2y3ojuL+6S1+KuBd73QdVwDr
	n+NXf/mKKTWRroaLNwtBEEiMrR/8p2ablCU4c09loTbxVQ==
X-Received: by 2002:a05:6000:2c09:b0:48d:db77:d124 with SMTP id ffacd0b85a97d-48e5d288b00mr13734288f8f.6.1793281979476;
        Thu, 29 Oct 2026 06:52:59 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:52:59 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Subject: [RFC PATCH v2 00/14] Enable LPAC on a7xx series GPUs
Date: Thu, 29 Oct 2026 14:52:37 +0100
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOTQ6CMBBGr0K6dswUBIIr72FYlDLCGApNWxoN4
 e7ycwCXL3n53rcIT47Ji3uyCEeRPU/jBuklEbpXY0fA7cYixbTAAjNoyWvHNnAkGJUhGKzSMFs
 fHCkDZYZKFrdGYt6IbcQ6evHnCDzrk/3cvEmHfXU3evZhct/jQZS7d8ZKzP/FogQElG2OOiPUV
 fXojOLhqicj6nVdf8W7Nf/eAAAA
X-Change-ID: 20260603-descriptive-name-lpac-upstream-730a164b105b
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=4469;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=p6wqA/jwxyIqcSTHnApGsgfvU2BLpE1567g9tFtfsQQ=;
 b=feq6ZOfAR+NU3cENzB30VH3PhCH4eAA7DfIpVH/eWChVnne9uIyAN6JEvD07bFsgYP9cOKFAZ
 rU7bVnDf59TAXD5riamSTbzdqszxnBeimsLpJilDn62PRDbkRrODEfs
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065302_609556_02C9AF4C 
X-CRM114-Status: GOOD (  13.59  )
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

This series enables LPAC (Low Priority Async Compute) on a7xx GPUs.

This allows to expose a separate queue to userspace that only supports
compute operations, in turn this can be exposed as a vulakn compute
queue by turnip https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39889

Currently hangcheck and recovery are broken as the patches to make them
work depend on https://lore.kernel.org/linux-arm-msm/20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com/

The series also depends on https://lore.kernel.org/linux-arm-msm/177919116291.814652.1720687887970998122.b4-ty@kernel.org/
to work correctly.

It is still an RFC as something needs to be done about hang detection
with multiple rings first.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v2:
- Made LPAC register writes conditional on lpac being supported and
  enabled
- Made LPAC a child node in dts
- Added a quirk to flag GPUs that have LPAC
- Hide LPAC behind modparam
- Several bug fixes (including addressing sashiko's reports)
- Link to v1: https://patch.msgid.link/20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: Joerg Roedel <joro@8bytes.org>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org

---
Anna Maniscalco (14):
      iommu: arm-smmu-qcom: Configure lpac device with split address space
      drm/msm: add support for lpac_domain in msm_mmu
      drm/msm: look for lpac from dts
      arm64: dts: qcom: sm8650: move smmu sid 1 to new lpac device
      firmware: qcom: scm: Configure LPAC aperture
      DEBUGGING: print contextbank and other ttbrs on fault
      iommu: arm-smmu-qcom: Fixed mapping between sid and cb for gpu and lpac
      temp: add LPAC regs
      drm/msm: initialize LPAC ring
      drm/msm: Add LPAC submitqueue
      drm/msm: set ctxbank and asid based on ring
      drm/msm: add lpac ring to devcoredump
      drm/msm: gate lpac behind modparam
      drm/msm: enable LPAC on gen70900

 arch/arm64/boot/dts/qcom/sm8650.dtsi          |   9 +-
 drivers/firmware/qcom/qcom_scm.c              |  18 +++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 200 +++++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |  20 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  99 +++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   1 +
 drivers/gpu/drm/msm/msm_gem_submit.c          |   6 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |  62 ++++++--
 drivers/gpu/drm/msm/msm_gpu.h                 |  18 ++-
 drivers/gpu/drm/msm/msm_iommu.c               | 170 +++++++++++++++++++---
 drivers/gpu/drm/msm/msm_mmu.h                 |   7 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |  14 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  14 ++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    |  38 ++++-
 include/linux/adreno-smmu-priv.h              |   2 +
 include/linux/firmware/qcom/qcom_scm.h        |   1 +
 include/uapi/drm/msm_drm.h                    |   2 +
 20 files changed, 575 insertions(+), 114 deletions(-)
---
base-commit: 9a967125427e03c7ebc24d7ad26e9307e8403d4e
change-id: 20260603-descriptive-name-lpac-upstream-730a164b105b

Best regards,
--  
Anna Maniscalco <anna.maniscalco2000@gmail.com>


