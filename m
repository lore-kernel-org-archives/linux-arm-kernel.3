Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D6F606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 18:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fuPygdEU;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XXFaBzin
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TxYi1TQ/n9gm4Dyl6a+4Ba89b3B/1LYi/mstI8Zdh48=; b=fuPygdEUoEUffiFPY3S0YLfxbd
	OJoZqIoqptW2RYieM0w6EYUIoAWF74YAFrIL460KZfL+VFjvtKGkYy3XaZeBOokadZJMARCIwKKDm
	P4zKvyLiLoCihsHSwrTz3C+x299G2uzsJ7Ykn6IWZI4bv8pK4JWlBios4ks1qAMowvmn0KXrFMiOh
	C5j5z4MeZ/ctsk0rFuHzTmiWMRjupEUApGs70eZCaJP3lB8JX+eEJz398JkfRBGxxKWVG3eJ8Blj5
	OVVAArelZ6DT+fVuMjaXlVLb8qDRe6j73sEhZo2X2XobAvYmp5LIPSNcz/3hMtiMu4AtcZxDSBB+d
	WjxaL3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlYu-00000005WvU-3C9N;
	Tue, 27 Oct 2026 18:06:16 +0000
Received: from mail-oa1-x46.google.com ([2001:4860:4864:20::46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlYr-00000005Wv4-0iAQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 18:06:14 +0000
Received: by mail-oa1-x46.google.com with SMTP id 586e51a60fabf-46617932071so170441fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793124371; x=1793729171; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxYi1TQ/n9gm4Dyl6a+4Ba89b3B/1LYi/mstI8Zdh48=;
        b=XXFaBzin8McGxG3t7/oEuEtF2SkAPufQ8+0tRzog/EnHQMry0pVxBn2W7cTHTvKT0+
         F9O9N2Aq0Nja68PBmi8UoTC15mfaD5GidWt87AnjeE8GEXBePTzJBYiG9S4AxCSoWsvs
         bICu9PbVbR5x8dlzNhZzg6FAQ8ukvSDnyncqGexYN8xX7NrpzQwoYI0fZr4dWkonoh8g
         SwJx950J3TTdddARNVVHmCUVwMcfln/P6puuDKbivyNzKrLcjfQSegcyLkE7DTsisT4f
         sSazBUWBjYv0jJgY9LpKybtosFtDDrD/dW0PNNr5VLztaIWZXrPmw91OiJl7YG9eysjm
         SB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124371; x=1793729171;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxYi1TQ/n9gm4Dyl6a+4Ba89b3B/1LYi/mstI8Zdh48=;
        b=rKUaHbRendLwHw4EFMYy/5Aryho3m28VKfLGjQgGE+q/+x9vRfS0ZSC4zFTuNsMYw0
         iIDPw3CXwxYBPMZ9uzLZUw3XdGbsQAGIPtDq821NcuX8QCXKWkWp+W2lMYsInkX198u3
         zekGPK0p1cT8D+HD2hGeyixMxe8+oMdGHtKqJ6vB9nx+vqeCLK9H8G/EAVhWtxNdDIUt
         6dVoNN4zH/2dy7Bwo3PQhYF3wRaSob0/KPzCZfcYm0kmxr327MZyA8y2lobiSY5Gqw/Z
         VVDfMwptHSBVDSkD9XzcseFkxNGSJ7QsjUzNo1km4/Dj6OqQ115kiT0VIBtB0RYWxSpP
         hVfA==
X-Forwarded-Encrypted: i=1; AKwUvByIzqmev9unq2KGQGvAlMzfLQz+TkOwOB0aaZuECcpnNrJe0A6/rLXu2g6JNqGR15MXZrqXDaPbmok8demf9UP6@lists.infradead.org
X-Gm-Message-State: AFq9FYLNQs2EFDAvMCb4TWUQqmcs5D3WjUPgD018kIkQjz1QZaZUk1gp
	JxqyLVuQZfSAM3KVNqWJps7JzBJiJ9Gj2qecAwINZpdeLVUOP0tWH6mG/jbd/qZEOBjwnOXGZID
	wLo0e8h3/KZ4ke2wcH4B92LNHBw==
X-Received: from ilei7-n2.prod.google.com ([2002:a05:6e02:61c7:20b0:516:a6c6:8fa3])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1694:b0:53a:8c5:d7d7 with SMTP id 5614622812f47-55c003426cbmr6749991b6e.58.1793124370805;
 Tue, 27 Oct 2026 11:06:10 -0700 (PDT)
Date: Tue, 27 Oct 2026 18:06:09 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027180610.2840837-1-coltonlewis@google.com>
Subject: [PATCH v2] irqchip/gic-v4: Use a separate lockdep class for vPE
 doorbell IRQs
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Oliver Upton <oupton@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_110613_236332_4E8E6150 
X-CRM114-Status: GOOD (  12.13  )
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
under desc->lock. However, under forced IRQ threading (threadirqs or
CONFIG_PREEMPT_RT), request_irq() creates an IRQ thread for the doorbell
handler, causing irq_set_affinity() -> irq_set_thread_affinity() in
vgic_v4_load() to call wake_up_process() under desc->lock and establish
a real desc->lock --> &p->pi_lock --> &rq->__lock dependency on the vPE
doorbell IRQ itself.

Mark vPE doorbell IRQs with irq_set_nothread() so they are never
force-threaded, and assign them a dedicated lockdep class in
its_alloc_vcpu_irqs() via irq_set_lockdep_class().

Fixes: 8e01d9a396e6 ("KVM: arm64: vgic-v4: Move the GICv4 residency flow to be driven by vcpu_load/put")
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---

Notes:
    Changes in v2:
    - Call irq_set_nothread() on vPE doorbell IRQs in
      its_alloc_vcpu_irqs() so forced IRQ threading cannot create a
      desc->lock -> rq->__lock inversion via irq_set_thread_affinity()
      (Sashiko, Marc Zyngier).
    - Link to v1: https://lore.kernel.org/r/20261023215207.1465369-1-coltonlewis@google.com
    
    An LLM-based coding assistant was used to help analyze the lockdep
    report and draft this patch. I reviewed the analysis and the change.
    
    Tested v2 with threadirqs and CONFIG_PROVE_LOCKING=y on a GICv4.1 host
    with an idpf NIC: confirmed vPE doorbell IRQs remain non-threaded while
    normal IRQs are threaded, and co-pinned vgic_lpi_stress runs after
    bouncing an idpf interface pass with no lockdep warnings. Also
    compile-tested for arm64 against v7.3.

 drivers/irqchip/irq-gic-v4.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v4.c b/drivers/irqchip/irq-gic-v4.c
index 8455b4a5fbb0d..e1e20aeb8fe2a 100644
--- a/drivers/irqchip/irq-gic-v4.c
+++ b/drivers/irqchip/irq-gic-v4.c
@@ -157,6 +157,8 @@ static int its_alloc_vcpu_sgis(struct its_vpe *vpe, int idx)
 
 int its_alloc_vcpu_irqs(struct its_vm *vm)
 {
+	static struct lock_class_key vpe_irq_lock_class;
+	static struct lock_class_key vpe_irq_request_class;
 	int vpe_base_irq, i;
 
 	vm->fwnode = irq_domain_alloc_named_id_fwnode("GICv4-vpe",
@@ -183,6 +185,9 @@ int its_alloc_vcpu_irqs(struct its_vm *vm)
 	for (i = 0; i < vm->nr_vpes; i++) {
 		int ret;
 		vm->vpes[i]->irq = vpe_base_irq + i;
+		irq_set_lockdep_class(vm->vpes[i]->irq, &vpe_irq_lock_class,
+				      &vpe_irq_request_class);
+		irq_set_nothread(vm->vpes[i]->irq);
 		ret = its_alloc_vcpu_sgis(vm->vpes[i], i);
 		if (ret)
 			goto err;
-- 
2.56.0.307.g5fe7bd680c-goog


