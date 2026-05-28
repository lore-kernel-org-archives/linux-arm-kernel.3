Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34ECCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQXNgdZN3cKQ+g08vXrIsLwNysE31EdhoJp0+kzR5Os=; b=l/FLb4Ws6FroUBWt/VRVjKeFg+
	5U0DepsQl76bsPCIPKVvN0ruDylS2fDApo3XFpw4WzGiRX1bcNl5DA+AC16b4ekJgWW1XouzBqgQB
	GMzZ2WJoXit/E5em1fMJYgf3NOnu18tGcpcccvZDk7vuZUseUiPaxVvKbreuVmxvuRip6iVG9QkT+
	rXDzHGSGJyCzScVuE8YjkjshtI5VWHNCrkRygOlLXWWpi3WzJD4mL5mZX8Ijumu3OraP1XRTjCclE
	K0L2LOpQ1kt4lL3/FFIBTVoqmnOO7rU4//54EwUMLWmb1Mms0OTPlfLwVEgBDDMoEvqubhrDFPm08
	zjbD6fdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShH7-00000006KzM-26N6;
	Thu, 28 May 2026 20:24:17 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShGx-00000006Kua-31T5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:24:08 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c82ac893940so6598817a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779999846; x=1780604646; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OQXNgdZN3cKQ+g08vXrIsLwNysE31EdhoJp0+kzR5Os=;
        b=NyyliFD/BBewgrrbFic+0t1AVzbZopH89ghz0od8oj04CYZY+B/LMwuSBMPzUyZNEi
         2ZoCWQFmm2b7KGXbB42kfrU2kH7hrJ0dq3+rNgNqnl8+AO/fpot20cJAAJNyoELy3UzT
         aGVAXCAYlfYYncW3bnI0zH9239p+FdXmeXuWo/tJ5Q5wxWsBfR0oAo2L8H/ltJZn4biG
         dIchQ5S9iVPBHbhDEWp6VlFlR/dxWJRc6dcZ9ki87lyxAeHIFdktTSZt0PTQsfNbiPf6
         MOmS67Oz6IaHgcoL5n18PLJWZgegI9/kRwO789SMEBu635moqdmy/0YJ6u2I7V7asIqr
         MY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779999846; x=1780604646;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQXNgdZN3cKQ+g08vXrIsLwNysE31EdhoJp0+kzR5Os=;
        b=pCPImQaFw9kSOrz7MMGJzzZhtFxMdk4l0fsGgO6W/UY8W4WezkQGqN4uJ2MfZMieiK
         tLjEfLX/fquhant6BJ9kOEmCfB78c6NHDlUUj9TB6rSVLG1EVphuTIw602vtGAx7sEjS
         acibOPRvjH7HKTVyA6gY1W0jL0Sx4qim9CkWibZ692HIiPPg4B+MULvg4Ln2lMlZltb6
         hobJfxI0dHPSJSR5tKnWEOGS1/2+iG0CMdaxjxGS5PpFClxJiv/9mXKePVpTL35zok7g
         anfg4St324QG+PM+w3JbQrY2PUw6haz0XRM+fvQn8PBjx0dPa200RQZOaQq8D3CTB4o+
         utAA==
X-Forwarded-Encrypted: i=1; AFNElJ+sTalqxIHBqngsjYuiczWwmPP0Eceyfopw5JMbcFyE3dXMhdxPxOrGcoAMOfEKCpWxfrfQ7RY6wVad1DbTzeym@lists.infradead.org
X-Gm-Message-State: AOJu0YzYtoUQSwzPGxtCz5LMefS3Fu29FZ7VdgriLu7YKKwC9EYKPzuQ
	vu3j5Z2n20hEeQruWH5KtOfVau7zY9oRFXZTWfNu1TfIQK/LUITghDNQelP8oNv9WZQhjpUl6dt
	tKQ==
X-Received: from pgce23.prod.google.com ([2002:a05:6a02:1d7:b0:c85:104d:a751])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7a9c:b0:3b3:9815:3e8f
 with SMTP id adf61e73a8af0-3b40e578036mr320728637.24.1779999845986; Thu, 28
 May 2026 13:24:05 -0700 (PDT)
Date: Thu, 28 May 2026 20:23:51 +0000
In-Reply-To: <20260528202353.3422206-1-praan@google.com>
Mime-Version: 1.0
References: <20260528202353.3422206-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260528202353.3422206-6-praan@google.com>
Subject: [PATCH v5 5/7] iommu/vt-d: Fix RB-tree corruption and Use-After-Free
 in probe
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
	Pranjal Shrivastava <praan@google.com>, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_132407_762094_8DD6EDF1 
X-CRM114-Status: GOOD (  15.29  )
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

The intel_iommu_probe_device() function contains two pre-existing
memory safety issues on its error path:

1. The info->node RB-tree member is zero-initialized via kzalloc. If
   a device does not support ATS, the device_rbtree_insert() call is
   skipped. If a subsequent probe step fails, the error path jumps to
   device_rbtree_remove(), which misinterprets the zeroed node as
   a tree root and corrupts the device RB-tree.

2. The info structure is freed on failure, but the pointer remains
   linked to the device via dev_iommu_priv_set(). This leads to a
   Use-After-Free regression if the pointer is accessed later.

Fix these by explicitly initializing the RB-node as empty and guarding
its removal. Additionally, ensure dev_iommu_priv_set(dev, NULL) is
called before freeing the info structure in the error path.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260525205628.CD4431F000E9@smtp.kernel.org/
Suggested-by: Baolu Lu <baolu.lu@linux.intel.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/intel/iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 4d0e65bc131d..ed6d3a0203f5 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -157,7 +157,10 @@ static void device_rbtree_remove(struct device_domain_info *info)
 	unsigned long flags;
 
 	spin_lock_irqsave(&iommu->device_rbtree_lock, flags);
-	rb_erase(&info->node, &iommu->device_rbtree);
+	if (!RB_EMPTY_NODE(&info->node)) {
+		rb_erase(&info->node, &iommu->device_rbtree);
+		RB_CLEAR_NODE(&info->node);
+	}
 	spin_unlock_irqrestore(&iommu->device_rbtree_lock, flags);
 }
 
@@ -3254,6 +3257,7 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
 
 	info->dev = dev;
 	info->iommu = iommu;
+	RB_CLEAR_NODE(&info->node);
 	if (dev_is_pci(dev)) {
 		if (ecap_dev_iotlb_support(iommu->ecap) &&
 		    pci_ats_supported(pdev) &&
@@ -3316,6 +3320,7 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
 clear_rbtree:
 	device_rbtree_remove(info);
 free:
+	dev_iommu_priv_set(dev, NULL);
 	kfree(info);
 
 	return ERR_PTR(ret);
-- 
2.54.0.823.g6e5bcc1fc9-goog


