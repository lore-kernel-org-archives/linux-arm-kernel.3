Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075E0FD2D72
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuLKSluxKmhn480CzigIfSkaIIQucOGgq+FPielHBMw=; b=QE9XaSaYrH0le3rmwwv+QreTtY
	MuccSZcObMl92Rsj+iA62wKG4Xp12PqRT7Yf+XAjlYEVw/Wx+zhYovvO6kxZNUXdhe3fTtq1IlE+N
	KDrVc9iCwpBIZcnsKOlVyS6ZfVJD820J7CZ6wyOMLAU4YMZm1MSUL+MHcuUxkG+GIoqQAoCNV6+ap
	XE8vGCacEmg8XqV5JrnKGQTPMqgW7LkLJZXZFmZIh0wwwOTYxvHjtppf7VvjYXALH4NrMnuzfYMFu
	Adzti0vIsIomVA9DzNNAnzgRdU25rFkAnF+xdB4CpoDUnCUOK/KnsOdKafFmsUEKb09KPKTXanXUp
	l2gnL1HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwX5-00000009W9U-3gFI;
	Tue, 10 Mar 2026 12:49:55 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwX1-00000009W5Z-3VSx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:49:53 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b96ec4966cbso225337966b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773146989; x=1773751789; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AuLKSluxKmhn480CzigIfSkaIIQucOGgq+FPielHBMw=;
        b=BVlf2n+lKRb0ATp67eCtmpFkLozXosIIzjRvj7aou+vjDI7WP/h5HUz9zcdG5bjcpU
         NY6Pav7/3iuvfjtxT6n6WeVbnKBK8QfHoK+AGe+9ofwcy69oC9xcsGWRL+bOvSNbFp30
         NRvn9OricY5Ra8yMf/Ahlul2phZP4Upisr4XA2i6YNPsr12iWfWvQUwzXYiAksDSWCAk
         KkN1HqDatCyIqWUFZc2N5phGwdeBUG9V8+LbvRXgk4IE9KeCjnW2RLq1Gh8rpse+vkJL
         ro6E0LlB+LSWttH+TzGSLPa2usrojlHE8EXuzQih2bc937UtyHUzSQCF1vHH5TgZK+1m
         cmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146989; x=1773751789;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AuLKSluxKmhn480CzigIfSkaIIQucOGgq+FPielHBMw=;
        b=hBSL97alrLQk9/JYIBF5DCMbchNJRyCW/lfsBJ/klZI47Zaj0GzKAQAIJ4I6cXkTXc
         ikUSZVVeTOwRdUY3I2hs2AFB6p4Uv0LbacUxqTYiNWRSaJ2mHGf5UFQnZRI4x/5W1ZPd
         9duIC0M1VelYoyVsKv3E3APR7GAWtRcqKjE0cSkAvqVy3oZDduDkbgbpHhw4uNQSv8uA
         El4alAwE2OyQywexerDzwNmWD8e8a88rLG/FMv+6tVJNKydIfUtfw9TlZ9esVafz12f/
         JdXS+SIOZ2xC8n/KFFiUd9k7q2Pv02Y/5fry9CaOvqRQnCZmA9sBNz6L65TWg+VA1uKq
         bksw==
X-Forwarded-Encrypted: i=1; AJvYcCX76g5sN3D/YFenKflxDQa8tUrLZFz8Qg/cBGEvEM9vJlYNMnOeWni3mHZQpaF55ruwqfIRPXv+0rYKRMZrnan0@lists.infradead.org
X-Gm-Message-State: AOJu0YxAcqUqwFlOBjU7z4C+eUxtRCCVyILTSgY7KB3hcdTpq0tGCYcO
	CKwPOvXn2HUsHp++i1FoGV/MAqAQnm1Pvg6WND6xRVvhuJndvPly2AVHufwByF9jMs1bbXgaX4Y
	i15jnUgKbjOXznpXTuG7WXn9o+0+tLQ==
X-Received: from edfa4.prod.google.com ([2002:a50:9e84:0:b0:662:810d:badd])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7290:b0:b8e:9a0:1bfb with SMTP id a640c23a62f3a-b942d58ea78mr829388866b.0.1773146989033;
 Tue, 10 Mar 2026 05:49:49 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:49:25 +0000
In-Reply-To: <20260310124933.830025-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310124933.830025-7-sebastianene@google.com>
Subject: [PATCH 06/14] KVM: arm64: Add infrastructure for ITS emulation setup
From: Sebastian Ene <sebastianene@google.com>
To: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: catalin.marinas@arm.com, dbrazdil@google.com, joey.gouly@arm.com, 
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	perlarsen@google.com, qperret@google.com, rananta@google.com, 
	sebastianene@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_054951_936230_B3449EE5 
X-CRM114-Status: GOOD (  22.81  )
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

Share the host command queue with the hypervisor. Donate
the original command queue memory to the hypervisor to ensure
host exclusion and trap accesses on GITS_CWRITE register.
On a CWRITER write, the hypervisor copies commands from the
host's queue to the protected queue before updating the
hardware register.
This ensures the hypervisor mediates all commands sent to
the physical ITS.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/include/asm/kvm_pkvm.h             |   1 +
 arch/arm64/kvm/hyp/include/nvhe/its_emulate.h |  17 ++
 arch/arm64/kvm/hyp/nvhe/its_emulate.c         | 203 ++++++++++++++++++
 3 files changed, 221 insertions(+)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/its_emulate.h

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index ef00c1bf7d00..dc5ef2f9ac49 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -28,6 +28,7 @@ struct pkvm_protected_reg {
 	u64 start_pfn;
 	size_t num_pages;
 	pkvm_emulate_handler *cb;
+	void *priv;
 };
 
 extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
diff --git a/arch/arm64/kvm/hyp/include/nvhe/its_emulate.h b/arch/arm64/kvm/hyp/include/nvhe/its_emulate.h
new file mode 100644
index 000000000000..6be24c723658
--- /dev/null
+++ b/arch/arm64/kvm/hyp/include/nvhe/its_emulate.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __NVHE_ITS_EMULATE_H
+#define __NVHE_ITS_EMULATE_H
+
+
+#include <asm/kvm_pkvm.h>
+
+
+struct its_shadow_tables;
+
+int pkvm_init_gic_its_emulation(phys_addr_t dev_addr, void *priv_state,
+				struct its_shadow_tables *shadow);
+
+void pkvm_handle_gic_emulation(struct pkvm_protected_reg *region, u64 offset, bool write,
+			       u64 *reg, u8 reg_size);
+#endif /* __NVHE_ITS_EMULATE_H */
diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 0eecbb011898..4a3ccc90a1a9 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -1,8 +1,75 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <asm/kvm_pkvm.h>
+#include <linux/irqchip/arm-gic-v3.h>
+#include <nvhe/its_emulate.h>
 #include <nvhe/mem_protect.h>
 
+struct its_priv_state {
+	void *base;
+	void *cmd_hyp_base;
+	void *cmd_host_base;
+	void *cmd_host_cwriter;
+	struct its_shadow_tables *shadow;
+	hyp_spinlock_t its_lock;
+};
+
+struct its_handler {
+	u64 offset;
+	u8 access_size;
+	void (*write)(struct its_priv_state *its, u64 offset, u64 value);
+	void (*read)(struct its_priv_state *its, u64 offset, u64 *read);
+};
+
+DEFINE_HYP_SPINLOCK(its_setup_lock);
+
+static void cwriter_write(struct its_priv_state *its, u64 offset, u64 value)
+{
+	u64 cwriter_offset = value & GENMASK(19, 5);
+	int cmd_len, cmd_offset;
+	size_t cmdq_sz = its->shadow->cmdq_len;
+
+	if (cwriter_offset > cmdq_sz)
+		return;
+
+	cmd_offset = its->cmd_host_cwriter - its->cmd_host_base;
+	cmd_len = cwriter_offset - cmd_offset;
+	if (cmd_len < 0)
+		cmd_len = cmdq_sz - cmd_offset;
+
+	if (cmd_offset + cmd_len > cmdq_sz)
+		return;
+
+	memcpy(its->cmd_hyp_base + cmd_offset, its->cmd_host_cwriter, cmd_len);
+
+	its->cmd_host_cwriter = its->cmd_host_base +
+		(cmd_offset + cmd_len) % cmdq_sz;
+	if (its->cmd_host_cwriter == its->cmd_host_base) {
+		memcpy(its->cmd_hyp_base, its->cmd_host_base, cwriter_offset);
+
+		its->cmd_host_cwriter = its->cmd_host_base + cwriter_offset;
+	}
+
+	writeq_relaxed(value, its->base + GITS_CWRITER);
+}
+
+static void cwriter_read(struct its_priv_state *its, u64 offset, u64 *read)
+{
+	*read = readq_relaxed(its->base + GITS_CWRITER);
+}
+
+#define ITS_HANDLER(off, sz, write_cb, read_cb)	\
+{							\
+	.offset = (off),				\
+	.access_size = (sz),				\
+	.write = (write_cb),				\
+	.read = (read_cb),				\
+}
+
+static struct its_handler its_handlers[] = {
+	ITS_HANDLER(GITS_CWRITER, sizeof(u64), cwriter_write, cwriter_read),
+	{},
+};
 
 void pkvm_handle_forward_req(struct pkvm_protected_reg *region, u64 offset, bool write,
 			     u64 *reg, u8 reg_size)
@@ -21,3 +88,139 @@ void pkvm_handle_forward_req(struct pkvm_protected_reg *region, u64 offset, bool
 			writeq_relaxed(*reg, addr);
 	}
 }
+
+void pkvm_handle_gic_emulation(struct pkvm_protected_reg *region, u64 offset, bool write,
+			       u64 *reg, u8 reg_size)
+{
+	struct its_priv_state *its_priv = region->priv;
+	void __iomem *addr;
+	struct its_handler *reg_handler;
+
+	if (!its_priv)
+		return;
+
+	addr = its_priv->base + offset;
+	for (reg_handler = its_handlers; reg_handler->access_size; reg_handler++) {
+		if (reg_handler->offset > offset ||
+		    reg_handler->offset + reg_handler->access_size <= offset)
+			continue;
+
+		if (reg_handler->access_size & (reg_size - 1))
+			continue;
+
+		if (write && reg_handler->write) {
+			hyp_spin_lock(&its_priv->its_lock);
+			reg_handler->write(its_priv, offset, *reg);
+			hyp_spin_unlock(&its_priv->its_lock);
+			return;
+		}
+
+		if (!write && reg_handler->read) {
+			hyp_spin_lock(&its_priv->its_lock);
+			reg_handler->read(its_priv, offset, reg);
+			hyp_spin_unlock(&its_priv->its_lock);
+			return;
+		}
+
+		return;
+	}
+
+	pkvm_handle_forward_req(region, offset, write, reg, reg_size);
+}
+
+static struct pkvm_protected_reg *get_region(phys_addr_t dev_addr)
+{
+	int i;
+	u64 dev_pfn = dev_addr >> PAGE_SHIFT;
+
+	for (i = 0; i < PKVM_PROTECTED_REGS_NUM; i++) {
+		if (pkvm_protected_regs[i].start_pfn == dev_pfn)
+			return &pkvm_protected_regs[i];
+	}
+
+	return NULL;
+}
+
+static int pkvm_setup_its_shadow_cmdq(struct its_shadow_tables *shadow)
+{
+	int ret, i, num_pages;
+	u64 shadow_start_pfn, original_start_pfn;
+	void *cmd_shadow_va = kern_hyp_va(shadow->cmd_shadow);
+
+	shadow_start_pfn = hyp_virt_to_pfn(cmd_shadow_va);
+	original_start_pfn = hyp_virt_to_pfn(kern_hyp_va(shadow->cmd_original));
+	num_pages = shadow->cmdq_len >> PAGE_SHIFT;
+
+	for (i = 0; i < num_pages; i++) {
+		ret = __pkvm_host_share_hyp(shadow_start_pfn + i);
+		if (ret)
+			goto unshare_shadow;
+	}
+
+	ret = hyp_pin_shared_mem(cmd_shadow_va, cmd_shadow_va + shadow->cmdq_len);
+	if (ret)
+		goto unshare_shadow;
+
+	ret = __pkvm_host_donate_hyp(original_start_pfn, num_pages);
+	if (ret)
+		goto unpin_shadow;
+
+	return ret;
+
+unpin_shadow:
+	hyp_unpin_shared_mem(cmd_shadow_va, cmd_shadow_va + shadow->cmdq_len);
+
+unshare_shadow:
+	for (i = i - 1; i >= 0; i--)
+		__pkvm_host_unshare_hyp(shadow_start_pfn + i);
+
+	return ret;
+}
+
+int pkvm_init_gic_its_emulation(phys_addr_t dev_addr, void *host_priv_state,
+				struct its_shadow_tables *host_shadow)
+{
+	int ret;
+	struct its_priv_state *priv_state = kern_hyp_va(host_priv_state);
+	struct its_shadow_tables *shadow = kern_hyp_va(host_shadow);
+	struct pkvm_protected_reg *its_reg;
+
+	hyp_spin_lock(&its_setup_lock);
+	its_reg = get_region(dev_addr);
+	if (!its_reg)
+		return -ENODEV;
+
+	if (its_reg->priv)
+		return -EOPNOTSUPP;
+
+	ret = __pkvm_host_donate_hyp(hyp_virt_to_pfn(priv_state), 1);
+	if (ret)
+		return ret;
+
+	ret = __pkvm_host_donate_hyp(hyp_virt_to_pfn(shadow), 1);
+	if (ret)
+		goto err_with_state;
+
+	ret = pkvm_setup_its_shadow_cmdq(shadow);
+	if (ret)
+		goto err_with_shadow;
+
+	its_reg->priv = priv_state;
+
+	hyp_spin_lock_init(&priv_state->its_lock);
+	priv_state->shadow = shadow;
+	priv_state->base = __hyp_va(dev_addr);
+
+	priv_state->cmd_hyp_base = kern_hyp_va(shadow->cmd_original);
+	priv_state->cmd_host_base = kern_hyp_va(shadow->cmd_shadow);
+	priv_state->cmd_host_cwriter = priv_state->cmd_host_base;
+
+	hyp_spin_unlock(&its_setup_lock);
+
+	return 0;
+err_with_shadow:
+	__pkvm_hyp_donate_host(hyp_virt_to_pfn(shadow), 1);
+err_with_state:
+	__pkvm_hyp_donate_host(hyp_virt_to_pfn(priv_state), 1);
+	return ret;
+}
-- 
2.53.0.473.g4a7958ca14-goog


