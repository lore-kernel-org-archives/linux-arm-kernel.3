Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5379DD7833A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKMpB5r/I5KY+jaN0RFmA4IHj/JXTsxbFfUyDVXDBn0=; b=jgP33NCAoQSUpulq/v0sGZXJNW
	k6jomY0RU2YmjjIEgOeJ1ulUkP5GaLIt2C5De29ofUcUywmwoyu60VjI95iYUazA/fBUnc9BB1A9v
	wCRTbTUM+Jy9oNI20C0bqfXOwIYE6inJIvKZxj2iFiVfVod47h19P/jaoxCJrod98uYov7s0PqMwW
	KA1dEfcpGpLf12JysCgW2KqfxJ06UmAloCcMypLvxZ4OXpX/zwNvU9POpTOUxg7C/JJi4zbOSeFFC
	uHmCI/p6MRIkoic2vfCgNffqwgWl6pH39+i3/FllPqDSMhk8R1VsvT3h85aaOP6lVf+GUMZhbNlZy
	I40CZtWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAIO-000000071dy-2CMs;
	Mon, 02 Dec 2024 17:33:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7v-0000000700e-3Dt7
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fKMpB5r/I5KY+jaN0RFmA4IHj/JXTsxbFfUyDVXDBn0=; b=fipjQWPJFCjvvBjzby/HFuULdn
	4IXpshLG7zNOUcJhXjNuEu5OyR7roPWD/BMnuIVRA1EaKILMOLLaIco8IXxT3oU8xEGeMitDxXYZP
	P7bmb6sENJwBOCT39SkormNpkfZeADoPAYYHPQxonGLkGTEP5xKrQjU+vkfMzntZV3M++mzMwYVI0
	HxpVAlvJ+LXlSCLK4kBste42Ctm0AiOMIZOYNIyq36fll7MewAY8Q9v3iy6tKLZkvWSiq9hP/eey5
	r3QMe8biTCXnFCsT7PXCV5HpHmKwIb2wDsVc8xqjoO0FZVzcU9RjqWyRwwfEJTIirAJLXGB6e4Hxc
	iNbamyWg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7q-00000002D6w-3q64
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:22:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D8215C57B4;
	Mon,  2 Dec 2024 17:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CF8C4CED1;
	Mon,  2 Dec 2024 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160139;
	bh=d0OVGALV9EL3RmlbVg9qcHbPiwRgVMx9tdZ7QRWENWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MqcITScSTDZNbauRSj6PsBCkUBmgF39q2HVjegYcl5mEoRfVD/JGlhsbBcL+uAUyC
	 1Jt3A30Bxy9lcNT9Y52K5UrdT0AYDljZAKyZ6xjo4nt8PC4eCx7PE4Edn/oe1AQP29
	 YPT4Ln8bK91MjC8STyjzRKm55z3qK1Vm8UPTZIzW/pLVd3Ctj/PE3S6R9UUKyQeTC1
	 jIe3sWr4i/DVDD7h34u639ZL60tJyAPuqbX1Abdq0ODLFZd4KGFb2Mm/INaHiVK+II
	 Pg7mIrlhobXLcA/N0bWx/QRSG3PgUy5bydHn23fT+stWBUdl1YJnWBDSHbsgWvy6Rg
	 r9NreX7ehmGJA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIA7l-00HQcf-Hn;
	Mon, 02 Dec 2024 17:22:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [PATCH 09/11] KVM: arm64: nv: Propagate CNTHCTL_EL2.EL1NV{P,V}CT bits
Date: Mon,  2 Dec 2024 17:21:32 +0000
Message-Id: <20241202172134.384923-10-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202172134.384923-1-maz@kernel.org>
References: <20241202172134.384923-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_172223_164933_6E7B69A9 
X-CRM114-Status: GOOD (  11.85  )
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

Allow a guest hypervisor to trap accesses to CNT{P,V}CT_EL02 by
propagating these trap bits to the host trap configuration.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 2c4499dd63732..f4607c4f68d2e 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -822,6 +822,10 @@ static void timer_set_traps(struct kvm_vcpu *vcpu, struct timer_map *map)
 	 * Apply the enable bits that the guest hypervisor has requested for
 	 * its own guest. We can only add traps that wouldn't have been set
 	 * above.
+	 * Implementation choices: we do not support NV when E2H=0 in the
+	 * guest, and we don't support configuration where E2H is writable
+	 * by the guest (either FEAT_VHE or FEAT_E2H0 is implemented, but
+	 * not both). This simplifies the handling of the EL1NV* bits.
 	 */
 	if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) {
 		u64 val = __vcpu_sys_reg(vcpu, CNTHCTL_EL2);
@@ -832,6 +836,9 @@ static void timer_set_traps(struct kvm_vcpu *vcpu, struct timer_map *map)
 
 		tpt |= !(val & (CNTHCTL_EL1PCEN << 10));
 		tpc |= !(val & (CNTHCTL_EL1PCTEN << 10));
+
+		tpt02 |= (val & CNTHCTL_EL1NVPCT);
+		tvt02 |= (val & CNTHCTL_EL1NVVCT);
 	}
 
 	/*
-- 
2.39.2


