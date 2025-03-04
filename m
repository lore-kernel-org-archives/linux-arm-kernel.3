Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BEFC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4O0NBwVlwoR/WweI6jxIBAubbEuQBPU/tNgYLJ99BM=; b=V5LhGP1SBo06ZoDc+XJz84TZrT
	3XHQiqm/htRMkWZ36e5UPNvrCjgSSSn5VFoYcbsy4z3vP+CUed9fzXycPJwF9mHBPb6POZoXmTu0Z
	y4nJmykrJG6s/tiJ3qSU5A7+lqJ1d1Xnxb/3yHT6augkZVX8S//WW0/+eMEtGRWAQYLlfhNDYh1fO
	hzQbRbo5Perxl5EcDUpeWj9u6B05A7i1XaQWi4lxKkImnfaldgNAsWS2u/TLilAxgXa9NMQ9/Dkjq
	/RRfmvUpKOZA19GVtC0TkwPxdX2pMthZep6uBtgN+j1SQmC7KQNiwvasb0kxVq+6Zp40cjVfJDSty
	Q/kbY6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXxZ-000000061DU-45ga;
	Tue, 04 Mar 2025 19:29:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVaP-00000005WFF-1pHD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 16:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=P4O0NBwVlwoR/WweI6jxIBAubbEuQBPU/tNgYLJ99BM=; b=rY0++RT7bmeQUX4EKa6oK+Xo3r
	jC2dxMUEfTDNs9TOdPywkngTAJ0/Tyi8jhIV0yNUfAR/wDJH7K48jpvxs4EO2Y7sFEDBkie0eRxkq
	j/uPJ1FKm8gBrwX5ExSe09T7IUVSOrV4EADKBT0z3zfyzNN3fVx3BlZ65A/M1tNJj5TzL0hMF8jX7
	dLUHQiRbNvrEJG3bqrrVAd4ToQGufwY5xEbq0SH9g84wibTvwMz14g3qi4rgFol0WqCijIEe2HmFs
	rfhslb29PuXwuZZ6EHpq/SYHgjvgFUu+qctUtbfS3fx6awjgNbZxuO6s6zoLnEZwN7+THCzimlrex
	kvfxoOGg==;
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVaJ-00000002AbX-0pBN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:57:39 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6e8a2fd46ddso7464106d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 08:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741107445; x=1741712245; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4O0NBwVlwoR/WweI6jxIBAubbEuQBPU/tNgYLJ99BM=;
        b=YoBJYbNfLnJSGNZbiLxlB4QIlmi2AOjhg3OecgqCwjr2gcE5o02qTjc9rrtF8D0ShD
         gGvUgBt+Httbtz6Sp+GigO5f6862cEFEfodjM/x/EvnVp/Ep7zDLp72/Hjjt+EJXWvlZ
         /Fe1rCx7+3JtmzS3UfTYillx7ArKpzGc15NPWNDGpSvtvdKLKL4PC8n3c40wmT0Gbm6N
         rb/8IPIfaGHjsKXCls61VSuPSntk6+f9uhBVh9/czavppfG8IOkszhwC7D/ja8k8xwU2
         sPZupyMBLhOCTbOPxXxAt5Vb0KF7lItsIpUdBHa46Sq1Go7KFms93Ux50wtqmKdA/0Qb
         fhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107445; x=1741712245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4O0NBwVlwoR/WweI6jxIBAubbEuQBPU/tNgYLJ99BM=;
        b=EtI6Yh5JdcGPU9d+iPvk9j8IXm05PwK8H4XQvhYAFASUj8IHsJNOlQm0dApN9K95SL
         WOC8B9GXrRN8isy5QEJV+FhTOJRa2pbgu9/4tybbnm2M/xGkwy6vT+kn5lEE/MeelYBq
         jFH4BUN86E4d8ZBp7LLtUDmo2YvNIm/j2wXdcQRSAq+Y1geCpeL/qDYvkA4c+2vG9SyU
         6EGH4RBFs+vlv25vudhF3D8zDBZeUoNr39lAjhfKX8fuqSHRa+7AYHoFCkXWjG8nmYVm
         LkFaxoxf33X8TQy8eErZwsKmlO8ZXfJSmQNguQAHeogUHpIFgtJOFgpeb9NXxVUtsjht
         gXbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9IskU7Ei5SmPp6OD/fsY1IgEQHn/7mRuFR76XAsqYKne9FjIW2TVu5pp55A3mqFhwQlde/5RR4C26vZnJ9YHt@lists.infradead.org
X-Gm-Message-State: AOJu0YxKq2H78tofMPWhNZr5dnKX9Rs7sGIwC4i1hdIIkXEpvSgJNDbl
	eDQBZ1IY0LB7H7Akzm+jRYt8mEn582dZkizSvB4XEnyUg1kbe4Xl
X-Gm-Gg: ASbGncssRdKyOR45P24xiKhQcTDMO5O16BZDV/iiAaxFe/VszPkd5bxCgNJpmsuYLeI
	3YkU0fZKqZUXN1qdxwkIdTKsp3AsA9F+Hscw0RbTIKw0glgW1EJ9ipeRcJq7vbUdyZJoTR7gSTe
	jmfCW2Yf0Lhabb7a/S8wmmTkqE0NgBmL7XTO7R5Lv0IlrFt3fwxbS9OwAfXZzVZ2PvNGtuqKsmX
	abFaB19y3teIxgNwOCV9dkL+LScHOwy6Avw7upoVYSEARFB1qlRPlPHTI5Z9xUEMNiWRrvaeaHG
	1EsGrW8xt/svVohHfuTmcVH3lc2bH0BX4VOx8sq2ukIv488BWEyGTmqf9ajx159PJyQGirNiazm
	bYqU=
X-Google-Smtp-Source: AGHT+IFmTBw/x9z2AhNxbshhDZU2/MsdlMTKQxvGcWNlN4YbSO4kS6CeUKvMP93Gc8bji+QnPDvufA==
X-Received: by 2002:a05:620a:444a:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7c3cd6830d9mr199306785a.14.1741107444924;
        Tue, 04 Mar 2025 08:57:24 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976ec3b6sm68915966d6.125.2025.03.04.08.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 08:57:24 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 04 Mar 2025 11:56:50 -0500
Subject: [PATCH v4 4/5] iommu/arm-smmu-qcom: Make set_stall work when the
 device is on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-msm-gpu-fault-fixes-next-v4-4-be14be37f4c3@gmail.com>
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
In-Reply-To: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741107439; l=2106;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=Me/D1+KhPPoLdXUQArYzWEOMKf4DNFEbfunwhGA1eSQ=;
 b=DcKFFyeJYU3dr7n7hyZuWkoVwCLwEf5oGUfH1stJNBPTrVCxsAWbmfPuZC7lLD7dJuFdZgFWN
 OMJ3w0DnCjKD1p7njjA8uCVBeD9sfqthO9aIDeLec9/kH02MUzU55kr
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_165735_991890_4725C715 
X-CRM114-Status: GOOD (  13.57  )
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

Up until now we have only called the set_stall callback during
initialization when the device is off. But we will soon start calling it
to temporarily disable stall-on-fault when the device is on, so handle
that by checking if the device is on and writing SCTLR.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index a428e53add08d451fb2152e3ab80e0fba936e214..d34a0d917013bb3d5a24b3ce72f48e3b38474da2 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -77,12 +77,36 @@ static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
 {
 	struct arm_smmu_domain *smmu_domain = (void *)cookie;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	u32 mask = BIT(cfg->cbndx);
+	bool stall_changed = !!(qsmmu->stall_enabled & mask) != enabled;
+	unsigned long flags;
 
 	if (enabled)
-		qsmmu->stall_enabled |= BIT(cfg->cbndx);
+		qsmmu->stall_enabled |= mask;
 	else
-		qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
+		qsmmu->stall_enabled &= ~mask;
+
+	/*
+	 * If the device is on and we changed the setting, update the register.
+	 */
+	if (stall_changed && pm_runtime_get_if_active(smmu->dev) > 0) {
+		spin_lock_irqsave(&smmu_domain->cb_lock, flags);
+
+		u32 reg = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
+
+		if (enabled)
+			reg |= ARM_SMMU_SCTLR_CFCFG;
+		else
+			reg &= ~ARM_SMMU_SCTLR_CFCFG;
+
+		arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, reg);
+
+		spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
+
+		pm_runtime_put_autosuspend(smmu->dev);
+	}
 }
 
 static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)

-- 
2.47.1


