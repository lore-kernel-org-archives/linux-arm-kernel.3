Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B564D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IbeVdz2Q;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=uL8iextk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7SQmolXx9Gu1yzUrM62wAZ0O9GWKQf6abuquBr/LlHA=; b=IbeVdz2QnI+HBEbwFt3bfmp4kH
	MYns6yd4gIwvZGNGhKzwC71S5eDfKLcgzXeJBfEdIsOFTyfZ9vN28kZzNiLts1DAK82MJYduynZsR
	qi77TSNDD+Lh0Othh3sMo3UklBmhpKIbabBi9DleLzKEfG4p4XiNs8jUMQ/sHvJWz8llKTM0X3qIO
	rr2F6S6QSreVnZU5So4dD1eK14cQ4rGA65k+i9CSIm61sf/YesL+ahoMts56bWxLS2MPwA/7ok9vV
	V4sYpwzVvhVNl/sMkFTi2ZxKTccSXy1M9rrjcegCVEDjt8fKBl9Dqo6xDjJBaitzquMkZ2Nly+56T
	iAVTH5oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtN6-0000000EFn9-1Jje;
	Thu, 22 Oct 2026 14:02:20 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtN2-0000000EFkD-0tEs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:02:17 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a1d1f26a63so18236385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792677734; x=1793282534; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SQmolXx9Gu1yzUrM62wAZ0O9GWKQf6abuquBr/LlHA=;
        b=uL8iextk/zaGwTMqXgkPmBJxESjuO9xa2x0b1Ela1uZKK5z0vqEeYWFvQZLP8N4G9Y
         YCpi4chOXlc9lWEfo/1dV6MeHWQ60fNIl6ncMeWf+q96/AT+YywtXxuDo6DbETOv/JQs
         Tt3z2pCbVeOxxntTJEcI4oT60fTb4q1rMcg/H7gQgH002n/pzG9Hg7wW6xl6aubUZXCm
         RCKDel/6xu25xQaghfot3/MTi9+Y8FCi3lqnKJFgbn/zlMbQySFlGiYBHdSxqn8NexGD
         hlbw5qioMMZdlT/CAjMQTUT+dAlo/9h4a/gr48GLRj6vziRYA5Fr5DcZBengKc6N96ml
         TPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677734; x=1793282534;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7SQmolXx9Gu1yzUrM62wAZ0O9GWKQf6abuquBr/LlHA=;
        b=G8M/8xL6+O7Hnd+WQNxblIEvVkeqRflUoyV0POLtpLqyb8kWFDYpHNyu3JE0kPXkI9
         qAhuYxfwiFPBRGcVU37XmwRnqnC0nBIHO7LmVIL4O9tHnhj1zVB6Xf6X2YI2FlY0+sfK
         ho4p+bz2z/3odxruK3erbbasaRCDsjpmNd5AsCo0/MDW/CbhkW8ICPJ6kQPrPaZMo3gJ
         0K4DDywZUUIimA4JHJ4tJKBRciyPm0o7f8U0GQnSXCI0qyQA5j60ZL9XpJo7OqL8DKfG
         YCyQrfB/aF2vl6jsDjVsD7qD8Z8eJ7bLKKVBK2WWt5mE8CdQ2qZMPv81xP5VUnjoyNDt
         V01Q==
X-Forwarded-Encrypted: i=1; AKwUvBygwfPJ2AcpsFcSuc8X2UxzziXeMwfQ6aoB22G2eP5+MX8IoCQTRdyKrzZmzEoYTSJXU06pYPPZvX1t5gUD+Gfh@lists.infradead.org
X-Gm-Message-State: AFq9FYKB/lliwLNz85Wzu3/AH/XrlxSNsns0ihAkQVMNdy8pcA6RuqHG
	3uAyJ+KzhSgo85HZM/yvk/kMK2J6HTSDXxqMWIge/hxHEpXrAuaElT43vCW7W91x2efzv2bodCr
	4/PVslJKKXpsqS7j3ghC6qA==
X-Received: from wmbgz7.prod.google.com ([2002:a05:600c:8887:b0:4a1:a2ef:38dc])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3514:b0:4a1:d248:25c4 with SMTP id 5b1f17b1804b1-4a1fdb17706mr114255665e9.13.1792677733445;
 Thu, 22 Oct 2026 07:02:13 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:00:47 +0100
In-Reply-To: <20261022140048.2522787-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261022140048.2522787-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022140048.2522787-4-vdonnefort@google.com>
Subject: [PATCH v2 3/4] KVM: arm64: pkvm: Reset GICv3 LRs in the hypervisor
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_070216_261602_1AD84796 
X-CRM114-Status: GOOD (  11.44  )
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

After the host is deprivileged, pKVM can't trust the host for resetting
the vGIC LRs whose value is architecturally UNKNOWN when the CPU boots
or resumes. Add a blanket cover in the CPU_ON/CPU_SUSPEND path.

Fixes: cdf367192766 ("KVM: arm64: Intercept host's CPU_ON SMCs")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/psci-relay.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index e20db999e328..890ced64fb18 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -213,6 +213,10 @@ static void __noreturn __kvm_host_psci_cpu_entry(unsigned long pc, unsigned long
 	write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
 	write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
 
+	/* We can't trust the host to reset those registers */
+	if (hyp_gicv3_nr_lr)
+		__vgic_v3_init_lrs();
+
 	trace_hyp_exit(host_ctxt, HYP_REASON_PSCI);
 	__host_enter(host_ctxt);
 }
-- 
2.56.0.257.gf7497c7d27-goog


