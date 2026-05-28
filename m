Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB2ECD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OCRry7rxw58KzBu/2DpFLzdj5hBkFn2md8kzREbSj6E=; b=O2OGexMknaH3K1OZiaU7/V0fuO
	BLKgCI6oo+tuVpv5n+pNPodzAEdr6Bw+Od2pjcBoNZkB9M2Js1Gkfye50FrVbSQAjeuYM8bTi6CYe
	PL9C/OwejE0PEP1DqPMoDZ6lN1nySeP69voyUp5O4q57Yvm+x+UHsGf3nNn2gIO9kYe4P0vD96BwG
	l9iQ6GiG27kBETAuXj7ZfpRN+d5DIYfpGETK2Mva7vlb7iWHkJJpjZbTPqL534kHwJ++qiseYmM/U
	9pBrrkNdwt5j2VhwN1+/VRV55m4WVPxF6VGYMcsvfuxgoDBI9rMMcLHrsjUPwAOgEPfA1YEoG7/Bl
	ejfQVkWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShGp-00000006KrQ-4BQ9;
	Thu, 28 May 2026 20:24:00 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShGn-00000006KqW-3hjz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:23:59 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c82894155ceso16389820a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779999836; x=1780604636; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OCRry7rxw58KzBu/2DpFLzdj5hBkFn2md8kzREbSj6E=;
        b=SuC8dJVN9QEJJwuMCXTA42TTBhBZSxl3sHMW1v125o/LRkZG7ikCBhsXSMxr9xqNGr
         0YUs0yimZZjM4Xe26pGK5pUx0C5dC9msp5sskLVGwUZyySYVG+xgAPf/nouQhInvMJNQ
         8HPCm61np6+xa5QFR1yeVTWxBgQtPkUQP2wPXwfwywKJ2pLUxL1HnelcjrFtNvSNBRz8
         WT7STjxyNdamjlkyPfGEE082E4R873mhut8ky0/rcSOBcFND6GFkUmaogxORHtH0sPlR
         OIdYmgNFc3DVhs0Z5KBmIGSPoaLFazlqHTAQYHltC7BrKuqL8SVW++OCuVw8jB882lJe
         ER1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779999836; x=1780604636;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OCRry7rxw58KzBu/2DpFLzdj5hBkFn2md8kzREbSj6E=;
        b=oK9Mg+xJTIgbnjsn72+JdSCOfk9eo4CqdiPQqv/0IWod79zgD9rcK0xwviHVJLefpP
         SWPCF/+q/kKLJiEaW9qQiXvADYabg5Df2N5yfEloIMc3t7+r3Mtv5bR/C0/sXP1EL04Q
         /4uKFfImEm3sTt04VN3MsUS960TimzYptvWIKlK9mLXllM6tZqFFqZXjAB8OaVJ09pNH
         BwKdSEkNj5vGpOcfCMT0t3FTH50+U2NRCzIY1VFAsL945eRywJW5ynVMq5tBtCMjSSNb
         R2oahL+Z7EFk4/AWGlBZDMqzAcnu4VlDM0Ffge0wY23DMy2mgZk9AalJuYFms7PaZmzJ
         ExRA==
X-Forwarded-Encrypted: i=1; AFNElJ8roonay/pinDwL/LqnFH6BIf6Jkd3SvFmMISeicn29DVkdsNlmpD05TN79Flm+QVzeTGhZp58ox3AY51aqM+nT@lists.infradead.org
X-Gm-Message-State: AOJu0YyYtXPEmHgIRh8zGvVDoJwhkDT+fV2McIpE+tb1/yabZu6mtiyv
	3dQO/cssD1F9BIwiFwB8PHDnlySyQ2kmy+4Aec/n5VK7kUk6Q9UuhVn7zOt40OcEeAY7QubYRqx
	biw==
X-Received: from pgbo29.prod.google.com ([2002:a63:5a1d:0:b0:c82:2e5b:8f33])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a1a:b0:3b2:924f:70af
 with SMTP id adf61e73a8af0-3b40e648375mr280209637.45.1779999835891; Thu, 28
 May 2026 13:23:55 -0700 (PDT)
Date: Thu, 28 May 2026 20:23:46 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260528202353.3422206-1-praan@google.com>
Subject: [PATCH v5 0/7] iommu: Standardize ATS robustness and state tracking
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
X-CRM114-CacheID: sfid-20260528_132357_921827_34E92B0F 
X-CRM114-Status: GOOD (  10.59  )
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

The primary motivation for this series is an ATS state mismatch observed
under heavy load (via iova_stress). A failure in pci_enable_ats() leaves
IOMMU drivers like arm-smmu-v3 with inconsistent state leading to PCI core
warnings during device detach.

While David's recent work [1] addressed a discovery race for specific
quirked devices by moving them to the HEADER phase, gaps remained
regarding how Virtual Functions (VFs) inherit state from their Physical
Functions (PFs). Specifically, pci_ats_supported() did not account for
PF-level quirked status, and pci_prepare_ats() lacked STU validation for
VFs.

Based on discussion with Jason in v3 it was decided that IOMMU drivers 
should explicitly check pci_ats_supported before calling pci_prepare_ats
To facilitate this, pci_prepare_ats() has been decoupled from the internal
support check. Furthermore, the device probe should fail if pci_prepare_ats()
fails. Since these early gates preclude software configuration errors,
any remaining failure during pci_enable_ats() is treated as a kernel bug

This series standardizes this pattern across ARM SMMUv3, Intel VT-d, &
AMD IOMMU drivers, while also hardening the latter two against pre-existing
issues found by Sashiko in their probe error paths identified during review.

[1] https://lore.kernel.org/linux-pci/20260403222750.1215002-1-dmatlack@google.com/

[v5]
 - Decoupled pci_ats_supported() from pci_prepare_ats() in the PCI core.
 - Rebased SMMUv3 support on top of Nicolin's "Always-On ATS" series.
 - Fixed pre-existing RB-tree corruption in VT-d probe (Baolu/Sashiko).
 - Addressed the pre-existing UAF in AMD IOMMU probe suggested by Sashiko
 - Collected R-b tags from Nicolin.

[v4]
 - https://lore.kernel.org/all/20260525184347.4059549-1-praan@google.com/
 - Standardized the pattern across Intel VT-d and AMD IOMMU drivers.
 - Replaced the SMMUv3 ats_prepared gate with a fatal probe-fail logic.
 - Utilized WARN() macros for runtime enablement failures in all drivers.
 - Collected R-b tags from Jason and Sami.

[v3] https://lore.kernel.org/all/20260519135323.1558777-1-praan@google.com/
[v2] https://lore.kernel.org/all/20260504163842.2692314-1-praan@google.com/


Pranjal Shrivastava (7):
  PCI/ATS: Ensure pci_ats_supported() is PF-aware for VFs
  PCI/ATS: Validate STU for VFs in pci_prepare_ats()
  PCI/ATS: Decouple pci_ats_supported() from pci_prepare_ats()
  iommu/arm-smmu-v3: Standardize ATS enablement failure reporting
  iommu/vt-d: Fix RB-tree corruption and Use-After-Free in probe
  iommu/vt-d: Fail probe on ATS configuration failure
  iommu/amd: Fail probe on ATS configuration failure

 drivers/iommu/amd/iommu.c                   | 30 ++++++++++++++++-----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 +++++--
 drivers/iommu/intel/iommu.c                 | 22 ++++++++++++---
 drivers/pci/ats.c                           | 21 ++++++++++-----
 4 files changed, 64 insertions(+), 19 deletions(-)

-- 
2.54.0.823.g6e5bcc1fc9-goog


