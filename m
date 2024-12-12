Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08D1E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyTqVJhMppnYdv5NSdPsxpiQh63AvYUQ+byd2sEa6to=; b=1if2fjIJY+TCNciS9XumWOwnly
	yYbouw+cUPFQkaWhdprL2SlDVB6ipiXFwgubJzLOFzngR1WAOVTddZ1EhJbv80+4+n13SGFXiYU7V
	Rl/xOGXymooyrb3Lkx+BWw8cxiMPegKN0BNfikfr2O61n94DrER4a58EYkvv0LhdP90PEezb8QWFz
	I8WXVRUUTB0FzYC4MGoQ2nmmJSfzsSSjrpoQlw8gvDsOC5gpXL0DacjJXBu1bYWTtf45pUd6DpOOI
	E3G4OpZOeaGBCRMWyhq66A6TdarT2AyDqOLKNwSVfC7GOj1RX2rEztcMBndDYRZTniMeWwJ2WoASl
	CV9t0tBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoJd-00000001VuA-0oPC;
	Thu, 12 Dec 2024 18:53:37 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZp-00000001K3I-2XWV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:18 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4361d4e8359so7199735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026776; x=1734631576; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iyTqVJhMppnYdv5NSdPsxpiQh63AvYUQ+byd2sEa6to=;
        b=aOmAyOdXNxtj1FLHs7hja/RfssMwRVUQgiLc5aXHBR1jl+ar1PRrxkRzw5ZSsX7Nkr
         8V3mx8nb2WCkNrVbAgbEAcCl6FZ0OtCU9bWVs48FmgK4LRS+oMZdG+1a+cSURgDJ8ZkO
         IQVcdTuOBdzXNaRGj0aRh763dZRN8AY/28LNqA1jhQH/SI0EEqhjPvqtkuES7TxHqjBt
         7llOel7WuH3Kl/Nv13MilBE9wOqncWOpVreL7JsDlu86KozUhHUMPijH2s7Dd4dfW9HM
         7KWSk8tft/78SKEP4iPOQV+m6Cif4la0mrorlurFPG4n/InKgte97AiQ3DRfG+rPvbo2
         tk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026776; x=1734631576;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iyTqVJhMppnYdv5NSdPsxpiQh63AvYUQ+byd2sEa6to=;
        b=OrXwIbhDrhaenIRb1attTd4sxco1B1l4+J3q57UjqHkkT0FaKYbxsiZemm76iU8QUL
         UN5Ds3JabL3nu/B00lM+5IpAW6QgW5AxMzU6O3nCHqMcwFqYTKcq2Pm1nymGbGjSwz0a
         efYDgqx9YsA8DFfYbySwCyCja+LDlv27SnqLno7nS815dYHzi/1chKtz8mSj034R2FK6
         OFVMIcm9E+cWexWdQO3mND38nUg4mxW0pEOsQ2HWd3ZDq1CxZMDqHh0pVfgFSf4l5ABh
         Iy5/TNls0mcWy0ftlau34hVuGriFZSp97g3CRErFPXR6S6o1bhTXePuwmup8FawaJY4m
         XbUA==
X-Forwarded-Encrypted: i=1; AJvYcCXZLylb2UG0npoitJUUzvvK8f3ppMZal8ydLVJenkB2/cHMnUnTJxOZM9QJwMgmjv0JAjqyOep6VbT33m+2wFti@lists.infradead.org
X-Gm-Message-State: AOJu0YzhkGo+tAA49pF5zcHspKOjXCENMI0m0O8GPaFTvZ7k6+Og+Hvf
	nrtKVM9CWoU+DrRfbhKkcXvGg8mPhdwU1N5IWnwEF6B4K5PGv4OKyaFaVzK9oK3rdvA08pwKUzO
	nKlQi9HoDWA==
X-Google-Smtp-Source: AGHT+IFG8WA1Z2ObHa4JSTh7ZOJd26fn3uY6Vzk1iSlEnJuugWr6UhUgo2xrrDlr60JHvwlglh6D+X+h9Bswrg==
X-Received: from wmgf12.prod.google.com ([2002:a05:600c:154c:b0:42c:bfc2:aa72])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64af:0:b0:385:f7ea:eb86 with SMTP id ffacd0b85a97d-38787685119mr4003192f8f.7.1734026775884;
 Thu, 12 Dec 2024 10:06:15 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:08 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-45-smostafa@google.com>
Subject: [RFC PATCH v2 44/58] iommu/arm-smmu-v3-kvm: Validate device features
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
X-CRM114-CacheID: sfid-20241212_100617_643678_F1C8D525 
X-CRM114-Status: GOOD (  11.61  )
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

The KVM hypervisor driver supports a small subset of features. Ensure
the implementation is compatible, and disable some unused features.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index e2d9bd97ddc5..4b0c9ff6e7f1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -27,6 +27,45 @@ static size_t				kvm_arm_smmu_cur;
 static size_t				kvm_arm_smmu_count;
 static struct hyp_arm_smmu_v3_device	*kvm_arm_smmu_array;
 
+static bool kvm_arm_smmu_validate_features(struct arm_smmu_device *smmu)
+{
+	unsigned int required_features =
+		ARM_SMMU_FEAT_TT_LE;
+	unsigned int forbidden_features =
+		ARM_SMMU_FEAT_STALL_FORCE;
+	unsigned int keep_features =
+		ARM_SMMU_FEAT_2_LVL_STRTAB	|
+		ARM_SMMU_FEAT_2_LVL_CDTAB	|
+		ARM_SMMU_FEAT_TT_LE		|
+		ARM_SMMU_FEAT_SEV		|
+		ARM_SMMU_FEAT_COHERENCY		|
+		ARM_SMMU_FEAT_TRANS_S1		|
+		ARM_SMMU_FEAT_TRANS_S2		|
+		ARM_SMMU_FEAT_VAX		|
+		ARM_SMMU_FEAT_RANGE_INV;
+
+	if (smmu->options & ARM_SMMU_OPT_PAGE0_REGS_ONLY) {
+		dev_err(smmu->dev, "unsupported layout\n");
+		return false;
+	}
+
+	if ((smmu->features & required_features) != required_features) {
+		dev_err(smmu->dev, "missing features 0x%x\n",
+			required_features & ~smmu->features);
+		return false;
+	}
+
+	if (smmu->features & forbidden_features) {
+		dev_err(smmu->dev, "features 0x%x forbidden\n",
+			smmu->features & forbidden_features);
+		return false;
+	}
+
+	smmu->features &= keep_features;
+
+	return true;
+}
+
 static int kvm_arm_smmu_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -71,6 +110,9 @@ static int kvm_arm_smmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (!kvm_arm_smmu_validate_features(smmu))
+		return -ENODEV;
+
 	platform_set_drvdata(pdev, smmu);
 
 	/* Hypervisor parameters */
@@ -79,6 +121,7 @@ static int kvm_arm_smmu_probe(struct platform_device *pdev)
 	hyp_smmu->ias = smmu->ias;
 	hyp_smmu->mmio_addr = ioaddr;
 	hyp_smmu->mmio_size = size;
+	hyp_smmu->features = smmu->features;
 	kvm_arm_smmu_cur++;
 
 	return arm_smmu_register_iommu(smmu, &kvm_arm_smmu_ops, ioaddr);
-- 
2.47.0.338.g60cca15819-goog


