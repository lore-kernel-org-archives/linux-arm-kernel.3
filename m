Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FA2D232EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BMgUtghnuAy1sqqzoIvEfRuLHghrW+zp1tKrLf8u880=; b=j9wYygWtlGL2AUQMx2aIl3ljRl
	bCzhBG2jKiSFWD8bRsr8S22y/Bt2IQjVSzr54cCD4c13ofc4wzNS9upeMXlnWSjx6tESlNuGR8Oop
	JjGBA5lnWd3DkB03DDQRoND4W7v7SvLnnZIj0DCy9Z9JMlyHOg0QWus65gDgB18EmKVlqY8vkR//j
	i8g0tS/Obazcc5PzuBY5dPrVJSpITcZG7EIW41wzl9Mch8bYdYkxLnXsqBvZ9FrOw/mKw0fgPIJ+3
	mIdqk72txpGYW9VknOOGcgePeuCOIcSQhUPHe7YrD+A+Fm76/ge/X8/caDv0MXZI8IkrH7AjN5PLU
	y1hv3FoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lH-00000001sXe-3t7A;
	Fri, 09 Jan 2026 08:22:23 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lF-00000001sVG-3AdP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 08:22:23 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477563a0c75so22160835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 00:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767946939; x=1768551739; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BMgUtghnuAy1sqqzoIvEfRuLHghrW+zp1tKrLf8u880=;
        b=bLsiJJmKDO6QnA7pW1zh7MvLpC760iGAGpb1YS92ORWfPm7npC5gWe9ayZoTUif37c
         7SwT9P8olCFD5kdJzzLbH3hXpENIrSbPjAU6YYupVO3R5fDZ+ckNYMxkSgok+XQ/mkGU
         MuFcw5oZidczpFjs7TaY5TiT9CxZPuG7rCiripJOAKhC+rAGurh1NXsSkQYVWlklkNn8
         4ZhJcz5KPQ4/5qZ7EpoJTiqCG1MKtYPq6KNYEVWQ/0gz+ZzLSccSYEl2g667stOfo/Bg
         5zmJ7X1zdicUKrFAnWFMSppocscWPiYfFRxR/x23xH8h3rerUUFtqmNV0TyCch9t92l0
         6GUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946939; x=1768551739;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMgUtghnuAy1sqqzoIvEfRuLHghrW+zp1tKrLf8u880=;
        b=UrAFGjDDj3YqJMO1qK8X6MGv9ZNBZHpZHulvdqC7vEN/mCHmax3UnEShzpxM6BFlgD
         t02z4cYOvRL7Ok7rRKCwf62O94wotXumUhQf8XBpo4fLl0Vqe99NbQHfT4WEqbUbd2tY
         57W8KeQB5TmVyW8jPxPD3OsnHOCmQAa6W1vcf5tSNCuRzZvB2NGHwDkW4GUZUmt8LZJo
         BTIoGbBnIuFnO4WDdQY/TpjfsgB6FCsz9K/1YW88aFy1H4keReFsZWVZKQcs/lNQed8u
         /9TMz2AlVCYSVLEwhfrNkN2o04vaJAvALoIltDTSa1kbtn62EhmYfyrGze+g5kubYllQ
         rEjA==
X-Forwarded-Encrypted: i=1; AJvYcCWTvFv0e4U+3DdaqizZfzO8gKYNCd1fwWG/Vu+IBGivBuWnmv2S4122QS1Bpn5citU38WseIPrp+j5M60MGaCU+@lists.infradead.org
X-Gm-Message-State: AOJu0YzdQ3MUY1eRYVf6ltxlGNBL3vDpBsTANQVOwOf/+w+r+ZY1so8Q
	XLa4kazgthYZlYZyiPCAFZCafFOlvFRvQJb6XS3Kd1HhPSji9LZBAEceEXEChqPMvDOgRRDvJbg
	E/g==
X-Google-Smtp-Source: AGHT+IEEqNYMoHeY+3DwmkTCwwRtWsTJKfrOQfXfQ55U2Jju+BCRFWy02s7qCZ5He0miV9LurIPAHvpnNA==
X-Received: from wrbgz29.prod.google.com ([2002:a05:6000:481d:b0:431:1c7:f966])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4fd2:b0:47b:deb9:f8a
 with SMTP id 5b1f17b1804b1-47d84b40a99mr108297505e9.30.1767946939194; Fri, 09
 Jan 2026 00:22:19 -0800 (PST)
Date: Fri,  9 Jan 2026 08:22:13 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109082218.3236580-1-tabba@google.com>
Subject: [PATCH v4 0/5] KVM: selftests: Alignment fixes and arm64 MMU cleanup
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	atish.patra@linux.dev, itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, 
	seanjc@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_002221_829730_306969B8 
X-CRM114-Status: GOOD (  11.28  )
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

Changes from v3 [1]:
- Renamed page_align() to vm_page_align() (Sean)

This series tidies up a few things in the KVM selftests. It addresses an
error in memory alignment, hardens the arm64 MMU configuration for
selftests, and fixes minor documentation issues.

First, for arm64, the series explicitly disables translation table walks
for the unused upper virtual address range (TTBR1). Since selftests run
entirely in the lower range (TTBR0), leaving TTBR1 uninitialized but
active could lead to unpredictable behavior if guest code accesses high
addresses. We set EPD1 and TBI1 to ensure such accesses
deterministically generate translation faults.

Second, the series fixes the `page_align()` implementation in both arm64
and riscv. The previous version incorrectly rounded up already-aligned
addresses to the *next* page, potentially wasting memory or causing
unexpected gaps. After fixing the logic in the arch-specific files, the
function is moved to the common `kvm_util.h` header to eliminate code
duplication, and renamed to vm_page_align() to make it clear that the
alignment is done with respect to the guest's base page size.

Finally, a few comments and argument descriptions in `kvm_util` are
updated to match the actual code implementation.

Based on Linux 6.19-rc4.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260106092425.1529428-1-tabba@google.com/

Fuad Tabba (5):
  KVM: arm64: selftests: Disable unused TTBR1_EL1 translations
  KVM: arm64: selftests: Fix incorrect rounding in page_align()
  KVM: riscv: selftests: Fix incorrect rounding in page_align()
  KVM: selftests: Move page_align() to shared header
  KVM: selftests: Fix typos and stale comments in kvm_util

 tools/testing/selftests/kvm/include/arm64/processor.h | 4 ++++
 tools/testing/selftests/kvm/include/kvm_util.h        | 9 +++++++--
 tools/testing/selftests/kvm/lib/arm64/processor.c     | 9 +++------
 tools/testing/selftests/kvm/lib/kvm_util.c            | 2 +-
 tools/testing/selftests/kvm/lib/riscv/processor.c     | 7 +------
 5 files changed, 16 insertions(+), 15 deletions(-)


base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
-- 
2.52.0.457.g6b5491de43-goog


