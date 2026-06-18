Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACD9CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hXhmL5CRl3+n80jeER5neBIkpa8f6Enzrvf/cmu79ZA=; b=WftKbGE/Iit3pXbVa4upMkZ85y
	cBX82yd8SyKuULkq6LevH33PH2Cq4bQ2rfu6TD1LZhQ8Kb/huZN4r7/WSqqtKtB8PcDV+i8IW1poi
	F3hj7OZ9xNf9a9jzsUd3WSi9OkiissfjzGenirySZb7M2LNWC38D9BUJRETn9OrdpMajC+Z3a/p7v
	psbnA6zCoiz9qaSeQt8Oa7rpUbOzIM3lXlJlv0+nMI09YhEyEl13wzrBmX/4y0T9t2dU+0+Px5gSR
	CD57gWDna7sDkiEfJapKCYxMTHL6VVNtvpq3gBZwVwLV6qWmKywKrNZs7Zl+hwxH6t5yekYjeHGFT
	/HYnaxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBfu-00000001Eyz-0AvC;
	Thu, 18 Jun 2026 12:16:50 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBfr-00000001EyI-3j6T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 12:16:49 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-461e0dad8easo592262f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781785005; x=1782389805; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hXhmL5CRl3+n80jeER5neBIkpa8f6Enzrvf/cmu79ZA=;
        b=NXLnHRMS+WCGfYF6CM+lbhg1H/hHUhaAFkr4aqSFO6pX+YXAzRqjJHmo93NtrBqlcu
         XZwHN8KVb5VSrJjCMpJdSPRPeMljfB7m5x5TDJVr8bnukZxFXkE28nk6TmRpIuCbWcDH
         DPi/yEKqOqN6N/EBcH8Mw6wsfFT9FBpwc510lyLre0wl//1lBBUYirwFoVuffnACDDfJ
         UT5XgNaJFoXyHfY3322WoStytStgsZGa04hz/hjxqchGb5T7hQ0pa3FTP8IpGhhm0mvN
         Q9RcL08BSZ2oVvIY4v+iABFJnLAfB4YUpK2g2/mnV3+j2wKkRbH1l5I9nZ2N6YezqgJJ
         FRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785005; x=1782389805;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hXhmL5CRl3+n80jeER5neBIkpa8f6Enzrvf/cmu79ZA=;
        b=JS27Au1bbV/zrbbwOIWhK2WJbNlCf5rYa/Hc688TN5612Kebbv31C4T7JVElHcJ9TU
         jMCMBN9a8K9pVGqwIOqVqflpEDofXhAqof+DT7kkTbAeOYENcmyiuNBbZBzEFF7zyJQY
         NfjuFEbcM+1sATHE0MvOSAW8t9L/iolfy7wj5ptswntMnXjvWZ8JOrnVpEJ7jkn3I/bC
         rXP+4bRlpvIureLHPA3w5ksICCLQuUZhLSZBWF2IpGZR9/6XCntpUY+QHndwHgMuFDFP
         yCIvyuGtmZhH0EesPFsgRyUOzc0DwDnGQ18cK5DUGl1BNfghPTCrZiKGguTproTuxIs3
         uljw==
X-Forwarded-Encrypted: i=1; AFNElJ+XdmtJViNWJIq1HQNnC50Ms09H8JJNQhqY2oZNsmVCxMMEC1trb9cgSv71GsFBYZoywFqELPtQ/Q17/zJBr8KP@lists.infradead.org
X-Gm-Message-State: AOJu0YwhTrEUXkpkXlhEsqjh/62YSJ/JDg8emGYM3Hpz3tG18Ulmr64l
	Y2AtKQuOlS/XU4Rz/KsUViWWblybHPuxhXaEBMd/rdWv+zZBunPl50or4zF98cXz+blhaiG/aU7
	xgQ==
X-Received: from wrmd14.prod.google.com ([2002:adf:e88e:0:b0:44b:7bd5:1b9f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5449:0:b0:45e:de0a:1773
 with SMTP id ffacd0b85a97d-462412c71e6mr10667158f8f.33.1781785004608; Thu, 18
 Jun 2026 05:16:44 -0700 (PDT)
Date: Thu, 18 Jun 2026 13:16:36 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
Message-ID: <20260618121643.4105064-1-tabba@google.com>
Subject: [PATCH v2 0/7] KVM: arm64: Fix missing ESR_ELx.IL in syndrome injection
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_051647_969819_462F38B1 
X-CRM114-Status: GOOD (  13.96  )
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
path never set IL. Patch 2 makes the same fix to inject_undef64() in the
normal host path, where IL was derived from the triggering trap's
instruction length. No instruction that reaches undef injection has a
16-bit encoding, so patch 2 has no functional change today.
Patch 3 makes the matching fix to inject_abt64(). Unlike undef
injection, abort injection is reachable from a 16-bit T32 instruction (a
32-bit EL0 task under an AArch64 EL1 guest), so the old code there
injects an abort with IL=0.
Patch 4 fixes the FPAC syndrome constructed during nested ERET
emulation, which did not set IL.
Patches 5-6 fix SError injection in the emulated and nested paths,
neither of which set IL.
Patch 7 fixes a fake ESR used to exit to the host. The host does not
read IL there, so it is not guest-visible.

Changes since v1 [2]:
- Patch 4: keep IL by masking it through from the trapped ERET's ESR
  instead of OR-ing the bit in. The ERET trap (EC=0x1A) always reports
  IL=1, so this preserves the source syndrome rather than adding the
  bit unconditionally (Marc).
- Rebased on v7.1.

Cheers,
/fuad

[1] https://lore.kernel.org/all/87pl1t8q24.wl-maz@kernel.org/
[2] https://lore.kernel.org/all/20260614163336.3490925-1-tabba@google.com/

Signed-off-by: Fuad Tabba <tabba@google.com>

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
2.54.0.1189.g8c84645362-goog


