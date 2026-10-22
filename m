Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D658C606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sl3QjpSo;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BFw2dysU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hfltIMqe1DPYXUB6u6RGh5+LsUMaEBkzsWt9Y8g2MJ0=; b=sl3QjpSor72o5c9HnxpuC4ITsl
	f1Kt95jQ90fGBQ6jNkE9xs5dUfJ4Bj+kjN+15+vYz8P3OXmCFR/IH7ll6rraRMwyI1w5HczQ5A/DU
	ZuzCpTjARwk6R44X8mXO0LB0cbPANBZ4sYOBzhYxtgQem4MRo06B8fxnc5jNEBlmxDe4BZj+GGc3s
	xirgLaExtv2i4MP3KCyL5mRU0Pv9+49HeTTSaovvxCN+6c45xEKtygIfDmNgGa3mGzXJ0aghjxZnz
	l0pGrKhbtn9Ig5cR3+87Dx59Cq7BrPmbPdiBiGR8vDU/mqdd/GpXmIMC9zBdN9Su4FnepX4IGCw6r
	wLGgN9Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtN6-0000000EFmc-0pJ4;
	Thu, 22 Oct 2026 14:02:20 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtN0-0000000EFjl-28kZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:02:16 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a20a40d3e9so3246475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792677732; x=1793282532; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfltIMqe1DPYXUB6u6RGh5+LsUMaEBkzsWt9Y8g2MJ0=;
        b=BFw2dysUxvOOM9zzZNALWPurSCX1aFU8RvBXKM++lJu4PTdrJEst8IWvC0J9ku8FnP
         hFMAqHD4yx47Giau6brLbzNFzdaEJ7sbPUwKKpo0aCqXkBa7wK8b/zGpQKtB557IL23q
         D0jexK20tN+VxxYH8Fa+SyoZghitVTzIjUmXYRrJLAHmVM4L8SQt0k+8Hl/LBHZdVfGs
         v2FPVx2bP0/2LSw/xSqmB5SjUavjEp5IYkMS4xGg/Q0sX8QC1MUPoRkh6nFcF+MLxIKp
         SdqNG6fwFdkMpycxr8D9n0fsMqhGeBHTphh8lv2LNybQrRfZpI8i4BQ6VNUw1p1zLLF8
         ErGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677732; x=1793282532;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfltIMqe1DPYXUB6u6RGh5+LsUMaEBkzsWt9Y8g2MJ0=;
        b=sADvCMtxxsAi3yEAeOCcmf73a+/+49f8MgKJKrb6/LMdYLm2Wlgpet5CfPTGrxEB8m
         FodgBxBMmvbw24NwiC0ovoaAiEb0BU3DW7VDfHp9472nZnHKcmQ4h0CVMxXJQPnCfLWP
         ZhvEr35A7Afrj2+lKFuKKSc1cZuJJa7Y8jjltYZWGo+4dBsKLgqzKZ9QOmgcmV1gfyQo
         yEGn8VsJmQnpDNbDSmCg/p3JRlyluZVnZCLImtSSFmQivicSsLQ0EaxchxT86xOSZC9k
         n0bcCn8GJo5O7V5I9nMDRWbIGZ5w5r+E7ZV7mlObJipL4E0WVBPpEj9CwPqyCuEFMvcb
         12OA==
X-Forwarded-Encrypted: i=1; AKwUvBy5FJGFuA98CbqvCAEv3syUfmnIa5PX+mOnTbG+P6VVQLTJhkFItzyUN2BIIUL5CZZysdJSUB1tHyIB10Tr1Hu5@lists.infradead.org
X-Gm-Message-State: AFq9FYIrfns2Ue/TllXw/7lqN68COLQqiW5YcIGJ4+Y9T8HEPiMdeJNK
	cnRNjtQ8IPNw8y0tNfpV/dYrvFmwBB2jHvAXpNjY5Gbc6IBMMH3HQNfdnowcUW5w5ZWygr3A6OE
	MVbRdadhGWZgsELmqCjsRkQ==
X-Received: from wroa12.prod.google.com ([2002:adf:ed0c:0:b0:48d:ef8e:e575])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc8:b0:4a1:bd69:526f with SMTP id 5b1f17b1804b1-4a1fd8a7d9dmr118418955e9.4.1792677732158;
 Thu, 22 Oct 2026 07:02:12 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:00:46 +0100
In-Reply-To: <20261022140048.2522787-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261022140048.2522787-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022140048.2522787-3-vdonnefort@google.com>
Subject: [PATCH v2 2/4] KVM: arm64: pkvm: Fix missing reset of GICv3 LRs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_070214_584155_D9B2DF9E 
X-CRM114-Status: GOOD (  21.27  )
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

The vGIC LRs are architecturally UNKNOWN when the CPU boots or resumes.
However, in protected mode, only the used ones are reset, because the
HVC __vgic_v3_init_lrs() is never called:

  * During boot, vgic_present is only set in init_subsystems(), after
    cpu_hyp_init() was called.

  * During CPU hotplug, kvm_arch_enable_virtualization_cpu() never calls
    it either because kvm_hyp_initialized is always set.

  * During CPU resume, no notifier is registered for pKVM.

First, return the error of __hyp_reset_vectors(). On an error, we know
the hypervisor doesn't allow a reset. Only re-init what the host has
access to, no matter the KVM configuration, which is the vGIC LRs.

Then, cpu_hyp_init() is only called from init_subsystems and
kvm_arch_enable_virtualization_cpu(). Remove the kvm_hyp_initialized
gate: when pKVM is enabled, the cpu_hyp_reset() will just return an
error while for other modes, we already know kvm_hyp_initialized is
false at this point.

Finally, enable the PM notifiers for pKVM, it is now safe to do so. It
will ensure the host properly configures the vGIC LRs regardless of the
KVM configuration.

Fixes: fa8c3d65538a ("KVM: arm64: Keep nVHE EL2 vector installed")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/virt.h |  2 +-
 arch/arm64/kvm/arm.c          | 51 +++++++++++++++++++----------------
 2 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
index b546703c3ab9..a5bde8cc5df5 100644
--- a/arch/arm64/include/asm/virt.h
+++ b/arch/arm64/include/asm/virt.h
@@ -83,7 +83,7 @@ extern u32 __boot_cpu_mode[2];
 #define ARM64_VECTOR_TABLE_LEN	SZ_2K
 
 void __hyp_set_vectors(phys_addr_t phys_vector_base);
-void __hyp_reset_vectors(void);
+int __hyp_reset_vectors(void);
 bool is_kvm_arm_initialised(void);
 
 DECLARE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 0576c2022ef5..4c4e2fb7b660 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2246,10 +2246,12 @@ static void cpu_init_hyp_mode(void)
 	}
 }
 
-static void cpu_hyp_reset(void)
+static int cpu_hyp_reset(void)
 {
 	if (!is_kernel_in_hyp_mode())
-		__hyp_reset_vectors();
+		return __hyp_reset_vectors() ? -EPERM : 0;
+
+	return 0;
 }
 
 /*
@@ -2300,32 +2302,39 @@ static void cpu_hyp_init_features(void)
 		kvm_timer_init_vhe();
 		kvm_debug_init_vhe();
 	}
-
-	if (vgic_present)
-		kvm_vgic_init_cpu_hardware();
 }
 
 static void cpu_hyp_reinit(void)
 {
-	cpu_hyp_reset();
-	cpu_hyp_init_context();
-	cpu_hyp_init_features();
+	if (!cpu_hyp_reset()) {
+		cpu_hyp_init_context();
+		cpu_hyp_init_features();
+	} else {
+		if (WARN_ON(!__this_cpu_read(kvm_hyp_initialized)))
+			return;
+	}
+
+	/*
+	 * Even if the hypervisor didn't allow resetting the vectors we can
+	 * reset what we have access to.
+	 */
+	if (vgic_present)
+		kvm_vgic_init_cpu_hardware();
 }
 
 static void cpu_hyp_init(void *discard)
 {
-	if (!__this_cpu_read(kvm_hyp_initialized)) {
-		cpu_hyp_reinit();
-		__this_cpu_write(kvm_hyp_initialized, 1);
-	}
+	cpu_hyp_reinit();
+	__this_cpu_write(kvm_hyp_initialized, 1);
 }
 
 static void cpu_hyp_uninit(void *discard)
 {
-	if (!is_protected_kvm_enabled() && __this_cpu_read(kvm_hyp_initialized)) {
-		cpu_hyp_reset();
+	if (!__this_cpu_read(kvm_hyp_initialized))
+		return;
+
+	if (!cpu_hyp_reset())
 		__this_cpu_write(kvm_hyp_initialized, 0);
-	}
 }
 
 int kvm_arch_enable_virtualization_cpu(void)
@@ -2353,8 +2362,7 @@ void kvm_arch_disable_virtualization_cpu(void)
 	kvm_timer_cpu_down();
 	kvm_vgic_cpu_down();
 
-	if (!is_protected_kvm_enabled())
-		cpu_hyp_uninit(NULL);
+	cpu_hyp_uninit(NULL);
 }
 
 #ifdef CONFIG_CPU_PM
@@ -2397,13 +2405,11 @@ static struct notifier_block hyp_init_cpu_pm_nb = {
 
 static void __init hyp_cpu_pm_init(void)
 {
-	if (!is_protected_kvm_enabled())
-		cpu_pm_register_notifier(&hyp_init_cpu_pm_nb);
+	cpu_pm_register_notifier(&hyp_init_cpu_pm_nb);
 }
 static void __init hyp_cpu_pm_exit(void)
 {
-	if (!is_protected_kvm_enabled())
-		cpu_pm_unregister_notifier(&hyp_init_cpu_pm_nb);
+	cpu_pm_unregister_notifier(&hyp_init_cpu_pm_nb);
 }
 #else
 static inline void __init hyp_cpu_pm_init(void)
@@ -2526,8 +2532,7 @@ static int __init init_subsystems(void)
 	if (err)
 		hyp_cpu_pm_exit();
 
-	if (err || !is_protected_kvm_enabled())
-		on_each_cpu(cpu_hyp_uninit, NULL, 1);
+	on_each_cpu(cpu_hyp_uninit, NULL, 1);
 
 	return err;
 }
-- 
2.56.0.257.gf7497c7d27-goog


