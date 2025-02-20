Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E3CC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 22:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o5DmJ1Qvvgo1Z9At6ruPZoGZsosgTSMjrNaaieIFxqo=; b=mEuPnyGf/fRTQPNA4dUC3z+5lm
	BG7xVY/MlX8v5AHp9MtiLrvy5Cp7QCRZbTou0nI0OvpNy965K29H8KjBSzNq3gzbSXIQBn+Mo79hx
	RcQqXRxaWdjYJa9heTRufa2JwKNuYo2rOE4AgWpECQ73e37vWYriJlHMxx0mLd5NHilDfz5Vmwcm8
	k7w3lFJp2H7OzrCRcPwgeMnqF5WxSSUcZaT+urO6ZYv4QqB0l/NT46BuX2Zmab2dRtMuz2AqSuZyj
	sL12Mh8P/elFTmqiU08YrlzjcpSHjmDaJ8XRL7ElxWWmdshgHkZzSD0MqIqsYt893VrvwcTJ4Mwlz
	I+kEjVZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFHM-00000003BoM-0n51;
	Thu, 20 Feb 2025 22:44:24 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFFs-00000003Bal-1qBh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 22:42:53 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2fc2b258e82so3258584a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 14:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740091370; x=1740696170; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o5DmJ1Qvvgo1Z9At6ruPZoGZsosgTSMjrNaaieIFxqo=;
        b=S/W53G8OxmenfBHfNCPCDZ6SmNR8jMx4Ty5K5hDMJd3C0QM16DiJRnskoVHDX08Jua
         1pWXSLGBemdgMQZ7jcciMQMZBP9I3F+eSZqE9Evr5Geo88G5KMS51uSYHJ/WlTrExVyz
         jck+syzOgMwRQ9cusBOm7p9e0OYsPdf9FUcCOLNIZY5TQmh/fWeJIqWgzDIsquEL7iUT
         CggsSQVaMR16vb++jwyjXolQpbgYTd5mGQkkkcg45oRKte9AVt1Ik8T+bJOo4JEmjhUi
         Ze2YnO0J7fnCzdV/zqiIs7f3+OHajStx4fVomy7GvIIZ5hvbqOtJJozOHPZGSQHSISvv
         1QcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740091370; x=1740696170;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5DmJ1Qvvgo1Z9At6ruPZoGZsosgTSMjrNaaieIFxqo=;
        b=snBRWXsoH9MfiyCcJLttjHNFqDupC6A7YdF75Xehgxjtr8K+YAfxhmuu40lBokSpHB
         T2Ob3TZP1HsLjrvlqG+cgxgIwseWaKdBJKYwCsD6fwF4mBxTMSX+SV9WrHDkesGyQxZY
         O9Wrn4GW5AVKoyVhfuuwnjki1oApUvESX3WyTgXPSSRHz7A3amf4MUQLIqeJo48i2DBD
         CkfZIrqpqbH0aLlD/inj6Q890fKk62BOoe7ZU+4DRbf6iBO87aYMsPlfOMinF5xbEZCE
         rlFtIhTldz/kNx76IP1J/NNgM/jQpuODlYxidZuIz8VVLp/6WsYN3m1CRase9COsZGMa
         TCeg==
X-Forwarded-Encrypted: i=1; AJvYcCXnjBh8gqI9XfylqpUkOveZSwZYecwwX6TN26RBUI7IwQFqAOGurafvGZKrxkzBFlinAue2G4KMg0M0yZPH9A+l@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Jj0L9BREgAN6kZmI2gV3RcGC8e8C7QRjlo55p/bbW9jE8K8D
	+jFjodxtkcfJwiNUk79MrcPzBnxkYuU3t6qlYFZslG1HwE2KwSK16UVbhnOOiq5qjPVZhKIQ4TL
	wAsK+YQloGnjyxP+kULOVkQ==
X-Google-Smtp-Source: AGHT+IHYGyoFxCA6j/z6yzorke0KV3cCeXvLmajggW5wwQuV3RAcPPZclS+SJSaT8x07bSqV3+hOj3DPYot55n4OyQ==
X-Received: from pjg16.prod.google.com ([2002:a17:90b:3f50:b0:2e0:915d:d594])
 (user=jingzhangos job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1a88:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-2fce7af3f1cmr1654619a91.24.1740091370587;
 Thu, 20 Feb 2025 14:42:50 -0800 (PST)
Date: Thu, 20 Feb 2025 14:42:46 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250220224247.2017205-1-jingzhangos@google.com>
Subject: [PATCH v2] KVM: arm64: vgic-its: Add debugfs interface to expose ITS tables
From: Jing Zhang <jingzhangos@google.com>
To: KVMARM <kvmarm@lists.linux.dev>, ARMLinux <linux-arm-kernel@lists.infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_144252_484173_ED771CB1 
X-CRM114-Status: GOOD (  32.02  )
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

This commit introduces a debugfs interface to display the contents of the
VGIC Interrupt Translation Service (ITS) tables.

The ITS tables map Device/Event IDs to Interrupt IDs and target processors.
Exposing this information through debugfs allows for easier inspection and
debugging of the interrupt routing configuration.

The debugfs interface presents the ITS table data in a tabular format:

    Device ID: 0x0, Event ID Range: [0 - 31]
    EVENT_ID    INTID  HWINTID   TARGET   COL_ID HW
    -----------------------------------------------
           0     8192        0        0        0  0
           1     8193        0        0        0  0
           2     8194        0        2        2  0

    Device ID: 0x18, Event ID Range: [0 - 3]
    EVENT_ID    INTID  HWINTID   TARGET   COL_ID HW
    -----------------------------------------------
           0     8225        0        0        0  0
           1     8226        0        1        1  0
           2     8227        0        3        3  0

    Device ID: 0x10, Event ID Range: [0 - 7]
    EVENT_ID    INTID  HWINTID   TARGET   COL_ID HW
    -----------------------------------------------
           0     8229        0        3        3  1
           1     8230        0        0        0  1
           2     8231        0        1        1  1
           3     8232        0        2        2  1
           4     8233        0        3        3  1

The output is generated using the seq_file interface, allowing for efficient
handling of potentially large ITS tables.

This interface is read-only and does not allow modification of the ITS
tables. It is intended for debugging and informational purposes only.

Signed-off-by: Jing Zhang <jingzhangos@google.com>
---
v1 -> v2:
 - Rebase on to v6.14-rc3.
 - Move the code in vgic-its-debug.c into vgic-debug.c.
 - Addressed other comments from Marc for v1 [2].

rfc -> v1:
 - Rebase on to v6.14-rc2.
 - Retained only the debugfs interface patch from the original RFC [1].

[1] https://lore.kernel.org/all/20250113193128.1533449-1-jingzhangos@google.com
[2] https://lore.kernel.org/all/20250214020258.2436469-1-jingzhangos@google.com
---
 arch/arm64/kvm/vgic/vgic-debug.c | 230 +++++++++++++++++++++++++++++++
 arch/arm64/kvm/vgic/vgic-its.c   |  39 ++----
 arch/arm64/kvm/vgic/vgic.h       |  33 +++++
 3 files changed, 271 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-debug.c b/arch/arm64/kvm/vgic/vgic-debug.c
index afb018528bc3b..a10ec54264bec 100644
--- a/arch/arm64/kvm/vgic/vgic-debug.c
+++ b/arch/arm64/kvm/vgic/vgic-debug.c
@@ -2,6 +2,12 @@
 /*
  * Copyright (C) 2016 Linaro
  * Author: Christoffer Dall <christoffer.dall@linaro.org>
+ *
+ * Copyright (C) 2025 Google
+ * Provides a debugfs interface to display the contents of the VGIC ITS
+ * tables. This allows for inspection of the mapping between Event IDs,
+ * Interrupt IDs, and target processors. The information is presented in
+ * a tabular format through a seq_file interface.
  */
 
 #include <linux/cpu.h>
@@ -320,3 +326,227 @@ void vgic_debug_init(struct kvm *kvm)
 void vgic_debug_destroy(struct kvm *kvm)
 {
 }
+
+/**
+ * struct vgic_its_iter - Iterator for traversing VGIC ITS device tables.
+ * @dev: Pointer to the current its_device being processed.
+ * @ite: Pointer to the current its_ite within the device being processed.
+ *
+ * This structure is used to maintain the current position during iteration
+ * over the ITS device tables. It holds pointers to both the current device
+ * and the current ITE within that device.
+ */
+struct vgic_its_iter {
+	struct its_device *dev;
+	struct its_ite *ite;
+};
+
+/**
+ * end_of_iter - Checks if the iterator has reached the end.
+ * @iter: The iterator to check.
+ *
+ * When the iterator completed processing the final ITE in the last device
+ * table, it was marked to indicate the end of iteration by setting its
+ * device and ITE pointers to NULL.
+ * This function checks whether the iterator was marked as end.
+ *
+ * Return: True if the iterator is marked as end, false otherwise.
+ */
+static inline bool end_of_iter(struct vgic_its_iter *iter)
+{
+	return !iter->dev && !iter->ite;
+}
+
+/**
+ * vigc_its_iter_next - Advances the iterator to the next entry in the ITS tables.
+ * @its: The VGIC ITS structure.
+ * @iter: The iterator to advance.
+ *
+ * This function moves the iterator to the next ITE within the current device,
+ * or to the first ITE of the next device if the current ITE is the last in
+ * the device. If the current device is the last device, the iterator is set
+ * to indicate the end of iteration.
+ */
+static void vgic_its_iter_next(struct vgic_its *its, struct vgic_its_iter *iter)
+{
+	struct its_device *dev = iter->dev;
+	struct its_ite *ite = iter->ite;
+
+	if (!ite || list_is_last(&ite->ite_list, &dev->itt_head)) {
+		if (list_is_last(&dev->dev_list, &its->device_list)) {
+			dev = NULL;
+			ite = NULL;
+		} else {
+			dev = list_next_entry(dev, dev_list);
+			ite = list_first_entry_or_null(&dev->itt_head,
+						       struct its_ite,
+						       ite_list);
+		}
+	} else {
+		ite = list_next_entry(ite, ite_list);
+	}
+
+	iter->dev = dev;
+	iter->ite = ite;
+}
+
+/**
+ * vgic_its_debug_start - Start function for the seq_file interface.
+ * @s: The seq_file structure.
+ * @pos: The starting position (offset).
+ *
+ * This function initializes the iterator to the beginning of the ITS tables
+ * and advances it to the specified position. It acquires the its_lock mutex
+ * to protect shared data.
+ *
+ * Return: An iterator pointer on success, NULL if no devices are found or
+ *         the end of the list is reached, or ERR_PTR(-ENOMEM) on memory
+ *         allocation failure.
+ */
+static void *vgic_its_debug_start(struct seq_file *s, loff_t *pos)
+{
+	struct vgic_its *its = s->private;
+	struct vgic_its_iter *iter;
+	struct its_device *dev;
+	loff_t offset = *pos;
+
+	mutex_lock(&its->its_lock);
+
+	dev = list_first_entry_or_null(&its->device_list,
+				       struct its_device, dev_list);
+	if (!dev)
+		return NULL;
+
+	iter = kmalloc(sizeof(*iter), GFP_KERNEL);
+	if (!iter)
+		return ERR_PTR(-ENOMEM);
+
+	iter->dev = dev;
+	iter->ite = list_first_entry_or_null(&dev->itt_head,
+					     struct its_ite, ite_list);
+
+	while (!end_of_iter(iter) && offset--)
+		vgic_its_iter_next(its, iter);
+
+	if (end_of_iter(iter)) {
+		kfree(iter);
+		return NULL;
+	}
+
+	return iter;
+}
+
+/**
+ * vgic_its_debug_next - Next function for the seq_file interface.
+ * @s: The seq_file structure.
+ * @v: The current iterator.
+ * @pos: The current position (offset).
+ *
+ * This function advances the iterator to the next entry and increments the
+ * position.
+ *
+ * Return: An iterator pointer on success, or NULL if the end of the list is
+ *         reached.
+ */
+static void *vgic_its_debug_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct vgic_its *its = s->private;
+	struct vgic_its_iter *iter = v;
+
+	++*pos;
+	vgic_its_iter_next(its, iter);
+
+	if (end_of_iter(iter)) {
+		kfree(iter);
+		return NULL;
+	}
+	return iter;
+}
+
+/**
+ * vgic_its_debug_stop - Stop function for the seq_file interface.
+ * @s: The seq_file structure.
+ * @v: The current iterator.
+ *
+ * This function frees the iterator and releases the its_lock mutex.
+ */
+static void vgic_its_debug_stop(struct seq_file *s, void *v)
+{
+	struct vgic_its *its = s->private;
+	struct vgic_its_iter *iter = v;
+
+	if (!IS_ERR_OR_NULL(iter))
+		kfree(iter);
+	mutex_unlock(&its->its_lock);
+}
+
+/**
+ * vgic_its_debug_show - Show function for the seq_file interface.
+ * @s: The seq_file structure.
+ * @v: The current iterator.
+ *
+ * This function formats and prints the ITS table entry information to the
+ * seq_file output.
+ *
+ * Return: 0 on success.
+ */
+static int vgic_its_debug_show(struct seq_file *s, void *v)
+{
+	struct vgic_its_iter *iter = v;
+	struct its_device *dev = iter->dev;
+	struct its_ite *ite = iter->ite;
+
+	if (list_is_first(&ite->ite_list, &dev->itt_head)) {
+		seq_printf(s, "\n");
+		seq_printf(s, "Device ID: 0x%x, Event ID Range: [0 - %llu]\n",
+			   dev->device_id, BIT_ULL(dev->num_eventid_bits) - 1);
+		seq_printf(s, "EVENT_ID    INTID  HWINTID   TARGET   COL_ID HW\n");
+		seq_printf(s, "-----------------------------------------------\n");
+	}
+
+	if (ite && ite->irq && ite->collection) {
+		seq_printf(s, "%8u %8u %8u %8u %8u %2d\n",
+			   ite->event_id, ite->irq->intid, ite->irq->hwintid,
+			   ite->collection->target_addr,
+			   ite->collection->collection_id, ite->irq->hw);
+	}
+
+	return 0;
+}
+
+static const struct seq_operations vgic_its_debug_sops = {
+	.start = vgic_its_debug_start,
+	.next  = vgic_its_debug_next,
+	.stop  = vgic_its_debug_stop,
+	.show  = vgic_its_debug_show
+};
+
+DEFINE_SEQ_ATTRIBUTE(vgic_its_debug);
+
+/**
+ * vgic_its_debug_init - Initializes the debugfs interface for VGIC ITS.
+ * @dev: The KVM device structure.
+ *
+ * This function creates a debugfs file named "vgic-its-state@%its_base"
+ * to expose the ITS table information.
+ *
+ * Return: 0 on success.
+ */
+int vgic_its_debug_init(struct kvm_device *dev)
+{
+	struct vgic_its *its = dev->private;
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "vgic-its-state@%llx", (u64)its->vgic_its_base);
+	if (!name)
+		return -ENOMEM;
+
+	debugfs_create_file(name, 0444, dev->kvm->debugfs_dentry, its, &vgic_its_debug_fops);
+
+	kfree(name);
+	return 0;
+}
+
+void vgic_its_debug_destroy(struct kvm_device *dev)
+{
+}
diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index fb96802799c6f..569f9da9049fe 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -154,36 +154,6 @@ static struct vgic_irq *vgic_add_lpi(struct kvm *kvm, u32 intid,
 	return irq;
 }
 
-struct its_device {
-	struct list_head dev_list;
-
-	/* the head for the list of ITTEs */
-	struct list_head itt_head;
-	u32 num_eventid_bits;
-	gpa_t itt_addr;
-	u32 device_id;
-};
-
-#define COLLECTION_NOT_MAPPED ((u32)~0)
-
-struct its_collection {
-	struct list_head coll_list;
-
-	u32 collection_id;
-	u32 target_addr;
-};
-
-#define its_is_collection_mapped(coll) ((coll) && \
-				((coll)->target_addr != COLLECTION_NOT_MAPPED))
-
-struct its_ite {
-	struct list_head ite_list;
-
-	struct vgic_irq *irq;
-	struct its_collection *collection;
-	u32 event_id;
-};
-
 /**
  * struct vgic_its_abi - ITS abi ops and settings
  * @cte_esz: collection table entry size
@@ -1938,6 +1908,8 @@ static void vgic_its_destroy(struct kvm_device *kvm_dev)
 
 	mutex_lock(&its->its_lock);
 
+	vgic_its_debug_destroy(kvm_dev);
+
 	vgic_its_free_device_list(kvm, its);
 	vgic_its_free_collection_list(kvm, its);
 	vgic_its_invalidate_cache(its);
@@ -2771,7 +2743,12 @@ static int vgic_its_set_attr(struct kvm_device *dev,
 		if (ret)
 			return ret;
 
-		return vgic_register_its_iodev(dev->kvm, its, addr);
+		ret = vgic_register_its_iodev(dev->kvm, its, addr);
+		if (ret)
+			return ret;
+
+		return vgic_its_debug_init(dev);
+
 	}
 	case KVM_DEV_ARM_VGIC_GRP_CTRL:
 		return vgic_its_ctrl(dev->kvm, its, attr->attr);
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 122d95b4e2845..c2891d7b5e62e 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -172,6 +172,36 @@ struct vgic_reg_attr {
 	gpa_t addr;
 };
 
+struct its_device {
+	struct list_head dev_list;
+
+	/* the head for the list of ITTEs */
+	struct list_head itt_head;
+	u32 num_eventid_bits;
+	gpa_t itt_addr;
+	u32 device_id;
+};
+
+#define COLLECTION_NOT_MAPPED ((u32)~0)
+
+struct its_collection {
+	struct list_head coll_list;
+
+	u32 collection_id;
+	u32 target_addr;
+};
+
+#define its_is_collection_mapped(coll) ((coll) && \
+				((coll)->target_addr != COLLECTION_NOT_MAPPED))
+
+struct its_ite {
+	struct list_head ite_list;
+
+	struct vgic_irq *irq;
+	struct its_collection *collection;
+	u32 event_id;
+};
+
 int vgic_v3_parse_attr(struct kvm_device *dev, struct kvm_device_attr *attr,
 		       struct vgic_reg_attr *reg_attr);
 int vgic_v2_parse_attr(struct kvm_device *dev, struct kvm_device_attr *attr,
@@ -353,4 +383,7 @@ static inline bool kvm_has_gicv3(struct kvm *kvm)
 	return kvm_has_feat(kvm, ID_AA64PFR0_EL1, GIC, IMP);
 }
 
+int vgic_its_debug_init(struct kvm_device *dev);
+void vgic_its_debug_destroy(struct kvm_device *dev);
+
 #endif

base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
-- 
2.48.1.601.g30ceb7b040-goog


