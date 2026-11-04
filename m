Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FAF606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DL726UAO;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MWEZwJVW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/BSvWpOJsi3sveNpByUAOa/5y9WQoQ7F5yD2zRlMNBI=; b=DL726UAOy6lJ72GCCFK496ia2v
	6cO6gHvCRmnsjVBYqbPOJfZc17WRjVA+5dpe5CQHpMP8p11+V48m8Wf8LAj27zr026yuvb3XZPEO1
	jzNpkQEcMeWRLlzrbU3cGE/KP4ZvnSTG31SZk1cmjrJJTPRPwU3TaEEoRpgeVnMsGYosSoMmDSk/+
	IWeAjJCE0/Pv8vE6k4CUqRM61NZfBIWO9DU1ukbr+R2J90twFsOz4aXo7ZPmsZWfDj7QV/l/ZI/YO
	C447vhErU8V7PphIRcjrqMcKqzm3Wvmlo8dcuL/1W8UkR7Vsr3PMIY3x/qvpIi28A7zOswrUNRx9N
	B5fn7AOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObdJ-00000005Yla-3taB;
	Wed, 04 Nov 2026 14:06:33 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObdF-00000005YiG-1Sh1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:06:30 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a318cd95e8so7619395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793801187; x=1794405987; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BSvWpOJsi3sveNpByUAOa/5y9WQoQ7F5yD2zRlMNBI=;
        b=MWEZwJVWmgN/NCYQ9i1oMwK+CDROZYA0Tm7WLdisKpP5SvK+mjYBZfvHUSb87aj91m
         oJVUfq/ZH9oVM80KG4QVy1n2skumV5rMbBKjIz902gXBP6bZquO5sMFPWENPcdaBoUvb
         bi8Q9fE8XqQKQJQxMQJJ/dJLBA9NwM7G6xVhZV3A9NJk9UEusXygQGhfWgGLbIFtSbsi
         VU7h1eQLL2YU+tNCjRB8FcwplDH0VKbn7hh0szjFmTAEAC+UPt2LeSYIm71rSHRWe5RW
         GrP3LJMdIcIT5sPLxgF2zV6ce9GsYwRwPTuBje71KxTR6wlhm1UVPCpsGP8LncBjS8Al
         YZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801187; x=1794405987;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BSvWpOJsi3sveNpByUAOa/5y9WQoQ7F5yD2zRlMNBI=;
        b=zRWsuneglBr4200KynO9P7Sh7qluPjDy0wEoVY339iEidmn9RLJveQLDU6dbE0wXVT
         hF9hzfWbk8UK9GdAYLvG4qN3//X+oXhwrxk+vNR+P43HNnYnZTiam0rfB/ZeLr2cGhrW
         9O1bfZ3YJ2OQJRW7IN0MhH/rvDiYLmC9OQOnZnPr5pvMppI4kyehg3xrGuBtr3MyWx2q
         ShMSDlPc5eAYu0pAqPDm/EC0Z9MUyzD1lGEQAosBB/xz8NwfMWUSCyJEsnb7ZPTFit+n
         d+OK32VE6twKWSSwYpxL99xxt/dciCGFHY9l0Hs1d3qKwrnPbikZXPOPe2PwVA81gHrV
         jP3g==
X-Forwarded-Encrypted: i=1; AKwUvBywv+pisX18BNdNQRxMM8e5en1te6L4kzbquRtot3Y9NSZmIUJxv7OenN4hVObITvp8c84xqaLC/+LN8bhcFfQx@lists.infradead.org
X-Gm-Message-State: APuU4Z+IJljcQeiO5Jtf79Evx06SVko7jFE1BQZAlUvQgHxrTi1AMAv9
	wukynB7nsyMCwfeMQtAKWsdWoBxVBGSlLHptV5IVJCcsJ+Did9bEmF72c+rKUndO1dAOkoumNeL
	tpSvTSUR9DwEfOFz043VINA==
X-Received: from wmpo21.prod.google.com ([2002:a05:600c:3395:b0:4a1:cf4b:72c2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b02:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4b4a55168c2mr28580285e9.3.1793801186750;
 Wed, 04 Nov 2026 06:06:26 -0800 (PST)
Date: Wed,  4 Nov 2026 14:06:09 +0000
In-Reply-To: <20261104140612.137869-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261104140612.137869-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104140612.137869-3-vdonnefort@google.com>
Subject: [PATCH v2 2/5] KVM: arm64: Use HYP_REASON_ERET_HOST on trace_hyp_exit
 from PSCI_CPU_ON
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060629_390496_CFFE7BA4 
X-CRM114-Status: GOOD (  11.22  )
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

The hyp_exit on PSCI_CPU_ON logs PSCI as a reason but really we eret to
the host. Use HYP_REASON_ERET_HOST instead.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/psci-relay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index e20db999e328..48228991a7ba 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -213,7 +213,7 @@ static void __noreturn __kvm_host_psci_cpu_entry(unsigned long pc, unsigned long
 	write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
 	write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
 
-	trace_hyp_exit(host_ctxt, HYP_REASON_PSCI);
+	trace_hyp_exit(host_ctxt, HYP_REASON_ERET_HOST);
 	__host_enter(host_ctxt);
 }
 
-- 
2.56.0.455.g6c5a503b38-goog


