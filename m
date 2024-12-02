Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231BDD78337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3z9au4WjpOsyRMcIBy3pgl0K9OzmibQs+ZPSP2pdgY8=; b=vigDmRQR9rqFZWo54ozZHLy1eQ
	kTDnnq0EAS2bpL7S/YD+2bX3FS8gNy2xl7jVIyfCOBZjucJ+kkhpA4WGcsotXLSBy1fiBqXMv6TNf
	ZiPVigiY0cdVJTFqgCB7nL0DoeO0R09My63TmDOB2klSaMsf8/FQ/UGHIFOdRIU/dLqdVhI9SFy51
	SiLz+ntsqzJUthcHZGzkgrGgCypIEy2Hc2TERmWDPjVLhWGitJD+rBASQV1bnrl/XcOs35vI2nsfK
	Y5DN+Ktp0gnq7nGTsknLWKQFD9KyN1Q+GLkh/KTsZFsp1oFhOwicBPMLtLUVuggy4/88G7vawDF95
	YUCLbg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA9j-000000070GV-1t5s;
	Mon, 02 Dec 2024 17:24:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7s-00000006zyw-2dJ0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3z9au4WjpOsyRMcIBy3pgl0K9OzmibQs+ZPSP2pdgY8=; b=I2f1eFdVcGNK9CuPeNwwQUG9PH
	2gXgoLsBdEsv3Au2MelDyn1/vA/R6pdjZrEmR4nffjvnQyXfbqBvFdq/Nf9SAvb4bc72MD7ZKSj+s
	YkykubI4EbseQhq8AcHtUFeNFt2zC0chbIKJtACChneGdK7Xc6VCzCNqhaHKzdWCRZmJki3UzYkd8
	LdjN9XUDzGKUdsCxiq1BcXiFZi8uReOFHqICRkwoJVHw7S9+SaR0mDcuVr6W6wkdRyiCT27ztiKkA
	tMQYz0ter4H2OfTTTH3u3oHptzzHMyLMK0D2DDSexCM6e4YpuLrK1g0orYUyvb8Y8urwdH25llHgl
	pep+HZAQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7p-00000002D6r-2mV8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:22:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E65DA41037;
	Mon,  2 Dec 2024 17:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C3AC4CEDD;
	Mon,  2 Dec 2024 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160138;
	bh=IIrtI7EOvJLa54PAnEtwLydgd3SRuxhX3ocldVjdaE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c2iBSwDIdRq02VTsVhiBzvFgP8aaWXi5YstePFY2Zdi67SIAJbmAv0RE8SRFnbSls
	 homdfVhG0zJpfAqwtDIxmCuXNrP2W3raEtpqSDcuEDjVcIyQY8/GpaEPJYDf1hS80O
	 CT6qTAfoInxEDmFgOGcWqUHafYWJSH2kko59GIqHSTjuh1/IeE5NUmMQSZGPLg5ey0
	 CprPFAiDJvUg+pq7X7rc32XM96EwZjlnKPrqQjvVysv8mUk+OImgO+gbB3kbxn7y6P
	 IQCHFyRkgfg0gzd7tN+K+CJsZ7dBLOMpvVb04GhY3sT7ZLJJL1keuvc3qwKdrhK+8s
	 C3ravH5jK4PEQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIA7k-00HQcf-BN;
	Mon, 02 Dec 2024 17:22:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Chase Conklin <chase.conklin@arm.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH 03/11] KVM: arm64: nv: Publish emulated timer interrupt state in the in-memory state
Date: Mon,  2 Dec 2024 17:21:26 +0000
Message-Id: <20241202172134.384923-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202172134.384923-1-maz@kernel.org>
References: <20241202172134.384923-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com, chase.conklin@arm.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_172222_046937_1F1B4A18 
X-CRM114-Status: GOOD (  12.02  )
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

With FEAT_NV2, the EL0 timer state is entirely stored in memory,
meaning that the hypervisor can only provide a very poor emulation.

The only thing we can really do is to publish the interrupt state
in the guest view of CNT{P,V}_CTL_EL0, and defer everything else
to the next exit.

Only FEAT_ECV will allow us to fix it, at the cost of extra trapping.

Suggested-by: Chase Conklin <chase.conklin@arm.com>
Suggested-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 81afafd62059f..231040090697e 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -446,6 +446,25 @@ static void kvm_timer_update_irq(struct kvm_vcpu *vcpu, bool new_level,
 {
 	int ret;
 
+	/*
+	 * Paper over NV2 brokenness by publishing the interrupt status
+	 * bit. This still results in a poor quality of emulation (guest
+	 * writes will have no effect until the next exit).
+	 *
+	 * But hey, it's fast, right?
+	 */
+	if (is_hyp_ctxt(vcpu) &&
+	    (timer_ctx == vcpu_vtimer(vcpu) || timer_ctx == vcpu_ptimer(vcpu))) {
+		u32 ctl = timer_get_ctl(timer_ctx);
+
+		if (new_level)
+			ctl |= ARCH_TIMER_CTRL_IT_STAT;
+		else
+			ctl &= ~ARCH_TIMER_CTRL_IT_STAT;
+
+		timer_set_ctl(timer_ctx, ctl);
+	}
+
 	timer_ctx->irq.level = new_level;
 	trace_kvm_timer_update_irq(vcpu->vcpu_id, timer_irq(timer_ctx),
 				   timer_ctx->irq.level);
-- 
2.39.2


