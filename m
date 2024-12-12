Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B46E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ri+r7pwRuSGuwjoUtH68VlyYId/xYJ7bbwqqbgxE7o0=; b=Kv+oUTcA0hjad7reAADTib9DPi
	rXBGvuioEI1wr+Z+7FhLVMepmZHQdXYY2kDuL2Hik48v8gfarvo0cnRhvkSg7rpE6wl5Clx/cqHtW
	JCRK706FxvRNQOpydllZQXe25GPk5y59C0N2RwY+ftngTE4xhMLHq4ldYBuAYDBY8kLWkYHu6+el5
	wKlIZhISax5uc1QP5ff39+7+Pu75Pyg19RigQv8YhExwijLag67lujltLNqUw2QDCwFS0G28qafmH
	Dk7id1kshq0dRa6aL6i1oi1MAydr/1oNiltqQ0QnPUeMtiPFkAnwlR0zwkPV+UUSPyOyrkvLGImR7
	lHekg7cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoKg-00000001WDA-3riT;
	Thu, 12 Dec 2024 18:54:42 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZr-00000001K4J-2ce7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:20 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4361ac607b6so7288275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026778; x=1734631578; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri+r7pwRuSGuwjoUtH68VlyYId/xYJ7bbwqqbgxE7o0=;
        b=0NvI/tXLTOYNoCKeq/2PoET2m0Q8i8XM6k+51BstYyaQsOM9x7yXStRQQ81nGnjuz8
         h+0eAAAXnVJCj20lHJi5zzPJRMFRLluTuucZvcE6tcf0r8NyADGoJ++ctSr7Ojpwfd1E
         20gu7LShWF2NMT9aMdlUGZTOQMKW6whfGS0m401iUMnX8rnGVFqqhehbhKkVPPK0NHkX
         GZ4BFXIxoUn3jcDLbf7rgQo4gBsaPOmJeOFZsql4ARwC/R4VrHqpl1y1NXbFTL++KbQR
         uSk5HVZx3VP8FfNyhGz5LCBdw4VO1/gbqlFxNBSQl/b5Uo6DQwTAC6qznm3W7lUG4cvc
         UATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026778; x=1734631578;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri+r7pwRuSGuwjoUtH68VlyYId/xYJ7bbwqqbgxE7o0=;
        b=aonHANj/HBVLv0A1+V7AK8pVooZKLwONDKPUWmUNzvt4hIKIW9cf+KSE0/PjpJ0YQE
         OmPJbNPBtUc6dqeZ4Pr8Gpn1TP+QVnHE4TEEOzJtumxlJPq6SH0pwdOrKjixgktGGFIG
         rZVOLeKIYIFYMe1+0LuOO7bMZ5Dg/a7w2ABgT/KQBG/Ou/IqKFw1lY6SlmqutsRZvc8o
         dTicpl7udMjgG09KWEamgnOvjxy8V8rAn57nUsSytR5MrftUdfGadtTBZdHpKIBtGWJO
         X9LSUOFbyoL5Z4/zCU66uITkCQrR0416TuYkBszBCQjhbSQhoewZkAhHh76HADg92Zvf
         nL3w==
X-Forwarded-Encrypted: i=1; AJvYcCViCLisS5rD+zKDSRzZifzOl5BuwRoc4aC1uwl8RcRhB6kZkPV5bef0MvjOSTkn58VIVIBpJgMKwOZwKC30pZ3Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwtrmNaI+GtKh4g3xADNE32NrJj6ppK3NT36ut9vl+2DXtNnBdf
	iWXJ+AwFzVESEpw8Pu6/juhrY93V9r4Ac4OVet3QaucdFuLSt5E3KqpzqTwn4bNmjPThrkwC98I
	SzG4LIeAVcw==
X-Google-Smtp-Source: AGHT+IFK/W90GGrvF5ugVo4Ngg6I8Ho4ihHIM4uN2vyaRLD/UUIi5+Bgx5fKDHT7GWhU2g/J1RsFzA2778KxoA==
X-Received: from wmdi8.prod.google.com ([2002:a05:600c:2908:b0:434:a0d3:2d57])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:548a:b0:436:17e4:ad4c with SMTP id 5b1f17b1804b1-43622823c62mr35176435e9.6.1734026778111;
 Thu, 12 Dec 2024 10:06:18 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:09 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-46-smostafa@google.com>
Subject: [RFC PATCH v2 45/58] iommu/arm-smmu-v3-kvm: Allocate structures and
 reset device
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100619_665609_E0551441 
X-CRM114-Status: GOOD (  14.25  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Allocate the structures that will be shared between hypervisor and SMMU:
command queue and stream table. Install them in the MMIO registers,
along with some configuration bits. After hyp initialization, the host
won't have access to those pages anymore.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index 4b0c9ff6e7f1..e4a5bdc830bc 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -18,6 +18,7 @@ extern struct kvm_iommu_ops kvm_nvhe_sym(smmu_ops);
 struct host_arm_smmu_device {
 	struct arm_smmu_device		smmu;
 	pkvm_handle_t			id;
+	u32				boot_gbpa;
 };
 
 #define smmu_to_host(_smmu) \
@@ -66,6 +67,35 @@ static bool kvm_arm_smmu_validate_features(struct arm_smmu_device *smmu)
 	return true;
 }
 
+static int kvm_arm_smmu_device_reset(struct host_arm_smmu_device *host_smmu)
+{
+	int ret;
+	u32 reg;
+	struct arm_smmu_device *smmu = &host_smmu->smmu;
+
+	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
+	if (reg & CR0_SMMUEN)
+		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
+
+	/* Disable bypass */
+	host_smmu->boot_gbpa = readl_relaxed(smmu->base + ARM_SMMU_GBPA);
+	ret = arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
+	if (ret)
+		return ret;
+
+	ret = arm_smmu_device_disable(smmu);
+	if (ret)
+		return ret;
+
+	/* Stream table */
+	arm_smmu_write_strtab(smmu);
+
+	/* Command queue */
+	writeq_relaxed(smmu->cmdq.q.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);
+
+	return 0;
+}
+
 static int kvm_arm_smmu_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -113,6 +143,20 @@ static int kvm_arm_smmu_probe(struct platform_device *pdev)
 	if (!kvm_arm_smmu_validate_features(smmu))
 		return -ENODEV;
 
+	ret = arm_smmu_init_one_queue(smmu, &smmu->cmdq.q, smmu->base,
+				      ARM_SMMU_CMDQ_PROD, ARM_SMMU_CMDQ_CONS,
+				      CMDQ_ENT_DWORDS, "cmdq");
+	if (ret)
+		return ret;
+
+	ret = arm_smmu_init_strtab(smmu);
+	if (ret)
+		return ret;
+
+	ret = kvm_arm_smmu_device_reset(host_smmu);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, smmu);
 
 	/* Hypervisor parameters */
@@ -129,6 +173,15 @@ static int kvm_arm_smmu_probe(struct platform_device *pdev)
 
 static void kvm_arm_smmu_remove(struct platform_device *pdev)
 {
+	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
+	struct host_arm_smmu_device *host_smmu = smmu_to_host(smmu);
+
+	/*
+	 * There was an error during hypervisor setup. The hyp driver may
+	 * have already enabled the device, so disable it.
+	 */
+	arm_smmu_device_disable(smmu);
+	arm_smmu_update_gbpa(smmu, host_smmu->boot_gbpa, GBPA_ABORT);
 }
 
 static const struct of_device_id arm_smmu_of_match[] = {
-- 
2.47.0.338.g60cca15819-goog


