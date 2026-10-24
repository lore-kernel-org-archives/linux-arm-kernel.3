Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E005606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 02:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wIcxsA/J;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ShTWneG5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MwaAPfyutmKmJPECsVQASiFKd+n4QdGa9vMFjSb1Ixo=; b=wIcxsA/JskDZ8x
	YOLh7NyIBBLYQlJ351XUQ8xvs7ySQJO0mNgHINTqHFFv3igZf+EI3mMZTbXkg/0eYa3auywGDqR6v
	9c0YjTMcrjVLwcux0L8ESggY5FwzZxLia+gIWGqgHDq9l5IpUlKkt+O3rYkHi2ATkrWqFef27oGjl
	FcjXilG/A4OT2AfsLZLjOEt/kQ1Pae2D1JQ5yOs9cOE5ZRZLykBX3g9zFlS6ieb38fs2C7glF/5kx
	uHs/3KiqFbgqG6KUXpZxXB2qcAdkA8IADD/jwWZhe0VWTCNEAoYmGqvC9UDL4gkgMfEeXCzCBSiku
	fHgHW/mMQDErfSMB5UrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKRRb-0000000HLO6-4Bhi;
	Sat, 24 Oct 2026 02:25:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKRRL-0000000HLKy-2TdV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 02:25:02 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1271234f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 19:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792808697; x=1793413497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwaAPfyutmKmJPECsVQASiFKd+n4QdGa9vMFjSb1Ixo=;
        b=ShTWneG5MGcTa1rJupTkOPGm6PGfmhUemPV0GOTHHbTKnyEj5ZJOQLiSx3m3sTv2o8
         OgE/hZcAjQONDyvnxSLkkLt4l0/zB7rlyHl6BrrnQWswAiFXrBgOPE6R94NdYq5z80QX
         6MOwT7BfZpzzEY0jp9dUbfsLiXRepeeSetv7kNebuqMkKMUuiaANyxqp4I/u14QdqCNz
         t6v9jjVnoX/PrXerizxeRJ6ZnHhD0ZVnFpDgp67zCF19H4uHEV2p4RGT1IJYTePiNaJ5
         2QuOa8De9MO3XANEwSCDK3iySH8sFsw1EOmyU3aI7k3M8X73cuRk60FTg0x8jbFGSGLz
         dj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792808697; x=1793413497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwaAPfyutmKmJPECsVQASiFKd+n4QdGa9vMFjSb1Ixo=;
        b=rvgjAxVSIJaqsDaAVkC0eaVMiBEy5Wkxkt8YPhRzWVdVysQr1p6a9xerzjbwv6IG41
         fTe32gkcQ0ah5YohnnclMrAliHsGoNP7nHLMc3AcvRQbedRYY2hsk//RpFWaOLaDaMvo
         b/e0HGqS8tPn6zLOViiv022xRAEvSGdZCaF8pyiF7MLavZCgd1AqCqItBbAijc6RZeiL
         KQ4mmfkyDhPdwgs5XOzHTLBVv1RkiX9OG87AU7MajQz1DodBtLIX3ow0EH9MQXUBAAMw
         9U9eQ2gC/D5IKk0QsUHJwUJeMb+7F+IDie6XmesnX6B+UPo2bXzGy8aLhhfwZeCWE7zw
         /kWw==
X-Forwarded-Encrypted: i=1; AKwUvBzNZ3563j5Z1/K9qLU/UEdCrInebbPEhuTnjDvdT5yQAMtLjlqibsztJVLADQ0o9pefeUHKol1o7N2T3IUbUMhn@lists.infradead.org
X-Gm-Message-State: AFq9FYLKhqEVWClu3zx8y+Rx3lkN1MOors1BbRfIKnYeEMFjW3ZEZEiE
	d1ws4ysYj6zZYTv+c+xlY9HH0+XVw42/Pj8tYzOl/X+WUVzwOAmzrvIq
X-Gm-Gg: AYBFou3DtAEWcQ3EbRY/KqZJVm+EvYx/aNLRBaCQrFCYAe5ZEztaDNG31qJ311p4VVn
	WatbJiZ1Dn1zyAwMHyrc1uIKqJ5oTzMYwiG0ZCmC++UaVnipbxHHezZG7WVjN8WizVAKdaz0VoA
	/pgZNjNmY0EFPtxnLYTshTn6d0fnn1nSV5SPRpGGQMV42vew0HIuf8uD3fqe3Le6nTO4qVyiAqB
	6e0O0ngaUObPPovP5EAqF0+LL5/Jan8MuuEP/qPFYOWHO5YQ9PIWMJ9bhKDR2nrFEhzrry1l7fc
	bTdXYwk2ib5rREj+V3L3q8jUGVN4T1APb9BlcMOdf3MgPTJlTwkcL1CpRHflvXlFffHUqA/OFJ5
	pWUY/omnNP4MIdcMAhvqH9O7vzs2LzzPr1GmISXWdETxaQd8vy4/Nz8SvUsnoP0m+SrDrwilXBF
	8kTuW1wvsLdWWa2VpC/egT+IuilMRIzLT16Ebih8awAoQbVcO+rSkCz0c2n+PckbxvPNhbD+0b5
	PWqODGAcKr+1gMRMf28NA0Nb0GIIKFwWQ281aTqMmbMCwia6qB5nx5nCQwhXamBo1L12wOt6e1U
	mFz7
X-Received: by 2002:a05:600c:4ece:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a35acb5854mr8241675e9.28.1792808697511;
        Fri, 23 Oct 2026 19:24:57 -0700 (PDT)
Received: from ASHA ([2001:630:3c1:164:1a66:daff:fe85:4026])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm21088415e9.8.2026.10.23.19.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:24:57 -0700 (PDT)
From: Amir Noohi <amirmnoohi@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Igor Velkov <iav@iav.lv>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <cdall@linaro.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Amir Noohi <amirmnoohi@gmail.com>
Subject: [PATCH 2/2] KVM: arm64: timer: Avoid the irq descriptor lock on vCPU load
Date: Sat, 24 Oct 2026 02:24:50 +0000
Message-ID: <20261024022450.629980-3-amirmnoohi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024022450.629980-1-amirmnoohi@gmail.com>
References: <20261024022450.629980-1-amirmnoohi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_192459_675468_E33F3ECD 
X-CRM114-Status: GOOD (  15.58  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the host interrupt controller has an active state, every vCPU load
sets the active state of the host timer interrupts with
irq_set_irqchip_state(): once for the virtual timer and, on VHE, once
more for the physical timer. On GICv5 hosts the state is also cleared on
every vCPU put, and with a userspace irqchip it is also cleared after a
guest exit when the virtual timer is not pending.

The timer interrupts are per CPU interrupts, so all CPUs share a single
interrupt descriptor and irq_set_irqchip_state() acquires its lock. CPUs
which load vCPUs concurrently therefore serialize on that lock, although
each of them only writes its own redistributor (and, when setting the
active state on GICv3, reads it back while holding the lock) or, on
GICv5, a system register.

This does not require over-subscription. On a 32 CPU Ampere Altra
(Neoverse-N1, GICv3, VHE) with an in-kernel GICv3, a test which makes N
vCPUs exit to userspace in a loop, each vCPU thread pinned to its own
otherwise idle CPU and running from its own guest page, gets 319694
exits/s from a single vCPU, but only 119943 per vCPU with 16 vCPUs and
58722 with 31. The aggregate rate stops growing at 8 vCPUs. At 8 vCPUs,
122800 of the 122847 lock contention events within 5 seconds had
__irq_get_desc_lock() or irq_set_irqchip_state() on the stack.

Use irq_set_percpu_irqchip_state(), which does not acquire the
descriptor lock. All callers of set_timer_irq_phys_active() run with
preemption disabled, and the timer interrupts are requested in
kvm_timer_hyp_init() and never freed afterwards. On hosts where KVM
stacks its own interrupt chip on top of the timer interrupts, its
irq_set_irqchip_state() callback masks or unmasks the parent interrupt
on the calling CPU, which is equally CPU local.

Same test and kernel configuration, exits/s per vCPU, mean of three 5
second runs:

                in-kernel GICv3           userspace irqchip
  vCPUs       before      after          before      after
      1       319694     324584          319670     345088
      8       278579     328736          112423     343984
     16       119943     328887           56120     282905
     31        58722     326056           28114     250586

With an in-kernel GICv3 the per vCPU rate no longer depends on the
number of vCPUs, and at 8 vCPUs no lock contention events have either
function on the stack.

Fixes: b103cc3f10c0 ("KVM: arm/arm64: Avoid timer save/restore in vcpu entry/exit")
Signed-off-by: Amir Noohi <amirmnoohi@gmail.com>
---
 arch/arm64/kvm/arch_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 6ac3321f4c57..a9103625dea3 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -679,7 +679,7 @@ static void timer_restore_state(struct arch_timer_context *ctx)
 static inline void set_timer_irq_phys_active(struct arch_timer_context *ctx, bool active)
 {
 	int r;
-	r = irq_set_irqchip_state(ctx->host_timer_irq, IRQCHIP_STATE_ACTIVE, active);
+	r = irq_set_percpu_irqchip_state(ctx->host_timer_irq, IRQCHIP_STATE_ACTIVE, active);
 	WARN_ON(r);
 }
 
-- 
2.53.0


