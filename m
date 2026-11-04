Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B50606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I7H3ZM8l;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ibkmOq3y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oR4eJtwvtcfj1GI1NI+nTmmxoOSHKaXhB8PQvEukb9k=; b=I7H3ZM8lAHXAlHpnr0EKaE2no3
	AAIBiyyHJkkUo66JupPE8JC4acIIMTF0GGTLB60cVi28lcLqwZJvbu7eX4UUi8yy43F6pqocMH7Sa
	0jsbzCMuYYABABxwButR+XiTnU8JNmWI3BPUXpx2AYpSwYxIqP1NUnzYm6CxmzsX9L4xjc5NwZHIF
	uRVADqWelMqQl2KtgZ3rR4mEsDDYvJz6kKlcg5P9gnv8+xCiDAqJ27s/KALPLr/Eg8k+9TvirOTNm
	KNsQcMFLd/XfihCii9ZP0jBqlkViJYVgQSuNdGyUEbSb4BMFl+lomuWfspOcIv+1BWBVteZLXSa/U
	I6b82AWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObdK-00000005Ylo-0CB0;
	Wed, 04 Nov 2026 14:06:34 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObdG-00000005YiW-2nx7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:06:32 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48fc8d1c14bso873240f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793801188; x=1794405988; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oR4eJtwvtcfj1GI1NI+nTmmxoOSHKaXhB8PQvEukb9k=;
        b=ibkmOq3yvLKWB/wqMViDXwBIPTG2mHUTUMWxI5H4kWKawvu9ihgO8Uj/QBoB/30IrN
         B91d5sSwE9Fd+pupqrynPC99wQuH3olAc0li6BCDhh5zqs6tY3Lr8tONyEbjRdOFFy/i
         c3l9oOg2tGseHzy+IHK47JUPv9IARFkC+z00FTt+EkklIvfzM1uL3TpWG3RoWzXxPtnT
         YYKliCaoeoycidtpgLcujwP74EIASdmei/zsxff1/KJg4ZXuyeAt4bDSBLmpaeU04L3/
         Jy5lpMWVx/lwQsyjRYGUMHb6ahiWeH661tqY/Rk7cNE27yGxrnIZjWQ/YrTXDtK9jvov
         W5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801188; x=1794405988;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oR4eJtwvtcfj1GI1NI+nTmmxoOSHKaXhB8PQvEukb9k=;
        b=eNX5bzrIeM88hk0NSFMMszSWHmQWI2pUL8aWrnMz9EeKMfopWVRBoDouSKcqZ5aUQs
         HlDKJXQvOKyPLO84IBe7wf3Kin3Ai0r+ksnl5MO/hXRCSBi6kuYyDU9DLb8UDUuLEcNc
         GDZ8JmqqottDClZnuKArnaNKDOkL2Mox7es3Y2Mj+pU6c2vUoEBEcjEZ0mefD+x2NbzV
         yABSax0TDjK66pErc9U96XKaWsSd/pr1UdiEJV2DOPca1qaPje+INWbSTBNtc36b9InK
         icol4TCGN4shZuWfMYZJctsLCnZnhTKWf5ZAKjG/l7UNLN/T/7/j0MokWq9gBn8NWtwT
         XXlw==
X-Forwarded-Encrypted: i=1; AKwUvByKU8AlvgWL/BMGc9h9VJR/TtCzH1Bt+OKoJzOJc0lJfokqpTKUc95mcrJWhLDwL4rlOCWXP980oMY6Ch4jNNS/@lists.infradead.org
X-Gm-Message-State: APuU4Z8q1ZDj84qnEpIjvD/GP/Aqy1x9VKoSn70NJDxioWOozJfuch0S
	k2Tst8nj9Pp9oliLCM9PCJqUY1dN4ELtW7EhKQ/VdNzaZ5WFdPhlXzS12JCtSc6bJTIlIJVYHLX
	R0lA2vQ/vkT0nq/CQQeeJug==
X-Received: from wmhn21.prod.google.com ([2002:a05:600c:3055:b0:4a2:a8e:2e95])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c088:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4acda922e24mr262532025e9.1.1793801187800;
 Wed, 04 Nov 2026 06:06:27 -0800 (PST)
Date: Wed,  4 Nov 2026 14:06:10 +0000
In-Reply-To: <20261104140612.137869-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261104140612.137869-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104140612.137869-4-vdonnefort@google.com>
Subject: [PATCH v2 3/5] KVM: arm64: Add ESR class to the hyp_enter hyp event
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060630_754805_449876D8 
X-CRM114-Status: GOOD (  18.49  )
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

Give a more detailed reason the hyp has been entered by reading the ESR
class when relevant (that is on trap). Encode the ESR class directly
into the existing reason field.

To distinguish between a trap from host and from guest, add a "from="
field, which has 3 possibilities: "host", "vcpu" or "firmware". This
value can be deduced based on a combination of the existing vcpu and
reason fields.

Finally, add a "to=" field to the hyp_exit event to mirror "hyp_enter",
allowing HYP_REASON_ERET_HOST and HYP_REASON_ERET_GUEST to be collapsed
into a single HYP_REASON_ERET.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_hypevents.h | 29 ++++++++------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  7 +---
 arch/arm64/kvm/hyp/nvhe/psci-relay.c   |  2 +-
 arch/arm64/kvm/hyp/nvhe/switch.c       |  6 ++-
 arch/arm64/kvm/hyp_trace.c             | 52 ++++++++++++++++++++------
 5 files changed, 66 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
index 3396deb1a1f8..7486d95455c5 100644
--- a/arch/arm64/include/asm/kvm_hypevents.h
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -3,22 +3,22 @@
 #if !defined(__ARM64_KVM_HYPEVENTS_H_) || defined(HYP_EVENT_MULTI_READ)
 #define __ARM64_KVM_HYPEVENTS_H_
 
+#include <asm/esr.h>
+
 #ifdef __KVM_NVHE_HYPERVISOR__
+#include <asm/kvm_hyp.h>
+
 #include <nvhe/trace.h>
 #endif
 
 #ifndef __HYP_ENTER_EXIT_REASON
 #define __HYP_ENTER_EXIT_REASON
 enum hyp_enter_exit_reason {
-	HYP_REASON_SMC,
-	HYP_REASON_HVC,
-	HYP_REASON_SYS,
+	HYP_REASON_SMC = ESR_ELx_EC_MAX + 1,
 	HYP_REASON_PSCI,
-	HYP_REASON_HOST_ABORT,
-	HYP_REASON_GUEST_EXIT,
-	HYP_REASON_ERET_HOST,
-	HYP_REASON_ERET_GUEST,
-	HYP_REASON_UNKNOWN	/* Must be last */
+	HYP_REASON_IRQ,
+	HYP_REASON_ERET,
+	HYP_REASON_USE_ESR, /* trace_hyp_enter() only, resolved to ESR_EL2.EC */
 };
 #endif
 
@@ -29,10 +29,14 @@ HYP_EVENT(hyp_enter,
 		he_field(pid_t, vcpu)
 	),
 	HE_ASSIGN(
-		__entry->reason = reason;
+		__entry->reason = reason == HYP_REASON_USE_ESR ?
+			ESR_ELx_EC(read_sysreg_el2(SYS_ESR)) : reason;
 		__entry->vcpu = __tracing_get_vcpu_pid(host_ctxt);
 	),
-	HE_PRINTK("reason=%s vcpu=%d", __hyp_enter_exit_reason_str(__entry->reason), __entry->vcpu)
+	HE_PRINTK("from=%s reason=%s vcpu=%d",
+		  __hyp_enter_exit_str(__entry->reason, __entry->vcpu),
+		  __hyp_enter_exit_reason_str(__entry->reason),
+		  __entry->vcpu)
 );
 
 HYP_EVENT(hyp_exit,
@@ -45,7 +49,10 @@ HYP_EVENT(hyp_exit,
 		__entry->reason = reason;
 		__entry->vcpu = __tracing_get_vcpu_pid(host_ctxt);
 	),
-	HE_PRINTK("reason=%s vcpu=%d", __hyp_enter_exit_reason_str(__entry->reason), __entry->vcpu)
+	HE_PRINTK("to=%s reason=%s vcpu=%d",
+		  __hyp_enter_exit_str(__entry->reason, __entry->vcpu),
+		  __hyp_enter_exit_reason_str(__entry->reason),
+		  __entry->vcpu)
 );
 
 HYP_EVENT(selftest,
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 179d7c8277b8..28e0191e443f 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -1758,23 +1758,20 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
 {
 	u64 esr = read_sysreg_el2(SYS_ESR);
 
+	trace_hyp_enter(host_ctxt, ESR_ELx_EC(esr));
 
 	switch (ESR_ELx_EC(esr)) {
 	case ESR_ELx_EC_HVC64:
-		trace_hyp_enter(host_ctxt, HYP_REASON_HVC);
 		handle_host_hcall(host_ctxt);
 		break;
 	case ESR_ELx_EC_SMC64:
-		trace_hyp_enter(host_ctxt, HYP_REASON_SMC);
 		handle_host_smc(host_ctxt);
 		break;
 	case ESR_ELx_EC_IABT_LOW:
 	case ESR_ELx_EC_DABT_LOW:
-		trace_hyp_enter(host_ctxt, HYP_REASON_HOST_ABORT);
 		handle_host_mem_abort(host_ctxt);
 		break;
 	case ESR_ELx_EC_SYS64:
-		trace_hyp_enter(host_ctxt, HYP_REASON_SYS);
 		if (handle_host_mte(esr))
 			break;
 		fallthrough;
@@ -1782,5 +1779,5 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
 		BUG();
 	}
 
-	trace_hyp_exit(host_ctxt, HYP_REASON_ERET_HOST);
+	trace_hyp_exit(host_ctxt, HYP_REASON_ERET);
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index 48228991a7ba..c771c1d150c4 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -213,7 +213,7 @@ static void __noreturn __kvm_host_psci_cpu_entry(unsigned long pc, unsigned long
 	write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
 	write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
 
-	trace_hyp_exit(host_ctxt, HYP_REASON_ERET_HOST);
+	trace_hyp_exit(host_ctxt, HYP_REASON_ERET);
 	__host_enter(host_ctxt);
 }
 
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 89fb9dd351ad..afb672dda5e8 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -345,13 +345,15 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	__debug_switch_to_guest(vcpu);
 
 	do {
-		trace_hyp_exit(host_ctxt, HYP_REASON_ERET_GUEST);
+		trace_hyp_exit(host_ctxt, HYP_REASON_ERET);
 
 		/* Jump in the fire! */
 		exit_code = __guest_enter(vcpu);
 
 		/* And we're baaack! */
-		trace_hyp_enter(host_ctxt, HYP_REASON_GUEST_EXIT);
+		trace_hyp_enter(host_ctxt,
+				ARM_EXCEPTION_CODE(exit_code) == ARM_EXCEPTION_IRQ ?
+				HYP_REASON_IRQ : HYP_REASON_USE_ESR);
 	} while (fixup_guest_exit(vcpu, &exit_code));
 
 	__sysreg_save_state_nvhe(guest_ctxt);
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index b9404496f977..ec97d412adfa 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -405,6 +405,7 @@ static struct trace_remote_callbacks trace_remote_callbacks = {
 	.enable_event		= hyp_trace_enable_event,
 };
 
+static const char *__hyp_enter_exit_str(u8 reason, pid_t vcpu);
 static const char *__hyp_enter_exit_reason_str(u8 reason);
 
 struct remote_event_format_hyp_printk;
@@ -412,21 +413,50 @@ static void __hyp_trace_printk(struct remote_event_format_hyp_printk *entry, str
 
 #include "define_hypevents.h"
 
+static const char *__hyp_enter_exit_str(u8 reason, pid_t vcpu)
+{
+	switch (reason) {
+	case 0 ... ESR_ELx_EC_MAX:
+	case HYP_REASON_IRQ:
+	case HYP_REASON_ERET:
+		return vcpu ? "vcpu" : "host";
+	case HYP_REASON_SMC:
+	case HYP_REASON_PSCI:
+		return "firmware";
+	default:
+		return "unknown";
+	}
+}
+
 static const char *__hyp_enter_exit_reason_str(u8 reason)
 {
-	static const char strs[][12] = {
-		"smc",
-		"hvc",
-		"sys",
-		"psci",
-		"host_abort",
-		"guest_exit",
-		"eret_host",
-		"eret_guest",
-		"unknown",
+	static const struct trace_print_flags class[] = {
+		kvm_arm_exception_class
 	};
 
-	return strs[min(reason, HYP_REASON_UNKNOWN)];
+	if (reason <= ESR_ELx_EC_MAX) {
+		int i;
+
+		for (i = 0; i < ARRAY_SIZE(class); i++) {
+			if (class[i].mask == reason)
+				return class[i].name;
+		}
+
+		return "UNKNOWN_ESR";
+	}
+
+	switch (reason) {
+	case HYP_REASON_SMC:
+		return "SMC";
+	case HYP_REASON_PSCI:
+		return "PSCI";
+	case HYP_REASON_IRQ:
+		return "IRQ";
+	case HYP_REASON_ERET:
+		return "ERET";
+	default:
+		return "UNKNOWN_REASON";
+	}
 }
 
 static void __hyp_trace_printk(struct remote_event_format_hyp_printk *entry, struct trace_seq *seq)
-- 
2.56.0.455.g6c5a503b38-goog


