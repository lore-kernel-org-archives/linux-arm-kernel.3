Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875E3C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mfba1GeK9GMLIuK10iqBPbEuuHDYdzYb65zyVJOFXLI=; b=FSmpiIJuPJaKr7z9iJ4zSUDM2c
	/OxdEbHdc9Y49dsm7ifzU9jzEjm5yAnSQveLQI22AaRS0JNH2jQ9u5MN3QRMWz7RXZZ9ngBxmq6iz
	T11yZhy5hhJ4VjUAtqYxJiYEAFfHaqaWJ+uLA+hvS/ddC7+430TbYDe8/JR5xCI2JrdXsy3rOy7Bd
	cmeQIGSYYVB3Co9bGXJ51Ms95HyKh3bPf2r46H8kUWJG7jyrRXf4Xy30ex9XTxRFS4+s1dC0A4dWK
	QD8jXii5BHOIY6KKPUlhVGtQFZZPv0ya2Sl94YdOZjKrUk/XGOMblsiMTP0F7pfrrIANsxhnQvsIC
	roGs9yPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55sG-0000000AJ54-0uZD;
	Wed, 16 Apr 2025 16:44:32 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55Jx-0000000ABsa-1YSU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:09:06 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5e67df8c373so6694882a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 09:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744819743; x=1745424543; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mfba1GeK9GMLIuK10iqBPbEuuHDYdzYb65zyVJOFXLI=;
        b=FJw6Udasan2MLgExFYdlBD/2EBVJI59HYEOcoj2nBkO4BnzxFJSwi5N/cpjmSPz/3E
         CZziIAdH23V2N3zQRrtdNDPZufq4V2s1O3acFXgygXdkOpc12Ge4Ub4b24/BnAUBHba2
         VelsT2NIQBa5nBy07nekCyhAnMb+M01u3IqXxhBsLvUWkA6ZPn2LlEF9cGs/sNucgtKN
         15ckc9ABKis5/QNqM4mdV/0u83kx/NvA9chrk77VYoM9N5BfBTUadT92PCREVJjMCaPN
         LvASubQyfdU96nl/PjfMY90CxvJRxVAcp+bmjxwZHaW22z5+gGQRUxrGmD+l4pNLVPVw
         wqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819743; x=1745424543;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfba1GeK9GMLIuK10iqBPbEuuHDYdzYb65zyVJOFXLI=;
        b=aQ0yHFJAzzlEw27+0aqfASsRfhV5dJdiML4VK9Sx3u2yk9sJu8Uj4W6Lmyd3kA1Pwu
         9+JCta8fwSjtgwwhrMW+Et3ZQ74LaUSJ7vU248Q5T5PeD2epC6VhUNRdBglkt3kKwUvg
         li1MNrdwYQDWswwLP8YxsOGOYL9D/ujOFoEh96KgLyzbuAMbQM1B4SUneA7039lGDGhW
         E/u9StE907DMKF7ow6kVg+7RJZfn6Wx3Tr+E8Bmt6eUgdTKWbm8TIUh/TaezHKrwKmZi
         OQcgYY+u14i2WxRTdpo5XXlrvKVfD9pVR426azgihi1MU+Xz8877vwiHjjyeNnNxqNPK
         9ZOg==
X-Forwarded-Encrypted: i=1; AJvYcCW5yJhnQXoj0hkOyCAo/jjIddaEOIFJEFld/7FlieKgZ+wV4jzP6U3sHx2u4X6NQ+G11h0xMevpLRPLZXfaBUlm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu0jRWLjfG/6fyFCdYK2vAgZGil8Dtak+PIEijmHiwOm6UHQy1
	LxBoCJC2Z39LgYuBDyOKvL30cXToPg6cGO1RZ+Q5h3ERD38x3ma8EVSpY1EXjknIdGXHXJfzbOr
	qKd6yfw==
X-Google-Smtp-Source: AGHT+IFrirfEQ7dHJWyLJg2ZMILHkZARW2nYQJNuhY9BP7hpLfrguWr31PwCDRv8rbgrpnP6p/6BoAlGjXT/
X-Received: from edud12.prod.google.com ([2002:a05:6402:c:b0:5e4:d4fc:4841])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:27c9:b0:5e4:9726:7779
 with SMTP id 4fb4d7f45d1cf-5f4b71ea77emr2046677a12.2.1744819742333; Wed, 16
 Apr 2025 09:09:02 -0700 (PDT)
Date: Wed, 16 Apr 2025 16:08:56 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416160900.3078417-1-qperret@google.com>
Subject: [PATCH v3 0/4] Selftest for pKVM ownership transitions
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_090905_413782_CC16A270 
X-CRM114-Status: GOOD (  12.71  )
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

This is the v3 of the pKVM selftest series, v2 was here [1]. This series
depends on [2] which moves the hyp tracking to the vmemmap. A full
stack on top of v6.15-rc2 with everything applied is available here:

    https://android-kvm.googlesource.com/linux qperret/pkvm-selftest-v3

Changes since v2:
 - rebased on top of v2 of the hyp-state-in-vmemmap series [2];
 - thanks to above rebase, dropped the PKVM_SELFTEST kconfig option and
   folded the selftest under the existing NVHE_EL2_DEBUG;
 - fixed commit message of patch 02

Changes since v1:
 - added support for testing NP guest transitions;
 - added .data section in pKVM to allow using non-zero globals (needed
   for previous point);
 - dropped superfluous WARN() from __pkvm_host_share_guest() which is a
   pain for testing;
 - updated assertions for hyp/host transitions according to the
   discussion on v1.

[1] https://lore.kernel.org/kvmarm/20250225015327.3708420-1-qperret@google.com/
[2] https://lore.kernel.org/kvmarm/20250416152648.2982950-1-qperret@google.com/

Thanks,
Quentin

David Brazdil (1):
  KVM: arm64: Add .hyp.data section

Quentin Perret (3):
  KVM: arm64: Don't WARN from __pkvm_host_share_guest()
  KVM: arm64: Selftest for pKVM transitions
  KVM: arm64: Extend pKVM selftest for np-guests

 arch/arm64/include/asm/kvm_pkvm.h             |   6 +
 arch/arm64/include/asm/sections.h             |   1 +
 arch/arm64/kernel/image-vars.h                |   2 +
 arch/arm64/kernel/vmlinux.lds.S               |  18 +-
 arch/arm64/kvm/arm.c                          |   7 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   6 +
 arch/arm64/kvm/hyp/nvhe/hyp.lds.S             |   2 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 198 +++++++++++++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |  12 ++
 arch/arm64/kvm/pkvm.c                         |   2 +
 10 files changed, 250 insertions(+), 4 deletions(-)

-- 
2.49.0.604.gff1f9ca942-goog


