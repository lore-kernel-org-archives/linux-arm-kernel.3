Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7950FC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 23:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=02v14PG2SlJYKfKrfbG12osm5mwtOvoFMeYGogboA68=; b=zBzLlGE5NwuiugkK/z4BNw7Txg
	sRFstEBz36piGv0JGJxBjVBCYZ5ZPaW4auJ/ea8i2mxnNA0C/xkqtWVt1CbQlChqGKJ6k9hMvkSFI
	eaKl9WToNXgAyNL4vbeyBTwV+FiFSoiRO+DiWDvqmbRd3NCoKYREeR5ya/ol44pdu/E1TSeQ1AfTI
	AVsAcBkHeMR5HoQLW7236a4Fhb8CEVov3tb0Jb4PoZoBu7r/avtPDE8HlE1/DX8zu1oY4AXWNLJOJ
	8m/LqYh9eStFrTyX4wF2C0JL7bCs9IpikrzNDurh3p9+fEtuyKPKUQBybABp+tQxZMevVhlOwqKVf
	pyzwp+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubodE-00000006Mc4-47xs;
	Tue, 15 Jul 2025 23:00:16 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uboan-00000006M0s-07Fn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 22:57:46 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-311e7337f26so6063090a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 15:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752620264; x=1753225064; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=02v14PG2SlJYKfKrfbG12osm5mwtOvoFMeYGogboA68=;
        b=r5WKBVzEIXnllilBmjSKa5Dz4D+uLlP+imrDZEc03Ju3kSLi5zOXI+QBnGXFpfO7a1
         8NKUnyydeiLENRxc3qmv2HNfB+Z2D5hTJ0vnA8hZ0lq+8rF8Dp2gZQIm106lN08u+y5c
         ejO+jiQF4xMmUVlBsn4sSvt9UZSycxQzrpJBgDG/P5zPZO1jVHBXE5Rb/yF7/FiIMQVz
         Kbn9jxrunA4GXgtmx+zB1jOLchgqGB81zNOFRlzq1OZRbyE8b7FYc9ewph40EUl6dCaj
         sdauqKWX9YEpc0Tvhf3koLZIHIHcCOREmiuRib+ujlWk6RW4vCvxWroWYIWkCcL0rXvd
         ui2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620264; x=1753225064;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=02v14PG2SlJYKfKrfbG12osm5mwtOvoFMeYGogboA68=;
        b=GET5vCh+L6ayxwNSySGeiId1RpZS0T6XaVG09LrSS29xlmX1tQ0EosrwCScAYYPC2+
         ma0yAVcltsnQR8P6F+RysyCXAkdzIDIJAKxPZfTl1PQDWCRcisq+onsuXFS645C+pPLS
         zE4U0Z66drXpBfPqk3fBUu757ViemnA6YsHj/WwuRgyjtxKTjWayV7RyNjSpXgOQXfRc
         DoS+u7BDI/ooNVSgvXmDudd6oQGbvby3GWoGcjSg3V/79VTRjLRSqB0bf6QJ11KmD7im
         fX/XRJcuci8Q7OCKC1Xu+wXgaVo8peQGsi5Dk1Ypz7837ZyiwS3d7Rd1kKe28u4QD7Y+
         rOTg==
X-Forwarded-Encrypted: i=1; AJvYcCVYMlQBP4/BxNQBQHdkhv3vuH+AIc6HA45QrFBvWhSOQ0chnmuh7Ni6zPTnH0m6KeZRi/KL7lq0Pc7jR/9RV0M5@lists.infradead.org
X-Gm-Message-State: AOJu0YxiQZsCMYqF7Z+CcoiYBUWt5gi7Q2u5yjyy0tI4DrPuSHrAAke9
	V6qG+LfY/IzTCpG5nMHveZy4N1e9ZM3/o4RTMs5HNpCdPSfTdU6EB+fBgOAMxxuikIVTXRlW2N5
	AT0rY6/T3mjKZXwSRyXh8cPPkhjHqew==
X-Google-Smtp-Source: AGHT+IFmKJQBRdaQUFmCTWk9rJ+t8UKoGImBBOF3tHsLyMLW5hYcabvIQuRaVHMmT0fhN+zjD/JrNn7PN0vOapR7eAc=
X-Received: from pjq16.prod.google.com ([2002:a17:90b:5610:b0:311:485b:d057])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:57c7:b0:311:eb85:96df with SMTP id 98e67ed59e1d1-31c9e75b966mr1351563a91.17.1752620263599;
 Tue, 15 Jul 2025 15:57:43 -0700 (PDT)
Date: Tue, 15 Jul 2025 22:57:34 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2546; i=samitolvanen@google.com;
 h=from:subject; bh=G1ncFmWqHiHwP7omxWzFU6wr0dg9BZPf3WQI0K2rUeM=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBlld+59uP5AfIa1edjR3s1vD+T5vwsrP5j1IL9s+9WT4
 evlvafu7ChlYRDjYpAVU2Rp+bp66+7vTqmvPhdJwMxhZQIZwsDFKQAT0U1hZJi2ZtrNywfe7dZc
 +775SuDe+ROv3bz+v7Lij5f9v88RsZuPMjJ8zEndNHVF9Wudz1NKQx9Mrtt2busPpVmHBfJjIix qj/zkBgA=
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250715225733.3921432-5-samitolvanen@google.com>
Subject: [PATCH bpf-next v10 0/3] Support kCFI + BPF on arm64
From: Sami Tolvanen <samitolvanen@google.com>
To: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Maxwell Bland <mbland@motorola.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_155745_068141_870A9805 
X-CRM114-Status: GOOD (  16.22  )
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

These patches add KCFI types to arm64 BPF JIT output. Puranjay and
Maxwell have been working on this for some time now, but I haven't
seen any progress since June 2024, so I decided to pick up the latest
version[1] posted by Maxwell and fix the few remaining issues I
noticed. I confirmed that with these patches applied, I no longer see
CFI failures in jitted code when running BPF self-tests on arm64.

[1] https://lore.kernel.org/linux-arm-kernel/ptrugmna4xb5o5lo4xislf4rlz7avdmd4pfho5fjwtjj7v422u@iqrwfrbwuxrq/

Note that in order to enable CFI for jitted code, we need to define
__bpfcall in a file included by include/linux/bpf.h. In v10, I'm still
adding an include/asm/cfi.h header file for consistency with other
architectures, even though the file no longer contains anything else.
If you'd prefer to move this to another header file, I'm certainly
open to suggestions.

Sami

---
v10:
- Rebased to bpf-next/master again.
- Added a patch to moved duplicate type hash variables and helper
  functions to common CFI code.

v9: https://lore.kernel.org/bpf/20250505223437.3722164-4-samitolvanen@google.com/
- Rebased to bpf-next/master to fix merge x86 merge conflicts.
- Fixed checkpatch warnings about Co-developed-by tags and including
  <asm/cfi.h>.
- Picked up Tested-by tags.

v8: https://lore.kernel.org/bpf/20250310222942.1988975-4-samitolvanen@google.com/
- Changed DEFINE_CFI_TYPE to use .4byte to match __CFI_TYPE.
- Changed cfi_get_func_hash() to again use get_kernel_nofault().
- Fixed a panic in bpf_jit_free() by resetting prog->bpf_func before
  calling bpf_jit_binary_pack_hdr().

---
Mark Rutland (1):
  cfi: add C CFI type macro

Puranjay Mohan (1):
  arm64/cfi,bpf: Support kCFI + BPF on arm64

Sami Tolvanen (1):
  cfi: Move BPF CFI types and helpers to generic code

 arch/arm64/include/asm/cfi.h  |  7 +++++
 arch/arm64/net/bpf_jit_comp.c | 22 +++++++++++++--
 arch/riscv/include/asm/cfi.h  | 16 -----------
 arch/riscv/kernel/cfi.c       | 53 -----------------------------------
 arch/x86/include/asm/cfi.h    |  9 ------
 arch/x86/kernel/alternative.c | 37 ------------------------
 include/linux/cfi.h           | 37 ++++++++++++++++++------
 include/linux/cfi_types.h     | 23 +++++++++++++++
 kernel/cfi.c                  | 25 +++++++++++++++++
 9 files changed, 103 insertions(+), 126 deletions(-)
 create mode 100644 arch/arm64/include/asm/cfi.h


base-commit: e860a98c8aebd8de82c0ee901acf5a759acd4570
-- 
2.50.0.727.gbf7dc18ff4-goog


