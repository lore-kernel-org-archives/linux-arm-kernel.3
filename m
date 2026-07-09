Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73656C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 23:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7wbRxqeXe6OhAyO1MWhkHUo2TrAk/KOd+lAMmZEbmWc=; b=TSINAZLLZrM4QDwPHko8dzyBV1
	OYNDae9Qze03pUToOl5cdBwi4XWer5ctc1e3IAW0/7xruMKjGjagnlDCblCu8ynjP9r8GlNztueo0
	oosDZo4tt7mgTIA9SISku0zrYzrUWea+KAFQOQxrfVPyjFOkSPgTT8hMpz8bFohrnDhLA81BohwW5
	P7QIdd0HlkmEQzQFYByengaGeaYvHkK+adHcJ/WDY4jTb3LRUEh5UDcK9eiwvQsVUPsNETSUY+9iq
	3xNVZ7925HDhI0iM3ZdcEj646wdP23ZmAyex/s1jK1FzKPss0KiBOKalNQqMEScpxg/ipSSV3N3XJ
	kLATboFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxMs-00000003nxN-47om;
	Thu, 09 Jul 2026 22:37:19 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxMp-00000003nvu-2AgJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 22:37:16 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-451b3a4a03cso156697fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 15:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783636634; x=1784241434; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7wbRxqeXe6OhAyO1MWhkHUo2TrAk/KOd+lAMmZEbmWc=;
        b=S07vy4ZJQll2eIhHf/qXYLGvQxG/BWNpkrVQP1w8KJhXHa8AgRCBOORyQ3/2X2g9+t
         aFxQX1P4IiyLPG2AAmztfjclq2Jql4MlkchWhH8xkFGHC/BulQgfVEK1ypuVq1Mw99HX
         UM3HbHBG/JJ06IKl2CDq/89UPZ94TwkeBRI781JAdwM0lfCGdOlb5q/bpqFjaMdFas8C
         budHxtzCv5ytB1k/f82sHODEQZediCV4/zcmeV7s03k+g9474wDidqnpHpwtI/iBbd2B
         ycDEy38fem1zNRYn1cvIMeuNrgA182lJU/0eZjMXJdGgJBsi4BTfmlVKW8ZfI1EnWuva
         09Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783636634; x=1784241434;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7wbRxqeXe6OhAyO1MWhkHUo2TrAk/KOd+lAMmZEbmWc=;
        b=T+8MEC/Flm2+g10V9BCb6AkreyskfiiilwuX7L2YW/f4DEwsLJsQDDz0cfDbNKyp01
         Z1Ng1svFo2DSfzxvqpHNkYPUBoWxg6rkxLeJhdxIAiWRdnsXJNXbsQhusqvgG6+RNqZB
         WoSDkcTZaxpc5ECVSEPYRbiXpxoFQFPJCik+eoeCH31Rx+B+PSBMVXvnpa9t1Ax0MPwv
         cydHqZZazsEzOu76A3FTgkeWBRl8+fSAdDLhONHEo5hxes/jKYElDMZMsqvvAAkB5lod
         YYVHGsKOde8AIJGY8mu7qRr3tt8CP2UfkCuNsXsxVDvAIt503DjkdX+xGuFPy2vqAWBd
         PUHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tsde2Micte5eKkuLfSmt0vLztqOjc/cN4C8l0AxotiqOGNYyR4Y+tjSam8He82ezXLNtdnF155WD5+qY51A3k@lists.infradead.org
X-Gm-Message-State: AOJu0YzC6mwzBKUvsT/KJlI40C6J0IiNo1V2cGrSgQ+ZteHmOgQlu/rP
	0rpb+cXSWZs2QWFkB6Yl4ieX+U8cLaiMi56yeRprCgYoAUvBiqoRs0LLEBDB/Wv4f3dal4frw3H
	5lZspeyfecGL1YoxiUpE8OvnsMw==
X-Received: from ilax6.prod.google.com ([2002:a92:d306:0:b0:503:4f93:1524])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c410:b0:48c:3b4:2b95 with SMTP id 5614622812f47-4a2042c6d24mr8647572b6e.29.1783636633855;
 Thu, 09 Jul 2026 15:37:13 -0700 (PDT)
Date: Thu,  9 Jul 2026 22:35:57 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260709223604.12934-1-coltonlewis@google.com>
Subject: [PATCH 6.6 v3 0/6] arm64: KVM: Backport VHE-only boot fixes
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: oliver.upton@linux.dev, sashal@kernel.org, gregkh@linuxfoundation.org, 
	mizhang@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, ahmed.genidi@arm.com, leo.yan@arm.com, 
	miguel.luis@oracle.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_153715_584804_2B1301E7 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

Architectural updates retroactively made FEAT_E2H0 optional, meaning
hardware can implement FEAT_VHE without FEAT_E2H0. On such CPUs,
HCR_EL2.E2H can reset to an unknown state and must be initialized early
so later code can reliably detect whether E2H mode is active.

Without these fixes, booting 6.6.y as a guest under KVM nested
virtualization will hang at boot.

This series targets 6.6.y specifically because these patches are all
present in 6.12.y and applying these patches to 6.1.y and presumably
older kernels has more conflicts and results in other issues booting
as a guest under nested virtualization. More work is needed to enable
that.

Changes in v3:
- Added Signed-off-by: Colton Lewis <coltonlewis@google.com> to all commits.
- Added explicit '[ Backport: ... ]' conflict resolution notes indicating why
  conflicts occurred and how they were resolved (Patches 4, 5, and 6,
  including Patch 4 where the conflict was trivial).

v2:
https://lore.kernel.org/kvmarm/20260708225124.4130846-1-coltonlewis@google.com/

v1:
https://lore.kernel.org/kvmarm/20260701204342.2654385-1-coltonlewis@google.com/

Ahmed Genidi (1):
  KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu()

Marc Zyngier (4):
  arm64: sysreg: Add layout for ID_AA64MMFR4_EL1
  arm64: Treat HCR_EL2.E2H as RES1 when ID_AA64MMFR4_EL1.E2H0 is
    negative
  arm64: Fix early handling of FEAT_E2H0 not being implemented
  arm64: Revamp HCR_EL2.E2H RES1 detection

Mark Rutland (1):
  KVM: arm64: Initialize HCR_EL2.E2H early

 arch/arm64/include/asm/el2_setup.h   | 56 ++++++++++++++++++++++++++--
 arch/arm64/kernel/head.S             | 20 ++++------
 arch/arm64/kvm/hyp/nvhe/hyp-init.S   |  3 +-
 arch/arm64/kvm/hyp/nvhe/psci-relay.c |  3 ++
 arch/arm64/tools/sysreg              | 37 ++++++++++++++++++
 5 files changed, 101 insertions(+), 18 deletions(-)


base-commit: da47cbc254661aa66d61ef061485a7080305c4be
-- 
2.55.0.795.g602f6c329a-goog

