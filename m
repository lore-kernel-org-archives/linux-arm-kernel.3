Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E18A606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IhGlU4U2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cCLrvZPy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OLhUG1hLaXa/kF9EnkdPlvaJj5GdsFAdoHncTvXoPzg=; b=IhGlU4U2FBsC3/
	lpzkEJXoNeHbGKAXEFi2W7Vt0vBVQ+U5ClNmeF+cSNLQ78wCMpqTSCGJ5WgTXw5egAjmwivJrVN48
	q4KZ9mh8BWAj+Pzv+OjsSWXA5riH2aBj7f0MqQD8B/N7xbtXS4Xc0yYD3C0oXh5cSkIOJyv79J3Jy
	jvunT6HKevFvPGAG99lMQZSGrFUX5NaHMsw76EmgDAP49mdiGOHJV38j1Xg+BnoSvfoooMrIlLHtM
	q9gbl8fF8Eemh6MZIVuMMi8t74ztYbl6Z3mA3GneGsG+svUa2yBWTS4Yo2XIsarYcKyciZWayiqWw
	6hShUUHWSSAO44nogfWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvnM-00000006Jf4-2qGE;
	Wed, 28 Oct 2026 05:01:53 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvnC-00000006JWI-1b3M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 05:01:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so1441235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 22:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793163692; x=1793768492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLhUG1hLaXa/kF9EnkdPlvaJj5GdsFAdoHncTvXoPzg=;
        b=cCLrvZPyVfbXP2xHckHfASYgGD7/iVSoujNHsDR/EokGBp7uN/rmr62ngQV5fx9pwU
         SYEY/22nNdZMzEFMArRVldHgj9JFKnoDiHL4RQcAaVCfyRpQ34jBkXv4vSMRkE31VdFj
         p7IkfRHEu5m7m39313fb/qXxMWCC5wTIZ/imbZYgx2UBYQF9aVpO0VgqNLNcRAxRaZCc
         ytLquKRAqxADZJ+Df/3OYq4Cra/gNhJNnt/7IkdPLC46DiCn/3FUgSO2AeO8gv0/+sya
         htwqTqGM7H8eeM1j1PyPf0YttvjTU/0bVzx8IgxGzMBuSzPZh5X/DrzB2xotn9ZOIQqI
         yeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163692; x=1793768492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLhUG1hLaXa/kF9EnkdPlvaJj5GdsFAdoHncTvXoPzg=;
        b=EBhqmLJ2hrKlDZ3FEu+sD9aT9zQQAsmbV7B8x0y2F5l1VlSu6OvPd9ntrxq3kJmHfd
         a7bSw+TbISWFajPUgkU0J+HRQXWmzlpw8yKAYFHcxAE1bVKBI/iGw4Q/3LkklY21bCUQ
         v4NLvCx/kj8GSLxUITX3JpaUDJs4qxjwgv5CWQjf2f+BPomnvf63u/IcbysEPPxPtaq1
         XK8qO4yJhIq3xN5EjjgHqZ0Rl5PVV2rTtCIpsFKrsk0y7I2HPyHMAJcPGERRQD/x5lWu
         nHA+3xwOSJa8MJLyfvz+e6gV5ectqfZpyS9lpJZ6c7R6OLv7TFqCeX1jWCEf9urM5UAd
         a8CA==
X-Forwarded-Encrypted: i=1; AKwUvBw0A/9E5JJAoNobXHHs50Qi8LhBlONA9kzjorEHNE0QFtv1OVMGU8gOwsfSpgPTVqDeJAB184x0L/RnwCXxGxOK@lists.infradead.org
X-Gm-Message-State: AFq9FYJXqnqARbuXSYlIiIyLbqKaNyV8O+K+P6lEjfLfH2w047lZ2lp7
	n6ROEAoXumu3gC0JcFrFzVjud0nl+K9cvNOODAvE0TBzaBAa6LrzRLac
X-Gm-Gg: AYBFou1n+P5T3r8mwE/gJuw0Ac8yXb0uvq+lE7ujeZzQL4KXAJvjAox9QTcM9c00pbL
	vUGqqqAsIPzaCUOVqt8gFV+saz4mFXpe+kNehSQimSNApvbu2iDoJS46KgeUBsTS0TKr1PSw3Dd
	tIzrTVkdtKWiHys8QL2mqSzBxua/Wou6FM1tmlRgLj+PJIgvoK9cHdwEoPYrA5njdp8A8KcQrhW
	mWN0QEMhSpdnLWb/rZ17GseoHSAxdPUdO679i77E+6Wm9fzp9xXSPM4WbcHZdft9PdvZR+cEidm
	0UB/QQRf8cOMzMUH15LCU5BdINXGV+5P20GYHoDO3vZCxovA1UpcJUZAJ3/8ktfabVo1hKOOtX5
	v2eeO5GMxU2WWbRjeV+eNSPRljh3OOOHLB84mxixZ2lMmNHO2b1gXst9DxPPcFd3O4QL9C6XgJ0
	qe4q2aZ3p/L7ZuPXbpyf48Hhp+jT1wH1gQyBlFba2rCYsqvQh0pl1F01T2o0ELwH3TSXBVAgQqB
	Khm/I3o31hHXtu023gZTIsAGBjfWsbPgbuFRsiKVnvtabxA6unPY5s9sktmOYQYq9yL4NJkESJ3
	vp3Z5kTQmA1LDTPb5y5ZpafB13ntMDMC2cNjm1WpfG8dxPySGe5ogjAjAP348xXkLECyodO7MkV
	TX6TVN01GCC82bFMkLuKKZESAvmB1cHMlBudHr3n4KkmF4aPN2An+Ou+Mt1iVH9pZG2XnJT9E4r
	iBAGiUfVtG1Zsl7GxayIuCufX3P78zAGwKqcprdg==
X-Received: by 2002:a05:600c:3e15:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4a9961f3d36mr12218315e9.6.1793163692052;
        Tue, 27 Oct 2026 22:01:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94eb8a60fsm13523365e9.3.2026.10.27.22.01.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 22:01:31 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] KVM: selftests: arm64: Test pending writes to active level IRQs
Date: Wed, 28 Oct 2026 06:01:13 +0100
Message-Id: <20261028050113.10046-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028050113.10046-1-kmehltretter@gmail.com>
References: <20261028050113.10046-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220143_372003_60F84AF7 
X-CRM114-Status: GOOD (  20.34  )
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

Add a two-vCPU GICv3 test for a level SPI set pending through
GICD_ISPENDR. Re-pend the interrupt while it is active, first from the
handling vCPU and then from the other vCPU. Require a second delivery
after deactivation in both cases.

Also check that the other vCPU observes the initial pending state
before the interrupt is acknowledged, and that a remote GICD_ISPENDR
write before the ack merges with the initial pending state without
causing a second delivery.

Without the VGIC fix, the pending state written while active is cleared
on deactivation and the test fails before the second delivery.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 140 +++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index 3cb85932ee85c..83091e0384c22 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -959,6 +959,145 @@ static void guest_code_timer_spi(struct test_args *args, int cpuid)
 	GUEST_DONE();
 }
 
+#define REPEND_READ		1
+#define REPEND_READ_DONE	2
+#define REPEND_WRITE		3
+#define REPEND_PRE_ACK		4
+#define REPEND_PRE_ACK_DONE	5
+
+/*
+ * A level-sensitive SPI that is set pending through GICD_ISPENDR stays
+ * pending for every vCPU until it is acked. If it is set pending again while
+ * it is active, it becomes active and pending and must be taken a second time
+ * once it has been deactivated. The second pending state comes from the vCPU
+ * that handles the interrupt in the first round, and from the other vCPU in
+ * the second. A remote GICD_ISPENDR write before the interrupt is acked merges
+ * with the initial pending state without causing a second delivery.
+ */
+static void guest_code_level_repend(struct test_args *args, int cpuid)
+{
+	int i;
+
+	gic_init(GIC_V3, 2);
+
+	gic_set_eoi_split(1);
+	gic_set_priority_mask(CPU_PRIO_MASK);
+
+	if (cpuid == 0) {
+		u32 intid;
+
+		local_irq_disable();
+
+		gic_irq_set_config(MIN_SPI, false);
+		gic_set_priority(MIN_SPI, IRQ_DEFAULT_PRIO);
+		gic_irq_enable(MIN_SPI);
+
+		for (i = 0; i < 2; i++) {
+			gic_irq_set_pending(MIN_SPI);
+
+			if (i == 1) {
+				/* Not acked yet: the other vCPU sees it pending */
+				WRITE_ONCE(args->shared_data, REPEND_READ);
+				dsb(ishst);
+
+				do {
+					dsb(ishld);
+				} while (READ_ONCE(args->shared_data) != REPEND_READ_DONE);
+			}
+
+			GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+			intid = wait_for_and_activate_irq();
+			GUEST_ASSERT_EQ(intid, MIN_SPI);
+
+			if (i == 0) {
+				gic_irq_set_pending(MIN_SPI);
+			} else {
+				WRITE_ONCE(args->shared_data, REPEND_WRITE);
+				dsb(ishst);
+
+				do {
+					dsb(ishld);
+				} while (READ_ONCE(args->shared_data) == REPEND_WRITE);
+			}
+
+			GUEST_ASSERT(gic_irq_get_active(MIN_SPI));
+			gic_set_eoi(intid);
+			gic_set_dir(intid);
+			isb();
+
+			/* The second pending state must not have been lost */
+			GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+			intid = wait_for_and_activate_irq();
+			GUEST_ASSERT_EQ(intid, MIN_SPI);
+
+			gic_set_eoi(intid);
+			gic_set_dir(intid);
+			isb();
+
+			GUEST_ASSERT(!gic_irq_get_active(MIN_SPI));
+			GUEST_ASSERT(!gic_irq_get_pending(MIN_SPI));
+			GUEST_ASSERT_EQ(gic_get_and_ack_irq(), IAR_SPURIOUS);
+		}
+
+		/*
+		 * A remote ISPENDR write before the interrupt is acked merges
+		 * with the initial pending state and must not cause a second
+		 * delivery after deactivation.
+		 */
+		gic_irq_set_pending(MIN_SPI);
+
+		WRITE_ONCE(args->shared_data, REPEND_PRE_ACK);
+		dsb(ishst);
+
+		do {
+			dsb(ishld);
+		} while (READ_ONCE(args->shared_data) != REPEND_PRE_ACK_DONE);
+
+		GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+		intid = wait_for_and_activate_irq();
+		GUEST_ASSERT_EQ(intid, MIN_SPI);
+
+		gic_set_eoi(intid);
+		gic_set_dir(intid);
+		isb();
+
+		GUEST_ASSERT(!gic_irq_get_active(MIN_SPI));
+		GUEST_ASSERT(!gic_irq_get_pending(MIN_SPI));
+		GUEST_ASSERT_EQ(gic_get_and_ack_irq(), IAR_SPURIOUS);
+	} else {
+		do {
+			dsb(ishld);
+		} while (READ_ONCE(args->shared_data) != REPEND_READ);
+
+		for (i = 0; i < 64; i++)
+			GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+
+		WRITE_ONCE(args->shared_data, REPEND_READ_DONE);
+		dsb(ishst);
+
+		do {
+			dsb(ishld);
+		} while (READ_ONCE(args->shared_data) != REPEND_WRITE);
+
+		gic_irq_set_pending(MIN_SPI);
+
+		WRITE_ONCE(args->shared_data, 0);
+		dsb(ishst);
+
+		do {
+			dsb(ishld);
+		} while (READ_ONCE(args->shared_data) != REPEND_PRE_ACK);
+
+		GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+		gic_irq_set_pending(MIN_SPI);
+
+		WRITE_ONCE(args->shared_data, REPEND_PRE_ACK_DONE);
+		dsb(ishst);
+	}
+
+	GUEST_DONE();
+}
+
 static void *test_vcpu_run(void *arg)
 {
 	struct kvm_vcpu *vcpu = arg;
@@ -1073,6 +1212,7 @@ int main(int argc, char **argv)
 		test_vgic_two_cpus(guest_code_asym_dir);
 		test_vgic_two_cpus(guest_code_group_en);
 		test_vgic_two_cpus(guest_code_timer_spi);
+		test_vgic_two_cpus(guest_code_level_repend);
 	} else {
 		test_vgic(nr_irqs, level_sensitive, eoi_split);
 	}
-- 
2.39.5 (Apple Git-154)


