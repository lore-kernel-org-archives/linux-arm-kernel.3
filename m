Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4900CCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 22:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qZy30c40uMQ+C5mAmU5IprjDTVrN2KgzxusGEfWx0IE=; b=GlmHDKKBtAvwrcup12WYXmX5cy
	jTRGK/vh8wXtwEEcbwa/eYJ/TlWKTvhVyypPdpIccObWruXp6g9LIUHLdkhC5yBJ6H5Qifp2HVESW
	PgtzwEg+bCN2K2dux/AAlFz1HUj/JH4tQj8y3xp99iUFwOAbCcQ7OBgmBzPN80NSKXTsjo0scjoj2
	UuTvmEG4vsOvKoUi5UFgA5HstY8nJ87x5cVm8mLLiur2IeAWOxFV3X5dIllOtcfma3VP6yLu3DV5N
	LXGLDBT83AUrBTXWF28InMfr1iMMu0rDRoyI/t0Q56FCB8trjib2VwUknBACBHE74Kj7le4bnptIa
	JciTk54A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwIX-00000007pb8-2tTo;
	Wed, 03 Sep 2025 22:49:49 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utshi-00000007NTd-33ms;
	Wed, 03 Sep 2025 18:59:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24456ce0b96so2498285ad.0;
        Wed, 03 Sep 2025 11:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925974; x=1757530774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qZy30c40uMQ+C5mAmU5IprjDTVrN2KgzxusGEfWx0IE=;
        b=jh92BI87VrKXzyWMtAfTheh1SO0RtWUdXQzfKTeVQZpMvqXPsgF1mgjVqxD2lvMajQ
         8R/GmnjUGWCOinbKmMJShGKg7Xxn+x4Usn44lgk6/1k83OCUr+j5JPw/okPxxFr9brKl
         pZJo9MGapaTZ6FRg/OHmqQIXgMcS9fWFDcC9Yl7i7dQNiM4w0nuEugEv4PKSn56iZI6O
         j8HA0Cy19UYLKkRHIpGIow3tl+RWmPcTGMymyOz1mcbQCoIDJzY0ctOFdlOOIUn3qSiW
         WhZK8GxwyRcr4rcbb14sqmWa9N9ZPSilgzTBf6aLAlGjBiV2mfnUKYKi0wySL8kyyQQY
         A2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925974; x=1757530774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZy30c40uMQ+C5mAmU5IprjDTVrN2KgzxusGEfWx0IE=;
        b=SHbN2Dia5hYrb85pri5k+ytAiK3+frpST7pW0I/nEWjxgPgvaSuyMOAGHTCZuLe871
         BM8XcbjOY9ZAGLEBXP2diwSP3dY3ZDaimWFY8fgRmKnkqK9cMB16yUi6SLsx3lcasoHq
         AHVetniGkGpvAc8Q30eIghS961cwwGxmdJZixu+zZ0KNwrEli8Jlkj1LP2TF9xKLJifp
         W1BosE+PdIrZa6pIca/UXDu61RB8WsE7nhAsj7mCvsM/rxOaSomuwAx3kZN50aRzK3qV
         UhM9OeksYmTGOc8Wki+I+Hyam1bgnWKK+xr42SlOGl56/ZYHywgfvm93TPi7Mbqw1OXN
         Yl0A==
X-Forwarded-Encrypted: i=1; AJvYcCWxFrV9JKOveRqUQ56h8GUK6d9tDPnGJgqjtFsXlCX92dhOJn9Jv9ah6kNIedYM9Iy8+he6/sthA4VFJnvJapG5@lists.infradead.org, AJvYcCXcgl34SUSDD7flCH7uhiwirEgw7vTElKXi+dPgM4gfUmHi2QK+dUD6IaIb7sDPgCyYjdjVXCCNp2pcr9U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxej3aAZoBAXcel9QS/NxuJXvbLLkSTKvktcRSBGloHorwpM8g9
	py4TqVMuVP7+Fdx+fOEeXjvd+AhWyOjX7Si7fnUHtSBNkYLZgTvBQfvN
X-Gm-Gg: ASbGnctHnKNpwad2dXAPZoY4rUHMsLTkCRGlCedcZDNvA6JRyKW4ynTmIGw2xL86Mnv
	y9RSRxajqjkYZcwXhY+2//rx0DXH5kMQrQ4pRfAqZc7wvhe6Vu+8LDMJDbydOYYTZTZ08kwxLPI
	8ZZrngmEZCbkpPsTvomgO6yW+IVpXm0b0IZoDCKPyZC+EbYP0GOvABUzxbmoLJdzGmShVfRQiIx
	vburShaOK6647T6wfV+g40AFadu8aRHMP1c4I/GcC+5T9oPq0bOOGYW9csRm5eVRJ6VMFVfV40A
	Di41yiCH71qkUOjhQzgInh0ogQp4bdkIwZZOY/AodS2liU2TDIihtIeSekHZPp1pmvt4klQpmf+
	cRLo9Pc7/cyJtSwBYGSciqmp7THJvtFhWbc44j/0ryXbgc3acUsQmuA==
X-Google-Smtp-Source: AGHT+IGc1hOCFlrmhtuYXy2RF4eOcL1ED3xkJpQYquvPOenW1RGNO8PJflQF3KtC2IpnrJ0auNPnsg==
X-Received: by 2002:a17:902:f642:b0:234:986c:66cf with SMTP id d9443c01a7336-24944ac387bmr203183595ad.16.1756925973872;
        Wed, 03 Sep 2025 11:59:33 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:33 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	virtualization@lists.linux.dev,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Justin Sanders <justin@coraid.com>,
	Jens Axboe <axboe@kernel.dk>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v3 0/7] Cleanup free_pages() misuse
Date: Wed,  3 Sep 2025 11:59:14 -0700
Message-ID: <20250903185921.1785167-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_115934_803229_9DEEDBB3 
X-CRM114-Status: GOOD (  14.49  )
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

free_pages() is supposed to be called when we only have a virtual address.
__free_pages() is supposed to be called when we have a page.

There are a number of callers that use page_address() to get a page's
virtual address then call free_pages() on it when they should just call
__free_pages() directly.

Add kernel-docs for free_pages() to help callers better understand which
function they should be calling, and replace the obvious cases of
misuse.

-----------------
Based on mm-new, I intend to have all of these taken through the mm tree.

I've split the patches into separate subsystems to make it easier to
resolve conflicts, but there aren't any functional changes.

v3:
  - Collect some Reviewed-by Tags
  - Replace remaining free_page() calls in patch 7 (all other patches
    are unchanged from v2)
  - Add all appropriate mailing lists that were missing from v2

v2:
  - Reference __get_free_pages() instead of alloc_pages() in the
  free_pages() kernel-doc
  - Get some Reviewed-by tags
  - cc the subsystem maintainers related to specific patches

Vishal Moola (Oracle) (7):
  mm/page_alloc: Add kernel-docs for free_pages()
  aoe: Stop calling page_address() in free_page()
  x86: Stop calling page_address() in free_pages()
  riscv: Stop calling page_address() in free_pages()
  powerpc: Stop calling page_address() in free_pages()
  arm64: Stop calling page_address() in free_pages()
  virtio_balloon: Stop calling page_address() in free_pages()

 arch/arm64/mm/mmu.c                      | 2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
 arch/riscv/mm/init.c                     | 4 ++--
 arch/x86/mm/init_64.c                    | 2 +-
 arch/x86/platform/efi/memmap.c           | 2 +-
 drivers/block/aoe/aoecmd.c               | 2 +-
 drivers/virtio/virtio_balloon.c          | 8 +++-----
 mm/page_alloc.c                          | 9 +++++++++
 8 files changed, 19 insertions(+), 12 deletions(-)

-- 
2.51.0


