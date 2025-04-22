Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1447C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 07:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=TTLML28jio6Vq1oVBF7SOxvire6Ltn2Qh5e/hzVTpgQ=; b=i/iXf21najbBuSUZ5oFbwfrmFH
	O0CX+2+LD8QkA7SyeIeqU9C/vK1rsQnilXCqY/g18ZFgDzRfZmapNAC5qI85IsIh+8lLDW3KJgfa7
	CjHDQCyy4cRAn16sE1d7rh+2LC4YGxbUq93dBYtZhLW0+kCQbJ4fxXd+VD7o9Kv6DjW1sGGgV8PwJ
	9eippF8u/U5fxVbLDCHUpnugWYgSP8s8NwR97EIvjehW9fyQSHPMaW0eKR0GBFjtQFYHmDQo4HTYo
	bWgs2wfoA8k4xd1QZAkwub2JuFFPzpeJtiqzeJBffQ4+49BmVpoSFZ6HHFrGBq0ykXMw0TT/mfLva
	uQv4Q2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77qv-000000065US-32ls;
	Tue, 22 Apr 2025 07:15:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77Nq-000000061Qk-299m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 06:45:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC9B54A06E;
	Tue, 22 Apr 2025 06:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0058C4CEED;
	Tue, 22 Apr 2025 06:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745304329;
	bh=02QtzYPWFeVBmAGUMJWoYi8804fbxQ7VMqW3UOJbvFQ=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=de1IeRqnUVbv5QgyG9E9I/HaV9QJ11W5Z3Lz/gXo4R/tfRMAq4pqj2H88kmQatfOp
	 7pih7TnKXou/BSmnBRdEmE1cTbh2z67GCh4ii4GLh1UJYYr3smuNAN9wb6ISVChE/4
	 n5/5P5dClcwi/Gc2dbF8oY3px+n6B+HiS5ng6rF0=
Subject: Patch "KVM: arm64: Always start with clearing SVE flag on load" has been added to the 5.15-stable tree
To: broonie@kernel.org,catalin.marinas@arm.com,gregkh@linuxfoundation.org,james.morse@arm.com,kvmarm@lists.cs.columbia.edu,linux-arm-kernel@lists.infradead.org,maz@kernel.org,oleg@redhat.com,oliver.upton@linux.dev,suzuki.poulose@arm.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 22 Apr 2025 08:45:13 +0200
In-Reply-To: <20250408-stable-sve-5-15-v3-2-ca9a6b850f55@kernel.org>
Message-ID: <2025042213-splendor-footwear-bdd4@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_234530_596710_B4E88B74 
X-CRM114-Status: GOOD (  15.72  )
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


This is a note to let you know that I've just added the patch titled

    KVM: arm64: Always start with clearing SVE flag on load

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kvm-arm64-always-start-with-clearing-sve-flag-on-load.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-131827-greg=kroah.com@vger.kernel.org Tue Apr  8 20:23:41 2025
From: Mark Brown <broonie@kernel.org>
Date: Tue, 08 Apr 2025 19:09:57 +0100
Subject: KVM: arm64: Always start with clearing SVE flag on load
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,  Suzuki K Poulose <suzuki.poulose@arm.com>,  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,  Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,  linux-kernel@vger.kernel.org, stable@vger.kernel.org,  Mark Brown <broonie@kernel.org>
Message-ID: <20250408-stable-sve-5-15-v3-2-ca9a6b850f55@kernel.org>

From: Marc Zyngier <maz@kernel.org>

[ Upstream commit d52d165d67c5aa26c8c89909003c94a66492d23d ]

On each vcpu load, we set the KVM_ARM64_HOST_SVE_ENABLED
flag if SVE is enabled for EL0 on the host. This is used to restore
the correct state on vpcu put.

However, it appears that nothing ever clears this flag. Once
set, it will stick until the vcpu is destroyed, which has the
potential to spuriously enable SVE for userspace.

We probably never saw the issue because no VMM uses SVE, but
that's still pretty bad. Unconditionally clearing the flag
on vcpu load addresses the issue.

Fixes: 8383741ab2e7 ("KVM: arm64: Get rid of host SVE tracking/saving")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
Reviewed-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220528113829.1043361-2-maz@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/kvm/fpsimd.c |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -75,6 +75,7 @@ void kvm_arch_vcpu_load_fp(struct kvm_vc
 	vcpu->arch.flags &= ~KVM_ARM64_FP_ENABLED;
 	vcpu->arch.flags |= KVM_ARM64_FP_HOST;
 
+	vcpu->arch.flags &= ~KVM_ARM64_HOST_SVE_ENABLED;
 	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
 		vcpu->arch.flags |= KVM_ARM64_HOST_SVE_ENABLED;
 }


Patches currently in stable-queue which might be from broonie@kernel.org are

queue-5.15/kvm-arm64-remove-host-fpsimd-saving-for-non-protected-kvm.patch
queue-5.15/spi-cadence-qspi-fix-probe-on-am62a-lp-sk.patch
queue-5.15/asoc-qdsp6-q6asm-dai-fix-q6asm_dai_compr_set_params-error-path.patch
queue-5.15/kvm-arm64-eagerly-switch-zcr_el-1-2.patch
queue-5.15/kvm-arm64-unconditionally-save-flush-host-fpsimd-sve-sme-state.patch
queue-5.15/kvm-arm64-always-start-with-clearing-sve-flag-on-load.patch
queue-5.15/asoc-codecs-lpass-wsa-macro-fix-vi-feedback-rate.patch
queue-5.15/arm64-fpsimd-track-the-saved-fpsimd-state-type-separately-to-tif_sve.patch
queue-5.15/kvm-arm64-get-rid-of-host-sve-tracking-saving.patch
queue-5.15/kvm-arm64-remove-vhe-host-restore-of-cpacr_el1.zen.patch
queue-5.15/asoc-fsl_audmix-register-card-device-depends-on-dais.patch
queue-5.15/arm64-fpsimd-have-kvm-explicitly-say-which-fp-registers-to-save.patch
queue-5.15/kvm-arm64-discard-any-sve-state-when-entering-kvm-guests.patch
queue-5.15/arm64-fpsimd-stop-using-tif_sve-to-manage-register-saving-in-kvm.patch
queue-5.15/asoc-codecs-lpass-wsa-macro-fix-logic-of-enabling-vi-channels.patch
queue-5.15/kvm-arm64-calculate-cptr_el2-traps-on-activating-traps.patch

