Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C70E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ztk0RLnA;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Mutsr/JP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=powphZXLhH8S0DAbGwSawM8KqytfbP1cF9uHOkKWMWI=; b=Ztk0RLnALiVC0tmDA6+YndEc8E
	9ZXv3J44aESAWaNC+VNJh4Ut/OEM+0lD0e3FGZ2xh9o5ml00OUq1giEi6fG5t870x0EwNKFWs92bQ
	P8IuY9TJXYFaVR+NyxerESVmZ8ux7zEvqy4vxYjhQvCP0knLTcSDCI/x/SFYeAuo0DHCHTc9Hi1uO
	virfooIG46xfgQuezsWxdSpx9LtIowjmD/FGXR+CeT5a7R8xLGFB8BuwGrAnDew+Wv5TLScWfYmPe
	j/a0j2w982kumLX8He6+VuzcqzmjHe8CECyLpN8Czq6sdeuOIKIfLDHU3xLLMYn9Q937NxeEj2kRf
	IOxTzfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNBQ-0000000H11n-2FSq;
	Fri, 23 Oct 2026 21:52:16 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNBK-0000000H104-3NSB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 21:52:13 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-4db3db8687fso1941705b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 14:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792792328; x=1793397128; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=powphZXLhH8S0DAbGwSawM8KqytfbP1cF9uHOkKWMWI=;
        b=Mutsr/JPuyif2p5ltxMpQ1F45ptX9rR59fquHi+tFQ+BjWCj3qvS09tY0bGvrXcfNV
         Ns4TbElH2bcPz04Fl1EL1P2XDC+KL01WBuQ+ottkngaqX0SuXk1g3WdeR487Zxf9u+yB
         kms6bjou/K/qQUC0dB6xn4WSVnXRll/7S04B69+2Vi6HUSdV1Nke0iyC6Drkv+KzXS94
         MQsnuvxKvnlbzXYFnkwhZuNgeDaAhFc9bX7FvKOCx9T+/OihcvYHtZBp/stdBxIlU5KB
         jw/mo6xNMpolgkLxpbVI0umnTOca5f69wfsjnA8zq3nDkFri6EZqJpu0EOn3KwkJ6EGH
         2Lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792792328; x=1793397128;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=powphZXLhH8S0DAbGwSawM8KqytfbP1cF9uHOkKWMWI=;
        b=1DhH85jgjNRh7n42nq/UVkMuYzexKN7LwIxHcILMzqj5J0jpGShixzSHtEGnaDO+5D
         RVnSYoEhfgswdZM0LJ1DKf4AabRi1lphiD4tcGuVcHu8JYYto81g7YxRP0ooerfDqmho
         Rc3FDRHf1/lamQtdwR3ixjPbc+5cO4XMKC4y3IhED4BUDu5+XzKD7CGJcYaTW0BOmLd9
         vZO9ES+Ge2mDs4au06ZWDwn0GSIvjWQZccg1AZ1HN5cVDcMb6dKb5XChnnvlqnx54rg9
         UgzZrValiVclC911/kJafgV+4Mx4sVzkmPcuIntxJFF7f3pVnAxHqH7X4qz42sLVmdic
         Zsvg==
X-Forwarded-Encrypted: i=1; AKwUvBzgxLGlARAcZ2TBRKyvVDertlp8UN0c59uOaPaS/x90/xCgKpazWdOlp2j5noq4Ppvw2BFDwfGYOOLi66JY8Xpb@lists.infradead.org
X-Gm-Message-State: AFq9FYIRie3OJVmRVuZjlpvhonLha7FpBy9udtMtLw+HjePYT782fO7r
	pTjRSB8Q+Qj7jOfrB1O18Xg5wUkfGK7wbPuKYtKP5ooiZvU7lGwRmKsHHdFv5m8MPmbM3WP3ObO
	6w/6psPuxT6d61vtd4fD44OjZHQ==
X-Received: from iocou10-n1.prod.google.com ([2002:a05:6602:c30a:10b0:9c4:1f4b:e117])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:11c8:b0:4f7:d324:bc36 with SMTP id 5614622812f47-55c002fc6a9mr386149b6e.43.1792792328262;
 Fri, 23 Oct 2026 14:52:08 -0700 (PDT)
Date: Fri, 23 Oct 2026 21:52:07 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023215207.1465369-1-coltonlewis@google.com>
Subject: [PATCH] irqchip/gic-v4: Use a separate lockdep class for vPE doorbell IRQs
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Oliver Upton <oupton@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_145210_852907_EC203B3D 
X-CRM114-Status: GOOD (  13.95  )
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
X-Spam-Status: No, score=-26.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

By default, init_desc() assigns the shared irq_desc_lock_class lockdep
key to desc->lock for every struct irq_desc. Device drivers that
register an IRQ affinity notifier establish a lock dependency chain of
&irq_desc_lock_class --> &pool->lock --> &p->pi_lock --> &rq->__lock
when irq_set_affinity_locked() calls schedule_work() while holding
desc->lock.

On GICv4 systems, scheduling out a KVM vCPU calls kvm_sched_out() ->
kvm_arch_vcpu_put() -> vgic_v3_put() -> vgic_v4_put() ->
its_make_vpe_non_resident() -> irq_set_vcpu_affinity() while holding the
scheduler runqueue lock (&rq->__lock). Acquiring the vPE doorbell IRQ's
desc->lock establishes &rq->__lock --> &irq_desc_lock_class, triggering
a lockdep circular locking splat:

  WARNING: possible circular locking dependency detected
  ------------------------------------------------------
  VCPU-0/109705 is trying to acquire lock:
  ffff0001e41e4cc8 (&irq_desc_lock_class){-.-.}-{2:2}, at: __irq_get_desc_lock+0x5c/0xb0

  but task is already holding lock:
  ffff00dad15fd260 (&rq->__lock){-.-.}-{2:2}, at: __schedule+0x23c/0x1850

  which lock already depends on the new lock.

  Chain exists of:
    &irq_desc_lock_class --> &p->pi_lock --> &rq->__lock

   Possible unsafe locking scenario:

         CPU0                    CPU1
         ----                    ----
    lock(&rq->__lock);
                                 lock(&p->pi_lock);
                                 lock(&rq->__lock);
    lock(&irq_desc_lock_class);

GICv4 vPE doorbell IRQs are internal to KVM and GICv4, set
IRQ_NO_BALANCING, and never register an affinity notifier or queue work
under desc->lock. Assign a dedicated lockdep class to vPE doorbell IRQs
in its_alloc_vcpu_irqs() via irq_set_lockdep_class() to prevent this
false positive.

Fixes: 8e01d9a396e6 ("KVM: arm64: vgic-v4: Move the GICv4 residency flow to be driven by vcpu_load/put")
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---

Notes:
    An LLM-based coding assistant was used to help analyze the lockdep
    report and draft this patch. I reviewed the analysis and the change.
    
    Tested with this patch applied to a 6.18-based kernel (the affected
    code is identical) on a GICv4.1 host with an idpf NIC and
    CONFIG_PROVE_LOCKING=y: bring an idpf interface up, then run the KVM
    vgic_lpi_stress selftest pinned to a CPU shared with a busy loop so
    the vCPU is preempted while its vPE is resident. Without this patch
    the splat fires on the first run. With it, five runs are clean and
    lockdep records rq->__lock -> the new vPE doorbell class instead of
    irq_desc_lock_class.

 drivers/irqchip/irq-gic-v4.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v4.c b/drivers/irqchip/irq-gic-v4.c
index 8455b4a5fbb0d..68ee288f6a076 100644
--- a/drivers/irqchip/irq-gic-v4.c
+++ b/drivers/irqchip/irq-gic-v4.c
@@ -157,6 +157,8 @@ static int its_alloc_vcpu_sgis(struct its_vpe *vpe, int idx)
 
 int its_alloc_vcpu_irqs(struct its_vm *vm)
 {
+	static struct lock_class_key vpe_irq_lock_class;
+	static struct lock_class_key vpe_irq_request_class;
 	int vpe_base_irq, i;
 
 	vm->fwnode = irq_domain_alloc_named_id_fwnode("GICv4-vpe",
@@ -183,6 +185,8 @@ int its_alloc_vcpu_irqs(struct its_vm *vm)
 	for (i = 0; i < vm->nr_vpes; i++) {
 		int ret;
 		vm->vpes[i]->irq = vpe_base_irq + i;
+		irq_set_lockdep_class(vm->vpes[i]->irq, &vpe_irq_lock_class,
+				      &vpe_irq_request_class);
 		ret = its_alloc_vcpu_sgis(vm->vpes[i], i);
 		if (ret)
 			goto err;
-- 
2.56.0.257.gf7497c7d27-goog


