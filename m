Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599AAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzdJHXVuXMAee7pvhjvjmYNerb4Ls3nAVJtLDckvOmI=; b=1c42lcQByZvc8Lp+WMUMHKrbHL
	G5DIj90ahVU54KDNZr8+U9XE2eWGn9K2xxDobzg3zQChaIvmpp5DLPq2Fhu6XPtr7hYXxmGzMX4by
	7xMWCApzjQbgnh4eerwy6NgvfdQILFXgSAQZr+ih5Cvu5aGz+lHP0cgegz7UmzdbEHtXrbyiF60EN
	l47zNgIIzKSFk4DhxswcsYEhAs/uWt5fxy64BQynnpXVDyMnffgnTDgCtDnrZ35wwdD35T77ES4GC
	CEn/lcKkRdXbb5v8hcTnoiVq1i9Mhs9y5AqrMl6ZeZG8E46d5z/SSCmZgPFp52Y/9bZXZnCt7alFq
	KrvoIQzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWj-0000000DFjL-30r7;
	Mon, 06 Jul 2026 17:54:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWe-0000000DFdw-0kAh
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jul 2026 17:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZzdJHXVuXMAee7pvhjvjmYNerb4Ls3nAVJtLDckvOmI=; b=MF0TT/EdVIkr7x7btPCJNiSJT4
	GMwY9aKjWqVKaopnV6Gt1/xyGgpEmSwtnpN0ChffiV0Tn8m//UjBSZ4f5Gwn64WPjdKOsYrGwDI7f
	iFmAi2z56N5U9gjCI4qfM5/LNWYjBnpVeAsEbC5Q5UeQRN/ktclqF2DuFy1C4Q/Vk7GxuJJuzqXC0
	DcoXqxNvbGo0ZugZ9YjcSOq18ZqFkO/DBfRMi+siF9vTB0nIxoxwZljwKPp/Ye+xvAA/j8kVtCkHO
	LqtI9VbcCEmMfR6/IiypviT46XfrtMnecg9tk67Cw0e7Z8cb54KUa4t5pyhFpXiuh2nNaqJ7nKQp7
	A+AWNlAw==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgnWb-00000006p4f-1gll
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:54:34 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-493c619bb52so23525525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360472; x=1783965272; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzdJHXVuXMAee7pvhjvjmYNerb4Ls3nAVJtLDckvOmI=;
        b=dF8RmcWhjuLYJkqcmUm6fH0Ip9zOv8d5XEAc+q7Lyd592+o0zAgSHlcN0PvOQ2ShFV
         uVHkn5HU0T7kW4o98pCCtnjY/Ash/Juep82eUP+VnRPXfQ09L2Bdr2cFxPD2NvEQ4Pcz
         bC5CDF8tejXYncDjkRMb6xkZSq7Z8D9KwEgyVquxU5C0uFE+aJWhbnAOHeU2YdEu3m50
         +Bgm5CW6XKkbPeC0Nupj1CKMEUyhiENgjd1Mvsp5dljCut7Gbf/VThnAEm89cVwpx0gA
         s7qxDzI+rLOagokwVBh3Wk4HTnee7cMJVjcbMSl+hLlShIKAq2KlPW7qi5ylI5Yo7nly
         zesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360472; x=1783965272;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzdJHXVuXMAee7pvhjvjmYNerb4Ls3nAVJtLDckvOmI=;
        b=sIDru7sUlUWp35nVVW0JvyOksIlq0qf0sXDshRLcIK2woiA7201X6YgS01NW6+f55y
         9qfgcgbe+HIKuQnxySosCzHw63egWbujGh8/sr+jTA05lEEa/Q5us1wRVkRPOEiyPAK/
         JFstC3wPJBInXRLUtPK0lkdJoapDLOonS+lkaQcYY+0EARx06fAXfO/e/c6mchhTya2V
         xkTGzGvnVSeyy3m8jLrmCiyo8nSy/QDQqzgO5H4CjMX28NR2l9M7zJ7jVUuPFLYFUicO
         2yZ2qF3HWIPYuYyUb7tjLjZNYP+jKjV8XdByoIjnO2do3+NDWr9jNk+CzKVG4ViOKInj
         9FZQ==
X-Gm-Message-State: AOJu0YwBXBaRcd1zpc/7or3EFLYyBERZEIJuBpqO1AvXTXtwFczr0YaD
	zHXdIH4IH7HcZWQIiLs/hWqBL+RimxcPnxkH/0rhkgl9os2g9Zb0+Kp7Bi9VRtshGTjB0Jr6toT
	rOoMshOrpxGG4coqHj/ctZQ==
X-Received: from wmog11.prod.google.com ([2002:a05:600c:310b:b0:490:b2e5:e62d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19c6:b0:493:b03c:5650 with SMTP id 5b1f17b1804b1-493df06d8cdmr18356455e9.19.1783360471797;
 Mon, 06 Jul 2026 10:54:31 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:54:06 +0100
In-Reply-To: <20260706175415.2604046-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175415.2604046-10-vdonnefort@google.com>
Subject: [PATCH v2 09/18] KVM: arm64: Add reclaim interface for the pKVM heap alloc
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_185433_480935_E582C765 
X-CRM114-Status: GOOD (  12.26  )
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

Introduce a host interface to reclaim donated memory from the pKVM heap
allocator back to the host.

It specifically provides two helpers that will make it easier to
create a shrinker for pKVM:

  pkvm_hyp_reclaimable()
  pkvm_hyp_relaim()

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 681b7bf8ac08..b427ef790b15 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -115,6 +115,8 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
 	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
 	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaim,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_reclaimable,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_MAX)
 };
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 99daa985856f..3a8590d1793e 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -21,6 +21,9 @@ enum pkvm_topup_id {
 	PKVM_TOPUP_HYP_ALLOC,
 };
 
+unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target);
+unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id);
+
 int pkvm_init_host_vm(struct kvm *kvm, unsigned long type);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index e270a974fa37..8fbebe64a93d 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -657,6 +657,42 @@ static void handle___pkvm_hyp_topup(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 3) = host_mc.nr_pages;
 }
 
+static void handle___pkvm_hyp_reclaim(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(enum pkvm_topup_id, id, host_ctxt, 1);
+	DECLARE_REG(unsigned long, target, host_ctxt, 2);
+	struct kvm_hyp_memcache host_mc = {};
+	int ret = 0;
+
+	switch (id) {
+	case PKVM_TOPUP_HYP_ALLOC:
+		hyp_alloc_reclaim(&host_mc, target);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	cpu_reg(host_ctxt, 1) = ret;
+	cpu_reg(host_ctxt, 2) = host_mc.head;
+	cpu_reg(host_ctxt, 3) = host_mc.nr_pages;
+}
+
+static void handle___pkvm_hyp_reclaimable(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(enum pkvm_topup_id, id, host_ctxt, 1);
+	unsigned long reclaimable = 0;
+
+	switch (id) {
+	case PKVM_TOPUP_HYP_ALLOC:
+		reclaimable = hyp_alloc_reclaimable();
+		break;
+	default:
+		reclaimable = 0;
+	}
+
+	cpu_reg(host_ctxt, 1) = reclaimable;
+}
+
 static void handle___tracing_load(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(unsigned long, desc_hva, host_ctxt, 1);
@@ -788,6 +824,8 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_vcpu_put),
 	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
 	HANDLE_FUNC(__pkvm_hyp_topup),
+	HANDLE_FUNC(__pkvm_hyp_reclaim),
+	HANDLE_FUNC(__pkvm_hyp_reclaimable),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index adc418076cb0..eb4c60a0db5a 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -115,6 +115,28 @@ static int pkvm_hyp_topup(enum pkvm_topup_id id, unsigned long nr_pages)
 	return ret;
 }
 
+unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
+{
+	struct kvm_hyp_memcache mc;
+	struct arm_smccc_res res;
+	unsigned long reclaimed;
+
+	arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(__pkvm_hyp_reclaim), id, target, &res);
+	if (WARN_ON_ONCE(res.a0 != SMCCC_RET_SUCCESS) || WARN_ON_ONCE(res.a1))
+		return 0;
+
+	init_hyp_memcache(&mc);
+	mc.head = res.a2;
+	mc.nr_pages = reclaimed = res.a3;
+	free_hyp_memcache(&mc);
+
+	return reclaimed;
+}
+
+unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
+{
+	return kvm_call_hyp_nvhe(__pkvm_hyp_reclaimable, id);
+}
 static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 {
 	if (pkvm_hyp_vm_is_created(kvm)) {
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


