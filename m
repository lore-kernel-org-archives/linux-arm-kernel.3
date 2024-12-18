Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABE7E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 20:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkfvAMeAqasaarDCC25uz9tXymaAjZWepO/HImSI4Yg=; b=i9Ekuqe+10kdV0o8SgUh84/hJi
	Y4qan/EmAi7cgcipAe9SpNlvFfCwJ02WyQ8AtzJVlhRk+mkVEj8wa9fyuQ0GEgRlXhRIAPqBiK/r5
	VLOtW+aBzOuaKnSlccOytuFG+1aSiTAN6Blq4CDSmnBQtuQgYuovckAqHi2Tv5kGOJqO3udCBY8OZ
	orjWZ2l72VTck4d6so5NR6OorbA8iUWKk8KiRclyspW7pP3DUFI9uvG8gyEIpuywnJoe1a9ZyFmQF
	HwO3SYS0sJ7mnNlVbSgWOZ26HhyCgV/cz9QjmJlgoyBl/t4mOyiTv/Mx4XUT5tqeqsEeMJk2sGpnc
	F6tVDFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO0D7-000000000VG-0TWm;
	Wed, 18 Dec 2024 19:59:57 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzvP-0000000HYRb-0jNw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:41:40 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5d3bf8874dbso2618493a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 11:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734550897; x=1735155697; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hkfvAMeAqasaarDCC25uz9tXymaAjZWepO/HImSI4Yg=;
        b=lO8O6jdTlPuN1rm+9jm9Lh76CkaqX2w90qpXof1SoM6hB0G5wmrLv/Z0qYhZvdbDw6
         y5f/OEuHweWJ0evwjDBNyi/QW7PisATLUg/iJItRwrs75FBL33LKNDGZpiDYr5OUHwjA
         M+WLRaxXz17/E91p7l0AC3QScM/DUdefqrm83FqOfFzis5d7cahWH++SLLmUocT/Fpfm
         Vyk+atVH1eCBw74OHJ9iszNjUceHC52bfmeadtbWZ3cnYwqrGjQKw9zyYA5ifSvdD6x2
         tsz52jAknqVt0XPhU27Nl9RJcooshh340pCM8TwaBvFSRzEAb3o/nJobRLNLgECVhhKM
         GhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734550897; x=1735155697;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkfvAMeAqasaarDCC25uz9tXymaAjZWepO/HImSI4Yg=;
        b=ddNduaYQgG3Juguk6iz19BeooMxQgeU5dJ/hb/EDnCRpq6v7x2yCEuv1OTE5WJUUhG
         sZygHUVdSParnzhaKhga+LELrvZuUNHFaHmnAUWlicRGmOs1vzxEdiW7/33nBKAKdb6F
         kDWZxwWP+R0/PhMMAcQ5x5JPYIYNHZZpXnsrZAFz2klhYdIGizjotAVw/7PubVGSRYae
         zgXCc1o3bgWFQDUT7JrDFWnmR/sLJ8R3unOt3d2Eu4weYXU6WhuRhnwSN1H9oP58DJs8
         zIpPFWjVU0Yi4X1iK+wegQc6KeWKme956Z91dBLc1IMairHExweFH/5S4fbuvrPyYzDv
         7TcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWscTTyzIPCNM+PkNXj1Pt1iTjBfW/lEs/KhkJwh9UvX2ETfro7LWj646FFOYyEvKv3n+DRkOTVV4ufvC6IOEbA@lists.infradead.org
X-Gm-Message-State: AOJu0YzDoTvMkABi1UoT2j1jDhqPEkFXT9wzAKZxNgf9L+Fa3nc1rryO
	KWgtlAzvsuSs5JKmPtKlkFQ9mS/SHgDmpc7z2J1BXvPFAi0Hlru9lXM/zx1C1pF8aalX4pwkmNl
	V607VHw==
X-Google-Smtp-Source: AGHT+IGSBECViplx1U+nRtyXTDKvrUbyI+0W4ITB//TrX14agtn1suD5UatvN7l8zoDc+3G2GrjvLEAvKgAZ
X-Received: from edb22.prod.google.com ([2002:a05:6402:2396:b0:5d7:f279:523e])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2550:b0:5d2:7270:611f
 with SMTP id 4fb4d7f45d1cf-5d7ee3ff1famr4439977a12.22.1734550897647; Wed, 18
 Dec 2024 11:41:37 -0800 (PST)
Date: Wed, 18 Dec 2024 19:40:57 +0000
In-Reply-To: <20241218194059.3670226-1-qperret@google.com>
Mime-Version: 1.0
References: <20241218194059.3670226-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241218194059.3670226-17-qperret@google.com>
Subject: [PATCH v4 16/18] KVM: arm64: Introduce __pkvm_tlb_flush_vmid()
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_114139_210584_E9106117 
X-CRM114-Status: GOOD (  11.60  )
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

Introduce a new hypercall to flush the TLBs of non-protected guests. The
host kernel will be responsible for issuing this hypercall after changing
stage-2 permissions using the __pkvm_host_relax_guest_perms() or
__pkvm_host_wrprotect_guest() paths. This is left under the host's
responsibility for performance reasons.

Note however that the TLB maintenance for all *unmap* operations still
remains entirely under the hypervisor's responsibility for security
reasons -- an unmapped page may be donated to another entity, so a stale
TLB entry could be used to leak private data.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h   |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index a3b07db2776c..002088c6e297 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -87,6 +87,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_teardown_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
+	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 32c4627b5b5b..130f5f23bcb5 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -389,6 +389,22 @@ static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
 	__kvm_tlb_flush_vmid(kern_hyp_va(mmu));
 }
 
+static void handle___pkvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
+	struct pkvm_hyp_vm *hyp_vm;
+
+	if (!is_protected_kvm_enabled())
+		return;
+
+	hyp_vm = get_np_pkvm_hyp_vm(handle);
+	if (!hyp_vm)
+		return;
+
+	__kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
+	put_pkvm_hyp_vm(hyp_vm);
+}
+
 static void handle___kvm_flush_cpu_context(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
@@ -573,6 +589,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_teardown_vm),
 	HANDLE_FUNC(__pkvm_vcpu_load),
 	HANDLE_FUNC(__pkvm_vcpu_put),
+	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
-- 
2.47.1.613.gc27f4b7a9f-goog


