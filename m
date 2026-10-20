Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F4A606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bdXaSWi/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P6m/deWh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=; b=bdXaSWi/9CbHDX4hvzwxst+4d/
	ZWm3dH77MRbmd8/sr+64CLcQIfM2W17QlYKCjq7uz1RlyKUvcO2Gw+oDjm4CmLUHBSrrmlxVGeJ2U
	NzhTLT5Wv9nbzKHuvnYhtQmuIDqdr7FBFK28ER1ZpfWXZzV7WG/6X3s/4lwgcF03xReCidAINe1zx
	iHXv3J6rXXdwVp6vJq3R9FKryfltxjanfLylSCe9UayYF1bdl4bENgoeS6MZ3+FLituBkvfkgEl6s
	IOmEj8GjmxPYiGHxzgBIjLNY1yvB38Y/G/HyEBtl5bpk8jH65+qTzc+qG93tHoOrTFhKgYdLmN28w
	NXDR1GQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDAy-0000000AHgU-41mE;
	Tue, 20 Oct 2026 16:59:00 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDAu-0000000AHf3-3VWu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 16:58:59 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-66fc7e0ab25so503199d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 09:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792515535; cv=none;
        d=google.com; s=arc-20260327;
        b=naxJlmh93+LUBt3KAp5skzZ4B2FueRQz/cA+ccOmbBkHYCxsYlO4AH9vzd7dCITWhB
         W0ctJG7qTtqi9LiOsETvuS3oE2vzQmJSh5DltS4hNBBojLSJrcpeptq0ZwzSwQnjxvkC
         thW6E/Kiwj/Zcc7kRnifNJBUH1WnYXv1gqDl8OCo7m8+EUcju3G3SfG6wkahuZxkVjJN
         pRMgKRJhH+SQRVpKQIS6bMBGJArLvQHpO7vMmbYLGwApFPbTaSg3Nu2cFyAa6MNsTFOX
         IDccBf4sBVC120ylkF2O2eWGsz5iSMd6+mRHbr2qNUtp3LCvcQo7N6vnQ4u1kpkWh1rZ
         7Ytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=;
        fh=YmDTXZ5tlBD1WZjzuo5muJhHZGEfzgwwIubZ8GPvELc=;
        b=VOJLDvp7vy4emzm3KxhYnrvsBma8TKS0Snn1q3rrvLsASrY+WRi9CQx4mrQonsmweU
         8or8D63je0Ix3gLVp/YWUWceFL+qbv5pzozhcDCkuZAuQ9f1hzxt+RI3oe4oi7XjebZS
         p+cXIwYAr9ZPUSs1WnvY2Gukg19NweypL2yi4Z657AAVQ8S7cchUsPhzz2koGiyVu9vW
         zrAP1bkzxnY7f8JKrtCotpfUO0xMwx0lWSUhVWMEjEqXpxuMiN2EWngm+PdBXu/Ws5Il
         K+XQq6vG+MjMDSOMHCHjNkiXhd2jmC5Y0EzUkNGkEHhXzlfoScraVsDE0hcfyw3phHas
         1q2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792515535; x=1793120335; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=;
        b=P6m/deWhOoReQG5r9VwOEL4hRPMSj17HbQ/0KAvBOohpw3c09VED2cpvvHT2d2D/QX
         gGaRaFa3omby/EFgSqP3O71sM4f4CTH2r3j5cw0dHvRemmIENd7KvbMBSi/SuVQ5zBrx
         +pTEm2dMsGllTq7GQXPi/7UfgF+S8t3VBm5lJj8k2XyaOUvStPwH3N3WT+xo08+2XPCU
         +hKlNBK+0R7TOZFbmMMOqrZZp01wY8cTsz80H13y+BzvknHQdj0wceRCWg/GVyxGYaLc
         jH1urfdiNx0acOM5WyKlzcrqaEt7i1+lTqE+AO1YnR0NzXrHd+NOi9KKghjuNtBECZLu
         WHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515535; x=1793120335;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3UZs72ItN8BjuPnBCdirt6JsCzxyYkOlT58mDePWJs=;
        b=yIieKUqgPxxDXdkkq8E0m6Fz221UK0Vr/JzqCCCp1EyDKCkfZ8aa4DLkiC+Xhpof6t
         WTLI0/jv4K8yCBdJA21gPt2SiWIlMjgEWJ9OibA24130aq9SDEIlw3FiSGSqgnEmGEH8
         sQXEr4oaCvXxp25YKtAx1pBrO7zAsy+5+aI1B8/llfEwVETochkWa2V6XtA1w9xiuYMH
         ZjAzEMc0XOCyiW7pojz7WCMaleR+l2SD+OerZjZUerCo1zr7hLeB9ypvuif3uQjRO/19
         +o1qDsTYocdheQ93zhXTS807rUftGV5IC44Bjs24TvRBwsk+yE5cPjbWIllYjHn7pa9F
         CZYA==
X-Gm-Message-State: AFq9FYIy6aukrwsuE/+n/RFBnH06hIuNQHj2EbrMnVt8amp5P0u/Tf8N
	+vDVSMDfGbbFJpajeWc1OZ0J/2P/SHWz1p5YeM4XfApo0EcJwsNKHZXJ/DpAvLHXMdQy7i62wkB
	6rii1HfwD9SrdrltQ4aMRrvvIc0cz/Kc=
X-Gm-Gg: AYBFou0mT2/YTBrshSU9UKNRxn9V4bcVNizFfCnY5A7LX/cBYb61uA5Cyatjoaf1Ur4
	8JCeB/vl5OSj2LnzusWyRtiOlvLkGK30WiqZbjUfP0n91IRUnt/MmS+fVdxxrH6imLf9G/l+0C2
	VCmkijYs22J/cdrerLkS2DRdAlXAmzZMc9MlkY/S1O2fXQevzDUrK1NN3YKWMezg8kC/xbqd05H
	veu1F8vHAhGo41U52Gg8m5rLg9t89Ku3gIFOyfMdtAG8UQf6Etimuv8Wq3Sh59vBNhkSVH0di+0
	p2twM75EpHnDDZSOUGX5ijGQooG/AiFVdy94lnxgpdAnNbl6r4pv1g==
X-Received: by 2002:a05:690e:138a:b0:679:b8df:29c with SMTP id
 956f58d0204a3-679ca54432bmr6769731d50.2.1792515534972; Tue, 20 Oct 2026
 09:58:54 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 12:58:54 -0400
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 12:58:54 -0400
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
 <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 12:58:54 -0400
X-Gm-Features: AclHuK_J27k-o8Ui6g8e3q8L_DReW_3vhUszXOZ3Ua6MjDZ1MkwzX1wkuw839aA
Message-ID: <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
To: Qiliang Yuan <odys.yuan@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Peter Collingbourne <peter@pcc.me.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_095856_885267_431E729A 
X-CRM114-Status: GOOD (  10.11  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Qiliang Yuan <odys.yuan@gmail.com> writes:

>
> diff --git a/arch/arm/include/asm/word-at-a-time.h b/arch/arm/include/asm/word-at-a-time.h
> index 5023f98d8293d..f672aad2e30e6 100644
> --- a/arch/arm/include/asm/word-at-a-time.h
> +++ b/arch/arm/include/asm/word-at-a-time.h
> @@ -56,6 +56,9 @@ static inline unsigned long find_zero(unsigned long mask)
>  #include <asm-generic/word-at-a-time.h>
>  #endif
>
> +#include <linux/kasan-checks.h>
> +#include <linux/kcsan-checks.h>
> +
>  #ifdef CONFIG_DCACHE_WORD_ACCESS
>
>  /*
> @@ -69,6 +72,10 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
>  {
>  	unsigned long ret, tmp;
>
> +	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */

Why it's open-coded ?

> +	kasan_check_read(addr, 1);
> +	kcsan_check_read(addr, 1);
> +
>  	/* Load word from unaligned pointer addr */
>  	asm(
>  	"1:	ldr	%0, [%2]\n"

