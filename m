Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7FCC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klzkC/mBQYrKBqRLnx7KXQRmttXlWXMkZplNZw9WkTo=; b=lA75LgoICrwjfEQetAJi3weSRI
	ZLkFc4PeVRwm5q8RHwzrUQAaVQ9NzQu3MArypeVjxP3qScsP8S1ObbjAyLiQy6O0Grx8gx4g5L4R8
	k0IQ1qF07E5yuHoU/FX+5PuSd3c7xjMMy3tTKxSAsUYFlnajAKYZ8MebgDlAOa5TZVayVM07st7c0
	o8otrfGMQKEpAFlUYp2Jmong3BwnydsljXiGj8MkgQA1q9Ny3GCNEv/DJV7iZjC/VM2Y7hhxluN8F
	vq0G0FChuO6rd9BeeIPJDmX8T6ecV/WY/DSLBqaH7nayJsY14sA5NV8jRaCNiC1f9rsrfuKD+WDwS
	44ik29sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29r1-00000004MaM-2I77;
	Tue, 08 Apr 2025 14:23:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29oz-00000004MBO-29SJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:21:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B5431688;
	Tue,  8 Apr 2025 07:21:01 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3508A3F6A8;
	Tue,  8 Apr 2025 07:20:56 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:20:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 0/4] Make gcc-8.1 and binutils-2.30 the minimum version
Message-ID: <Z_Uwxe46_o5nYkMB@J2N7QTR9R3.cambridge.arm.com>
References: <20250407094116.1339199-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407094116.1339199-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_072101_639488_3F478BB3 
X-CRM114-Status: GOOD (  20.72  )
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

On Mon, Apr 07, 2025 at 11:41:12AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> x86 already requires gcc-8.1 since linux-6.15-rc1, which led me to
> actually go through all  version checks and make this is the minimum
> for all architectures.

I am very much in favour of this, so for the series:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Is the aim to get this in for v6.15?

I believe this will permit a number of further cleanups for arm64, and
if it's possible to get this in for v6.15, it'd be a bit easier to start
preparing those for v6.16. No big problem if that's not the case.

Mark.

> 
> Most of the actual resulting changes are actually for raising the
> binutils version, which eliminates version checks on x86 and arm64.
> 
> Arnd Bergmann (4):
>   kbuild: require gcc-8 and binutils-2.30
>   raid6: skip avx512 checks
>   x86: remove checks for binutils-2.30 and earlier
>   arm64: drop binutils version checks
> 
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Brian Gerst <brgerst@gmail.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Uros Bizjak <ubizjak@gmail.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-raid@vger.kernel.org
> Cc: x86@kernel.org
> 
>  Documentation/admin-guide/README.rst          |  2 +-
>  Documentation/kbuild/makefiles.rst            |  4 +-
>  Documentation/process/changes.rst             |  4 +-
>  .../translations/it_IT/process/changes.rst    |  4 +-
>  .../translations/zh_CN/admin-guide/README.rst |  2 +-
>  arch/arm64/Kconfig                            | 37 +--------------
>  arch/arm64/Makefile                           | 21 +--------
>  arch/arm64/include/asm/rwonce.h               |  4 --
>  arch/arm64/kvm/Kconfig                        |  1 -
>  arch/arm64/lib/xor-neon.c                     |  2 +-
>  arch/um/Makefile                              |  4 +-
>  arch/x86/Kconfig.assembler                    | 29 ------------
>  arch/x86/crypto/Kconfig                       |  2 +-
>  arch/x86/crypto/Makefile                      | 12 +++--
>  arch/x86/crypto/aes-ctr-avx-x86_64.S          |  2 -
>  arch/x86/crypto/aes-xts-avx-x86_64.S          |  2 -
>  arch/x86/crypto/aesni-intel_glue.c            | 21 +--------
>  arch/x86/crypto/aria-aesni-avx-asm_64.S       | 10 -----
>  arch/x86/crypto/aria-aesni-avx2-asm_64.S      | 10 +----
>  arch/x86/crypto/aria_aesni_avx2_glue.c        |  4 +-
>  arch/x86/crypto/aria_aesni_avx_glue.c         |  4 +-
>  arch/x86/crypto/blake2s-core.S                |  4 --
>  arch/x86/crypto/blake2s-glue.c                |  6 +--
>  arch/x86/crypto/chacha_glue.c                 |  6 +--
>  arch/x86/crypto/poly1305-x86_64-cryptogams.pl |  8 ----
>  arch/x86/crypto/poly1305_glue.c               |  4 +-
>  arch/x86/crypto/sha1_ssse3_glue.c             | 10 -----
>  arch/x86/crypto/sha256_ssse3_glue.c           | 10 -----
>  include/linux/unroll.h                        |  4 +-
>  kernel/gcov/gcc_4_7.c                         |  4 --
>  lib/raid6/algos.c                             |  6 ---
>  lib/raid6/avx512.c                            |  4 --
>  lib/raid6/recov_avx512.c                      |  6 ---
>  lib/raid6/test/Makefile                       |  3 --
>  lib/test_fortify/Makefile                     |  5 +--
>  scripts/Makefile.compiler                     |  2 +-
>  scripts/gcc-plugins/gcc-common.h              | 45 -------------------
>  scripts/min-tool-version.sh                   |  6 +--
>  38 files changed, 36 insertions(+), 278 deletions(-)
> 
> -- 
> 2.39.5
> 

