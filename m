Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E27606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 06:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kD4iXYtE;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KCHuiRV/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/mYu7fYt3Nnrov1PUQgYA1NNwSASs0rt/VgYt7AiFM=; b=kD4iXYtEpSeE/oehpQwpV59y79
	L5NTWogtT7YQYQ9UMq9o4bbAhuuOExDtK9P1B6jeR1sv/eusfI/Rk/7Gc9oc/RpKa2LZtSK8MHSKM
	mHnSjkXbux8PQaahc3KlK7XxhWW12ooiWhuunuO59B9lCqwFQ2OrtQQuNfR7d3JZlVEcFec8WK9+R
	emx+gz9WDM2lL2bNvZNkhSdBIXfxSQlYI2qk352VsjPI/Hr7+YbIlx5UQaFohwtPnF+/H2tzw35bk
	Ccs7vnNILwZD7+R9X4CdM/CY4CvWEn3o6M5hqRdOFgt5ICXqnqieEoNm91Mtbjn0WbrVMjk/qv0my
	+NrEdLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmZi-0000000DVLu-25mN;
	Thu, 22 Oct 2026 06:46:54 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmZa-0000000DVJg-296w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 06:46:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1100222f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 23:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651604; x=1793256404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/mYu7fYt3Nnrov1PUQgYA1NNwSASs0rt/VgYt7AiFM=;
        b=KCHuiRV/S6AUIa4bMQ5ViJwijqP0pPUP4loDJCi0zj8ni+d43/ennXzU+gLOvuajFZ
         ZAJSaIxA2180XLbLjD04vsjniQ8ImBCfCAve9MUgopmhx+do0KkUgnKuxxJGqhR437QW
         BLHzLMDTNVmAxMLTrtUPSud9eirxQeruEuzGSmGQ5/HXaqur8eQfIMK/Qw+u+TDjSzXk
         peGzKviy0Gjr7A9sYd5on+4OlasGjzf+EbQWJkmEHSi7FNoOs2xnPTdzFNaXYiAetZeK
         xel8woG1wmwpZQwJTHhlVgeHomX3cLSgrJeuuEwmnqe0aew3UFSjEz8AeDuStgrKjTJU
         JL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651604; x=1793256404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/mYu7fYt3Nnrov1PUQgYA1NNwSASs0rt/VgYt7AiFM=;
        b=bcw+KLrmvJSy6UqD2WilLogJyIaO4StGgmiCc3WaSkDzfWUnfLxyW2DXf7GzoWsUxS
         iN7LvWAp1KogK/8sAExK5jRHm9opP51rE6TY8HyAXmtzeabrUmTYCsOwjujT1qHukgtN
         9nN02i+Z16SptL5kpVj0FVYjsR3LcxYIHA5i+9/VIoSpExrjOVeoOW33HejlzxcqOLzq
         bMEJq7R07lm8dxXkeIni8fimN+F0m49a9tUV1+4dIOgbzEQEmLo4BCHsq5qKv0wcpQAV
         Ctr5pdnDbH/NAat/eHxdoHtpZ0S/kR23rIPeBrIw+ZRk80KDZZhXYzzgunziksElrzYj
         CfVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZqq9pgJ06gN9wzEdlLG+cCx2/ugCNeVwOXDhIeZ9isS4tu/et/3qMayH1qYI/gEKZ6/BXqCVOPIRZueI3Bvew@lists.infradead.org
X-Gm-Message-State: AFq9FYIT2Tei8InyE1Wqp8jxlR5drgmPafmO1/aQoXc2TCPI+MLxGZwA
	GZ8oA4ohnQUBW+n6gmBWTkx1o7vRF8eAXImnmOQdrCD0c0MO5nLIw4+v
X-Gm-Gg: AYBFou27OTVtBgtVB2qon0+RF9Kv8Fo4Db0/8JOvwqgeSsXFH7LrDJXbTvdNqs3nZx+
	ZPMeN9y6Gerz3NTIKYX3/lIrKmNsLQOWgVQp2mG7IMDkO1tD2x6YMaVVZcKcFaCU/if5QQ6gEsC
	ydIER6scG2C4fykQW0G0BpI5TuwRcxumZKX50M3+m1xZE6hgKuG9wqy3oZ1MkY3GY7h9blwMMEC
	pHHh6Q4o+pB1mM78URd+n/38l2AeHuPgY03z9zNUFlhNJIp67U9gpiylbYOvRUkJWX4tGUktWtV
	QxbCXpsuIQqOlnmBZ6dd7fO7JXTKzAsAAQs+4c+wPll/l2QxMkkY9dxMYPIA/TCI5Afa5XGo/HM
	w12VVNZcq5fiA91ShjgGnfIA/Dfg4JOUBmgHTBmMLiwpg0tKRvBbeisvRliZ9GbAvti1Q3sEecn
	+jecVVifpQmXxraACfv5b3wliqkDb22ZAplx5hQXoID84U5sk/QKbR8mjJo5/sahoorxMb8GqfP
	qkDqRnlHRMyKpL1ctvx61hoNgjp43uMF5GGEL8zrpmtbXaGQpGBV+r78agH/siikSuDNIdtaTdQ
	pncSfWujxgoKXUsWtCtfQyAXmwmBGNvh0XZY3EGe0CadKMutXoA6Od9TIxoveTFQK5fUF/yLDuA
	hKgizXI0iWDD+v/EnmICsZP7j4b4EGAjMJC28VgBldNqYGYn7NOFCDMWMB50sYg+f
X-Received: by 2002:a05:6000:1111:b0:48d:fed0:ccbd with SMTP id ffacd0b85a97d-48e264caa01mr6437578f8f.34.1792651604419;
        Wed, 21 Oct 2026 23:46:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm10215624f8f.22.2026.10.21.23.46.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 23:46:44 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] KVM: arm64: vgic-v3: Don't drop pending writes to active level IRQs
Date: Thu, 22 Oct 2026 08:46:27 +0200
Message-Id: <20261022064628.4206-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022064628.4206-1-kmehltretter@gmail.com>
References: <20261022064628.4206-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_234646_576544_F942FF21 
X-CRM114-Status: GOOD (  17.18  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GICv3 backend also loses a level interrupt set pending through
GICD_ISPENDR or GICR_ISPENDR0 while it is active. Its LR handling has
the same split between pending_latch and an Active-only LR as GICv2,
and clears the new pending state after deactivation.

Apply the GICv2 bookkeeping to vgic_v3_fold_lr(). Clear the old latch
when the LR reports that the interrupt has been acknowledged, and
preserve a latch which was not represented in the LR.

GICv3 permits an implementation to clear register-set pending state on
ack. Doing so matches the GICv2 backend and makes a later ISPENDR write
a distinct pending state.

Fixes: 67b5b673ad4d ("KVM: arm/arm64: vgic: Disallow Active+Pending for level interrupts")
Assisted-by: LLM
---
 arch/arm64/kvm/vgic/vgic-v3.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 726e20a1da6e7..8009dc6df00db 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -75,7 +75,7 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 {
 	struct vgic_irq *irq;
 	bool is_v2_sgi = false;
-	bool deactivated;
+	bool deactivated, was_active;
 	u32 intid;
 
 	if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3) {
@@ -93,7 +93,8 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 		/* Always preserve the active bit for !LPIs, note deactivation */
 		if (irq->intid >= VGIC_MIN_LPI)
 			val &= ~ICH_LR_ACTIVE_BIT;
-		deactivated = irq->active && !(val & ICH_LR_ACTIVE_BIT);
+		was_active = irq->active;
+		deactivated = was_active && !(val & ICH_LR_ACTIVE_BIT);
 		irq->active = !!(val & ICH_LR_ACTIVE_BIT);
 
 		/* Edge is the only case where we preserve the pending bit */
@@ -103,9 +104,15 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 
 		/*
 		 * Clear soft pending state when level irqs have been acked.
+		 * A latch written while the irq was active is a new pending
+		 * state. A write while the irq was in the LR may also have
+		 * followed the ack, so preserve it too.
 		 */
-		if (irq->config == VGIC_CONFIG_LEVEL && !(val & ICH_LR_STATE))
+		if (irq->config == VGIC_CONFIG_LEVEL &&
+		    !(val & ICH_LR_PENDING_BIT) &&
+		    !was_active && !irq->latch_written)
 			irq->pending_latch = false;
+		irq->latch_written = false;
 
 		if (is_v2_sgi) {
 			u8 cpuid = FIELD_GET(GICH_LR_PHYSID_CPUID, val);
-- 
2.39.5 (Apple Git-154)


