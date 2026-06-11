Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99849CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BD4ZiLw2q2GCJI2/AVfMMRUM2DNcD4XHKmAqREpv/88=; b=TM9QHjEJpVlec0lqySPydt/t2p
	ilwePMqH9LKjor4S35kqGOoAp7d+A12RzSWGuqN3eZc7PfPxw+WSCKHhSPpgCR3lRJnL4sjFIormf
	8T0PTVzAGiuSKdSNNtxTj7ofdpvf7QWeGSs/a75Yjwgnk4K+QDFvTUWdyEWWLeEJWoReKlLiNpj8K
	UFMb4X3PDJTQELmbSyIRtr0RCEUWPIzUaT99VKxXx4yvk7xbH0y1bhOaOKJp31UfomOqHKHOojH75
	Phge7Pe/eRc05SvfeYTwKEfiBXONzBzx9Ag6EaWNvb/iDpMN2u6ZmdtCSofuOAjMqxQFtKXmmX+Fg
	fD/6yEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf2f-00000009STM-3iPo;
	Thu, 11 Jun 2026 13:01:53 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf2d-00000009SRs-18xi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:01:52 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-68b6f4f3c06so8106047a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 06:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781182909; x=1781787709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BD4ZiLw2q2GCJI2/AVfMMRUM2DNcD4XHKmAqREpv/88=;
        b=rcO3jMXVMgPoiEeBxeuiOAAW7HIqK6X+1wskIOrfWH9SmoAqcUqADp5mysu5CLS1G6
         WE10mwNTVD4cGQl+PcQbJpfF52vlKQKV/inij8XWoVR/wNJ5EANZdyq7Lwyn265tpxnQ
         jFZh4OzFR0fPo60rQCV4AxJU9/xie/wpVRJEzuSd96z3wt4D6HByjWKKqwc49de8K7Dl
         oVwvsU5veWW+drsFc7JIsN+nKwuxsNRGi07yO1U0wwruZoUiV16E33Ad/Lo+3ekvpR+4
         ViyNeGYMHMSpz5qkxkEVR1YcH12cNATrEjkSNtkUWqA48/fLRjkZwQoterCqcnyz6kch
         Y/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781182909; x=1781787709;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BD4ZiLw2q2GCJI2/AVfMMRUM2DNcD4XHKmAqREpv/88=;
        b=n8myPs+bt5vINMnuJK3ADMWkH2r1VXIJs5B7vBqY9DNu15x1CEVzscjjslaopw24RH
         SNnJ2/14skLNK6rlmGlxHj5Sekjc6adnd7TnYuN+eRsOq1dgQH5RSjJ5rSliKwzzgicg
         qKi37TQC7Mm4ahm+cXK2FQJcveznwgmHQjpirUuCwtWE6ekLaBiHdpNH69nQkDy80a0a
         79taYzQqkZKF38BLeOfykS3W9NHkGE4dwC+rtCTMuTBeyCFkpNy6MYtG6I8/DFCng4k5
         I/VOxfo9IcDYfzqlNl+luBgmYBc9wbqq94P4OYkGgwOwJZW6bgrXbL3WoMz6bLXiOIhF
         FHSw==
X-Gm-Message-State: AOJu0YwegrZtkpHXiliv/fj4p82yDcvm+pUss8WcHKaJnz7otoYt6voh
	xuhJYVPrVwsRa/NiTBcQ6zBIdN+U4Ye9L8AEaN8zJngggAfWQQ9JDPHvRn1o8uMDF31y5PL+3iE
	icU0LYYtu8TaN8AlvRSqpFH+XEymMBlAdup7I6v2m3sxM59NdhNsWakfeo8Hc2oM5zJFtEH+JL5
	SoADELK9Q7sAyRVCzriFvPHvdrh6pC8q81BjZvTQ60Pc/f7Jv/3lhIFHaZaJz2
X-Received: from edqo12.prod.google.com ([2002:aa7:c50c:0:b0:680:6e15:ab62])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1ed4:b0:692:4759:ac57
 with SMTP id 4fb4d7f45d1cf-6930e26599dmr1393742a12.2.1781182908431; Thu, 11
 Jun 2026 06:01:48 -0700 (PDT)
Date: Thu, 11 Jun 2026 13:01:38 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260611130144.1385343-1-abarnas@google.com>
Subject: [RFC PATCH 0/6] arm64: mm: Introducing ROX CACHE to ARM64 systems
 with bbml2 no abort
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org, "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Yang Shi <yang@os.amperecomputing.com>, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_060151_337287_CC1973F6 
X-CRM114-Status: GOOD (  17.48  )
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

Hi All,

I would like to propose the introduction of the EXECMEM_ROX_CACHE feature
for ARM64.

When the `rodata=3Don` kernel parameter is set, all executable and read-onl=
y
aliases in the linear map are forced to be read-only. Originally, this
forced PTE-level mappings across the entire linear map, causing a
significant performance regression (greater than 10%) for some workloads
due to increased TLB miss rates and deeper page table walk.

The `feat_bbml2_no_abort` (FEAT_BBML3 in ARMv9.7) feature can be
utilized to mitigate this regression. Because we can split memory
mappings without triggering TLB conflict aborts, kernel memory permission
adjustments become possible after early boot without forcing PTE-level
mappings across the entire linear map.

However, when applying read-only permissions to kernel module section the
linear map can still became fragmented due to the scattered physical layout
of the underlying pages. To address this, EXECMEM_ROX_CACHE, which was
initially enabled on the x86 architecture [1] for this purpose, can be
used on ARM64 as well.

EXECMEM_ROX_CACHE works by preallocating PMD-sized contiguous blocks to
act as a cache for .module.text memory. These blocks are initially
poisoned and made read-only-execute (which simultaneously makes the
linear alias of this region read-only). When loading a .module.text
section into memory, the requested cache region is made RW, the bytes
are copied, and ROX permissions are restored.

To take full advantage of this approach, after restoring RO permissions
on the PMD-sized linear alias block, the PTE mappings are coalesced back
into a single PMD entry.

Testing on an Android device running 6.18 based kernel with rodata=3Don
shows an average 20% reduction of level 3 page table entries for the
linear mapping.

This implementation currently works around some limitations of the
`set_memory_xx` API, which might be relevant when considering the
refactoring proposed here [2]:

* Because the execmem_cache operates outside the linear map, its
  permissions could theoretically remain untouched (poisoned and RO)
  until the cache block is fully emptied and freed. However, we currently
  lack an API to interact exclusively with the vmalloc area (e.g., setting
  it to RW) without simultaneously setting the linear alias to RW.

* Additionally, set_direct_map_valid() has somewhat confusing semantics.
  It is used while "cleaning" a cache block (after confirming it is
  entirely empty). The linear map region should be returned to its default
  state to restore writability, but set_valid might just set the "valid"
  attribute (as is the case for ARM64, which I have temporarily addressed
  here with a workaround).

I would be glad to hear your feedback on these changes.

Best regards,
Adrian

[1]: https://lore.kernel.org/all/20241023162711.2579610-1-rppt@kernel.org/
[2]: https://lore.kernel.org/all/20260219175113.618562-1-jackmanb@google.co=
m/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Christoph Lameter <cl@gentwo.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
Cc: Brendan Jackman <jackmanb@google.com>

--->8

Adrian Barna=C5=9B (6):
  arm64: mm: explicitly declare module and ftrace execmem regions
  arm64: mm: allow huge vmap permission adjustments with bbml2_no_abort
  arm64: mm: fix restoring linear map permissions on execmem cache clean
  arm64: mm: add helper to fill execmem with trapping instructions
  arm64: execmem: enable EXECMEM_ROX_CACHE on supported CPUs
  arm64: mm: support PMD page coalescing in the linear map

 arch/arm64/Kconfig           |  1 +
 arch/arm64/include/asm/mmu.h |  1 +
 arch/arm64/mm/init.c         | 54 +++++++++++++++++++-
 arch/arm64/mm/mmu.c          | 95 ++++++++++++++++++++++++++++++++++++
 arch/arm64/mm/pageattr.c     | 46 +++++++++++++----
 5 files changed, 186 insertions(+), 11 deletions(-)

--
2.54.0.1136.gdb2ca164c4-goog


