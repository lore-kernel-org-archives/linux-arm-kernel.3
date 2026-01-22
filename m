Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDC9C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2J6EeAezXJllHDzySrmJ4PCNEfxO88c9P+Q7J7R6rRw=; b=CYSDw/knYNZOx8XPbnFAFUY78X
	uOWSa38j35xh/uQxPUFnvTu5ei0b3hdTShvzP+JB05ayebtdjoMwamPLPCKNdc7jcPuqakmru08SO
	u0hOGTfoY4HrN5dLoXAQ4n44HLrTjSBxvSl+3I7jcBncKmAKsfdnxx3AT4tWUr5nGGA18I95fN5yx
	8LZPkFS02vXX+U4P+jpfYkN7KeOtmRzSNTfrq3TZuT8AYgEBbMfR+UAMWPI2xjG1JXvwHrzaYqSRD
	/92nuaSvK1f3rmsefjGpPCgaq83O+X4emnlU5qL9bvCAyAUYKzNph1DZGw6KBmd5nDg8csPTudaTA
	Kkdgew9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vislh-00000006x2f-2DaB;
	Thu, 22 Jan 2026 11:22:29 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vislc-00000006wzN-11GU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:22:25 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-64b735f514dso901438a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 03:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769080942; x=1769685742; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2J6EeAezXJllHDzySrmJ4PCNEfxO88c9P+Q7J7R6rRw=;
        b=tSExAmVTVe9kwN3tKktxDGZgUzerkPJWkOAW6D0LBCs++PIGKFIDIPec0DrvVs9ptJ
         37Y2iNDiYoa4OhiTth6o+fnrlNNaJQuBcoEDqeFza91301oSqs/kFDmobLKPd/+uNh8z
         RX6ZmxAux7Omjs3d5BxYrNfneCDKqckETqpObVfL9sP0pe+YhwKWNnFsVbTvUNCVzlwn
         bU8rdfCEqYnkiUhrPK97ZyDXW97TLvN4i0hNLe3raZ7unC9Khr+afTxbcb5icjwAttOd
         FDRBJImumsTVEsZRL7I+INAePdiZr9MCrtXrE5uRNeTb2VEWpEMQshZxdMZJyvKXZKzu
         W5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769080942; x=1769685742;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2J6EeAezXJllHDzySrmJ4PCNEfxO88c9P+Q7J7R6rRw=;
        b=WjEp5P9Im4NxndOTQkYAmoaV7QFeVAhpEZRno3vLEbu7rXZ+73l2k2thdak9nAnRk7
         drOZf/8CYwcnjOopfnnURQMqZSLL72pAANuxlw0V4w7QAh+Z8hCz97cb0C6TCzFP3lsH
         958k/sj/1nyRN9Ni1ulOMrVRarTvOp7PKdaIyZBkVB8MU7FjKRcP75k0zYQ1c7ray+EH
         vJUPfPl6wP1RC9PSzN8vGNnApHOMvoS/Sj9ZcuH58M3zYAa92mM1UbTiBxN04X1btnbx
         Ac1EFY/xq3yM5Ah7bBv6R78gDtLjT7TqyBMOFBlT9OFrMV/b3GegW+gjptDVXS6EbtjE
         7TXA==
X-Forwarded-Encrypted: i=1; AJvYcCXKIWCJrSNvKN8cWccoVK7X6h99xW3wqBJBFdK1VBnqNq2zIQ8jIYA0WiCct4xivc30Z/6pwQw8GjL45HL0HzeA@lists.infradead.org
X-Gm-Message-State: AOJu0YxS0tg6aRhxs5/1wwZC1xwZWkVy8zWlt1d2eSvGSnJ4byFZCUwI
	h83BxZlBBTe52je7JM1sUH9pPccvgaJrVNii+p7xR87rfth79ExVDRrkVTtig0enO9uzXb1txfZ
	DhQ==
X-Received: from eduf18.prod.google.com ([2002:a05:6402:52:b0:64b:c59e:7562])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2550:b0:658:1eee:8a4a
 with SMTP id 4fb4d7f45d1cf-6581eee8d21mr2762062a12.11.1769080941575; Thu, 22
 Jan 2026 03:22:21 -0800 (PST)
Date: Thu, 22 Jan 2026 11:22:17 +0000
In-Reply-To: <20260122112218.531948-1-tabba@google.com>
Mime-Version: 1.0
References: <20260122112218.531948-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122112218.531948-4-tabba@google.com>
Subject: [PATCH v3 3/4] KVM: arm64: Inject UNDEF when accessing MTE sysregs
 with MTE disabled
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_032224_300305_49666F0E 
X-CRM114-Status: GOOD (  12.89  )
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

When MTE hardware is present but disabled via software (`arm64.nomte` or
`CONFIG_ARM64_MTE=n`), the kernel clears `HCR_EL2.ATA` and sets
`HCR_EL2.TID5`, to prevent the use of MTE instructions.

Additionally, accesses to certain MTE system registers trap to EL2 with
exception class ESR_ELx_EC_SYS64. To emulate hardware without MTE (where
such accesses would cause an Undefined Instruction exception), inject
UNDEF into the host.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 67 ++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index a7c689152f68..faed1b38e6cc 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -687,6 +687,69 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
 	kvm_skip_host_instr();
 }
 
+/*
+ * Inject an Undefined Instruction exception into the host.
+ *
+ * This is open-coded to allow control over PSTATE construction without
+ * complicating the generic exception entry helpers.
+ */
+static void inject_undef64(void)
+{
+	u64 spsr_mask, vbar, sctlr, old_spsr, new_spsr, esr, offset;
+
+	spsr_mask = PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT | PSR_V_BIT | PSR_DIT_BIT | PSR_PAN_BIT;
+
+	vbar = read_sysreg_el1(SYS_VBAR);
+	sctlr = read_sysreg_el1(SYS_SCTLR);
+	old_spsr = read_sysreg_el2(SYS_SPSR);
+
+	new_spsr = old_spsr & spsr_mask;
+	new_spsr |= PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT;
+	new_spsr |= PSR_MODE_EL1h;
+
+	if (!(sctlr & SCTLR_EL1_SPAN))
+		new_spsr |= PSR_PAN_BIT;
+
+	if (sctlr & SCTLR_ELx_DSSBS)
+		new_spsr |= PSR_SSBS_BIT;
+
+	if (system_supports_mte())
+		new_spsr |= PSR_TCO_BIT;
+
+	esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT) | ESR_ELx_IL;
+	offset = CURRENT_EL_SP_ELx_VECTOR + except_type_sync;
+
+	write_sysreg_el1(esr, SYS_ESR);
+	write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
+	write_sysreg_el1(old_spsr, SYS_SPSR);
+	write_sysreg_el2(vbar + offset, SYS_ELR);
+	write_sysreg_el2(new_spsr, SYS_SPSR);
+}
+
+static bool handle_host_mte(u64 esr)
+{
+	switch (esr_sys64_to_sysreg(esr)) {
+	case SYS_RGSR_EL1:
+	case SYS_GCR_EL1:
+	case SYS_TFSR_EL1:
+	case SYS_TFSRE0_EL1:
+		/* If we're here for any reason other than MTE, it's a bug. */
+		if (read_sysreg(HCR_EL2) & HCR_ATA)
+			return false;
+		break;
+	case SYS_GMID_EL1:
+		/* If we're here for any reason other than MTE, it's a bug. */
+		if (!(read_sysreg(HCR_EL2) & HCR_TID5))
+			return false;
+		break;
+	default:
+		return false;
+	}
+
+	inject_undef64();
+	return true;
+}
+
 void handle_trap(struct kvm_cpu_context *host_ctxt)
 {
 	u64 esr = read_sysreg_el2(SYS_ESR);
@@ -702,6 +765,10 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
 	case ESR_ELx_EC_DABT_LOW:
 		handle_host_mem_abort(host_ctxt);
 		break;
+	case ESR_ELx_EC_SYS64:
+		if (handle_host_mte(esr))
+			break;
+		fallthrough;
 	default:
 		BUG();
 	}
-- 
2.52.0.457.g6b5491de43-goog


