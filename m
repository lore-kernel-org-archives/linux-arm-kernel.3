Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10194D65C6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 15:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7g6szJSc9qKXraE1vzVnFUR39QDkw3X32snO8YJ7Qo=; b=3PkO3En7FC/j49VFOMd585RLS+
	5h70XQvIu5temm7+XznJc2DFKaW1FkvFVhIkEkhtV8FNN/xEAnZgT4N/+QvcUM2k6jaiG/dOIaKRH
	59Ui3FhRsiNGqhy+9YJyIDvEpsNE8nvI4VuD2uE2WTVx4d+wcdSKB3CEgkTjFgMesEYKLK698XlDh
	nn6C5UhSjdRKX0qequFt66beOViAvm51irsy03ymnqEeWUJUzYRHurLpOvv11hhe4m4kS2V77N7yR
	CjDkbNWvqCT8FHznUVPf3u+iadiH8sMwBW7x5gVTmopTPLiAcL1DMXKuUoRlL/44YE7daqHAGDNER
	9UaZAT+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtlB-000000072En-3lPR;
	Wed, 17 Dec 2025 15:48:17 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtl7-000000072EO-1dNA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 15:48:14 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a09757004cso52513535ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 07:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765986492; x=1766591292; darn=lists.infradead.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=k7g6szJSc9qKXraE1vzVnFUR39QDkw3X32snO8YJ7Qo=;
        b=ipoFYzVmgpbkF6vky0knfpowJ2F39AfkNCc+Su2raz9YTonmz+dNWve/TgT9eqMeqM
         B62EUneDP879L6DEAcIC2yeemIC/hx3zIHi4KNmY400bhrZdz6K+4d+VDTyaiJ9f7AB4
         lsg8hx+vMxEmhEbrZ+wVxnlyi9ocqGBo86KSBUPJ0v2NCvYCyWS/PREkL52JxxFThwKI
         uHnFFLVbcpp0IUmzj+exs6f37PvK83MT+HSy/rqrrFW3kUyh4xSO/mhJ8s10xYU5+jbg
         WzlN+MM2zvNKezjCiPx5QFNoDLjrpGTga8l7PcL2Cm2xL+5MhoVVNHPcknElVmu+PgHm
         lNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765986492; x=1766591292;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7g6szJSc9qKXraE1vzVnFUR39QDkw3X32snO8YJ7Qo=;
        b=MNaNnKlLqZajIXdn3lfx2Ag+4KwVsexXz1GZ7ujYiE/+v+VOoLRPJd6lmaoGr9oQRe
         ae1f2aDh+CiUaNwkPEYKF6Icbn3ijDKLX0rMt1PzPWNxa3lc+MDCoHzLMQoxITA7kvH+
         9yAGEKA6mpN9rgU2/qbfCPUnzhm2GsiwpFC/3yne4bJH0NnDOeZ5R2yXxjjCqSUy5lD4
         9sqm/9u/Dpk8ybuUmLzX/dyAcV0YDaJnKvHXf62+p11PDLPdsNkUWcJPFl5OJknVSR79
         1GDS56ISbA0DVBRH/ksy82v8TsykIIxawUdvGqlZpRoxAvWeRlEhbc7cNzRg88BUYGHW
         T3mA==
X-Forwarded-Encrypted: i=1; AJvYcCVbWNn9ydbq+wz/h2Aba+zOQbf+h+W6U1B0fBX1FQZSGR7FFIBGdcVh07TA7XelItqUbWqZ971c77WPjf4UmxJZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyY0eaUh5PGFAWry8plf0d6eHcf1BgAwA/FeNU4g8BTnA2LYx/2
	VWMqFDXHNZk6bfSXBxmDKSfrrdtrT5LNrq/vbjDAZvWQRgQKZlqxooqZ3Z35G4Ht
X-Gm-Gg: AY/fxX7XiQkW0wRhmVcqISLPHfQbvJ4oB9hYJeXoAyeeL3xao/U/FsaZHp7sl1DUloS
	krKNPwax/4YMJLgalRE83R/HLyMk2yod+sT5ynH9QWKKa1/2PugkMq55jaqvfUu2qH3V8YBnbbs
	BhyH0X20qXs1VBw/cdgCzTQADMDrvtCcD94ykOPFAUGEVXkjCsgeaNt+R//L+wtpQaEiCyJcJmG
	PA7/4Fhcw0HsAwylsynxM3DLNX9lBVKPN/cRnfqCF+TmkCmxMxZTCnv8WlKU/iSyu9kaDmlYaBr
	AK6KanCWKGenDtFa/rcmR3NXFGlvVgdkX/StALZbL23gooy+Y6tZ4fpenHM/NyZ8ugzrhBUca/1
	BE7mwROb0iyTcBgI7V7EHZKdurbyoXwb5p8WrToDyTiiGK/t2448z1oK26QkQUDN9Mr7hB+mXQs
	TkH4fA+GHW3aGGfvh6
X-Google-Smtp-Source: AGHT+IGzrC8xHoSohluxl3TB8gicGFdkGjx48ZJyAE+fsjdi1rZJJgtl3YetY/wOPW+z2c4mkNcmfA==
X-Received: by 2002:a17:902:cf03:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a0bb05e314mr123346515ad.44.1765986491997;
        Wed, 17 Dec 2025 07:48:11 -0800 (PST)
Received: from dw-tp ([171.76.225.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016ef4sm207003795ad.56.2025.12.17.07.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:48:11 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
In-Reply-To: <ca0da7fd-245c-4d52-8f4d-f8fce4717494@arm.com>
Date: Wed, 17 Dec 2025 21:16:14 +0530
Message-ID: <87a4zhkt6h.ritesh.list@gmail.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com> <20251215150323.2218608-15-kevin.brodsky@arm.com> <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org> <f9550d22-8810-4145-aaa8-48961f6ea35e@arm.com> <ca0da7fd-245c-4d52-8f4d-f8fce4717494@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_074813_436317_596D1911 
X-CRM114-Status: GOOD (  16.21  )
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

Ryan Roberts <ryan.roberts@arm.com> writes:

> On 17/12/2025 09:26, Kevin Brodsky wrote:
>> On 17/12/2025 05:14, Andrew Morton wrote:
>>> On Mon, 15 Dec 2025 15:03:23 +0000 Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>>>
>>>> Add basic KUnit tests for the generic aspects of the lazy MMU mode:
>>>> ensure that it appears active when it should, depending on how
>>>> enable/disable and pause/resume pairs are nested.
>>> I needed this for powerpc allmodconfig;
>>>
>>> --- a/arch/powerpc/mm/book3s64/hash_tlb.c~mm-add-basic-tests-for-lazy_mmu-fix
>>> +++ a/arch/powerpc/mm/book3s64/hash_tlb.c
>>> @@ -30,6 +30,7 @@
>>>  #include <trace/events/thp.h>
>>>  
>>>  DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
>>> +EXPORT_SYMBOL_GPL(ppc64_tlb_batch);
>>>  
>>>  /*
>>>   * A linux PTE was changed and the corresponding hash table entry
>>> @@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tl
>>>  		flush_hash_range(i, local);
>>>  	batch->index = 0;
>>>  }
>>> +EXPORT_SYMBOL_GPL(__flush_tlb_pending);
>>>  
>>>  void hash__tlb_flush(struct mmu_gather *tlb)
>>>  {
>>> _
>> 
>> Oh indeed I hadn't considered that arch_{enter,leave}_lazy_mmu_mode()
>> refer to those symbols on powerpc... Maybe a bit overkill to export
>> those just for a test module, but I'm not sure there's a good
>> alternative. Forcing LAZY_MMU_MODE_KUNIT_TEST=y is ugly as it would also
>> force KUNIT=y. Alternatively we could depend on !PPC, not pretty either.
>
> Does EXPORT_SYMBOL_IF_KUNIT() help?
>

yes, that make sense. Thanks for the suggestion!
I guess we will need a diff like this in that case -


diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
index fbdeb8981ae7..ec2941cec815 100644
--- a/arch/powerpc/mm/book3s64/hash_tlb.c
+++ b/arch/powerpc/mm/book3s64/hash_tlb.c
@@ -25,11 +25,12 @@
 #include <asm/tlb.h>
 #include <asm/bug.h>
 #include <asm/pte-walk.h>
-
+#include <kunit/visibility.h>
 
 #include <trace/events/thp.h>
 
 DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
+EXPORT_SYMBOL_IF_KUNIT(ppc64_tlb_batch);
 
 /*
  * A linux PTE was changed and the corresponding hash table entry
@@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tlb_batch *batch)
                flush_hash_range(i, local);
        batch->index = 0;
 }
+EXPORT_SYMBOL_IF_KUNIT(__flush_tlb_pending);
 
 void hash__tlb_flush(struct mmu_gather *tlb)
 {
diff --git a/mm/tests/lazy_mmu_mode_kunit.c b/mm/tests/lazy_mmu_mode_kunit.c
index 2720eb995714..340d7cda9096 100644
--- a/mm/tests/lazy_mmu_mode_kunit.c
+++ b/mm/tests/lazy_mmu_mode_kunit.c
@@ -69,3 +69,4 @@ kunit_test_suite(lazy_mmu_mode_test_suite);
 
 MODULE_DESCRIPTION("Tests for the lazy MMU mode");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");


-ritesh

