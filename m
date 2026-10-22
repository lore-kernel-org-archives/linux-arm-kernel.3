Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97475606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n9dHK+mK;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BsTgeaAx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=; b=n9dHK+mKgY3KH6ygMEsfN6ByhL
	HbIVSwbC/Yzw++PCLCu6iiSx2mOWQ9mG5zMR8s7p5nnqX24vLHeMDg4SWR0q5gKbDo2xDdBTs3x4U
	eKb223SlUgPVMUNtJhIEHdxLN0MPEmst8BhMIhfXhLqhTQM7vmgcRuPAS2PV7G46bRZgpCRj+slAA
	S8dLa08CXktGuoF09GTZ5R8AEIDCwh3zxLtFrAiibH47TvJuMSFaVwyMClhpybePfHK8G+s5rjNsN
	ekZiPlpd/qUcdTea1RXDLIGuH75GQVWJL+/scNhZBsVaDhBRftmMX7ZyYxLjlbVUs8k1ao5wdP21g
	+P1VJrRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtrS-0000000EJ9t-0St4;
	Thu, 22 Oct 2026 14:33:42 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtrO-0000000EJ95-2LLq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:33:40 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-66fbdb0a5a7so315410d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792679617; cv=none;
        d=google.com; s=arc-20260327;
        b=CkCnPRxw9OA3l29t4iNcZB00wU+XfFtgaaUlRfH9ncBITDoJMG4J+XOCbgrU3IpZvc
         gkxfNAdkQEzZ1ZyXgwEB5yjPDABOejO94tpID80xTOhGK3bpaEiUpvOuaw1U1UfT6Dn3
         OhJFq1MGcSB29RN7jMJjWcxjTBd7+9IdojjoHPxajPQZ7rqvj/V9w7qLvjcNRCWk59F5
         XbutGEnpdfd+wrIpQ4mI8eanmWZ8AZQtfgqgLMfvbnxxyq/OD9h1xXOJwLdAlJvqBskN
         yFXzQsA9SihtBo2hmfzqPIVHIraRi/KWoNbC2SxlAs3pYe9KRRiSRLFgiPY77FAqtWP0
         S+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=;
        fh=ZfNZ18vOfWBAA0xzJF6a6DVmrrp/yoMPFeveC+7eLSw=;
        b=rwNS4KeRtDUKGA3djTpGUCNI5OQGAW0Oe7vSIxPi4WciUUMeOqkp7LFG7H405utaMk
         poqxbynXE8Nx1FOYT7oUBRDt+G7wizbzth9Qq1tO3y6Ud5usLTQ0q1VGcgQ/RsIP7vR2
         IRZq8cFoNkKwwjLsgYwEFqWc/882vtGILkzG1s+twr/jThMpLVsnHxz+zzmILjXxItgt
         PiSLB3qbLu/j6kiw5bXkRBpcvqA7ys7fg2Lx74+a/H31znmbcE4EmSm2owVMgSzBxd74
         41cY/o4WCj8aiOV6yxFKwgnFkehY0FyX7ROLwOiREvmytqV3HFIgEDiWrGuX0i++cBO3
         weRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679617; x=1793284417; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=;
        b=BsTgeaAx0nBm2qTPNag2R3M+TslaHLxPTiBv1T9etAKzGb9jXVZg1xDUbhU7nIgCrA
         eHrsrpGhsgJQBEUPEe/NLR0LdcPDpqXH28+2NMBKkCfcZD7d86kD+hds8bGaiBEcB58c
         EhhVXgnrm7gN1XlKEbjWzOkQvx9AwvVx//VcvODJlqZwViBvqNRIcHI5tPcVmmr4wfax
         VjcObLWusT/URg3DxbxeGCxhWLSc15y4rZeMwpfxH8MKv1Gh4HMymfMvcjlMoBLuT7cB
         o/FqNJiXGhqovMLCXdqcl8/SOq8GWZPZTC1ScDyUJ/nD86TLKP6FvxXL/wK0OkQKvWR3
         K5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679617; x=1793284417;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=;
        b=Ay3QVcG4fy631N/JRp7HOI4ubjYzrfKk5C1EkdMHA15VPETUp1KWv6J8rknT7kIBqG
         qTI2Oad0W3ASPgpGTzB1Y5rrAe4OuDkYbdSJx7KBJYWXzPfLIf9dP0XAkSmQEmx/Q1XR
         VJBiJsF7r4EJQzxilM/5FylABvfqQCw3/EWiDSuFS033u+q3i1YB+YXPu2IfwiGVNhWd
         vaHFnnDY/P1xvOR/MZicto7248Odba+wppR2nBYwY2NCrhRDAvUnUL+JTuwED3NM+l+J
         Oa3FEzZ2k0pWGqD3ZzJWgsDb4vKdkZEFUfNGEQqI8U+oRQlLDfcVX/pwNevY0IrBgRUA
         MCEw==
X-Forwarded-Encrypted: i=1; AKwUvBxFJi7v0in6M5vB3hJbfgbXxnbIobTi6db0UzwDvbDTFF7IEjHbZizG/cS6XhNKMj4Rq1hShuRice9cZ2eESczp@lists.infradead.org
X-Gm-Message-State: AFq9FYJdc993g4f9R46Y2jXNW3zd9M2CtPrIg8FwyHSyDvYbVZf8IQyd
	wIbJCw+Ni9d5h4IzLLAhYS9Hf6yS3RShEY6DdjwuaC5k/rdxBWzx54/Pfaq9PNtco/S4qZF4zAg
	c7WYEoCIbPXhI1MDNHGL8nQT38SZ0vmc=
X-Gm-Gg: AYBFou11VYMMhV9zgxsduDJnT7ertFIoP3+AZa1slbLVmwv2EkeAo2plIsyuZ7b7Qwt
	aZ1gBgVHKu+AV1uwtI7qUC987+1CcmnspFKal45JB8xJMGqv0LVBNT00XMHGprJYfNbHybMV20F
	V/h8bhB9UT+EwdBIrbLlyZzTe1dNRiSpIJzBUJNTLuBNMoe+poS+6YcFQlyHeUj7EgeYSqVSj01
	LdIX6fKyiYc2MbmWvM9HLbx73otvoRqto94sf/9d5Qr/rLHRILBHjnTDHJfRRw25UjLpD4slXqi
	grumA1hpQAuhuX47bLbJJHbNYdiLjldxv+LIR4B6T7ZQL4Vl4SDGsysWwSrXUxwN7HKURZwBTwT
	uMS6VDImpog/kCgm3GPT03/GhkfiREguukeU=
X-Received: by 2002:a05:690e:4504:20b0:679:9e25:316c with SMTP id
 956f58d0204a3-67a0e4f7118mr3858513d50.5.1792679616649; Thu, 22 Oct 2026
 07:33:36 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 22 Oct 2026 07:33:35 -0700
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 22 Oct 2026 07:33:35 -0700
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261022021820.1789083-1-odys.yuan@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
 <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
 <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com> <20261022021820.1789083-1-odys.yuan@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 07:33:35 -0700
X-Gm-Features: AclHuK9KZnLcDmcb3UzjebEw_JXnOgl4qhgoWZHIOId6L7KU5VJDln5TqsxLBMU
Message-ID: <CAPAsAGyA=WG=z6a==N3O6oan6WVmZS-VrxEA7SrxRQs5d+Dsfg@mail.gmail.com>
Subject: Re: [PATCH 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, Peter Collingbourne <peter@pcc.me.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_073338_631299_A6A91867 
X-CRM114-Status: GOOD (  10.46  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Qiliang Yuan <odys.yuan@gmail.com> writes:

> On Tue, 20 Oct 2026 12:58:54 -0400, Andrey Ryabinin wrote:
>>> +	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
>>
>> Why it's open-coded ?
>
> For the same reason as read_word_at_a_time(): commit ece69af2ede1
> ("rwonce: handle KCSAN like KASAN in read_word_at_a_time()") open-coded
> it "to avoid having to pull the entire instrumented.h header into
> rwonce.h". I kept the six asm/word-at-a-time.h headers to the same two
> small headers, kasan-checks.h and kcsan-checks.h, rather than pulling in
> instrumented.h with linux/bug.h and kmsan-checks.h.
>

That concern is specific to rwonce.h being included from very low-level header
like compiler.h It doesn't cary over to word-at-a-time.h

> Thanks,
> Qiliang

