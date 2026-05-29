Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1763CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8knH7UioVOHGAK4eKxBC8130k96uQrzRV3kgHSLvOkg=; b=CbiJgkoSz0PQTVbGNUYzYGFAnt
	6uHvXPEMYkp9ldoso8SNfI5vyufrV3N+Mo453yA0o2hvy/qFkcYT0lU+bVyqlNmWe/KXasQGj149h
	WE3alrpaP4MnSgzwU5jmdojFTt32jW9bEmasBOcIUQF0sZ2oj/cFApbMe1H92l+H9n4ucZ01S1CTy
	ATzT6lDsWQsdsSi7bb/bk5FFApj2lzO5Qu4/18zTZyNnz1ONg74FwFwMP9n9Ln9SllyPL9qdMNZgo
	vGZcrdotWa1uHOK32XmfaHOSdV5/IiDXm+yJjQn3oLBiq/P/ZcFiQb+wKynNUaEOTDDlCQ4D5cf9q
	71mMep3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv8m-00000007Fkr-2yR3;
	Fri, 29 May 2026 11:12:36 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv8Z-00000007FcN-1WLc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:12:24 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso8864768b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 04:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780053142; x=1780657942; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8knH7UioVOHGAK4eKxBC8130k96uQrzRV3kgHSLvOkg=;
        b=YRnQGp2JGYtcs2bd2aV0o0M4OFsX1L2EPXfkgZ8WqLjJTbVCGrYeZ0W9KIqV9Cudr2
         uPzm1BtwlUW136BMhPO/alAGI1nJfXNfEgxi6JLFYmuiPhWRkhC2j5fmpGQmpKHviai2
         OzEc8ol0ZSzCsBMGUha33rjg4dU881nv9LOmFpqRYQ1UMzvYE/Trfn8G/352ruYKqKtp
         cg07DWc5dpeqgBpdYrF6SCX9H/zJqLh7OAfEuDsZbFkLXiTn/s3gJf+PaaSB1Xf2q/wE
         X6V7yfDyexOfaEafe9CkJzHwM8lPPiTeuiypt6hzf4c1N6q5JoC6vfMnTlAgnmJZ1quu
         f5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053142; x=1780657942;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8knH7UioVOHGAK4eKxBC8130k96uQrzRV3kgHSLvOkg=;
        b=W1mKL3oMnzTHTKeseQL5IKnINBE4t6V8B8PG1LsMtU/bKE8venn1Oivqv4E0upETZR
         j9vwCzrzPEsGnjjTtGbPoiGyuo8ir3RFs0pdmIOoBvEZlblodj9WCGYUWLQclvm97LMF
         E9rY7qGN8uu5fB3wETitbp/S7FLakLAywgxeYcE0KmOqeyHb5ppCiUSevpG5cxFSTGHB
         7kxOesTHSPEA14mgayD84t8DKPrgjkSbfezKqi+t1wu0o7m/8WrtndoXeTm2A8PvhhDO
         c3ADgTjoJciUe+Eui8K5WrP36OeWPtiHsQMzClId706xSZmKa8EqWob9US0tQ72l2DP9
         a/sw==
X-Forwarded-Encrypted: i=1; AFNElJ9aE8veuyrUjjFu4NFZC+XQUKRVIc8EI5fpHPMn8nL7q04oIFadg+jFAX33ouTtpZKZYJSfQaz8Zc2lMmciJ8hR@lists.infradead.org
X-Gm-Message-State: AOJu0YwyUvQBR06Lmu7KBLwEUqkKYUMmJbYU2p8g0kyCOgNsv5gflOwf
	1rphqZ/OVEo2M14F2Tsnj3EmTHa+Z57qY+i7KIhaehSPLGcg7Ew7EAOjvlemOp98IXPw6X8m9yE
	mwg==
X-Received: from pfbll21.prod.google.com ([2002:a05:6a00:7295:b0:835:429c:76df])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2185:b0:834:df57:9d36
 with SMTP id d2e1a72fcca58-84212ba2fb4mr2617218b3a.25.1780053141470; Fri, 29
 May 2026 04:12:21 -0700 (PDT)
Date: Fri, 29 May 2026 11:12:06 +0000
In-Reply-To: <20260529111208.387412-1-praan@google.com>
Mime-Version: 1.0
References: <20260529111208.387412-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529111208.387412-5-praan@google.com>
Subject: [PATCH v6 4/6] iommu/arm-smmu-v3: Standardize ATS enablement failure reporting
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolin Chen <nicolinc@nvidia.com>, David Matlack <dmatlack@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Mostafa Saleh <smostafa@google.com>, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_041223_399798_13FDD4C2 
X-CRM114-Status: GOOD (  15.66  )
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

The SMMUv3 driver currently has a two-phase commit in its ATS enablement
flow. During arm_smmu_attach_prepare(), it predicts whether ATS will be
enabled using arm_smmu_ats_supported() and accordingly increments
nr_ats_masters and merges ATS invalidations into the domain's invs array.

However, the actual hardware enablement via pci_enable_ats() happens
later in arm_smmu_attach_commit(). If this call to pci_enable_ats fails,
the SMMU driver's ATS state tracking remains polluted, i.e., the driver
tracks ATS as enabled on a master that is not actually using it. This
leads to an incorrect nr_ats_masters and triggers a warning in the PCI
core during detach:

 1 [  127.925080] ------------[ cut here ]------------
 2 [  127.925084] WARNING: drivers/pci/ats.c:132 at pci_disable_ats+0x94/0xa8
 3 ...
 4 [  128.068169] Call trace:
 5 [  128.070603]  pci_disable_ats+0x94/0xa8 (P)
 6 [  128.074688]  arm_smmu_attach_prepare+0x104/0x310
 7 [  128.079292]  arm_smmu_attach_dev_ste+0x128/0x1e0

The issue was exposed under heavy load when running a VFIO-based DMA
map stress test (iova_stress).

Following the addition of the arm_smmu_master_prepare_ats() [1] helper during
device probe, failable ATS configuration (STU setup) is now handled early
during probe. This ensures that any master reaching the attach phase is
guaranteed to have a valid ATS configuration.

Update arm_smmu_enable_ats() to use the WARN() macro for any
subsequent enablement failures during the commit phase. Since probe
checks now preclude software configuration errors, any failure here is
considered a kernel bug.

[1] https://lore.kernel.org/all/cover.1779392420.git.nicolinc@nvidia.com/

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a10affb483a4..aaebd72bc48d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2956,8 +2956,14 @@ static void arm_smmu_enable_ats(struct arm_smmu_master *master)
 	 * ATC invalidation of PASID 0 causes the entire ATC to be flushed.
 	 */
 	arm_smmu_atc_inv_master(master, IOMMU_NO_PASID);
-	if (pci_enable_ats(pdev, stu))
-		dev_err(master->dev, "Failed to enable ATS (STU %zu)\n", stu);
+
+	/*
+	 * Any failure at this point is a kernel bug. pci_ats_supported()
+	 * and pci_prepare_ats() have already verified the hardware capability
+	 * and programmed the STU. Thus, pci_enable_ats() should not fail here.
+	 */
+	WARN(pci_enable_ats(pdev, stu),
+	     "Failed to enable ATS (STU %zu)\n", stu);
 }
 
 static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
-- 
2.54.0.823.g6e5bcc1fc9-goog


