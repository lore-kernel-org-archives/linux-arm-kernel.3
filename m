Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79017E7DEF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DpiJoHpkSUIEeyEcInw4W8Eny3OZ/gdfqU/Eqv54B88=; b=emoZo3exxQLY5w2yup8hnsUKgs
	+qKenxvlt8FpZErGOCLnL76r0h7cJgz/N2fNKcy66p3oDib7InkorySxD6n4GIGpdN00G8sw97ulJ
	TWTLRx6wchCo5f/6Y/SI3AmSy143QQMer77EvPP48nVvfCdmfMPpDyMQhknfv04fTXcxRDmCMsqO3
	qDSYK5PYfVPLB+g253qwFhWh4mty4F6XPRxj9MLJTSsEDuGLghwa61lqdHFD0mrV6kqaF/80bXQzX
	xb/jxTVJMqfhH+cN9ktSFvTaxBMr1kgn33VPhA4j84N0vx1BY9m/rkiKDHoBzg+nKVjKcn7L2/J8u
	3EwSYu2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvlj-00000005BLW-3cPp;
	Mon, 02 Feb 2026 15:23:15 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvli-00000005BKy-00d3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 15:23:15 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-480717a8e05so45621835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 07:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770045791; x=1770650591; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DpiJoHpkSUIEeyEcInw4W8Eny3OZ/gdfqU/Eqv54B88=;
        b=13c1t79Yjki2M6R7VKMLVfKeZaVXwLelRLwzmnbwb5RYGujaSTCb8mwcFZqMlNkVlP
         fsKdL1rUimpTk5b2aSI+eEQlqsDWGF3NjlFsKZygjPdZ/XEpE7W5pX75UKzFkeHxXblb
         J0WL2kp7ps7EpffMuAhaqrCFZxzWZj/8FD6IQkVcD4JCgy8MEgkA/V2QBVUzFWJYREyZ
         t6iDtYER8xupizGrLLv1kRyWmkTvss+qJAGhFPT8WYENxsCPZCZ/12NEzVv/it/7AJ4H
         QhZPUVjWVB0AJHJOHDQM4Ag7F0L8V+0D9w5EktOxcAeyDcXoOJQTaDf633fKBHYO/U92
         pcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045791; x=1770650591;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DpiJoHpkSUIEeyEcInw4W8Eny3OZ/gdfqU/Eqv54B88=;
        b=A7UUCZdR6nvKQwbDKZVIDrjLw1gxpVZ6lPlV981fIMbvVBLILU+1s0V84HtVjNzBM9
         9NEtqPJXT9ZS9zhpTVMBxHyryJiV76s6yg/GQZueAptdd5wAaaq7HChH4O+tkVnBBaqR
         zsW6WAa3XXE0fw4fX6c/ktmmY9JFgLjxh5WmohyYxZq9u+1e5khUKnPH7D22cG1/Ns2U
         nF56sfFJVYqeoB8wye7KWRrMd7mdLuDwX8aaBFp0JBecubevJS9PO2jYzlPHTe38ir4Z
         mGq9RfrH7tvJVw1O0GJOmLfvB/GdmXAx1tvZjtHg9su0RRpUltnMivJmdxijEQWz5stl
         Q0iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVNNoR2oYY1CY5w64oQZVSCqlw3rYigLlUhUV9hUVJwpNO5DfANcSDzSaTr420UPpAaPvkOlYcGr6a9f77engl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx06MwWFk8EREIk6LQv4CCBXNutnpH/cmu22GLZw8hu0lHUfNnD
	A4Q1L0zjfs2DIWz0XRwNYCC0gSfSA+PPeHz/H443YHKc+pm7Efk+694FJVqYDzdlEY9Xld8DN2y
	xYg==
X-Received: from wmop16.prod.google.com ([2002:a05:600c:4690:b0:480:4be7:3f3a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f8a:b0:477:76c2:49c9
 with SMTP id 5b1f17b1804b1-482db4568dbmr166795515e9.2.1770045790988; Mon, 02
 Feb 2026 07:23:10 -0800 (PST)
Date: Mon,  2 Feb 2026 15:22:53 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260202152310.113467-1-tabba@google.com>
Subject: [PATCH v1] KVM: arm64: nv: Avoid NV stage-2 code when NV is not supported
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_072314_134037_1FAC786E 
X-CRM114-Status: GOOD (  13.64  )
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

The NV stage-2 manipulation functions kvm_nested_s2_unmap(),
kvm_nested_s2_wp(), and others, are being called for any stage-2
manipulation regardless of whether nested virtualization is supported or
enabled for the VM.

For protected KVM (pKVM), `struct kvm_pgtable` uses the
`pkvm_mappings` member of the union. This member aliases `ia_bits`,
which is used by the non-protected NV code paths. Attempting to
read `pgt->ia_bits` in these functions results in treating
protected mapping pointers or state values as bit-shift amounts.
This triggers a UBSAN shift-out-of-bounds error:

    UBSAN: shift-out-of-bounds in arch/arm64/kvm/nested.c:1127:34
    shift exponent 174565952 is too large for 64-bit type 'unsigned long'
    Call trace:
     __ubsan_handle_shift_out_of_bounds+0x28c/0x2c0
     kvm_nested_s2_unmap+0x228/0x248
     kvm_arch_flush_shadow_memslot+0x98/0xc0
     kvm_set_memslot+0x248/0xce0

Since pKVM and NV are mutually exclusive, prevent entry into these
NV handling functions if the VM has not allocated any nested MMUs
(i.e., `kvm->arch.nested_mmus_size` is 0).

Fixes: 7270cc9157f47 ("KVM: arm64: nv: Handle VNCR_EL2 invalidation from MMU notifiers")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
Based on Linux 6.19-rc8
---
 arch/arm64/kvm/nested.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index cdeeb8f09e72..d03e9b71bf6c 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1101,6 +1101,9 @@ void kvm_nested_s2_wp(struct kvm *kvm)
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
+	if (!kvm->arch.nested_mmus_size)
+		return;
+
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
 		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
 
@@ -1117,6 +1120,9 @@ void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
+	if (!kvm->arch.nested_mmus_size)
+		return;
+
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
 		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
 
@@ -1133,6 +1139,9 @@ void kvm_nested_s2_flush(struct kvm *kvm)
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
+	if (!kvm->arch.nested_mmus_size)
+		return;
+
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
 		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
 
@@ -1145,6 +1154,9 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
 	int i;
 
+	if (!kvm->arch.nested_mmus_size)
+		return;
+
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
 		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
 

base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
-- 
2.53.0.rc1.225.gd81095ad13-goog


