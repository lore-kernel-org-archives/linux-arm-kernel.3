Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2FACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwbylVdF+O+8AihJparLUGU02SRqGSrn4Cd3mbYF5r4=; b=zUTwBwjsmdb5R3GLLkbOQeYrMI
	I4+fAlpDIB1EvUefGe+9ivVcPuJFdz+HuXn69rwkus+EzyNd3piOMIwaRSYPzZOT6CdLPUwdKwAtW
	8iXeMJ9iofmGz9U6Y4q2OBMNSYPdLYWmBApQL58RGWhFKTbgqjSAN6Aw0uckFNPM11H5yafCrCqeu
	jq5C0cyE3mHwUcwzyhO3LRm7LTLXKeMWUfQxPzXH/yU/RI8Wa+yPkKUD/9b3mzX4lpJ3hnPe7gJSX
	uBVW0CBAejQgcLsBUM5tejvOC4iOKN5ODVFlMFNL3yfXc77xawm2w0zDXTgo0HSCEBxKABBgzV9QC
	uWNS+PaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShGv-00000006Kt6-0UVZ;
	Thu, 28 May 2026 20:24:05 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShGp-00000006Kqp-2nAR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:24:00 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-36bb6c41341so344240a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779999838; x=1780604638; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwbylVdF+O+8AihJparLUGU02SRqGSrn4Cd3mbYF5r4=;
        b=q2Pky6MtsxX4HWF3i7KvZX03ta6nJqO6aVnN7n/GZmoHlY9w/dGV3iUK83RMcxHOEZ
         Zwv7jGeg4xxmOddDKEnzrmV+yhY5o86Ka5oY9N9AcP9MnoVnzHolxwv6gi6ge83pyAUA
         CCfdguN6uHT2S8tch4BuLXD00L5X3n7bQo7I8/Q73x64S1ERjaqCU/h7sg+cycfnzKnW
         pFptUpypPDxueLY4dEbNit3i7PW8DnblFseysZzM+dA+6SFoYozAlVzxo1zCAQuC4nie
         j7Ll+mct0IbYdGimSSMJXMpmLmO+I1ZulPyMzwpLE5FSYwHRv93PlGh+yxi8+m6ThKhW
         qjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779999838; x=1780604638;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwbylVdF+O+8AihJparLUGU02SRqGSrn4Cd3mbYF5r4=;
        b=GqIjAbSwaOa3ferukstZG7x5FzFUtkFNMz5siFX7tfko6XPDrTLlIs/zHI0NBEcfNG
         RhQRpDetjTExM0Q2hB0f8FmfiWUvWpwFCq/DQZOkjthFX1xXfbwp6a6U1FoqDyd4ENpG
         ZUf7b33PBoIz4hqs3DEk5kcbnFCmkbnZISrxO/hTcCUU8T6Yk6Emx+SD4fSHNYNCdMe3
         rV9snciryZ/ocS76elhef3k8sQIN4RskyC0R9lwbC49NeHAOHsRJNvSEKK1iIFNV00zO
         +TgbsV71tPy969gT4MaHY2DtqScAYCFGzclA4bcLNfUxMzIFzNP7d7XJGjSp1mgwexVP
         663w==
X-Forwarded-Encrypted: i=1; AFNElJ8RyugCzYDpf7pHCy+OT/0Xr4PKE+by7V8kBsYoYCiESvnmVbeUKsx/8xymL7Uk+Y00hcWGOzVYG3E1rHs8v45Z@lists.infradead.org
X-Gm-Message-State: AOJu0YwABNKK/W+zk3O07URqTl1YtAk5OduwCP6f1O7+wI4zyZaeXl39
	38JmHcqXd6xow5OmtMzZ6on7+vPxtLnkCWcp3HRrQZqymPTQ1dYaP99Mu8uZ08oSYxrGsxcN1r0
	ZGA==
X-Received: from pjbcu14.prod.google.com ([2002:a17:90a:fa8e:b0:369:9cde:eaa0])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7c9:b0:368:1088:bb1d
 with SMTP id 98e67ed59e1d1-36bbcfd9807mr90130a91.15.1779999837989; Thu, 28
 May 2026 13:23:57 -0700 (PDT)
Date: Thu, 28 May 2026 20:23:47 +0000
In-Reply-To: <20260528202353.3422206-1-praan@google.com>
Mime-Version: 1.0
References: <20260528202353.3422206-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260528202353.3422206-2-praan@google.com>
Subject: [PATCH v5 1/7] PCI/ATS: Ensure pci_ats_supported() is PF-aware for VFs
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
	Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_132359_704101_F6165F63 
X-CRM114-Status: GOOD (  11.28  )
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

Update pci_ats_supported() to additionally check the associated PF's
status when called on a VF. This ensures that PF-level quirks and
untrusted status are correctly propagated to VFs, providing a robust
support check that aligns with the kernel's PF-centric ATS configuration
model and is immune to the timing of VF-specific fixups.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/pci/ats.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index 96efa00d9743..679a3c3c1d54 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -40,10 +40,13 @@ void pci_ats_init(struct pci_dev *dev)
  */
 bool pci_ats_supported(struct pci_dev *dev)
 {
-	if (!dev->ats_cap)
+	if (!dev->ats_cap || dev->untrusted)
 		return false;
 
-	return (dev->untrusted == 0);
+	if (dev->is_virtfn)
+		return pci_ats_supported(pci_physfn(dev));
+
+	return true;
 }
 EXPORT_SYMBOL_GPL(pci_ats_supported);
 
-- 
2.54.0.823.g6e5bcc1fc9-goog


