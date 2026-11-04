Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFED606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wxlb3Uzs;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gmN3Pj1J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MWbafvzSXIS+FuKJGheLyccmpIuKpJRwMov0QQ6M3pU=; b=Wxlb3Uzstr0FFh2VNIgNh0H+Eb
	RfWnchUJPyTisX4nQBMLUHVl1lE1eW+IfWof804jN/ZPfVJm2ndQLtf+dYsFFpUY7dYLE0CESU5IK
	GTsXG5IzwSSHZU7V8ilyW42nnE7mkhgXFET4FB59z8DeLjBwm8u8rS9FmamPtSCNVYT1jrM5yXOIw
	1dTNU+pmY5LD1+Qtyo9/0VsaxG1LBIXB1W3IHoHCtq64uOKnhulKRN8azdZ7DndefakQpNpSJl2aN
	pMrGYwTRKMi/qdcc7MNtL3md5CKpif3uhWcAA3FN66qxsYQTchCnPFC6N/hMXGwX4i4huZHpeth5B
	iUVmolIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObdP-00000005YqX-39S8;
	Wed, 04 Nov 2026 14:06:39 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObdJ-00000005YkO-1Aov
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:06:34 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6b1e00100eeso992465a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793801190; x=1794405990; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWbafvzSXIS+FuKJGheLyccmpIuKpJRwMov0QQ6M3pU=;
        b=gmN3Pj1Je8hRPk6RZBgi2del+MLIj7RLkOTG/WpIpehlzFEMxg6h9LEepx99r+LFac
         sUaz4CiAYPh2pttN241vqBB5vEmwCPGuw8RCJwc48d+hwcNKnQyz1wuz/pBrbMYyZVO8
         Ign+ZlNSqOZ3mtE1urwanO9NpCzfUYY05xwyJMf/jbLFWeI3WD+7iUxu8o44IHmQ8ucq
         RtUF6HH5qEwfIN9nkoFC/ToHK+KWt+31l1eKd22Llrcx2Qq0+5E2lEfGRny5ifK489DW
         5t0ADWTnvD2FgkNCStAbkPd4yo5+beI03K/VGelM+j0555s2BZdUUUgIaUVF9G7aTcko
         GyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801190; x=1794405990;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWbafvzSXIS+FuKJGheLyccmpIuKpJRwMov0QQ6M3pU=;
        b=ct2bQGIjt2mjYB35L5KjmwyVcN/POClMgI9iMyFX1Gke41p9xI78HZDRozby6VJtFb
         aE4qM600+Ie/Tlr+EntfgJpZPNuKei84nz8uvvYZDb5QZnpCNovW6ZxS2+OlwvQEgLpA
         R0NCRpGGAPX7M8nICZ5IKsvcpbqCK9MDaZco9ZTqu/ovMPBSbSOIihO8nA2jh1cU604Y
         cJkV5UpIvdAFiGNi+v4nh4bFmBCZQGMyu2Ts7zVJbg3fw0fwh/j4lLxCxudHuOg0pTgv
         +n+e0p7oWAHJOACMOO/RoHTbbieV3FD2+tMgdBWvuVXijglX8iQLRSWsVWQti+3/pfsK
         AURg==
X-Forwarded-Encrypted: i=1; AKwUvBwpFEArOv9BX/yY4C0UrLZ2XTfYigv7IpSp5LMc1zTPY60YiY77ymeBGU6kHfBvmiYF/HU0rmOTKeTe3rKlQX0v@lists.infradead.org
X-Gm-Message-State: APuU4Z9Sltb+qUNA+dX5JYbwOKGjWVYq+mCZNhK/C8kQ9ZhV9ndBqhAk
	VDnH65fWb0AuCV6oedclHdkDGVz3Hf0Qm4h7ieYmm6uP9SOGH6D9i1ZH/HMmgApTu8NFRlcOGDY
	L17wAySWUKfQ5KuVSvwr7zw==
X-Received: from edbin4.prod.google.com ([2002:a05:6402:2084:b0:6b4:5df5:42f3])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2346:b0:6ac:686f:91db with SMTP id 4fb4d7f45d1cf-6b4f7d3cdfdmr9122001a12.11.1793801189924;
 Wed, 04 Nov 2026 06:06:29 -0800 (PST)
Date: Wed,  4 Nov 2026 14:06:12 +0000
In-Reply-To: <20261104140612.137869-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261104140612.137869-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104140612.137869-6-vdonnefort@google.com>
Subject: [PATCH v2 5/5] KVM: arm64: Add host_hvc hyp event
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060633_327709_9607CA9A 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

In a similar fashion to the guest_hvc hypervisor event, log hypervisor
handled host HVCs with their return values, stored in x1.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_hypevents.h | 13 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
index 63d98dd92cb0..9a240fa410ca 100644
--- a/arch/arm64/include/asm/kvm_hypevents.h
+++ b/arch/arm64/include/asm/kvm_hypevents.h
@@ -66,6 +66,19 @@ HYP_EVENT(selftest,
 	RE_PRINTK("id=%llu", __entry->id)
 );
 
+HYP_EVENT(host_hvc,
+	HE_PROTO(u32 id, u64 x1),
+	HE_STRUCT(
+		he_field(u32, id)
+		he_field(u64, x1)
+	),
+	HE_ASSIGN(
+		__entry->id = id;
+		__entry->x1 = x1;
+	),
+	HE_PRINTK("id=0x%x x1=0x%llx", __entry->id, __entry->x1)
+);
+
 HYP_EVENT(guest_hvc,
 	HE_PROTO(u32 id, u64 x0),
 	HE_STRUCT(
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 28e0191e443f..1113cd828bd5 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -1642,6 +1642,8 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 0) = SMCCC_RET_SUCCESS;
 	hfn(host_ctxt);
 
+	trace_host_hvc(KVM_HOST_SMCCC_ID(id), cpu_reg(host_ctxt, 1));
+
 	return;
 inval:
 	cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
-- 
2.56.0.455.g6c5a503b38-goog


