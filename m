Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A77CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DRCIDgfvyWb8F6dd51kKp09a/LacrvNUI0KU4btuiv8=; b=otM4gTe+reKi0zYVhCVQuNUo8y
	bF+D2ZgBUqrEbv4EUJnhfadCW3XY1TN1+DndGv6Ojab2AVxBo85iVg7ZGzTBzw4wzwsyGNYXwriHi
	f7kMWtkE3c2QUa05Cz6vAKkmEIe5B+7idCHjeo6reGfrihLktkQ49q9bUKL1Rdd/NY2Wskvyi7FbZ
	F2Du/4YaDoUO9+tzOI4/lcry4gJvMXaTr0Rj1iQuS7ZEDPDpNYW7UjEKiIJOJTGgeBAadiYCyjCl0
	h0oZ0X/YOF7f0eUC5iwtSTqG8rRwy0+vA8FYT7U6Wiw0LozgFoNtkWJudwtYaBAbriCu+M8m6tIq8
	60FOJCGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcD-0000000HV8z-2WP9;
	Wed, 17 Jun 2026 14:51:41 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrcB-0000000HV8X-2axk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 14:51:40 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-45ef616db45so4813007f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 07:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781707897; x=1782312697; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DRCIDgfvyWb8F6dd51kKp09a/LacrvNUI0KU4btuiv8=;
        b=HRYgiGIhZbMvyHVpNw2A8c/pQzBbIWkPTLWgUmbRt5x5Ezt0c8kOXELMxhPxbKtIRK
         bpVwIl+djhdjuuhgoaZiXGwh1Fj7Db8eby3v2sOS0TqQX0zB89d+7Omjn6MQPI1+SUmf
         dDzM0WFsszhZI8T/YK2kgjxJQh7k1E3N4nV90g9Q6SI17+mPxBlavgSxYihFxsH7+fpu
         jP5DQg+52BhqjgwhKEOyAyDTLdRARR68g6rUtbBIANu263U8oYvuSr0z98RtCJ8hOVm5
         dtdVTe5h1RlZYqHNiyKAR0toXayrqzwrTRqgO6VOixaYu/p8dDl/S56MW/k3Y36IwuIv
         6aSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707897; x=1782312697;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DRCIDgfvyWb8F6dd51kKp09a/LacrvNUI0KU4btuiv8=;
        b=mp0RQjN9bqlqdwsqH02VhCewAGlw/zPZYe9U7UKLWGccTH5hoUOKUogqRTjDkvXphQ
         IuajcYR0Xc62ZfbGQS06t1aWtJrXw1HOILWku/NvEBXig6o+QiWiLg8vilqQocABpmUj
         ZiXmAHp9mx4KsKE2U6rb4pAss9qo5Zv8Re/DWGfKKsY+VPvZIZhrjRPdrjFcm6t+wP6d
         333gxKiBTRhOgY3XZAQN+Vh7PE7MQm0maGWe1CW5tOhSB27sy4Pi+5dQrqpeqEYa7oAC
         pASxROvZpuiEN+m2Y9qa8YAFSZIzk+Lhp07//ScSSZ3BSb1OiJ3DltAsZnuuepCazMmk
         nvMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Q0wPwJJoA7mqK2yPQyex8MdsUtT0PcJ4K5pJD976v+388lOIepNsoAIQxLOnnKQr7ikdDJTLCv3mV8QWZtDMr@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe+dPhctSNsOU+JgZc9CV5lw1Ac7k8ObogoLkBv25+TPu3HGzJ
	TdkSm0df1Np2AT4AErq277IrLVeVnsXU0e0hgF3VQq4TmfuAiJyMUOYTLppVHMrg58Rk2u+uauw
	HF7jUFox/QmTCKcUWC5KFyM2MJrgUIg==
X-Received: from wrsi9.prod.google.com ([2002:adf:fdc9:0:b0:43d:677d:1980])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:edcf:0:b0:461:bfd6:510c with SMTP id ffacd0b85a97d-46235e9ae48mr6358501f8f.3.1781707896957;
 Wed, 17 Jun 2026 07:51:36 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:51:23 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260617145130.3729015-1-sebastianene@google.com>
Subject: [PATCH v7 0/7] arm_ffa, KVM: Fix FF-A emad offset calculations
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org, 
	will@kernel.org
Cc: jens.wiklander@linaro.org, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, maz@kernel.org, mrigendra.chaubey@gmail.com, 
	op-tee@lists.trustedfirmware.org, perlarsen@google.com, 
	sebastianene@google.com, seiden@linux.ibm.com, smostafa@google.com, 
	sumit.garg@kernel.org, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_075139_675790_5927E6A5 
X-CRM114-Status: GOOD (  19.38  )
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

Hi all,

This series fixes the Endpoint Memory Access Descriptor (EMAD) offset
calculations and adds the necessary bounds checks for both the core
FF-A driver and the pKVM hypervisor.

Prior to FF-A version 1.1, the memory region header didn't specify an
explicit offset for the EMADs, leading to the assumption that they
immediately follow the header.
However, from v1.1 onwards, the specification dictates using the
ep_mem_offset` field to determine the start of the memory access
array.

The patches in this series address this by:
1. Updating the core `arm_ffa` firmware driver to correctly calculate
the descriptor
   offset using `ep_mem_offset` rather than defaulting to `sizeof(struct
ffa_mem_region)`.
   It also introduces bounds checking against `max_fragsize`.
2. Enhancing the pKVM hypervisor validation logic to no longer strictly
enforce that
   the descriptor strictly follows the header, aligning it with the
driver behavior
   and the FF-A specification, while also ensuring the offset falls
within the mailbox
   buffer bounds.

While addressing these bugs, Sashiko uncovered other issues that were
fixed in the same series.

All the patches aside from the first one in optee are urgent fixes as
they either impact the hypervisor security or kernel stability.

Changelog
#########
v6->v7:
- taking the patches from Mostafa and sending a new version with the
  collected tags
- Added overflow checks when doing `ep_offset + emad_size` in the arm
  ff-a driver
- Move the length check before the ffa_mem_reclaim
- fix compatibility break with ff-a version 1.0 reported by Sashiko
- add one more patch to fix an issue with the FFA_VERSION call
  that can lead to leaking pKVM stack un-initialized data to
  a host when -ftrivial-auto-var-init=zero is not used.

v5->v6:
- Add fixes tag
- Small clean up make variable declaration reverse christmas tree.

v4->v5:
- Collect Sudeep Rbs
- Add extra patch to check base address alignment.
- Remove WARN_ONs in KVM code
- Use ffa_emad_size_get() instead of hardcoded size in KVM code.

v3 -> v4:
- Address review comments and fix Sashiko bugs

v2 -> v3:
- Fixed typo in nvhe/ffa.c (missing sizeof)

v1 -> v2:
- For pKVM, removed the strict placement enforcement for `ep_mem_offset`
  as it is not
  compliant with the spec, and avoids making assumptions about the
driver's memory
  layout.

Link to:
########
v6:
https://lore.kernel.org/all/20260527150236.1978655-1-smostafa@google.com/
v5:
https://lore.kernel.org/all/20260526151934.3783707-1-smostafa@google.com/
v4:
https://lore.kernel.org/all/20260520204948.2440882-1-smostafa@google.com/
v3:
https://lore.kernel.org/all/20260512124442.1899107-1-sebastianene@google.com/
v2:
https://lore.kernel.org/all/20260430160241.1934777-1-sebastianene@google.com/
v1: https://lore.kernel.org/all/ae9KN9nkOgDYJcGP@google.com/T/#t

Mostafa Saleh (4):
  optee: ffa: Add NULL check in optee_ffa_lend_protmem
  firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
  KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
  KVM: arm64: Ensure FFA ranges are page aligned

Sebastian Ene (3):
  firmware: arm_ffa: Fix Endpoint Memory Access Descriptor offset
    calculation
  KVM: arm64: Validate the offset to the mem access descriptor
  KVM: arm64: Zero out the stack initialized data in the FFA handler

 arch/arm64/kvm/hyp/nvhe/ffa.c     | 47 ++++++++++++++++++++++---------
 drivers/firmware/arm_ffa/driver.c | 25 ++++++++++------
 drivers/tee/optee/ffa_abi.c       |  3 ++
 include/linux/arm_ffa.h           |  2 +-
 4 files changed, 54 insertions(+), 23 deletions(-)

-- 
2.54.0.1136.gdb2ca164c4-goog


