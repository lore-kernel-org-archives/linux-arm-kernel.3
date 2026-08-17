Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F45C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 12:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJ2+ubnMZf3r3CY3qPXvHtyj9j+4FAMip4TP+iqz1vo=; b=EOwRsQKO0n8o1qYuoEy1bI6LSz
	/gciOUesl8Gs+s9yo3mSiigTxEuMs4qC/tpj8UNwTEFshJJFwarK8pd13+MdR0zjVHX+4YJRQrjgL
	a3yxgZ5iTlb0gmZ9UjVQPg/w4gvyxcESEsBQ3DXP6dQXCnfRdh248j89TJybS+sSYIsawtMXJshnk
	pqprGYO5y1jtSWj7/Kbr9DnOSK/U+I6zenQ6mE6GCAKWj+cYBLg+7G0ebmS19SbfqV2Lk2jvWBDhm
	9MA6oJ+SArUuvke7asNIm4ddJ4Iw1CBRtdA/xuL5tdtt8ZR+hQCFWkPhRpUKHQ42ki5Upm6yqpyQM
	jGCByzsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwBF-000000066bK-1GX2;
	Mon, 17 Aug 2026 12:11:05 +0000
Received: from out-243.mta0.migadu.com ([2001:41d0:1004:224b::f3] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwBC-000000066aG-0Msi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 12:11:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=HixNdaF24ntDEuguIuhpK7haYmS/JSSrlBPi1Y1tptI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786968655; v=1; x=1787573455;
 b=QeEsg/dqo1TZKqifzrBNzsykZmrFrlTHIwqmU/NfoUZuilMqfjcwRFQWsUqqIc1hgw0/A0kg
 JvEop+e9FDiowsS/ZKpFBBgvwCfaYypnG3Eq7CzMxKIlFsxztHVZ7HgwayE3nz2eXd+UkW0TJqe
 HoN2VbcomdRbSPmB6Q4EDzfU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from localhost (185.201.63.253)
	by smtp.migadu.com with ESMTPS id f0badc6dc42a8a86;
	Mon, 17 Aug 2026 12:10:55 +0000
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 14:10:39 +0200
Message-Id: <DKR7IK0VAERF.3ALVHRNQMSXZU@linux.dev>
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andy Lutomirski" <luto@kernel.org>,
 "Borislav Petkov" <bp@alien8.de>, "Brendan Jackman"
 <brendan.jackman@linux.dev>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "David Hildenbrand" <david@kernel.org>,
 "Gerald Schaefer" <gerald.schaefer@linux.ibm.com>, "Heiko Carstens"
 <hca@linux.ibm.com>, "Huacai Chen" <chenhuacai@kernel.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Len Brown" <lenb@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>, "Pavel Machek"
 <pavel@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>, "H. Peter
 Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Sven Schnelle" <svens@linux.ibm.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>, "WANG Xuerui" <kernel@xen0n.name>,
 "Will Deacon" <will@kernel.org>, <x86@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-pm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
 <loongarch@lists.linux.dev>
Subject: Re: [PATCH 1/6] set_memory: add number of pages parameter to
 set_direct_map APIs
From: "Brendan Jackman" <brendan.jackman@linux.dev>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>
X-Mailer: aerc 0.21.0
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org> <20260816-execmem-set-vm-perms-v0-2-v1-1-90944a3ad43f@kernel.org>
In-Reply-To: <20260816-execmem-set-vm-perms-v0-2-v1-1-90944a3ad43f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_051102_386496_236A56C9 
X-CRM114-Status: GOOD (  15.35  )
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

On Sun Aug 16, 2026 at 12:59 PM CEST, Mike Rapoport (Microsoft) wrote:
> When set_direct_map APIs were introduced by the commit d253ca0c3865
> ("x86/mm/cpa: Add set_direct_map_*() functions") the single page
> parameter made sense because the initial callers (vmalloc and
> hibernation) had sets of unsorted struct pages that required changes of
> their mappings in the direct map.
>
> Since there is an increasing demand for direct map manipulation and it
> is also desirable to be able to update larger physically contiguous
> mappings, for example an entire large folio, extend set_direct_map APIs
> to receive number of pages parameter.
>
> As there is still only a handful of callers, change the existing
> functions directly and update all the call sites rather than adding
> wrappers for single page case.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

I think if we add this arg we also need to specify how the
implementations are supposed to behave when they fail midway?

IIUC the incumbent answer for stuff like this is:

- The implementation might leave partial modifications behind when it
  fails. The caller needs to deal with that.

- ... But, that's gonna be due to allocation failure. So the caller can
  just do the inverse operation in the failure path as a cleanup, and
  assume that inverse operation succeeds since the pagetables are
  already allocated up to the failure point.

I guess it's worth making that a sort of explicit contract since it
makes certain implementation details load-bearing, e.g. I think...

- It forces the pagetable update algorithm to work in a fixed order.

- it forbids us to e.g. merge PTEs into a PMD if the region might be
  pending such a cleanup, since it would force that cleanup to
  reallocate a PTE table.

