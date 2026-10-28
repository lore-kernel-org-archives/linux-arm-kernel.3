Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CD660A2600
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3erZ0qEZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nnfeXwG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MsI8OZZh9dKz1v392dtfILjaERE3/nyinId1eBUI+OM=; b=3erZ0qEZyZ5Th3cnbVxe6duvvw
	ERLeElv90y/404Dnqab81DCPwlb0bTxX7iSzl+n7GXrPc7yItrR+a+lb10mI08luKsgw/ztqSvkqo
	m4IgcLtVILlmLQj2sgnpUSYrA8SUWx7i1dgae548TVhFOlE2MhkULRDSbV/EGJiDmd6V7io03UT76
	iJjOOPXHuDLH+uyDBOQUrtsREoL1uFfO96v/RCtAP3D7mHx1ulx+pmDNAbHhR5sjpjqN3pMkS3u+A
	r15+JpIcT1QZxIsAmwitKqHrc4sAR1+MqcJdly618aM5jMnaODwihns0K/4d4M/Sc3LIE7fMVxMyx
	L2RDZDAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvn1-00000006JPq-2XAn;
	Wed, 28 Oct 2026 05:01:31 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvmz-00000006JNQ-1TOY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 05:01:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so4648665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 22:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793163686; x=1793768486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MsI8OZZh9dKz1v392dtfILjaERE3/nyinId1eBUI+OM=;
        b=0nnfeXwG27eEwKeUmQdto/uH27vwGcCh6EKoIL1+GELvT/L3ihJUarnIqLwmSf6rgP
         MVp3JXdHlT/nB6dDShglYU2SVLVQxq1LbWjBf59GgbX6cKRflFR4jMnYjuYKMzUEE1Gv
         fioLNfSEuL5q/FY35MyIPYI43eAAx9usVGUJ5FxSor5zWD5PBlxY1NnKi+vUjcKoEF+m
         L3Z0qmiyirvOJulgHBIZ0JIN2jNsDlamrs1k8/HjuCQWFp2I69mL8e0vmANrHlokcBnn
         ZeCx1hmoUAGo+cbJNtUpXujQjcq1shg+Hn27siH5H+G4EJxbh6mb41kcdmh+gCsOyM5s
         JPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163686; x=1793768486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsI8OZZh9dKz1v392dtfILjaERE3/nyinId1eBUI+OM=;
        b=wDgP+Jexjy7X+JGjSdp30sFfaFYHhAyynF8G0h/I487JdgbgY1FLcX+pBQsowkcXX5
         xG6/27MUYMorRICKLkzXlJyd0vDSy8C1P8HjM4NvFetLNtbSz8azuTtcbx1jhHyKpFS3
         HNudICggSeJkbSkTOVeE1kmOVbp8AKMZGtFHmJTs8km7IhYdGIejpCPC4TU6xc40d3ES
         nJLUN+uc9uiPTSOjHCP+CiUjyDHZy2GPllCOHOCvAe7YEfD2s81Tzs9hZxTenW/2LXOy
         Dk/LQFh5La25k3UC98vcZNOX4YzTp9/gYYQ/kmcRfEVciE6355TAHwO4t70UsyxMsM4H
         H1Yg==
X-Forwarded-Encrypted: i=1; AKwUvByXOu9PmYOWqTBZN+ZfcAAnmc6bVxV8KDtHkOpHnQ4LXvUi6VvVE/A3GLEEWJy6vnQyUx0Cx4myjYl8gO+jcbxN@lists.infradead.org
X-Gm-Message-State: AFq9FYKgOH1Q5W2tOsJrDN5o9SRLUPPZ/HquP2Ne8qpdwL/FVHowYM8e
	JjkZk6U0uDq0/Fwht+TT82Te/XL0g8MAI7Jgr2fdp3+mvGAjbwAHevLM
X-Gm-Gg: AYBFou1JGbokjZZMxgawD49Fi62tQI1gZv2N+SSRfJAlxaM+T6pU+B1dJEGsOkZCSmj
	veDw+ylTnEZ0imWaHFXx22ZUgch7TDFm7Wpy7LSZfu4638nzU3hur3jjPnzK6CjFsk8Mz/VOMKA
	cK9mttLCs0usCg6tm0CtUVXTPSdOGiMkuwlZJNEHmyO2PCwvzm3IC195yeRh2dz1IQYiSn5Abwz
	osP4osHF5XWfjp8bJU/E7YyggHSSZTom6RlP0G75Jan9a2I587gMGVb7uUDM5rg6HJVi8GkrMZu
	A+KDtvk9J5m4SUbItOpbwQlQAZSPfpY11zSDFP6hsCRIkRxiTGQv3LpbhYIpTqz6opVCxc1XNDU
	K9PUZVkxvtUK9WijVedxkNnfhJ0nM/yxyBrJkMRMOQ6PljJ56IMBxIqDYCzr3mqvjhatizAY8em
	L9hKuaqsjjoLRxF7O2yk3iS+1g3dkv5NUhLNFhQJpDdYVoQ1OmmSEqKiqtu39I89YzBYWheTju8
	t/FUMbGfn4qk2UrTzoiLPL5aK7FF5DvzAmVQebm8kJpztw9RBfxnCWt8UOnKf0u5kUUwu0C3/4q
	THhc8h7kO1v406b5GOF9gNudLSGSBl9arlTNdINQGwjCZKu33hVnx/YIBsz4XDlewc2xKGpcZbm
	BKZLoYi7UhAAHLRsIa2pwS46lD8tUQmEOKmVWlKOx32NwMaB0dqxcAQy7+mAuJ/GP2Q4bdf7Oy/
	yb3WbVPqL8e53r1mo23XUHNyLn0Geq+ApiHNpROw==
X-Received: by 2002:a05:600c:c117:b0:4a2:cbe:beac with SMTP id 5b1f17b1804b1-4a9672f814emr15602045e9.23.1793163686125;
        Tue, 27 Oct 2026 22:01:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94eb8a60fsm13523365e9.3.2026.10.27.22.01.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 22:01:25 -0700 (PDT)
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
Subject: [PATCH v2 0/3] KVM: arm64: Preserve level IRQ re-pending
Date: Wed, 28 Oct 2026 06:01:10 +0100
Message-Id: <20261028050113.10046-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220129_411321_C6987965 
X-CRM114-Status: GOOD (  13.83  )
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

A guest can set a level interrupt pending again while handling it. The
GIC records Active and Pending and delivers the interrupt after
deactivation. KVM instead drops the second pending state for both the
GICv2 and GICv3 backends.

The VGIC keeps software pending state outside the LR because commit
67b5b673ad4d stopped placing Pending and Active together for level
interrupts. When the LR is folded, KVM cannot distinguish the pending
state used to populate the LR from a later ISPENDR write.

Synchronize the target vCPU's LRs in vgic_mmio_write_spending() with
vgic_access_active_prepare() and vgic_access_active_finish() under
config_lock before setting pending_latch, as suggested by Oliver Upton.
When a vCPU writes its own GICR_ISPENDR0, this synchronization is a
no-op. For shared interrupts or remote redistributor writes, stopping
the guest folds any prior ack from the target vCPU's LRs before the
new pending state is recorded. In the v2 and v3 fold paths, clear
pending_latch when an LR populated for an inactive interrupt no longer
reports a pending state, and preserve a latch written while the
interrupt was active.

The last patch adds a two-vCPU GICv3 selftest covering same-vCPU and
cross-vCPU re-pending while active, as well as a cross-vCPU ISPENDR
write before the ack.

The issue was reproduced with Zephyr, NuttX and RT-Thread test harnesses
that configure an unused SPI as level-sensitive, pend it via
GICD_ISPENDR, and re-pend it once from the ISR before deactivation. On a
Raspberry Pi 400 host with a GIC-400, each GICv2 guest handled the SPI
once on the baseline and twice with the RFC fix. A native RT-Thread run
on the same GIC-400 also delivered the re-pended interrupt.

The v2 change was A/B tested with RT-Thread's direct and mailbox-pic
reproducers on Linux/KVM hosts running under QEMU TCG with GICv2 and
GICv3. The baseline lost the second event and v2 delivered it. The new
GICv3 selftest also passes in that setup. I do not have a physical GICv3
host, so the GICv3 testing is emulated.

Changes in v2:
- Synchronize target vCPU LRs in vgic_mmio_write_spending() via
  vgic_access_active_prepare() and vgic_access_active_finish() under
  config_lock instead of tracking on-LR writes with a separate
  latch_written flag (Oliver Upton).
- Extend the selftest to verify that a cross-vCPU GICD_ISPENDR write
  before the ack merges with the initial pending state without causing
  a second delivery.
- Drop RFC prefix.
- Link to v1: https://lore.kernel.org/r/20261022064628.4206-1-kmehltretter@gmail.com

Karl Mehltretter (3):
  KVM: arm64: vgic-v2: Don't drop pending writes to active level IRQs
  KVM: arm64: vgic-v3: Don't drop pending writes to active level IRQs
  KVM: selftests: arm64: Test pending writes to active level IRQs

 arch/arm64/kvm/vgic/vgic-mmio.c              |  76 +++++-----
 arch/arm64/kvm/vgic/vgic-v2.c                |  10 +-
 arch/arm64/kvm/vgic/vgic-v3.c                |  10 +-
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 140 +++++++++++++++++++
 4 files changed, 197 insertions(+), 39 deletions(-)


base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.39.5 (Apple Git-154)


