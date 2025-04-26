Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FA1C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTCpnJo/wLXrkH36khfXlnTNieOc0Xo7xnmwF/6qG5Q=; b=RAskitTEB5dJsdfhGjrEj33xHu
	UesgJPvHrtfn0duLqhjgLXxmN+Q0IPqYBDV4bnkeUvaSrk5MtET66oVgUng7J8vmA5ehCdzob8RmN
	4NnHkKT4PTHYiQ1TTBExs2W1wowzODbutxb3Tn7ywyJFTI6hPKas50kD21fqdgo5PoTmdrMqYD5fR
	Kb/KP66XjVAS/Fk1A7FmU07Scz/eBuQe2R0DsFCKVR37tnEYqYY/ISk1OUQqy+D/MsBJ0ugWLmtv0
	c/ouLOM0jtZOkux9Pgg4T5nQSKiCVbJF8fsi4UspLhhZluciLdBji9L/X17p1SqxB6JbnYolz7G7S
	G3E+TU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8bb5-00000001n6A-04eh;
	Sat, 26 Apr 2025 09:13:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8bYt-00000001mlV-34qs;
	Sat, 26 Apr 2025 09:11:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A068643F17;
	Sat, 26 Apr 2025 09:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F946C4CEE8;
	Sat, 26 Apr 2025 09:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745658663;
	bh=FtQjZM5OpR8eTj/Tk+/peoGkalxU+ZbYVlDYxiH1EPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bpo8Q55o67h7IwV7XIqnLMwJzS5hk0JlwLkWShp8X/AuNAuzFZIGLbhEhwmORDQll
	 utyYeCKtBH02BDpXzFi5Q1FKvNhyPsZBt461UT/aAjxLE4OiGapNZriDHHI8l+7QXr
	 n9eotkJikcjBuB5HJJspSA4xt66VwS5Fo+237shW5zLiSgUeEOqQVBAqBD1KGKoxqD
	 moj7nfOPSMrCmLKbKDLYqEowYy+npb3+2hA2IE87vcQa2omMyyLmyXIFr7iaKWGtR4
	 336OAdWEBAX7Zrbd0jqsolxYv5QUou7cyANxX79PsDPK/IGBihIfL/m1APtOMPUOki
	 +UAtUVW0IVm+A==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso26278691fa.3;
        Sat, 26 Apr 2025 02:11:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjrE3cBOYm/c/ndDkuse+/+N8+OIlOOWw20V1PTbTWCUCDzMOhJYYn5R1mcumSYE7Qf3xjyBXsEJFplJOqbA1a@lists.infradead.org, AJvYcCWQAqGdMXNhx5Aytk5a49ojOzsrs1pptEtL3hK90AFxouvspEO0EozIm8O1h0f59jhg9n/fgP1wh8FdJvQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHtXAddFhOB69keRlMmaMH9xkFpAkH6kx3OXVHKl/4jen9FwQT
	CSGA7C5wDyyvdjcaDP3UEFAdub7ZV4W5p7JBxomeiex01TsgvhkIgLCrRnGsUDoS7GAbPB0Wb3c
	JXyKfnvi1/Ok0SwzoHuJ/o3J4+bw=
X-Google-Smtp-Source: AGHT+IHLH5VeWV0U4iLUEk8k7RFRILjWBSdawBeD90fjLlL8DQGJ5x0W8iCulQNonT8aL01WrKimT1BHnCLrasm95sk=
X-Received: by 2002:a2e:a5c9:0:b0:30b:bba5:ac18 with SMTP id
 38308e7fff4ca-31905b6a5f0mr15804561fa.3.1745658661713; Sat, 26 Apr 2025
 02:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250426065041.1551914-1-ebiggers@kernel.org> <20250426065041.1551914-3-ebiggers@kernel.org>
In-Reply-To: <20250426065041.1551914-3-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 26 Apr 2025 11:10:50 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG+stJai+pQqAL7QwZHXV2a-hP4jjQKH7O2cBm1GK2aOA@mail.gmail.com>
X-Gm-Features: ATxdqUFDuzRMzSvvkZhhFNt-cqI-JOG2ysnGNbi6gxycTT7GyUoo4km_JN24bFc
Message-ID: <CAMj1kXG+stJai+pQqAL7QwZHXV2a-hP4jjQKH7O2cBm1GK2aOA@mail.gmail.com>
Subject: Re: [PATCH 02/13] crypto: arm/sha256 - implement library instead of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, 
	linux-s390@vger.kernel.org, x86@kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_021103_813235_6FA6B723 
X-CRM114-Status: GOOD (  17.23  )
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

On Sat, 26 Apr 2025 at 08:51, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Instead of providing crypto_shash algorithms for the arch-optimized
> SHA-256 code, instead implement the SHA-256 library.  This is much
> simpler, it makes the SHA-256 library functions be arch-optimized, and
> it fixes the longstanding issue where the arch-optimized SHA-256 was
> disabled by default.  SHA-256 still remains available through
> crypto_shash, but individual architectures no longer need to handle it.
>
> To merge the scalar, NEON, and CE code all into one module cleanly, add
> !CPU_V7M as a direct dependency of the CE code.  Previously, !CPU_V7M
> was only a direct dependency of the scalar and NEON code.  The result is
> still the same because CPU_V7M implies !KERNEL_MODE_NEON, so !CPU_V7M
> was already an indirect dependency of the CE code.
>
> To match sha256_blocks_arch(), change the type of the nblocks parameter
> of the assembly functions from int to size_t.  The assembly functions
> actually already treated it as size_t.
>
> While renaming the assembly files, also fix the naming quirk where
> "sha2" meant sha256.  (SHA-512 is also part of SHA-2.)
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/arm/configs/exynos_defconfig             |   1 -
>  arch/arm/configs/milbeaut_m10v_defconfig      |   1 -
>  arch/arm/configs/multi_v7_defconfig           |   1 -
>  arch/arm/configs/omap2plus_defconfig          |   1 -
>  arch/arm/configs/pxa_defconfig                |   1 -
>  arch/arm/crypto/Kconfig                       |  21 ----
>  arch/arm/crypto/Makefile                      |   8 +-
>  arch/arm/crypto/sha2-ce-glue.c                |  87 --------------
>  arch/arm/crypto/sha256_glue.c                 | 107 ------------------
>  arch/arm/crypto/sha256_glue.h                 |   9 --
>  arch/arm/crypto/sha256_neon_glue.c            |  75 ------------
>  arch/arm/lib/crypto/.gitignore                |   1 +
>  arch/arm/lib/crypto/Kconfig                   |   6 +
>  arch/arm/lib/crypto/Makefile                  |   8 +-
>  arch/arm/{ => lib}/crypto/sha256-armv4.pl     |   0
>  .../sha2-ce-core.S => lib/crypto/sha256-ce.S} |  10 +-
>  arch/arm/lib/crypto/sha256.c                  |  64 +++++++++++
>  17 files changed, 84 insertions(+), 317 deletions(-)
>  delete mode 100644 arch/arm/crypto/sha2-ce-glue.c
>  delete mode 100644 arch/arm/crypto/sha256_glue.c
>  delete mode 100644 arch/arm/crypto/sha256_glue.h
>  delete mode 100644 arch/arm/crypto/sha256_neon_glue.c
>  rename arch/arm/{ => lib}/crypto/sha256-armv4.pl (100%)
>  rename arch/arm/{crypto/sha2-ce-core.S => lib/crypto/sha256-ce.S} (91%)
>  create mode 100644 arch/arm/lib/crypto/sha256.c
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

