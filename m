Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8011CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1WHbQ1I/exyopX3p7b75ehhnkD9ODb3Bve7jByn9iQ=; b=gB+HpTJWJISunus+09boZcvElS
	MotGZaPEKTI+JlqiRSl5gGyVrrOs55ptI/gYyyUN5tq70IyvIaViZZyp/qyqf63o+7Cx4hj6l+ckP
	kornSqq3tNkuLItJ8a+oUjDNU12ihOC6fuTrGh6QRir6J9aREfCExr6W5IzgMEgT6+nIXBayyQSNn
	vpS6bsilkCkcIwQDqM+kvMdzLAoyChTzXAmwc5IoBIESrQO0Q4CmpZ7GxjkiMpGbrd/P/C5LV7t8C
	xisnEV+j74O/0w85/TUMkwuX35sZSMylA3JClfKb2WFPUuCztMQQC5jr0YtAeV9RDVEihcMP+Erj0
	fVqo+joA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv8Y-00000007FcO-1775;
	Fri, 29 May 2026 11:12:22 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv8R-00000007FZw-2ccF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:12:16 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b99eb06178so62691545ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 04:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780053134; x=1780657934; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1WHbQ1I/exyopX3p7b75ehhnkD9ODb3Bve7jByn9iQ=;
        b=ps+PKodnOOWxYMGGXY7KRqHnBvwg7EX3bFOhZhChwocp1qvQSGqJ97/+pDsmEbpFB4
         EW/zXL0xp/ud+RcN4jNRHG83IDQAL0KqMEEy7s1qN3J2LyM6cU1w5Kspnt6wgH09bWp3
         8DSzFx0AQ+brcye98eIhgEW2Qh5ld6YkmhdFn8fjw0p12/5bq+My9wLndLCd4FgSWa18
         v4E/lVZ+W78HojE0TIvIp8LkaFqtyzwLtcOrGuI1Ukh6BOlLfV0ZRbZgnKg7v1hbVcP5
         S8LeTM9MXLpvGKxRvWq/UW0vduN4eeEKWln29w5csg2tONdH2swFzAHTRuvP+OAfKK+A
         oLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053134; x=1780657934;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H1WHbQ1I/exyopX3p7b75ehhnkD9ODb3Bve7jByn9iQ=;
        b=Xh5jNtUb0pQUpHeI6g8uElSG8kVaqSYmdTevEl6/pjb6AgYz41rTaCC9WY1bFgmEFQ
         W3TofeQxntQMMPf1YNBs9zEIE91aBoyTGOvBfD0oKwTWNPSIGMK9Og2JTIvjgE5fKhxf
         HLyFBbrd3CcHjKXRF0pxqkgSXEr213GhtFXqlXUafdN2iwwWw1FmulX07X2SZQuoB5Vq
         o7dZ1Z04ppf7JYVSZVtdc6ybxUmpkKUH8V0wLezZyD+sb9EGWv5140JrUPlMi4YAskqR
         FQqyfO0TonnC7QLlePNNY7N123ZviKV4lYC90HCE7AZKDR8xbY8og7DEQoJXSOZ250Tx
         8UhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JQbGU3AFEfwqGpcRhCQNxTT0CbAOGB3aaE4NXSYqw5PF6Ea1HUDu7C9lCr1MVHlE57Is0pgKQmjFf2lrqmYJd@lists.infradead.org
X-Gm-Message-State: AOJu0YykbA1ZyTrlsMNzvdKCAb2s6e6i/uyHg7Px/M63Q/cilV3+aad0
	1Z+zrM2JIVws/jpgU3zidwZfB/q1hlRcClMDPujaK/Ixsun6lzT/aneyqFy7vNPh4HJx6kW8wR0
	btw==
X-Received: from pln12.prod.google.com ([2002:a17:903:360c:b0:2bd:5ced:c1c0])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ced0:b0:2bc:7d1d:b677
 with SMTP id d9443c01a7336-2bf20ce01c6mr32213585ad.36.1780053134160; Fri, 29
 May 2026 04:12:14 -0700 (PDT)
Date: Fri, 29 May 2026 11:12:03 +0000
In-Reply-To: <20260529111208.387412-1-praan@google.com>
Mime-Version: 1.0
References: <20260529111208.387412-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529111208.387412-2-praan@google.com>
Subject: [PATCH v6 1/6] PCI/ATS: Ensure pci_ats_supported() is PF-aware for VFs
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
X-CRM114-CacheID: sfid-20260529_041215_666575_254EC119 
X-CRM114-Status: GOOD (  11.52  )
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
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
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


