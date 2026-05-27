Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B4CCD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 15:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t0KYYgCqaB1EQ6tWG+L5HeJwzgQqF0UPRi4lIJbh6P8=; b=vMXIH4C1W66JanSpg6ceL1cIJA
	cRg5qhaX3tSlvyRo5N54ZJaodUB/+aRzNDPgt5gdNB7xwk9praNyplAMCi7So3HE1wMIxOAgniH+U
	4wL+lkYvS3H2ABZts8GmVcC0SbFXnA3oWOXjiQma1lvpWzNVqe3yM451lB9ncxnzkDJUDp4evZNSW
	o0HqX50ceBux/8sAXYvwTvoNzi3bbMy6nMpWJ3T4VcCtiRf8U+k9Rt05QUnGkpzeZnEOc9e5EbFd6
	dgkCRZJtD+D+UUVLePMPfY1edhy4jJf5++Du0iheq3KeeIj/eZnK6kxt49oj6QrjZgt5qLo1eMaYp
	77STqDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFmP-00000004M92-2UMW;
	Wed, 27 May 2026 15:02:45 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFmN-00000004M6z-09Wh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 15:02:44 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-67e9db60e1bso10861566a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779894160; x=1780498960; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t0KYYgCqaB1EQ6tWG+L5HeJwzgQqF0UPRi4lIJbh6P8=;
        b=jpy6FXhyepC+Of9zIU4RnK21bKL3CzJtVk6whlIDJFMGdWJeGJiBPYgBRPmxAK0xsI
         p2Mt91CYYetVr47z1KrWqUfjv7xNj3ty8DBtv+cjh4biuitVduSe7euaNldIaJcFMTLF
         mvIXn34anOwohFCAYrIVpeloLrKnK8PpJvFswjhsUaH986npwwge/72Pv2/PAKOzFfSG
         7O3rkW9MVPrbLjvppmAzv/f67xOr6SMA3moxRnYDvLBdESWRIxLi0FvZ0wkQaNo5iHmu
         bXGhvRLNFdtt+jdfsqISxooKDnCnv7ACpcEcj7QkWqO8bOP32q5IMmQ6MLaymXolLiE7
         3UUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894160; x=1780498960;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t0KYYgCqaB1EQ6tWG+L5HeJwzgQqF0UPRi4lIJbh6P8=;
        b=cHB0ziiUD1WnUIYtJcB3tqU/9R22/fi6atrRy2qvrk95hl/2XAONsWVYAE7stx7qzX
         GhGhYnEXCUNuvzh47Rkon46L76n+ofui0b9e1QE7x8YzZPGzXm4vzs2SddpQmSWNLQxx
         uqCSnkhklojivvV6piB2Ykrp3i45R8ePmvJEOZHVKO1hRtqddCDRHRkQAKHoNZ2Y/xNM
         +6FNYxHhQS/fu62QIMj/S3/dInMcvAwooFlnp29tiwXyYo/6LXtP531ZH/+WYPWRc0AB
         ZChnn0V7oe5vWf42bpElb4q10ZnerLfzZMemLrp27k5WfhhPzPwM+dftkfbtuczxJxEA
         xl7A==
X-Forwarded-Encrypted: i=1; AFNElJ8Mk2JxuegguSFL4qasis+Fi6tTPLBSJGR2XSga1QTwGOZ+pOeud8ub5zk/mX3GpKPAgL2Ehol1TMlb9CN4cbM1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4Y6duoZce8HEkpRXxA69yBK3+UaJ8nitYBc//AjNpA0+Zukt0
	7nsEnwSuSdOzOKFQ/OlgZfRqK4Tr9vYnUXFxamLq8m+9Jh6sN06pDHg6F4t+KzBt3gzOHHjZrV+
	p+ttGwJ0ad7cDRw==
X-Received: from edho11.prod.google.com ([2002:a50:c90b:0:b0:687:b8fd:7b67])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3249:20b0:68a:57f1:44e2 with SMTP id 4fb4d7f45d1cf-68a58107b1cmr2314665a12.7.1779894160042;
 Wed, 27 May 2026 08:02:40 -0700 (PDT)
Date: Wed, 27 May 2026 15:02:30 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260527150236.1978655-1-smostafa@google.com>
Subject: [PATCH v6 0/6] arm_ffa, KVM: Fix FF-A emad offset calculations
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_080243_089548_7FDDAAFA 
X-CRM114-Status: GOOD (  16.83  )
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
1. Updating the core `arm_ffa` firmware driver to correctly calculate the descriptor
   offset using `ep_mem_offset` rather than defaulting to `sizeof(struct ffa_mem_region)`.
   It also introduces bounds checking against `max_fragsize`.
2. Enhancing the pKVM hypervisor validation logic to no longer strictly enforce that
   the descriptor strictly follows the header, aligning it with the driver behavior
   and the FF-A specification, while also ensuring the offset falls within the mailbox
   buffer bounds.

While addressing these bugs, Sashiko uncovered other issues that were
fixed in the same series.

All the patches aside from the first one in optee are urgent fixes as
they either impact the hypervisor security or kernel stability.

Changelog
#########
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
- For pKVM, removed the strict placement enforcement for `ep_mem_offset` as it is not
  compliant with the spec, and avoids making assumptions about the driver's memory
  layout.

Link to:
########
v5: https://lore.kernel.org/all/20260526151934.3783707-1-smostafa@google.com/
v4: https://lore.kernel.org/all/20260520204948.2440882-1-smostafa@google.com/
v3: https://lore.kernel.org/all/20260512124442.1899107-1-sebastianene@google.com/
v2: https://lore.kernel.org/all/20260430160241.1934777-1-sebastianene@google.com/
v1: https://lore.kernel.org/all/ae9KN9nkOgDYJcGP@google.com/T/#t


Mostafa Saleh (4):
  optee: ffa: Add NULL check in optee_ffa_lend_protmem
  firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
  KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
  KVM: arm64: Ensure FFA ranges are page aligned

Sebastian Ene (2):
  firmware: arm_ffa: Fix Endpoint Memory Access Descriptor offset
    calculation
  KVM: arm64: Validate the offset to the mem access descriptor

 arch/arm64/kvm/hyp/nvhe/ffa.c     | 38 ++++++++++++++++++++++---------
 drivers/firmware/arm_ffa/driver.c | 21 ++++++++++-------
 drivers/tee/optee/ffa_abi.c       |  3 +++
 include/linux/arm_ffa.h           |  2 +-
 4 files changed, 44 insertions(+), 20 deletions(-)

-- 
2.54.0.746.g67dd491aae-goog


