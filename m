Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4849CCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 18:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hKucAVRhiN094mFuCmSJPl9Zvf4iz9kVDYBn+OIoEcY=; b=1qVQR/76gU1wcZIfonyIYfG7Nc
	e2CA0hk6ool05sGHlbsF32hYuO5u8ZQAzdixAVQUVrlW9uVhMZbZl7w4uWTPr1+PXz0T8rsewqa4I
	TsR+Gix30Z1Vhx0BnjC3xBgpeP7GNBfBm8blzJG9rwN7GyeJ8WfGsbqep9ug8qZh0DE68Cvv5dnxe
	8rBULNRVizSdgykk12fS8jdXvOxfth6CuQnWYQw9PoBFwnqm+9LoBPJvItonLC9cztPSqGQoxqLBq
	3/wE6JULhyqvJb1c4pg+UE6IEP6rIR4Amiu/kX1GU0FrvJ3QyanBTTCPNtojwYBhyokW8ccuYCWTt
	tULAeSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaHL-00000000Fv8-13dZ;
	Mon, 25 May 2026 18:43:55 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaHI-00000000FuN-1HtN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 18:43:53 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2baf7748d0aso97924375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779734631; x=1780339431; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hKucAVRhiN094mFuCmSJPl9Zvf4iz9kVDYBn+OIoEcY=;
        b=p9kByzf/5sWGR3BZiaBv+BukBPWG5fjIW+WLscb5ucBfBz7yl38aye3eHPvWYYtknB
         kVDUALba0E3O3AABqMXL6cj4QTPHQLQYX+QBb8U280MxVaxib8hSkLbSrfsqYS8anCKz
         rDlNE5K/dPLufjB1btdY29B1A5oY/c+AVcDfPZ1OdT730mW53UF8KCX0QMQs4u9L2G5k
         wIy4GtSjS83MTssQ6WBer8O62dFsaUx46y+cQ/9kqN6n7jrJbZaVEnKLznMhajait2ap
         pt8zpvrRfuR6iqCayxmC411zwyGs3jmZlIY2YD+MrUNUONq4qPpm2LpnF3wlAQTGFzgN
         UqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779734631; x=1780339431;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hKucAVRhiN094mFuCmSJPl9Zvf4iz9kVDYBn+OIoEcY=;
        b=T1iPuOzClW1T+NcizDhiOGyKa1MuorhhoXGlJTu6d3w/2Li3QUTf2J3AXXxscvaz/o
         quiUyDDh14s7Kb3du2CGEVnKyg2A7q9p70ZksMiSZd02JwlyCjGz9PHQF4rTfMA7N0uO
         C642f2WMU4MhVW88GoGzW705MaoETaY5f0U3qIeGM8FpuD669pHgoPufzIbIVkzIzAeI
         2tdUeubLw97/LjyVgKyejkMRhdzIyfMcvA2r4ms5ybvoc/uPyYvn2JR5FBU8EavZeCZt
         tA5WGAwHb4wgyhcGXWdjb9ckIhoO9f3tqALWKoRb9z6g44BHPRsSKmhB8SHRol2HBrxc
         Ahcg==
X-Forwarded-Encrypted: i=1; AFNElJ8ghc7XvI/BtjsD0GXFXhqa41WVQbPYlRvQH8n1p7yuDE2o/XxAE/idNj6r9J0/ef5wHIH8R4BpTpWqEtZxmu6l@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9AWtY49TREl4fmbmERnSJLyATVyn+0ilnc1e07pK3vp4orLrR
	tk7kf3CBgKGdXzCevmN/Z3PnrngQUAOFJJ3mg910mPqi3XlSt83MxB6CDowOP+2tx1LftTmg/A1
	D5Q==
X-Received: from pllo21.prod.google.com ([2002:a17:902:7795:b0:2b7:882d:6a56])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d50c:b0:2bc:78ec:54cf
 with SMTP id d9443c01a7336-2beb035a83bmr182353345ad.9.1779734630658; Mon, 25
 May 2026 11:43:50 -0700 (PDT)
Date: Mon, 25 May 2026 18:43:42 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260525184347.4059549-1-praan@google.com>
Subject: [PATCH v4 0/5] iommu: Standardize ATS robustness and state tracking
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
X-CRM114-CacheID: sfid-20260525_114352_351795_1C42CDE4 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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
and the device probe should fail if pci_prepare_ats fails. Since these
early gates preclude software configuration errors, any remaining failure
during pci_enable_ats() is treated as a kernel bug & reported via WARN().

This series standardizes this pattern across ARM SMMUv3, Intel VT-d, &
AMD IOMMU drivers.

[1] https://lore.kernel.org/linux-pci/20260403222750.1215002-1-dmatlack@google.com/

[v4]
 - Standardized the pattern across Intel VT-d and AMD IOMMU drivers.
 - Replaced the SMMUv3 ats_prepared gate with a fatal probe-fail logic.
 - Utilized WARN() macros for runtime enablement failures in all drivers.
 - Collected R-b tags from Jason and Sami.

[v3] https://lore.kernel.org/all/20260519135323.1558777-1-praan@google.com/
[v2] https://lore.kernel.org/all/20260504163842.2692314-1-praan@google.com/

Pranjal Shrivastava (5):
  PCI/ATS: Ensure pci_ats_supported() is PF-aware for VFs
  PCI/ATS: Validate STU for VFs in pci_prepare_ats()
  iommu/arm-smmu-v3: Fix ATS state tracking
  iommu/vt-d: Fail probe on ATS configuration failure
  iommu/amd: Fail probe on ATS configuration failure

 drivers/iommu/amd/iommu.c                   | 27 ++++++++++++++++-----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 21 +++++++++++++---
 drivers/iommu/intel/iommu.c                 | 15 +++++++++---
 drivers/pci/ats.c                           | 14 ++++++++---
 4 files changed, 61 insertions(+), 16 deletions(-)

-- 
2.54.0.746.g67dd491aae-goog


