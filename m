Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEE2CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xWJsQ/41akAuUsf+Yb2x4PykPgg0DSrsfcVLaBUG/04=; b=OzpZpGp8p6rwTe7Mup4s/gE6Vi
	jv6JM6/hsVqrs26AYw/POsusXYMcdSnC+DUenbQZBZ2GUfWl4wV3NgQLIhX4DhnQSOK9upPQMb9I+
	74cnLjvXxj9Wi6oIwNky0GAZ81Ve1WNuhOXVyG+s75BfJXSjsEzAyzyli0doKF7Vce6ianTxnfj8E
	9Mlx/GwrEFKOWUrQwaT9xX+6vL+FDlHiMxBjNH04bEhdoF6bsWXlI5jhqS026olK+kHn+Lc0TDZ0z
	7iQp4c06+FXDvEML85QJKr4n6KI+aXOKIJp9Ak1YmsK1WNDNXyslq38652P07KjMbHUHr63BORdgd
	rxZ1z7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNp7p-00000007weS-230D;
	Fri, 15 May 2026 09:46:33 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNp7m-00000007wdm-1rId
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:46:31 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c827c880e39so3626062a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778838389; x=1779443189; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xWJsQ/41akAuUsf+Yb2x4PykPgg0DSrsfcVLaBUG/04=;
        b=BYu0GFd5maP6rC4dBhhzRjQuAks0l6PPRhv07R81TfYj6l8cYOGezC7Jg5Q87bmsfm
         2FHKmr7RxlS8aL/WDHfsbXbnFMIZ8Oda+qsl0W3vIZrDxg5UxFBum2ecvBXZgwWcFsJh
         sZPKaxUyV2waWkdLhna8NOrc4oY4BIyyTJlMAtvlY5VG9FEvdAO0ZlZBlldqPWBEPNJC
         KT5htkcanmLWIbKTvk7qsYLs2j1fD0OrumJZ+bWe+Z6elDiQ+d1msakJC8Y9CbUHjCO+
         9molTeC4Qf8J258um5VlbHgVHZD50Xrbe21LIBfT8RVmrj6eCJLlFgJyJHTDSdU6FIrb
         WqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778838389; x=1779443189;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWJsQ/41akAuUsf+Yb2x4PykPgg0DSrsfcVLaBUG/04=;
        b=RAyJPljsspRmp+XNsBRsUfMGcvSpWprUCmmD6n++mw6SKOzL/Of/8JeD/tC3PRl0K8
         wg/6UWkOUqgTL/nmUMBnmxoe8Ji8xrgYO9dFoQpWr2QD57rOadPNHl8z67qPMWjdCeuM
         Rs65o5iNOzGevu1c+3N3ubIMmsP68RnHYivIKuV6qsOrllZpT/+wYljdCooCB2KWKG6m
         UzuioKEi7MUKUwFdfQYUCldLEjqymjvEGhzW+4HFr+84l+80XXNQd1phZFkK9OMd9K+Q
         Jav6zdKTFS9+xE6m3DpbTh3JB8jO7hU0EDzai9OajsVdu5dmHNgHkm64qPBZE1/djKii
         N85w==
X-Forwarded-Encrypted: i=1; AFNElJ+Ws3P/LoNylxPPgbMcdLVSGZ+0nABGXnPKHDlb6+jJp5MWwAFRoZew/+doTAfW089zfRppmgWfBlH63JIUmAac@lists.infradead.org
X-Gm-Message-State: AOJu0YzN1yRo4LBpeGWcrFlWO1RV8Yl8a00+9OcctcAMgVLjcSwS9xWb
	CxJGVQARMXV/y8EjmwoSzTxDVUVcqdfc51jFF63Yk96brIaI2QtgA/q9sU78KoUqbsB+ybRtGVQ
	RxoJdVYAlVHo48M0+PTz2b86RcQ==
X-Received: from pgbdo6.prod.google.com ([2002:a05:6a02:e86:b0:c76:669e:8145])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:33a1:b0:3a3:a55f:405d with SMTP id adf61e73a8af0-3b22ea76bdamr3616498637.13.1778838388477;
 Fri, 15 May 2026 02:46:28 -0700 (PDT)
Date: Fri, 15 May 2026 09:46:05 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515094605.3195841-1-joonwonkang@google.com>
Subject: [PATCH] iommu: Allow device driver to use its own PASID space for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: jgg@ziepe.ca, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	jpb@kernel.org
Cc: Alexander.Grest@microsoft.com, amhetre@nvidia.com, 
	baolu.lu@linux.intel.com, easwar.hariharan@linux.microsoft.com, 
	jacob.jun.pan@linux.intel.com, kees@kernel.org, kevin.tian@intel.com, 
	nicolinc@nvidia.com, praan@google.com, smostafa@google.com, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, peterz@infradead.org, sohil.mehta@intel.com, kas@kernel.org, 
	alexander.shishkin@linux.intel.com, ryasuoka@redhat.com, xin@zytor.com, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joonwonkang@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_024630_503979_415615BF 
X-CRM114-Status: GOOD (  30.06  )
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

For SVA, the IOMMU core always allocates PASID from the global PASID
space. The use of this global PASID space comes from the limitation of
the ENQCMD instruction in Intel CPUs that it fetches its PASID operand
from IA32_PASID, which is per-process; when a process wants to
communicate with multiple devices with the ENQCMD instruction, it cannot
change its PASID for each device without the kernel's intervention. Also
note that ARM introduced a similar instruction, which is ST64BV0.

Due to this nature, SVA with ARM SMMU v3 has been found not working in
our environment when other modules/devices compete for PASID. The
environment looks as follows:

- The device is not a PCIe device.
- The device is to use SVA.
- The supported SSID/PASID space is very small for the device; only 1 to
  3 SSIDs are supported.

With this setup, when other modules have allocated all the PASIDs that
our device is expected to use from the global PASID space via APIs like
iommu_alloc_global_pasid() or iommu_sva_bind_device(), SVA binding to
our device fails due to the lack of available PASIDs.

This commit resolves the issue by allowing device driver to maintain its
own PASID space and assign a PASID from that for the process-device bond
via a new API called `iommu_sva_bind_device_pasid(dev, mm, pasid)`. Doing
that, however, will disallow the process to execute the ENQCMD-like
instructions at EL0. It is because the process cannot change its PASID in
IA32_PASID(or ACCDATA_EL1 on ARM) for each device without the kernel's
intervention. For this reason, calling `iommu_sva_bind_device()` and then
`iommu_sva_bind_device_pasid()` for the same process will not be allowed
and vice versa.

Currently, there is a limitation that a process simultaneously doing SVA
with multiple devices with different PASIDs is not supported. So, calling
`iommu_sva_bind_device_pasid()` multiple times for the same process with
different devices will not be allowed for now while that for
`iommu_sva_bind_device()` will be.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Suggested-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Joonwon Kang <joonwonkang@google.com>
---
 arch/x86/kernel/traps.c   |   2 +
 drivers/iommu/iommu-sva.c | 111 +++++++++++++++++++++++++++++---------
 include/linux/iommu.h     |  14 ++++-
 3 files changed, 102 insertions(+), 25 deletions(-)

diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 0ca3912ecb7f..61e2e52105e5 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -864,6 +864,8 @@ static bool try_fixup_enqcmd_gp(void)
 		return false;
 
 	pasid = mm_get_enqcmd_pasid(current->mm);
+	if (pasid == IOMMU_PASID_INVALID)
+		return false;
 
 	/*
 	 * Did this thread already have its PASID activated?
diff --git a/drivers/iommu/iommu-sva.c b/drivers/iommu/iommu-sva.c
index bc7c7232a43e..12d6d638c827 100644
--- a/drivers/iommu/iommu-sva.c
+++ b/drivers/iommu/iommu-sva.c
@@ -10,6 +10,9 @@
 
 #include "iommu-priv.h"
 
+/* Whether pasid is to be allocated from the global PASID space */
+#define IOMMU_PASID_GLOBAL_ANY IOMMU_NO_PASID
+
 static DEFINE_MUTEX(iommu_sva_lock);
 static bool iommu_sva_present;
 static LIST_HEAD(iommu_sva_mms);
@@ -17,10 +20,11 @@ static struct iommu_domain *iommu_sva_domain_alloc(struct device *dev,
 						   struct mm_struct *mm);
 
 /* Allocate a PASID for the mm within range (inclusive) */
-static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct device *dev)
+static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm,
+						 struct device *dev,
+						 ioasid_t pasid)
 {
 	struct iommu_mm_data *iommu_mm;
-	ioasid_t pasid;
 
 	lockdep_assert_held(&iommu_sva_lock);
 
@@ -39,10 +43,15 @@ static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct de
 	if (!iommu_mm)
 		return ERR_PTR(-ENOMEM);
 
-	pasid = iommu_alloc_global_pasid(dev);
-	if (pasid == IOMMU_PASID_INVALID) {
-		kfree(iommu_mm);
-		return ERR_PTR(-ENOSPC);
+	if (pasid == IOMMU_PASID_GLOBAL_ANY) {
+		pasid = iommu_alloc_global_pasid(dev);
+		if (pasid == IOMMU_PASID_INVALID) {
+			kfree(iommu_mm);
+			return ERR_PTR(-ENOSPC);
+		}
+		iommu_mm->pasid_global = true;
+	} else {
+		iommu_mm->pasid_global = false;
 	}
 	iommu_mm->pasid = pasid;
 	iommu_mm->mm = mm;
@@ -56,20 +65,9 @@ static struct iommu_mm_data *iommu_alloc_mm_data(struct mm_struct *mm, struct de
 	return iommu_mm;
 }
 
-/**
- * iommu_sva_bind_device() - Bind a process address space to a device
- * @dev: the device
- * @mm: the mm to bind, caller must hold a reference to mm_users
- *
- * Create a bond between device and address space, allowing the device to
- * access the mm using the PASID returned by iommu_sva_get_pasid(). If a
- * bond already exists between @device and @mm, an additional internal
- * reference is taken. Caller must call iommu_sva_unbind_device()
- * to release each reference.
- *
- * On error, returns an ERR_PTR value.
- */
-struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
+static struct iommu_sva *iommu_sva_bind_device_internal(struct device *dev,
+							struct mm_struct *mm,
+							ioasid_t pasid)
 {
 	struct iommu_group *group = dev->iommu_group;
 	struct iommu_attach_handle *attach_handle;
@@ -84,12 +82,25 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm
 	mutex_lock(&iommu_sva_lock);
 
 	/* Allocate mm->pasid if necessary. */
-	iommu_mm = iommu_alloc_mm_data(mm, dev);
+	iommu_mm = iommu_alloc_mm_data(mm, dev, pasid);
 	if (IS_ERR(iommu_mm)) {
 		ret = PTR_ERR(iommu_mm);
 		goto out_unlock;
 	}
 
+	if ((pasid == IOMMU_PASID_GLOBAL_ANY && !iommu_mm->pasid_global) ||
+	    (pasid != IOMMU_PASID_GLOBAL_ANY && iommu_mm->pasid_global)) {
+		ret = -EBUSY;
+		goto out_unlock;
+	} else if (pasid != IOMMU_PASID_GLOBAL_ANY && pasid != iommu_mm->pasid) {
+		/*
+		 * Currently, a process simultaneously doing SVA with multiple
+		 * devices with different PASIDs is not supported.
+		 */
+		ret = -ENOSPC;
+		goto out_unlock;
+	}
+
 	/* A bond already exists, just take a reference`. */
 	attach_handle = iommu_attach_handle_get(group, iommu_mm->pasid, IOMMU_DOMAIN_SVA);
 	if (!IS_ERR(attach_handle)) {
@@ -157,8 +168,56 @@ struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm
 	mutex_unlock(&iommu_sva_lock);
 	return ERR_PTR(ret);
 }
+
+/**
+ * iommu_sva_bind_device() - Bind a process address space to a device
+ * @dev: the device
+ * @mm: the mm to bind, caller must hold a reference to mm_users
+ *
+ * Create a bond between device and address space, allowing the device to
+ * access the mm using the PASID returned by iommu_sva_get_pasid(). If a
+ * bond already exists between @device and @mm, an additional internal
+ * reference is taken. Caller must call iommu_sva_unbind_device()
+ * to release each reference.
+ *
+ * On error, returns an ERR_PTR value.
+ */
+struct iommu_sva *iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
+{
+	return iommu_sva_bind_device_internal(dev, mm, IOMMU_PASID_GLOBAL_ANY);
+}
 EXPORT_SYMBOL_GPL(iommu_sva_bind_device);
 
+/**
+ * iommu_sva_bind_device_pasid() - Bind a process address space to a device
+ * with a designated pasid
+ * @dev: the device
+ * @mm: the mm to bind, caller must hold a reference to mm_users
+ * @pasid: the pasid to assign to the bond
+ *
+ * Create a bond between device and address space, allowing the device to
+ * access the mm using the PASID returned by iommu_sva_get_pasid(). If a
+ * bond already exists between @device and @mm, an additional internal
+ * reference is taken. Caller must call iommu_sva_unbind_device()
+ * to release each reference.
+ *
+ * It is the caller's responsibility to maintain the PASID space for @pasid.
+ * After the bond is created, the process for @mm will not be able to execute
+ * ENQCMD or similar instructions at EL0. To allow those instructions at EL0,
+ * iommu_sva_bind_device() must be used instead.
+ *
+ * On error, returns an ERR_PTR value.
+ */
+struct iommu_sva *iommu_sva_bind_device_pasid(struct device *dev,
+					      struct mm_struct *mm,
+					      ioasid_t pasid)
+{
+	if (pasid == IOMMU_PASID_GLOBAL_ANY)
+		return ERR_PTR(-EINVAL);
+	return iommu_sva_bind_device_internal(dev, mm, pasid);
+}
+EXPORT_SYMBOL_GPL(iommu_sva_bind_device_pasid);
+
 /**
  * iommu_sva_unbind_device() - Remove a bond created with iommu_sva_bind_device
  * @handle: the handle returned by iommu_sva_bind_device()
@@ -198,9 +257,12 @@ EXPORT_SYMBOL_GPL(iommu_sva_unbind_device);
 
 u32 iommu_sva_get_pasid(struct iommu_sva *handle)
 {
-	struct iommu_domain *domain = handle->handle.domain;
+	struct iommu_mm_data *iommu_mm = handle->handle.domain->mm->iommu_mm;
+
+	if (!iommu_mm)
+		return IOMMU_PASID_INVALID;
 
-	return mm_get_enqcmd_pasid(domain->mm);
+	return iommu_mm->pasid;
 }
 EXPORT_SYMBOL_GPL(iommu_sva_get_pasid);
 
@@ -211,7 +273,8 @@ void mm_pasid_drop(struct mm_struct *mm)
 	if (!iommu_mm)
 		return;
 
-	iommu_free_global_pasid(iommu_mm->pasid);
+	if (iommu_mm->pasid_global)
+		iommu_free_global_pasid(iommu_mm->pasid);
 	kfree(iommu_mm);
 }
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index e587d4ac4d33..5b6116e7152d 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1140,6 +1140,7 @@ struct iommu_sva {
 
 struct iommu_mm_data {
 	u32			pasid;
+	bool			pasid_global;
 	struct mm_struct	*mm;
 	struct list_head	sva_domains;
 	struct list_head	mm_list_elm;
@@ -1626,7 +1627,7 @@ static inline u32 mm_get_enqcmd_pasid(struct mm_struct *mm)
 {
 	struct iommu_mm_data *iommu_mm = READ_ONCE(mm->iommu_mm);
 
-	if (!iommu_mm)
+	if (!iommu_mm || !iommu_mm->pasid_global)
 		return IOMMU_PASID_INVALID;
 	return iommu_mm->pasid;
 }
@@ -1634,6 +1635,9 @@ static inline u32 mm_get_enqcmd_pasid(struct mm_struct *mm)
 void mm_pasid_drop(struct mm_struct *mm);
 struct iommu_sva *iommu_sva_bind_device(struct device *dev,
 					struct mm_struct *mm);
+struct iommu_sva *iommu_sva_bind_device_pasid(struct device *dev,
+					      struct mm_struct *mm,
+					      ioasid_t pasid);
 void iommu_sva_unbind_device(struct iommu_sva *handle);
 u32 iommu_sva_get_pasid(struct iommu_sva *handle);
 void iommu_sva_invalidate_kva_range(unsigned long start, unsigned long end);
@@ -1644,6 +1648,14 @@ iommu_sva_bind_device(struct device *dev, struct mm_struct *mm)
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct iommu_sva *
+iommu_sva_bind_device_pasid(struct device *dev,
+			    struct mm_struct *mm,
+			    ioasid_t pasid)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void iommu_sva_unbind_device(struct iommu_sva *handle)
 {
 }
-- 
2.54.0.563.g4f69b47b94-goog


