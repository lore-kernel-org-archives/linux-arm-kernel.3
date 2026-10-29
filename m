Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B772606A833
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ulTf00Mf;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5SmMgqM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WpY7be90G/SGk1dVlALZpqn7ki65kr0ccX4qFPemUo8=; b=ulTf00MfyPxy5p
	Z3mXqUBOkOn87xbUTIwwZWqpcNX7ec0f3m/AQbHdjglT3Yfj7cYwqIpdl+jmG1ySmzbsTQ8uf6eUZ
	WgF/AUbEnLrnQv71mnfXlJ37TTrljTahyPHDipMlF2NHxWG7mIvypKQowNme3wXG2smDV1eaUEgD3
	MxVPV3U9xf+mimI7/2MKwSNfIdia0q2Z1cWf8ZlRxBSTPM9DpYrT74Ni80dv0DUkbzzlpom91DBTV
	uWPZiE2xIoAcq9DhFsqEWTHEosumm+ax57SjNuItl0WJd6TjIgpxaDeLXy53Rctfd5VGfVzuXDOJo
	6hXwzCV+9ah/MZlgKRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZb-00000009SIh-2jNC;
	Thu, 29 Oct 2026 13:53:43 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZB-00000009Rtn-0Mpm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:53:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1000796f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281994; x=1793886794; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpY7be90G/SGk1dVlALZpqn7ki65kr0ccX4qFPemUo8=;
        b=Z5SmMgqMFrdb9BKqPgx4jU2Q5TdjDwlcEyI/BDCivd2bIPLh0++zmIQ28gzL7Laq69
         aZ3zWCSzkOro5l+LXjlfwVsYnwtqtz+VRie4/Kk4AFOtIneWgI3j87kdxKuDMwBVOqtu
         pAiHp20Q6O+ycF/sysxD7DMes/uu6prbdNUxRkK2xfY7l8V3j/xAZGYge/ZbGDCYah3N
         W3S1PqGqwTPB4UIITpYRMJzvQcUBrD0QDJBLLAsEyt5wQGC+q0hE41ScSOHCwNx+iiB8
         IMTStPmGzcxzaOpE1IRrPrIzkc2+AXyGxY1ZOlNd35mrbrVj6GPzzfDf/22VUF7TvXkh
         mLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281994; x=1793886794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpY7be90G/SGk1dVlALZpqn7ki65kr0ccX4qFPemUo8=;
        b=J4LncjhNHduzzexXAZKPRURzJLupLLKtJsagaJMt+K15iGE9ewHEgOXx0n6kzRLkTX
         BRdP4jev6z/j1TwfT//MwNSfNj9Kn0OwrXjVDylJiouzsEzwuVFhVxeFVIGupgEVA3Ez
         m8mkk616ILGxzpRwglzbxisMGQt/DAODh1v9IsmvlqTkqlHDxHjGETW5mOsM6lr6JMVq
         Nvzc/XeAZ7+vlA2xyjMYvQzJDufkGyjdMgcpJZyM5XLc+7UeYn75DxLESRrSZCJPka8+
         a6WRXyRWgRB+XWQsON/usA4AvG7l4Iy1lFL42Ny7cpp/wYSaf/zIs1T2gz4WH9D/j4Zq
         J7Xw==
X-Forwarded-Encrypted: i=1; AKwUvByyTz5h4qvAxd7DuYxuPIxC7IwgcHUmdzsyFU4Gaz5xy4KQDTK4pX0Lqr6tLtSt39KsAy1/gfme5u46+5LnL67d@lists.infradead.org
X-Gm-Message-State: AFq9FYLKdJ1CL0yL/DaMJLESWoXodyVQGMbFTAgaxmydMVcmey1fV3TW
	hnWvY/59ZdQuEr7LpuWL/xHYIRf3uxxVsYV5HdezWXtVdujG9MPEx9thWtcB
X-Gm-Gg: AYBFou39a1N30GdfwdawH0ufxk1KJiTjCA6CILKEIrxR3SmFFn8P2jNVl1m1CqiOpy5
	8nikPm04puC7uKJYnz2goCMzafpFobyUZS5bUIBOy9RDsPDgDNbXChOPtBFRcLHDTyuDlA8FDSk
	p2p7CXTz5T/Wjm9YbyptfdpGZg6MS1i5KuXlD3DoelnXWo+HjR45/NeBoQZTHecan2a6AQQTitl
	GvJ6LUgojPLLvxm5WJK/eKB76G0dSsBMsaiTqbBLjCyg8VhA8AZV3vrgsEphgZVD6TvcYGkT43c
	CLzZNOxiQCvBeDXMZjf606CD76Sce5UauTo1ee0l64L0uIksAcWGV44/DEqZvZEuLrbcjNBRqWh
	OF0TzmUZsQ0mneUrVQgQk0iz6GAl4PUBlYrEYD2xFdVGDClyrzbVtIs9KtQMsgr73oaAI8i5nos
	ZCnfGixJfAhn9ZZgayL1lkjkkK0Z2WM5KC91r4wHChtDe0qm3jgx0WMat4TLmBdzcMw2OVpSSRG
	dXA5UsaxRcL95IcguXZljhlfE0ypxx106w2oM1Gsg1j/DKXhrqRsup+OXU1rpP/+m1O2hEnJvSx
	OKAgzmJc85JcKi039K3SQCR0luvkp2qK1Nazu+35Kb4kWw==
X-Received: by 2002:a05:6000:4715:b0:48d:f383:2356 with SMTP id ffacd0b85a97d-48e5d5d16afmr13493554f8f.53.1793281994421;
        Thu, 29 Oct 2026 06:53:14 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:13 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:43 +0100
Subject: [PATCH RFC v2 06/14] DEBUGGING: print contextbank and other ttbrs
 on fault
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-6-a21a5c850961@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=2450;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=dH+it9hPPDLJzOx0q/+eo2IfgBzUDyQPf1+n9ilF6yo=;
 b=rSQ/TIKRIiV2aSX7/+jAtk7J1jcL0JxB8zRWLfn1sl11ELATT02XD6e/9sRnBZS+9corw6Stl
 Oo1uS/fWy8LCZ5C5THVWfEq4MkKG8/9Q7VkA0Io7j8QvOp628/2VM06
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065317_167078_9EF86BCB 
X-CRM114-Status: GOOD (  13.38  )
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

Faults can now come from different context banks so print that
information as well.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 4 ++--
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++++
 include/linux/adreno-smmu-priv.h           | 2 ++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 65d34d0cfc38..4389559e1d17 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -329,8 +329,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	else if (info->fsr & ARM_SMMU_FSR_EF)
 		type = "EXTERNAL";
 
-	pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
-			info->ttbr0, iova,
+	pr_warn_ratelimited("*** gpu fault: cb=%d ttbr0=%.16llx cb0_ttbr0=%.16llx cb1_ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
+			info->contextbank, info->ttbr0, info->cb0_ttbr0, info->cb1_ttbr0, iova,
 			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ",
 			type, block,
 			scratch[0], scratch[1], scratch[2], scratch[3]);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 48a590aaeb5e..ae6152bddf8f 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -136,6 +136,10 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
 	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
 	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
+	info->contextbank = cfg->cbndx;
+
+	info->cb0_ttbr0 = arm_smmu_cb_readq(smmu, 0, ARM_SMMU_CB_TTBR0);
+	info->cb1_ttbr0 = arm_smmu_cb_readq(smmu, 1, ARM_SMMU_CB_TTBR0);
 }
 
 static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index d83c9175828f..5d6de4b4de06 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -32,6 +32,8 @@ struct adreno_smmu_fault_info {
 	u32 fsynr0;
 	u32 fsynr1;
 	u32 cbfrsynra;
+	u32 contextbank;
+	u64 cb0_ttbr0, cb1_ttbr0;
 };
 
 /**

-- 
2.56.0


