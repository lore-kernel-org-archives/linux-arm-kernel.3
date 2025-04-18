Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E78FC369CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 03:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDZz8zS561FtX+iixxPJldXseasTt9hoE3qXWPq515U=; b=hUTDWoyIl9yQ4uKNlDhlxKGnaG
	V+WKffgak23GBbEk0uHE95gBSPLtiuqibAuGQB0/u6mJXQmSiTp0u8rZsf+UxzqLd5kZ1qHwtlgVH
	RF1SgA3G/uVHkfKN6OTIFsbURMTrsnIteOPpWcoU6vqeHnJAVZyHLLPClWQMnrQUEwaR/46Lsbrqv
	LMG50KzDVe5aSyFwR8GOXCngH0GB0Hco52Ub2J23z/sXZE5MH6pnKFTw4irexsBl4Ko4ld+INAKIJ
	BzNeZkOc910CiV90hCGWwh+24lR0SBkoGfIBTNITqY2KPzEv2B5iMVv04o4p92cpFNg6LPHhJjhhI
	SHT+0K2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cRE-0000000EyyD-11OX;
	Fri, 18 Apr 2025 03:30:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cPN-0000000EynC-3PZ2;
	Fri, 18 Apr 2025 03:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZDZz8zS561FtX+iixxPJldXseasTt9hoE3qXWPq515U=; b=WJ+vgh1bSGYozhLYDK+Uz+b+Gh
	1sPgvy/2uU6kwkSs65AujbXDAACrN36/kiAh0lnybrLnkVq5enLLKZI4NgrCv6s2UBNu9jbJmIg0i
	vH5BV3ZnmlZq3LYHfbYqHCfwp1Euu+wxHy416isUjcEtVnG9TIfCosXu9pHFxKL8HTsGxtPjEhIln
	GT5rh1ywhxF4xZJqFyketLs7fjBex6x7+SrqCGHGS88KdL7MVMWKI118bsfc7THHXUcT4/RSF96ZL
	nyqT1jvadNSSXMJ5K+NVrpc1s3fsE6COpIC1/p/JpCY/gNPltImxaZcwzNjvMto96nBL00eflZSY/
	FnKIlCmw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5cPK-0000000ASaC-1ejX;
	Fri, 18 Apr 2025 03:28:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CD564A4B1AE;
	Fri, 18 Apr 2025 03:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CD9C4CEE2;
	Fri, 18 Apr 2025 03:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744946927;
	bh=paa/9NZKZKpdwfQILoGguW2nvATTkdoCMaZ8TYAofx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S90kDL67H31uSpEv4ZrQD4HD18zmryec0gLnj6+7QnaMN47KnnOiTpqryL9vUNJ0A
	 OOlF1S+mKh49+xCZJuOOZXg0mYOqjU0Q39rMBTaO7x4ZZ6rpyfpPUNEX8HBVkfOsLD
	 EY0RfFI9paylTf22uMjv+BqRmKRkmXOwmB9ECQuP3FNHB5Wy7t4nZwSuepETOw2lRW
	 Qz6m6UZdgJj7wiKuWat9qhSWie5OoLWjIimkGMx6zHjaxZh+mzrUBzik42/Ul41jJB
	 R4/dQdFwKtEZseJeVkLQbr6lQOpHAW5m/VQwglLYHWTuPTm5l0lXEg+EXy1tPH0mfa
	 VY0mvYrHgNZ8g==
Date: Thu, 17 Apr 2025 20:28:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org,
	Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <20250418032845.GA38960@quark.localdomain>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHCIL_sYIS_1JQH@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAHCIL_sYIS_1JQH@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_042850_965780_5D2A2721 
X-CRM114-Status: GOOD (  11.91  )
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

On Fri, Apr 18, 2025 at 11:08:16AM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index 25ed6f1a7c7a..86fcce738887 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -1753,5 +1753,7 @@ config ARCH_HIBERNATION_POSSIBLE
> >        bool
> >        depends on MMU
> >        default y if ARCH_SUSPEND_POSSIBLE
> > 
> > endmenu
> > +
> > +source "arch/arm/crypto/Kconfig"
> 
> ...
> 
> > diff --git a/crypto/Kconfig b/crypto/Kconfig
> > index 9322e42e562d..cad71f32e1e3 100644
> > --- a/crypto/Kconfig
> > +++ b/crypto/Kconfig
> > @@ -1424,13 +1424,10 @@ endmenu
> > 
> > config CRYPTO_HASH_INFO
> >        bool
> > 
> > if !KMSAN # avoid false positives from assembly
> > -if ARM
> > -source "arch/arm/crypto/Kconfig"
> > -endif
> 
> So this removes the KMSAN check.  Is it still needed or not?
> 

Only x86 and s390 support KMSAN.

- Eric

