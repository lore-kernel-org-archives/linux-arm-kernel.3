Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDB7CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 16:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wF52xqv2gt97ZmYG5q8RS9QpeTQBkGWbTxMLhSV4/qM=; b=X+u2nA6+398yluM+PT7taP5JwK
	BT0QYpmZObh2pR6LPQy3pq9n35qjegxMrHN+Eazz67eY1D/sphqHo4uoSKekXFNLmX4G6IPxzmZGg
	53fhNv9GX31fFZn6X52Q+NUwSurNZgqS6WY4r25qY6m3N1XRNogGnV23vVPjK2CFLjArhCzSXqZk2
	796PB2worNi/hTVHhykecDDBz8plRqZw0n5xSWQEX7uvVJPTzvZebRtaPW/pp4sd2U+1R80oE2+qN
	Tay59W7DC06peQdI9f/4cvbHYx2HTF05eqepEeERVGd4HPB/+LBcASSubQ/AdY5uHkfxOvSaNCB9j
	cH83RD0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmJ-0000000DAiB-06Hj;
	Sun, 14 Jun 2026 16:33:43 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmG-0000000DAhJ-1o9I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 16:33:41 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-460153ce644so1756794f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 09:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781454818; x=1782059618; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wF52xqv2gt97ZmYG5q8RS9QpeTQBkGWbTxMLhSV4/qM=;
        b=ruqvUKyRnUXz4twSeDovXcy6avpgY+5vtxYQa2D1FHUSzjGs2UvuUnkmzXSbvn2pek
         +9FiAZ4ROuTEmrdrUv7ByBrJe93BpZzYuUp8NzH98HjGVJxAoyApeo+ADxB8pkuTOZkP
         p84/yKVxSK4YCJWdifqxsS5fd6usyac+qeWETI32kLF1zw1IwV91yTeabB1XmxuoAX8V
         6GKGZzPUHPVSgZF6ZUqrgmaZcM27iJ517eff0Ee/bwt5Uo4k3O2lZE9Q5i7PN85+86+x
         rRKQJZntbVTuw1ebS8aaJwQm/adMBngAgqcpKZxzJZwJ6wDbPbLJe/cSvNAZGm6oGEca
         /iqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781454818; x=1782059618;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wF52xqv2gt97ZmYG5q8RS9QpeTQBkGWbTxMLhSV4/qM=;
        b=AScty4hcsD27SD0oF0gXOLokR/gMnwK2UtH570ZPkINHdnT/qK0VXOfyaTxqsrZXIS
         tqqvyFVRfOqfxOoWdVO/X5ryCMvkX2ikWIQ6KMAU23ZoEhFlqH9zmJVfGGZadP8ric9B
         Mi8iZIYmrQpr4+T2Bs7belCymChBzma/CDuBBxSfZWPjJvlbqsic7qn3Xcl1xS4c+Ba8
         1B3md69UrVxJO4U2yBvSU/sKMZevKADMoAhA7MqL6l09J6uaR8Hs+77P5gOqeIr5fNy+
         8yeLZohSz7udn28mpMRJknezffTA7nm6DUIN7w4jly+g3PB7BmEDB8cxVWAL8oQGt3k4
         6FlA==
X-Forwarded-Encrypted: i=1; AFNElJ//I7ytE4SUY2B6PeLDamkgOt5rghWfBcM65KvXiWV2BIYjp2My717WnIyGQlpbAQXWLzjXq3fruSijQ7xv17bg@lists.infradead.org
X-Gm-Message-State: AOJu0YzN1c+NUGZFc1ik0AVuQc6JMOfOUHPmtlaExHjilLX3R6kCh3wH
	gdSqMMzXCpXEmE+rH9FEulhz+Z982h2oLWikNUhpqCToNj+K4yZ0cLiLrWtisSHyJjAZ4vV5a2X
	MKA==
X-Received: from wrnv4.prod.google.com ([2002:adf:ebc4:0:b0:43d:733a:c37e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:6f1c:0:b0:448:7049:a6c9
 with SMTP id ffacd0b85a97d-4606da5a49dmr14309136f8f.5.1781454817370; Sun, 14
 Jun 2026 09:33:37 -0700 (PDT)
Date: Sun, 14 Jun 2026 17:33:29 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260614163336.3490925-1-tabba@google.com>
Subject: [PATCH 0/7] KVM: arm64: Fix missing ESR_ELx.IL in syndrome injection
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_093340_519571_5D08B7E6 
X-CRM114-Status: GOOD (  12.03  )
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

Hi folks,

After sashiko caught the missing IL bug [1], I did an audit of all ESR
syndrome construction sites in KVM/arm64 as Marc suggested. This series
is the result of that audit.

The ARM architecture mandates ESR_ELx.IL=1 for several exception
classes regardless of instruction length: EC=Unknown, Instruction
Aborts, Data Aborts with ISV=0, and SError. For FPAC (EC=0x1C), IL
reflects instruction length, but FPAC can only be generated by A64
instructions, so IL must also be 1.

Patch 1 is the bug sashiko found: inject_undef64() in the pKVM hyp (EL2)
path never set IL.
Patch 2 makes the same fix to inject_undef64() in the normal host path,
where IL was derived from the triggering trap's instruction length. No
instruction that reaches undef injection has a 16-bit encoding, so patch
2 has no functional change today.
Patch 3 makes the matching fix to inject_abt64(). Unlike undef injection,
abort injection is reachable from a 16-bit T32 instruction (a 32-bit EL0
task under an AArch64 EL1 guest), so the old code there injects an abort
with IL=0.
Patch 4 fixes the FPAC syndrome constructed during nested ERET
emulation, which did not set IL.
Patches 5-6 fix SError injection in the emulated and nested paths,
neither of which set IL.
Patch 7 fixes a fake ESR used to exit to the host. The host does not
read IL there, so it is not guest-visible.

Based on Linux 7.1-rc7

Cheers,
/fuad

[1] https://lore.kernel.org/all/87pl1t8q24.wl-maz@kernel.org/

Fuad Tabba (7):
  KVM: arm64: Set ESR_ELx.IL for injected undefined exceptions at EL2
  KVM: arm64: Unconditionally set IL for injected undefined exceptions
  KVM: arm64: Unconditionally set IL for injected abort exceptions
  KVM: arm64: Set IL for injected FPAC exceptions during ERET emulation
  KVM: arm64: Set IL for emulated SError injection
  KVM: arm64: Set IL for nested SError injection
  KVM: arm64: Set IL in fake ESR for pKVM memory sharing exit

 arch/arm64/kvm/emulate-nested.c    |  4 ++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c     |  3 ++-
 arch/arm64/kvm/hyp/nvhe/sys_regs.c |  2 +-
 arch/arm64/kvm/inject_fault.c      | 18 +++++-------------
 4 files changed, 10 insertions(+), 17 deletions(-)

-- 
2.54.0.1136.gdb2ca164c4-goog


