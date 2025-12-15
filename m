Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6E0D5B841
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bw36UYHiJwTnMGEVt20djLkGP5pKUV/ucx4MipOtVRg=; b=240f7FyCVHiPd4T+izXW5whsP0
	nG6GwEcs1dL3VHNxG3Duau/2i4mLTYq1inWy6LqDwh54nK3zSGYMuo30M1GzAgGdKkddgqqUOQtIS
	e0vJ25FrMGI0lx1KSpcFud7nBTk70Ru96kP620AEUjNeccIwsVUD9EwHWuJTQJTKKaeUuoYwupWli
	dvLcyVrkjakZ6DcsQoSv+6o+SAiMlk/qCxmF2bfaoZ0ldhJVEhWE9osUXSfd6+pETVMuBSeSiKwBo
	DOKx/dDmdvWSgkeYwbQFOpLQns0D57m8tIEhc7Th+8VzmJQt0PCP0QOAKGSFlgpupi8W18mby49zL
	OLhFMr7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAlX-00000003uv1-2l8h;
	Mon, 15 Dec 2025 15:45:39 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAlU-00000003usk-13d0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:45:39 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-477a11d9e67so18855805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 07:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765813534; x=1766418334; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bw36UYHiJwTnMGEVt20djLkGP5pKUV/ucx4MipOtVRg=;
        b=e6+X/HX7tL3qBuRizeYqk66wR6Fcx2sPa7DIFighAdZ4OgVTcouz337I13wiRQ7STi
         w7ohfonB0E3GdYQQ41XbBIH18AJwM02j2C9UoGdb9VcT6EIC0CV+jEb0gy1y9sog80P9
         D0Yo0/dzSHz9tq2L9jdzmK6z/hglMt5r272N8kYExYLWZDPXFjVPOZtxVcZ/6Uc45yg8
         kzL4ZLsNBG+HtWn/7i0eEPwzAWn2sqiIAU2cSDHnOnvTnwE6FxWwejCsbel4GlRVB4tL
         rzpuSa/RPY8OcF33VX2vtXhSHFNlPAEjAuGSkyqaeUyHnm7/X1LUrpiZ1h9sHPE9M2hK
         EdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813534; x=1766418334;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bw36UYHiJwTnMGEVt20djLkGP5pKUV/ucx4MipOtVRg=;
        b=cXC6HmLVFbz86MmSC8RKwiQOC5xXc8Sm5hhj/7CJ9QElisDYh3XUNSaUDnQdNsIOMg
         Qv8GnjhTNdG5ZqjaAFplEpF11nCllGqdQoisR/qeIPke8MWvL4ngitPQQdlp5RTYelSz
         xBfHcGCfQbjiGs/k0IO1/m9aw1ERqWJkUjnGjiKVjMomYcFhkqOFk4M/RQrJtl6BSsIa
         uud6m+jpGaOxU0qRg1fPibQGMTIXn0FfpmtorQ2acx20mw05uZ1Rq6eeoCVkqx8po5Z5
         DUAylnCuJLHSjEK93DI2GX3WGpp8BJ2IdPrcBjvQIWA0x+sRN7mpUfn8ac/26PQV6sGn
         AKVw==
X-Forwarded-Encrypted: i=1; AJvYcCUYIbd4nihVMKU+ZZxh+ZKiTT/0k8PbWDyS6gTlv9hJs+ahr1u9mytnkrokqHjEEJVqDESDzlaxxRyiH9XooLRl@lists.infradead.org
X-Gm-Message-State: AOJu0YwIprKFHR4nYjX4z0YX8a+ucbhQLOHCVvkFsp9OsDjBh8lTqS8d
	POsegwRe3hhFURhEzkDDf0Mk+VrnjCNrnKYP5yGBec/fb3fbZ7HKH696QetXTzpWR43/Xbrd0Zt
	RJg==
X-Google-Smtp-Source: AGHT+IFvCN7OJ47OliZuHF+F6SZwHJvJOtHHqhXWSZq7DLxhATMKUb5NKWIlhsqiu0gI3E0gMagNgYMmzg==
X-Received: from wmrc6.prod.google.com ([2002:a05:600c:ac6:b0:46e:1f26:9212])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b07:b0:477:8a2a:123e
 with SMTP id 5b1f17b1804b1-47a8f916502mr130881835e9.33.1765813533898; Mon, 15
 Dec 2025 07:45:33 -0800 (PST)
Date: Mon, 15 Dec 2025 15:45:28 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215154533.3154405-1-tabba@google.com>
Subject: [PATCH v1 0/5] KVM: selftests: Alignment fixes and arm64 MMU cleanup
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074538_076247_68FF20ED 
X-CRM114-Status: GOOD (  10.90  )
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

This series tidies up a few things in the KVM selftests. It addresses an
error in memory alignment, hardens the arm64 MMU configuration for
selftests, and fixes minor documentation issues.

First, for arm64, the series explicitly disables translation table walks
for the unused upper virtual address range (TTBR1). Since selftests run
entirely in the lower range (TTBR0), leaving TTBR1 uninitialized but
active could lead to unpredictable behavior if guest code accesses high
addresses. We set EPD1 (and TBI1) to ensure such accesses
deterministically generate translation faults.

Second, the series fixes the `page_align()` implementation in both arm64
and riscv. The previous version incorrectly rounded up already-aligned
addresses to the *next* page, potentially wasting memory or causing
unexpected gaps. After fixing the logic in the arch-specific files, the
function is moved to the common `kvm_util.h` header to eliminate code
duplication.

Finally, a few comments and argument descriptions in `kvm_util` are
updated to match the actual code implementation.

Based on Linux 6.19-rc1.

Cheers,
/fuad

Fuad Tabba (5):
  KVM: arm64: selftests: Disable unused TTBR1_EL1 translations
  KVM: arm64: selftests: Fix incorrect rounding in page_align()
  KVM: riscv: selftests: Fix incorrect rounding in page_align()
  KVM: selftests: Move page_align() to shared header
  KVM: selftests: Fix typos and stale comments in kvm_util

 tools/testing/selftests/kvm/include/arm64/processor.h | 4 ++++
 tools/testing/selftests/kvm/include/kvm_util.h        | 9 +++++++--
 tools/testing/selftests/kvm/lib/arm64/processor.c     | 7 ++-----
 tools/testing/selftests/kvm/lib/kvm_util.c            | 2 +-
 tools/testing/selftests/kvm/lib/riscv/processor.c     | 5 -----
 5 files changed, 14 insertions(+), 13 deletions(-)


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.52.0.239.gd5f0c6e74e-goog


