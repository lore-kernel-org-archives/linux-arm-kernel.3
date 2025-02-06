Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EA3C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 00:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zr3/LuzVjUoCOE75RpPvv8HgrgBhtrHXf0v0cKrFx3I=; b=J/5O4ouzR0rXkq3h1qEXYQUcgm
	nFOL6TaKRTT8SnjNgp3Aq7i7hKVz+MoAb24iBE29MBpKV35oqyh7r3oA/0CEn1Hqgo+ItZLLoSflK
	qxRZooDEk/br9TVr8RfPNPS4PWwwRs6joCs72kQugBj5jsHWrZ1N2air7ZyA5C7hJ/ejl9xo1or0N
	vFfKxgTAfmkvD/VWxg8lqxOBC/uHSMx5J1eyKOl20rZ2iaPQWBjigdk2i228CSNqAvDYIa4dsLpl0
	OizlFNo0ehUfc7L5dX7tY2i1zcifKWa5iZAZgfcZO6JLoNzI89frl6VXXbEH8yOLC5rT137MsjdmQ
	ksB3i20Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfpcZ-00000004uk7-1O5y;
	Thu, 06 Feb 2025 00:19:55 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfpbC-00000004uc3-15RQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 00:18:31 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-71e27b42a09so428924a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 16:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738801109; x=1739405909; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zr3/LuzVjUoCOE75RpPvv8HgrgBhtrHXf0v0cKrFx3I=;
        b=UAj4FMeNEr+QsgPjGSbBvv348ONsjLQw9vAvbN6YMvr02WUp0YwG7g8jYGP71BJDQb
         8KZpwNTjZ9CZKuwfd5JGCYmFDzm9SyXNQb8QFbUzm4Trn7BnNFs+VPJYYPi0/O3rK7WN
         N7m6f2TgK36sWXne4PapXr+4WdaSctwbY4gnjyrhZ6DeWebK75sZ9kGPzn0wBwiX8Rit
         X2IS4CtEVGXxhAyJWfmGilIjEiSutOXCwFwIgjvx7P68E1LfDdpV0SSrm3F9cu9NNSz4
         iVaCJATtkMul/UK+SoCDkDnup2QNKLF8xCUvsMl4owUm9RZ2obTkVnNGtN7amoYCQmLO
         Zklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738801109; x=1739405909;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zr3/LuzVjUoCOE75RpPvv8HgrgBhtrHXf0v0cKrFx3I=;
        b=hC/f9yf2o21U42gh//XwJWWnQMx01ORs/FivMp1E0YKw9Cgx8lXNpTeM9qSPUya6EX
         PETNaax+dTRqzK6RAHVy2x/Y+c+PaeimFrVePe8G+/hUJz+QBdlk9VnJsqsgajfoZavh
         uK+5bXLFoniBXVCRyR7/iAMq6M3Kp5jJw5pWp/675kL5phf8TY9JpX7R64uBg1wdBxt2
         b7QUGQXG0bhuM6EgRs6A5gBXYJRjEoxbkt6yv6FP+yYrRcyCJeZysuIOYJkKiSrfINFv
         rpHPvq7RH/9vTeTPSishG+6wMBjthLGuur+g4axb4zTw4rHCQD13kGnoCmp2vUBY2H6T
         VzbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6w0S/GdO41U9vOpycFCCUXcc7f7WUV3oujcMSCuao3I6X2+4kS6gL/mdhiuq6vNbKv7kZKFAL20sPZKXAFoxk@lists.infradead.org
X-Gm-Message-State: AOJu0YwIM677a/McdS/FbmjuFhrIILYxdxYgTyddgcZNm6zS3gvkfXat
	/4dqvffHMMeWShfdZfoyHvIOb7Dv9fLSgQhz5BXPdY9KbAhe61wRUDJ+k3ngxKyfm20ykLEt+Zu
	ZZAFenM9twNzwFe3oTCpkmA==
X-Google-Smtp-Source: AGHT+IEVrsS8ZrjIpYlGyg1Ed1+MVibgRhSBBaTAljJpus0kxqPO6kMqiuj10XnP6c5iR6jfwp3/WzcdNy0U3kgBdA==
X-Received: from otqn6.prod.google.com ([2002:a9d:6f06:0:b0:71d:fe90:fac3])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:3982:b0:71d:eee3:fd1a with SMTP id 46e09a7af769-726a3fbc8e8mr3724016a34.0.1738801108890;
 Wed, 05 Feb 2025 16:18:28 -0800 (PST)
Date: Thu,  6 Feb 2025 00:17:44 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250206001744.3155465-1-coltonlewis@google.com>
Subject: [PATCH v2] KVM: arm64: Remove cyclical dependency in arm_pmuv3.h
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_161830_323563_57FC4700 
X-CRM114-Status: GOOD (  17.01  )
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

asm/kvm_host.h includes asm/arm_pmu.h which includes perf/arm_pmuv3.h
which includes asm/arm_pmuv3.h which includes asm/kvm_host.h This
causes confusing compilation problems why trying to use anything
defined in any of the headers in any other headers. Header guards is
the only reason this cycle didn't create tons of redefinition
warnings.

The motivating example was figuring out it was impossible to use the
hypercall macros kvm_call_hyp* from kvm_host.h in arm_pmuv3.h. The
compiler will insist they aren't defined even though kvm_host.h is
included. Many other examples are lurking which could confuse
developers in the future.

Break the cycle by taking asm/kvm_host.h out of asm/arm_pmuv3.h
because asm/kvm_host.h is huge and we only need a few functions from
it. Move the required declarations to a new header asm/kvm_pmu.h.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---

Possibly spinning more definitions out of asm/kvm_host.h would be a
good idea, but I'm not interested in getting bogged down in which
functions ideally belong where. This is sufficient to break the
cyclical dependency and get rid of the compilation issues. Though I
mention the one example I found, many other similar problems could
confuse developers in the future.

v2:
* Make a new header instead of moving kvm functions into the
  dedicated pmuv3 header

v1:
https://lore.kernel.org/kvm/20250204195708.1703531-1-coltonlewis@google.com/

 arch/arm64/include/asm/arm_pmuv3.h |  3 +--
 arch/arm64/include/asm/kvm_host.h  | 14 --------------
 arch/arm64/include/asm/kvm_pmu.h   | 26 ++++++++++++++++++++++++++
 include/kvm/arm_pmu.h              |  1 -
 4 files changed, 27 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_pmu.h

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 8a777dec8d88..54dd27a7a19f 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -6,9 +6,8 @@
 #ifndef __ASM_PMUV3_H
 #define __ASM_PMUV3_H

-#include <asm/kvm_host.h>
-
 #include <asm/cpufeature.h>
+#include <asm/kvm_pmu.h>
 #include <asm/sysreg.h>

 #define RETURN_READ_PMEVCNTRN(n) \
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7cfa024de4e3..6d4a2e7ab310 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1385,25 +1385,11 @@ void kvm_arch_vcpu_ctxflush_fp(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu);

-static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
-{
-	return (!has_vhe() && attr->exclude_host);
-}
-
 #ifdef CONFIG_KVM
-void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
-void kvm_clr_pmu_events(u64 clr);
-bool kvm_set_pmuserenr(u64 val);
 void kvm_enable_trbe(void);
 void kvm_disable_trbe(void);
 void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest);
 #else
-static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
-static inline void kvm_clr_pmu_events(u64 clr) {}
-static inline bool kvm_set_pmuserenr(u64 val)
-{
-	return false;
-}
 static inline void kvm_enable_trbe(void) {}
 static inline void kvm_disable_trbe(void) {}
 static inline void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest) {}
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
new file mode 100644
index 000000000000..3a8f737504d2
--- /dev/null
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __KVM_PMU_H
+#define __KVM_PMU_H
+
+void kvm_vcpu_pmu_resync_el0(void);
+
+#ifdef CONFIG_KVM
+void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
+void kvm_clr_pmu_events(u64 clr);
+bool kvm_set_pmuserenr(u64 val);
+#else
+static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
+static inline void kvm_clr_pmu_events(u64 clr) {}
+static inline bool kvm_set_pmuserenr(u64 val)
+{
+	return false;
+}
+#endif
+
+static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
+{
+	return (!has_vhe() && attr->exclude_host);
+}
+
+#endif
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 147bd3ee4f7b..2c78b1b1a9bb 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -74,7 +74,6 @@ int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu);
 struct kvm_pmu_events *kvm_get_pmu_events(void);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
-void kvm_vcpu_pmu_resync_el0(void);

 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
--
2.48.1.362.g079036d154-goog

