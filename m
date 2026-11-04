Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74254606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ffb8+Jry;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gLrLURqd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Otbpqb7SJFabxtkE4DZe7Wt61LA99tGboOBEZyTX8RM=; b=Ffb8+JryGV3G2jfXM+IR+ytHWn
	VC11Fl/hk2R61btkwA14nvIadBOjYKxgmbShF3qMXS7d++h//Ki15k71czLZB6pX8VqxUWK6Wp7FU
	9H8R8RsM4S+s5Wz1Q1ep5cUT4eK1tq4+D90xK4WpjafSzjKd0vIPxwBDojfit4NWJlsYW2eOXI0eY
	9tI82PojSiyS1Ht50xZYbh5mij9dyLSAmRetGudOs1W3tyKYWHuotZvXtk2tdPptl17uPZbYCJBjJ
	Rl/VYegl387Lwas+ucfdMUCfr6/lEi9IUEWPdgqT0jP7cjFqKI/LWySiQ1d3SASCODYDXO6ZFzAb0
	7zvc8weg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObdK-00000005YmB-0kiJ;
	Wed, 04 Nov 2026 14:06:34 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObdH-00000005Yiv-1bGs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:06:32 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48e17d30a79so524289f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793801189; x=1794405989; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Otbpqb7SJFabxtkE4DZe7Wt61LA99tGboOBEZyTX8RM=;
        b=gLrLURqdlRUJ+8v7vvy1QlPfMnrUl5RswYBdqLJRRTIBZds6bmFakt59Iv+1JgAzT7
         TSOAAk3T8HWgh6Rc4Zs367P/EssxRA1676+Cgp9YtA17eedsAeHZaenfX3r914x6vfrI
         /neCGpTtylm1HZMGUQsd3Aby3+xQykAOHYCSiwreP/9ggcCbw6Q7NEKiONtWFN3pjMIK
         eXZkQ/c7K+uWYbJvqdMm36d12g/MeyVFZDIS1CkTt6q8HEOMCCSVt1VIGbBssFuBDgnI
         dHHAjbUffSeD4zBoBf7y7S8i4Vm4lA6OjUHosEsaU3Cbc5id7t8kNnLluwxa6Ws6N5kv
         qsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801189; x=1794405989;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Otbpqb7SJFabxtkE4DZe7Wt61LA99tGboOBEZyTX8RM=;
        b=ReZbStpZy60FYtCIxlb5IlfSMfbGX0t5u6l8+5pibYHgt5CxNiquLrS6DACrRHhgZk
         saIRN1xM9DMdI8J9KaYzjcxbe9L4lc5Ii5eKh/p++5+LOwCnv8/orgNTYsHbb41bQ3VB
         VBKQjJmIlPEiFvmryijd1VQCCDacNvvjZchNmbKvnklFhZOlSh2f3upQvW1MLNs6PP1v
         +aYSlXYbPvsIvJfa6RE40eWiEEPcX2tX1w6t5gsV4yNB1NY7Twv2JHrI9Lh8Z3J8Srff
         GC3jyeW3UAxY+Oeq49kG0r4TWiY0c448XVbFvfd+vfnUo5DBtwM9oov4UhpCbRG4ukDQ
         tXCA==
X-Forwarded-Encrypted: i=1; AKwUvBypqAKLa1vkLWwZPJXwTwRfB8xxMjBwPLiXddSCl4l+QNAkg8BBA6wqDdFBHzOFmZV2r5mLfODqEN6dHeOj9zao@lists.infradead.org
X-Gm-Message-State: APuU4Z/DRMOOVSUWOlbcSk4rm9iHJWD4TyWDckKArC/rCpQvVGeLxau/
	E9/I2c6FX6pHAsqbVXlynZKyEINn4luGPZlYO0GxFjwWPFWk7CNAE1gL4ocqgD+XK9AMMrSL9Mg
	V13ltCig1DNXIgt8oegDasw==
X-Received: from wrbgf8.prod.google.com ([2002:a05:6000:27c8:b0:48e:267d:cb0b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:26c3:b0:490:c68e:5d5d with SMTP id ffacd0b85a97d-490c68e5e13mr937960f8f.49.1793801188873;
 Wed, 04 Nov 2026 06:06:28 -0800 (PST)
Date: Wed,  4 Nov 2026 14:06:11 +0000
In-Reply-To: <20261104140612.137869-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261104140612.137869-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104140612.137869-5-vdonnefort@google.com>
Subject: [PATCH v2 4/5] KVM: arm64: Add guest_hvc hyp event
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060631_461018_91BD04E6 
X-CRM114-Status: GOOD (  15.89  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Protected VMs issue HVCs that are fully handled by the hypervisor. This
makes a failure hard to debug solely based on host information. Create a
guest_hvc hypervisor event for hypervisor handled HVCs and log the
return value, stored in x0.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_hypevents.h | 13 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 12 ++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
index 7486d95455c5..63d98dd92cb0 100644
--- a/arch/arm64/include/asm/kvm_hypevents.h
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -66,6 +66,19 @@ HYP_EVENT(selftest,
 	RE_PRINTK("id=%llu", __entry->id)
 );
 
+HYP_EVENT(guest_hvc,
+	HE_PROTO(u32 id, u64 x0),
+	HE_STRUCT(
+		he_field(u32, id)
+		he_field(u64, x0)
+	),
+	HE_ASSIGN(
+		__entry->id = id;
+		__entry->x0 = x0;
+	),
+	HE_PRINTK("id=0x%x x0=0x%llx", __entry->id, __entry->x0)
+);
+
 /*
  * trace_hyp_printk() has too many specificities to be declared with HYP_EVENT().
  * However, we can use a REMOTE_EVENT macro to automatically do the declaration
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index fc0475f0877d..df7bd34325de 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -11,6 +11,7 @@
 #include <linux/mm.h>
 
 #include <asm/kvm_emulate.h>
+#include <asm/kvm_hypevents.h>
 #include <asm/spectre.h>
 
 #include <nvhe/alloc.h>
@@ -1445,11 +1446,12 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	struct pkvm_hyp_vcpu *hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
 	u64 val[4] = { SMCCC_RET_INVALID_PARAMETER };
+	u32 fn = smccc_get_function(vcpu);
 	bool handled = true;
 	u32 feature;
 	uuid_t uuid;
 
-	switch (smccc_get_function(vcpu)) {
+	switch (fn) {
 	case ARM_SMCCC_VERSION_FUNC_ID:
 		/* Nothing to be handled by the host. Go back to the guest. */
 		val[0] = ARM_SMCCC_VERSION_1_1;
@@ -1542,10 +1544,16 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 		pkvm_memunshare_call(val, vcpu);
 		break;
 	default:
-		return pkvm_handle_psci(hyp_vcpu);
+		handled = pkvm_handle_psci(hyp_vcpu);
+		goto out;
 	}
 
 	if (handled)
 		smccc_set_retval(vcpu, val[0], val[1], val[2], val[3]);
+
+out:
+	if (handled)
+		trace_guest_hvc(fn, vcpu_get_reg(vcpu, 0));
+
 	return handled;
 }
-- 
2.56.0.455.g6c5a503b38-goog


