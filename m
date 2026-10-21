Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F1C606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T65D2EV9;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gf0Hkru3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z2i7Do+cloqJgPeb5aYLDs8IqOGcJVVvWxpYdA4Y6+Q=; b=T65D2EV9SQTzWPXj8JTJYRAmpn
	3UPxeP4jgUqmbQzy0uHCLh/gNphg3gqWBjDKcXaAp3l65hU6QAvQOSsUqMMjq2R9v9T0MXdJaTZS6
	pqBKEurEjPYUUkHn/pw3cvT14U2ToNnnXTv6SlMBYC3a8eJ1F29Tb8Mj0BOfAUE/XTZEYwNm1Ba5p
	3pVf2DKWZXvPqtSTVJndkMHPgXzERykcb8lY8SnWHukiefzjYgH6KlsFU+YPj8uPdxa6lRtoE5QUf
	f1N8heks9sVdylpnuzz/e1j+/KgrYLLQDrSVsYQjFcBWDm/J0ye9Pq/4cqKkDlKtUNDBvbQgKRb0C
	wB5WNsag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRiU-0000000BM4S-1JXx;
	Wed, 21 Oct 2026 08:30:34 +0000
Received: from mail-pz2-x08.google.com ([2607:f8b0:4864:3b::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRiR-0000000BM3q-20Od
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 08:30:32 +0000
Received: by mail-pz2-x08.google.com with SMTP id 41be03b00d2f7-cd613507bd1so29359a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 01:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571430; x=1793176230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z2i7Do+cloqJgPeb5aYLDs8IqOGcJVVvWxpYdA4Y6+Q=;
        b=gf0Hkru3iIdGFDDwvJYg47k4M9nMh9G8g/GYscmqywujLj6PbIwJnHQw7Rx3gncj1z
         Fm8QD+Zs4PKRl8PigDKw+iqxaqUolT8Kj58k8yAGk3Gq7PwX8W3I+0JP5xXUKSNl7mxH
         BahmQ5j1lPJswPifcbmkGO1xvvHdptVt/52/KWoATpi6yZCTxfTBkKQNqZQ5njmX1YEl
         gkU3CG/DpBdZaM6Ligxw48hU88fA7ZVqZvgumUB6n/AfGTSUHbjIkHt5Q9UlnQx2Zs7E
         Sug1JlGsU+JPVXJlkcQiISAV3Ij0bQASJXNccZkoactuD42uRFynSEDbyOncyoBK3kjA
         u41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571430; x=1793176230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2i7Do+cloqJgPeb5aYLDs8IqOGcJVVvWxpYdA4Y6+Q=;
        b=IMyw9yGZrO3EFG9L3eRYStjCBB/rVKO9HfNvtQKSYWaeqDdyCysT0KxMTcK8O24+JV
         o9f1SMalzzhML7kwRYVcRlawnHH8pxNotyDAz0YKDOGAhD4VoXwUOENVa9Sm5q4FbeLo
         VUJ5j3LczT+RL0RWKBHM72+xBj8vxFyM8WofU35gLmnJe5KpsIS5hU2o3ckHYqpkAePO
         mjWBQcKQ4seQHWVTkHbgnIryzq/LQW5a8TFI3Ac3YjLRnBJhmx+y2+oolZYYqB77Qrpq
         vzB+25DMbW7NtA18935C1uo7giRffKJQ6k0q8Sx6Xkid6qZrV/1zONUXtgS1t5Geb0Hs
         1svg==
X-Forwarded-Encrypted: i=1; AKwUvByL2J8q5ExMPChixp/7sMTPWiqohLPPW3JwGRhb9PGH87InkN3AnDoIQBghZKpaFRe/rjs3Xxu76uwCQ6qQ4w+q@lists.infradead.org
X-Gm-Message-State: AFq9FYK7PbR2WX91af4h6uxxyVFYDdbVZp1kuO0L/RUdd3ExzJV2UOsK
	oAekNXxgGdx0SUCycJ5yTzpCdLwdegAepCacnRKqaoPMBZ0OyzbLtDiZ
X-Gm-Gg: AYBFou3mYOpWWa4R9HUP8gwlXnRH80SkDe1s7QSczMyDVTYpG92XQ9G2TsNPcbT2xyZ
	mdDGveaaLAm36K5Jm2k/WxGQLVOtDzaIQtd48RLQ7MMXgirMV8bZVOwpNtSFJRdf7e6Nd9+hkLt
	nYgO7CFQn1I1HAGuB5sJsOvqdg0S2v/5dWBXceRI4zpZmBfICVQ5LLyQdZ+lkW7HNEolzDiY7Q4
	bgvVb/XkHhfyBOIHl1TXk2kKcEE8GrB0+pKC61klU17tiiSay40Dqoc2N8o521FdGsXFnFD3Rql
	ESRgCB7YnoCjP+U2P4Mulk/apoau2iQEm4CYcAABAY3nFXrszNTZve/k54yAMlyA9ZZHdZr6uMt
	H1cuX5qNx6n0pBX7I4KPiZbS7m/n1evRErb4EX7AZ/9B/2Nd7/jjOth0ngm6kKM9mcFg0RQoptW
	Z2bney9k24CHQmnlsmGrYst4plSTXJKSCryzf8I+8LqDSa5FhGBponBBXjXjZbx4icvbL+aSlzF
	zX4DoUOGHx9PWtRGXKkkOn7zEVuyZByoxD968cdX19z0EiYvRgpS5xrshrBoYWhoLNS
X-Received: by 2002:a05:6a00:918c:b0:8a0:2344:c44b with SMTP id d2e1a72fcca58-8a089d5de3cmr958437b3a.40.1792571429981;
        Wed, 21 Oct 2026 01:30:29 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:30:28 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v9 0/8] kdump: reduce vmcore size and capture time
Date: Wed, 21 Oct 2026 16:30:03 +0800
Message-ID: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_013031_525828_6FA75E94 
X-CRM114-Status: GOOD (  20.28  )
X-Spam-Score: -1.9 (-)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wandun Chen <chenwandun@lixiang.com>

On SoCs that carve out large firmware-owned reserved memory (GPU,
camera ISP, ...), kdump currently dumps those carveouts as part of
system RAM even though their contents are firmware state that is not
useful for kernel crash analysis.

ACPI systems already filter reserved memory out of the vmcore through
their existing path: firmware reports those carveouts as unusable in
the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
(is_usable_memory(), efi-init.c), and the ELF header builder has
always skipped nomap regions; only DT-based systems currently fail
to filter these regions, which is what this series addresses.

This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
memblock to filter reserved memory on DT-based architectures. A new
flag is needed because MEMBLOCK_NOMAP can only express regions without
a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
so kdump omits them; reusable CMA regions are different because their
pages are handed back to the buddy allocator and may carry crash-relevant
data.

Since the reserved memory regions are filtered out, the vmcore is
smaller in size and faster to produce.

The series is based on linux-next and is organized as follows:

Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to
             memblock, fold the duplicated per-arch memblock walks
             into the weak defaults, and serialize crash header
             preparation against memory hotplug.
Patches 4-7: NODUMP infrastructure: switch crash_core to
             for_each_mem_region(), introduce the MEMBLOCK_NODUMP
             flag, add a dumpable flag to struct reserved_mem, and
             mark /reserved-memory entries with MEMBLOCK_NODUMP.
Patch 8:     Skip MEMBLOCK_NODUMP regions when building the vmcore
             ELF header.

v8 --> v9:
1. Patch 7: Avoid a potential boot panic on SH when NODUMP marking requires
   memblock resizing before it is allowed, found by Sashiko in [1]. SH supports
   neither CONFIG_KEXEC_FILE nor CONFIG_CRASH_HOTPLUG, so skip marking when
   both are disabled.

v6 --> v8 (v7 mainly tried to fix the initrd issue on release in v6,
that approach is superseded here):
1. Stop marking /memreserve/ regions with NODUMP. v6 marked
   /memreserve/ regions with NODUMP. But a bootloader may specify
   a /memreserve/ entry for memory that the kernel later frees
   (e.g. the initrd), and those pages would then be wrongly
   filtered out of the vmcore after being reused as normal memory.
   The v7 fix (clearing the flag in free_reserved_area()) caused
   a lockless runtime mutation of memblock.memory [2]. Better solutions
   exist but need extra preparation, so temporarily dropped the patch
   that introduced the problem to keep this series simple in v8.
2. Fix a build failure in patch 2 with both ARCH_KEEP_MEMBLOCK and
   MEMORY_HOTPLUG are unset. There the memblock arrays live in
   .init.data, and the weak defaults referencing them create section
   mismatches, which turn into build errors when SECTION_MISMATCH_WARN_ONLY
   is also unset.
3. RISCV recently gained crash hotplug support, so adapt its handler
   like x86 in patch 3: use __crash_prepare_headers() instead of
   crash_prepare_headers() to avoid self-deadlock.
4. Update the cover letter per review feedback: describe how ACPI
   systems filter reserved memory and why a new flag is needed
   instead of reusing NOMAP.

v6 --> v7:
1. Fix a stale MEMBLOCK_NODUMP flag issue [3]. Memory reserved and
   marked as NODUMP may later be freed (the initrd, for example),
   so the NODUMP flag must be cleared accordingly. Since the fix is
   part of the NODUMP infrastructure introduced by patch 5, it has
   been folded into that patch.
2. Drop the "generic" related description in the cover letter.
3. Collect the Acked-by and Reviewed-by tags received during the v6
   review (thanks to Baoquan, Mike, Rob and Marek). Patch 5 is the
   only one without a tag, as its Reviewed-by was dropped when the
   fix was folded in.
4. Drop patch 1 of v6, which has been merged separately.


v5 --> v6:
1. Serialize crash header preparation against memory hotplug to avoid
   out-of-bounds or use-after-free issues.
2. MEMBLOCK_NODUMP marking is now done after memblock allows resizing,
   avoiding a panic from too few regions before resize is permitted.
3. Reordered the patches, put pre-existing bugfixes earlier in the series.

[1] https://sashiko.dev/#/patchset/20261016061549.4181390-1-chenwandun1@gmail.com?part=7
[2] https://lore.kernel.org/lkml/20260922090252.B01541F000FF@smtp.kernel.org/
[3] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org

v5: https://lore.kernel.org/lkml/20260806093519.2907771-1-chenwandun1@gmail.com/
v4: https://lore.kernel.org/lkml/20260630074715.4126796-1-chenwandun1@gmail.com/

Wandun Chen (8):
  riscv: build crash_mem ranges from memblock instead of resource tree
  crash_core: fold duplicated memblock arch hooks into the weak default
  crash_core: serialize crash header preparation against hotplug
  crash_core: replace for_each_mem_range() with for_each_mem_region()
  memblock: introduce MEMBLOCK_NODUMP flag
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
  crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
    header

 arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 -----------
 arch/riscv/Kconfig                         |  2 +-
 arch/riscv/kernel/crash.c                  |  2 +-
 arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
 arch/x86/kernel/crash.c                    |  2 +-
 drivers/of/fdt.c                           |  1 +
 drivers/of/of_private.h                    |  1 +
 drivers/of/of_reserved_mem.c               | 18 ++++++++
 include/linux/crash_core.h                 |  2 +
 include/linux/memblock.h                   |  9 ++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 53 +++++++++++++++++++++-
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 16 +++++++
 15 files changed, 103 insertions(+), 94 deletions(-)

-- 
2.43.0


