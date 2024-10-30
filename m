Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89A4D5CC88
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bGuQbCJqzSWR/P9KHK12m51X+pkq64dpNQ+veH3h4CY=; b=SJWOAVx5kPqJo0aP5kktPhQsZt
	geTLEPAgij05RmSWtrezBewNgHwsezm63zv+Bmfo6yEvuHOmeLuLtJSyRVEGu8ZZRjFcgAiB9E+9O
	Vi3+aOY+R2yPb1mQn3MOTargp3+Gyel/efrLpWL1HdNH7vt7N1J7v/21/29Y4mvKkHi2dy0+v9A1q
	Z5haDe2hhJPb08KBi+T21uU9bNfcmAiD1UGc64EU1EjoNmBb1ZWrNExa24w1eBnfUvhfE3ZzqyAXC
	xyGUgRkaWBvxTgoa4Vi7rqFl00hcB+2afkwi027eVw5KBzjDjcQjdNdDaXAI6YzbUGkNTt7ey5MQo
	ILPvYVRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65oB-0000000HWri-25D3;
	Wed, 30 Oct 2024 10:20:11 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65mW-0000000HWVY-2zbn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:18:29 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e293b3e014aso10335142276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730283506; x=1730888306; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bGuQbCJqzSWR/P9KHK12m51X+pkq64dpNQ+veH3h4CY=;
        b=G5LYsir1AUjMvOdlOhcE2SUgSypSt3u9Ey7iwbY3yhInwR5EP2vsd5KXW/w4lKrieW
         sP4su1oh+92gy7wf8DRF785GxRprosqHrb9OfwpYKCus72ahPTDnJsSGoiOutgOEvhIn
         HUKXIPWfnbJpSFANpjMMKClyMtESoCpBv+yghs10wV9gw1WJe/MKmclDbxRa6pleVGPp
         TuyCYNMKOlbn5xxpvnOJKmgyc3PecTEqPCnJF5GY4tMxj7FL/OJlVviyjsw6ifUmYxRb
         Z4EopnHD/MP/NdCGMENAX+gsK9Nsoedqw2O4WLoiXoqdj86wipWfXtWHcl2xNqz1lIs/
         F9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730283506; x=1730888306;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bGuQbCJqzSWR/P9KHK12m51X+pkq64dpNQ+veH3h4CY=;
        b=QNq2Bd7y2q/+A5WRlvt2HeUJJoCDcM92dBeO8enCYDmj8iWfrvBADhQwb0MFf0/VQv
         Xa2srLd60RzYA+w6Aco4dF5T5NJNI/xkTEVXMuwBXOJqE3F2bYq3P3sSBpFAWmLHT3Rp
         QINlB/4XPjDoChXCMETBDlzVRXSNmscz5Vd75P/SSgvg0UkRD/ga77rxLa8cUSiZhCwj
         e1CKeUK5bk4YtTsRhdan3uD9xTOClB/3xtYGowvAxfRZ3ITPCIklBQRTiTQZnf84AwNr
         UVkPAYG5XrQWs64i7ngpJ5s50+OkcI0rLas96dewnBYBsw/mvbvel7Lma/7U8A2z4RSN
         EkqA==
X-Gm-Message-State: AOJu0Yy91UIN4PFpgdL/nuxL50exhBjo9d2E5zNT7ymbRGUcL4NUrEu+
	JMIoMb4Y0iLhsbYAzxG+nebYvWO9du5pf7ZtU8lx21DG56VU0V0aLlSGzr93eUGvPKHP0j8u/jn
	QbLfo7gulEEAOapl/JqVzaVe7W3/mMbhZd6wSei0384OLahB+Q/XyE4ixI4ODeG5gnSuxkf6IX8
	UJempbAFUNJ57OkCw8+OqoS861D/yP2kaWB9Jzlfb7
X-Google-Smtp-Source: AGHT+IHtlhBLo3bbEhs1wF7v+cIpaCJgFs3yINNS6BC1NQanIJtbkye+dpCYL0tYjl6tOSWNY4FY4k9o
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:6902:3297:b0:e2e:2e79:207c with SMTP id
 3f1490d57ef6-e3087728d56mr13735276.0.1730283506265; Wed, 30 Oct 2024 03:18:26
 -0700 (PDT)
Date: Wed, 30 Oct 2024 11:18:04 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2684; i=ardb@kernel.org;
 h=from:subject; bh=nOLFU4fVeqjBBVbYqOn8j3eNn//s20k3b7v6vSDc/tE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV2J/c7HrMULbjVuyex5a9d5ZUr4lSvt+iHzp0+cMWeP8
 Ja1sakCHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAi/+cw/LPs268tdWH/guai
 PT6aD5hNrvE/EdHRPiJ7appPyjJT3zuMDH8MJxotVSoPZu6fd76/vWDlnQq5XJ6HH1o+Xto7YVH AEgYA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030101803.2037606-10-ardb+git@google.com>
Subject: [RFC PATCH 0/8] arm64: Simplify VA space configurations
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_031828_779990_0FB68D07 
X-CRM114-Status: GOOD (  13.95  )
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

From: Ard Biesheuvel <ardb@kernel.org>

For historical reasons, we currently support many combinations of page
size and virtual address space size:
- the original arm64 port used only 3 levels of paging (4k/39 bits), and
  the 4 level configuration was only added later
- LVA support on 64k pages could not be disabled at boot, and so it was
  added as a completely separate configuration, even though the number
  of translation levels is the same
- 16k pages gains only 1 bit of VA space when going from 3 to 4 levels
  of translation, and so both are supported
- 16k/36 bits is supported under CONFIG_EXPERT, but 36 bits is a bit on
  the small side for the kernel.

Let's simplify this, by
- removing the configurations that are also the fallbacks on LPA/LPA2
  capable hardware,
- converting 36, 42 and 39 bit configurations into reduced definitions
  of TASK_SIZE, while keeping the larger VA space on the kernel side,
- dropping 16k/48 bits altogether.

The remaining configurations always support up to 52-bit virtual
addressing on the kernel side, and implement the reduced userland VA
space sizes by skipping levels when programming TTBR0_EL1. This is a
quick and dirty hack, but sufficient for the purposes of this RFC.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Kees Cook <keescook@chromium.org>

Ard Biesheuvel (8):
  arm64/Kconfig: force ARM64_PAN=y when enabling TTBR0 sw PAN
  arm64/Kconfig: fix ARCH_MMAP_RND_BITS_MAX for 52-bit virtual
    addressing
  arm64/Kconfig: eliminate 64k/48-bit VA combination
  arm64/Kconfig: eliminate 4k/48-bit VA combination
  arm64/Kconfig: Drop support for 47-bit virtual addressing
  arm64/Kconfig: Drop support for 48-bit virtual addressing
  arm64/mm: Use reduced VA sizes (36/39/42 bits) only for user space
  arm64/mm: Account for reduced VA sizes in T0SZ and skip the levels

 arch/arm64/Kconfig                     | 89 ++++++++------------
 arch/arm64/include/asm/assembler.h     |  2 +-
 arch/arm64/include/asm/memory.h        |  4 -
 arch/arm64/include/asm/mmu_context.h   |  9 +-
 arch/arm64/include/asm/pgtable-hwdef.h |  2 -
 arch/arm64/include/asm/processor.h     |  6 +-
 arch/arm64/kernel/cpufeature.c         |  2 -
 arch/arm64/kernel/head.S               |  4 -
 arch/arm64/mm/init.c                   |  4 +-
 arch/arm64/mm/pgd.c                    |  9 +-
 arch/arm64/mm/proc.S                   |  2 -
 11 files changed, 52 insertions(+), 81 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog


