Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E545CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DxKhicoquanRcHmBFTA0cKSjkW5cU988lyFYAH+YfGE=; b=lIZqUg79ZpMTa60lGz1xcDxyzF
	5sue3FklyGqy1TMiiNHokz9GmvgpMpgANjpbWdP7h5OgMbr6PaffdR2exkDEREaYWI97w1xTO25Ud
	O4pDos97iGPctFUQqIFojFs/kEbMCupcExW48XAjxrTMY9AJ1TCF0MCKtTNsASob3Ezy06Mslg4IY
	4so3vjTZ5WJxix0JVaGjkSaklbSMgILEAL+b+hvWoYnWy7QYT5B4Yb8nM+DI8qLVlZ448yaYMLvwp
	BoTgOfCr6LX666W0Md140cfZEPiyNhcZJdX9Vjrdp0CwIcyzmFurR2FSCaQXm496TF2HcxfDawC8b
	kXpRiohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVF9v-0000000HItN-3xnW;
	Thu, 04 Jun 2026 20:59:23 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVF9t-0000000HIsB-33CL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 20:59:22 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c0c3184c71so9220715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 13:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780606761; x=1781211561; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DxKhicoquanRcHmBFTA0cKSjkW5cU988lyFYAH+YfGE=;
        b=Lv3fRQzWcYkYELXAMPmTEPsdiYYvH4Dfwps9VRlCYOn54+BiEbntcDdQ7LmPP7fKuf
         Fopt9Ws97gL+C/eanhKvres1oDpOw4QhtWnBnujUzTPnIZQ/Cbt72Ma67shfyl55VbHR
         0ZJ7I+jQfxvsuMqZk4G1F3zp/7a47Z3CmpwM+9zDq9AKzOwkRo00G0yjNiVuy8LRG4xD
         06VowZWSnniGtnlBzvHqqM0soDuznUGjmzh6+ftyz1uVmaT8iOFQkBu0usdlTIzoWK9N
         vIhC7vStkkqjnsFR9Dwu4Qil0FTZeABXfZBfLevt6y6C/omEt8yUNpL2reo2ye3pN/T3
         BU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780606761; x=1781211561;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxKhicoquanRcHmBFTA0cKSjkW5cU988lyFYAH+YfGE=;
        b=E6FBBLLd6DphvtDOCD7BxrntII6XPHgjtQTMZq2ys3y2sscG009I8dNhFtiYpsn4Ox
         zjn+AP4FQbstrhcB3gjwzGIAU8yJ5H05h+MdFirxvxDf7kFUSM7jTBC6JZZb9zaRO0Sj
         37p8wCTd86YDdEx/3iaqMqggbTGJ3nK1hxmZqZmPEUObAHsBrBefkj3V2ytj8tTdpPsW
         vMx3de/xTTKsYlrGvhVNAmU/kbDA9rIPA1b21T2cqsTJGpJmyyfEJFxMph7Ng+kaSKoP
         fzpSLeI9h2kmuDYWO0/bOfi4vE59pr2/oYjIAyhNlUimPd/R59iIxOInXir91FhNzrDH
         JMsw==
X-Gm-Message-State: AOJu0Yw/mRMC74v+RpQyPdUY80JPJYAmqkSHiHBbFS3xR4fY910NNUOG
	yDVcjQrbCxLwkVmztrghhac19jMZ6mxTxA+zQ3ust6wdkddN1WPxSDq0
X-Gm-Gg: Acq92OGPi4I9nzPcQyr5FX/qowfesoxEEOOOBFsDDC937f6Kdc0CorSvgC7ey8aa/bW
	HrhA7+c3l5c6KUJEyk8Xmqx4R0Cl/z1ojSy3RekRbSgGYAqM5BjAIszEXNoXhOaM3ERA4Ry6mLT
	i5soMaufHZDT6htEiqrxBViNGHmHfLwqf87e0azM+qZOQS1vjN5yVPf1tPvJdGizZunlB5W1OoJ
	dibp74OWXu2SMY26il4hcl+vQuWwkOhC13OdlzVikC2XtncwCFvFY/dAIQNyFNIyT744cEKbyMg
	FmNnUawgwosapICpzXzvFu8OIureyFvjerAx9BWZ5n5tAGCowO+i74QZ2EZb1vvCV5AIhF2iZkM
	QXQukTJgNlsonmBxoZ/rwE3Ib7uE8oEv77f6f0ZVXIGHeHtbpIKYKCvZYQwTHpPs3EpUfjMH1hY
	E1avtMBLKqllV6Lyfx9sLkhrf3dA/8jeqeYGoh7isYC/ZD8QQct7HwsA==
X-Received: by 2002:a17:902:fc47:b0:2c0:eee2:fc45 with SMTP id d9443c01a7336-2c1e7b2f6c7mr2868755ad.4.1780606760717;
        Thu, 04 Jun 2026 13:59:20 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e294sm67453635ad.6.2026.06.04.13.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:59:20 -0700 (PDT)
Date: Fri, 5 Jun 2026 05:59:15 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, Sascha.Bischoff@arm.com,
	jic23@kernel.org, timothy.hayes@arm.com, eric.auger@linaro.org,
	christoffer.dall@linaro.org, andre.przywara@arm.com
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: [PATCH] KVM: arm64: vgic: Check the interrupt is still ours before
 migrating it
Message-ID: <aiHnI1mu6SGQrgnz@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_135921_775227_8F802697 
X-CRM114-Status: GOOD (  16.20  )
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

vgic_prune_ap_list() drops both ap_list_lock and irq_lock while migrating
an interrupt to another vCPU. After reacquiring the locks it only checks
that the affinity is unchanged (target_vcpu == vgic_target_oracle(irq))
before moving the interrupt, which assumes that an interrupt whose affinity
is preserved is still queued on this vCPU's ap_list.

That assumption no longer holds if the interrupt is taken off the ap_list
while the locks are dropped. vgic_flush_pending_lpis() removes the
interrupt from the list and sets irq->vcpu to NULL, but leaves
enabled/pending/target_vcpu untouched. As the interrupt is still enabled
and pending, vgic_target_oracle() returns the same target_vcpu, so the
affinity check passes and list_del() is run a second time on an entry that
has already been removed.

Also check that the interrupt is still assigned to this vCPU
(irq->vcpu == vcpu) before moving it.

Fixes: 0919e84c0fc1 ("KVM: arm/arm64: vgic-new: Add IRQ sync/flush framework")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 arch/arm64/kvm/vgic/vgic.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 1e9fe8764584..18b280de9a29 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -818,15 +818,16 @@ static void vgic_prune_ap_list(struct kvm_vcpu *vcpu)
 		raw_spin_lock(&irq->irq_lock);
 
 		/*
-		 * If the affinity has been preserved, move the
-		 * interrupt around. Otherwise, it means things have
-		 * changed while the interrupt was unlocked, and we
-		 * need to replay this.
+		 * If the interrupt is still ours and its affinity has
+		 * been preserved, move it around. Otherwise, it means
+		 * things have changed while the interrupt was unlocked
+		 * (it may even have been taken off the list with its
+		 * affinity left untouched), and we need to replay this.
 		 *
 		 * In all cases, we cannot trust the list not to have
 		 * changed, so we restart from the beginning.
 		 */
-		if (target_vcpu == vgic_target_oracle(irq)) {
+		if (irq->vcpu == vcpu && target_vcpu == vgic_target_oracle(irq)) {
 			struct vgic_cpu *new_cpu = &target_vcpu->arch.vgic_cpu;
 
 			list_del(&irq->ap_list);
-- 
2.43.0


