Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B48CA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 21:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHGi9waLbc/LXqI7q6196IqO0koRV2UuvFn61AeiCls=; b=CcIt3587aFkB5j7bsQktoabD4/
	LJadMq/E5GvIwR3q6aRxcXmH5GkpByblqOAJiB0xFhCk8c61oXZGZOqiIuTgSoPKJVF3ISJJxyIqV
	y+F/rFa/DVJPF0N8wRTBcFmk/Jiy+qjzbfDRzn2o44VODak2JJcVOwGnMXwgOhNyHwDuQDEzvkY2l
	4Iys+HTBKjIeVI+wKriQF0eSK/54WQr42dVz36PY/Lt+uPWP0wzJbJqEE5Bx2EKWknogSrulOgFQp
	ECqUJExktDwMRckuyXDVgWiogSYpS96ktxXcNVtpsABzEeug+u7B5T9Jng4bm5H2cKMLpgaUX5gKV
	mKg5850A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDPy-0000000617E-3rNq;
	Sun, 10 Aug 2025 21:17:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDKs-00000005zY2-1EUk;
	Sun, 10 Aug 2025 21:12:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F149F45AF0;
	Sun, 10 Aug 2025 21:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF676C4CEEB;
	Sun, 10 Aug 2025 21:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860329;
	bh=PTB+y1bea+X0pwle+Qsb0krCZI4wJwkr28qnyuTl7j4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HCOBV3tU+ctjdX3pY3Zg/0pvMsfqNnXGmHLBwd4NcMVjVEH7cvRnVceivTVzUTBgz
	 iBywCPbd901UmslM78Hnuk/eTpHS6/f3sLyf9xPRghxH/2C+4EPHmKaK3TU1y8G/SD
	 2LZGbg4pzBNtyw7wRgsvYlW0+yX8/zcykqfhKvNIWp878PjsojxBNWCh5PKt5A4KoZ
	 LQ8F53gT97pNeIvGJtMveQduZsLP39bJ9M6pBSMzg1LErA9A75yivHXsm8MZHlMgbc
	 tG9XSvaRQ5XBE9KczEQP5WOF5MlpsjN04vNY4GNEFA7Y6xVuMV9vlzvKe/2lUu0GBk
	 cXiQT6eCpZTTg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD1539D0C2B;
	Sun, 10 Aug 2025 21:12:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 00/13] stackleak: Support Clang stack depth tracking
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486034248.1221929.3658503475425874388.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:22 +0000
References: <20250717231756.make.423-kees@kernel.org>
In-Reply-To: <20250717231756.make.423-kees@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-riscv@lists.infradead.org, arnd@arndb.de, mingo@kernel.org,
 gustavoars@kernel.org, hch@lst.de, andreyknvl@gmail.com,
 ryabinin.a.a@gmail.com, ardb@kernel.org, masahiroy@kernel.org,
 nathan@kernel.org, nicolas.schier@linux.dev, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, linux-kernel@vger.kernel.org,
 x86@kernel.org, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141210_386634_21C0928B 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Kees Cook <kees@kernel.org>:

On Thu, 17 Jul 2025 16:25:05 -0700 you wrote:
> v3:
>   - split up and drop __init vs inline patches that went via arch trees
>   - apply feedback about preferring __init to __always_inline
>   - incorporate Ritesh Harjani's patch for __init cleanups in powerpc
>   - wider build testing on older compilers
>  v2: https://lore.kernel.org/lkml/20250523043251.it.550-kees@kernel.org/
>  v1: https://lore.kernel.org/lkml/20250507180852.work.231-kees@kernel.org/
> 
> [...]

Here is the summary with links:
  - [v3,01/13] stackleak: Rename STACKLEAK to KSTACK_ERASE
    (no matching commit)
  - [v3,02/13] stackleak: Rename stackleak_track_stack to __sanitizer_cov_stack_depth
    (no matching commit)
  - [v3,03/13] stackleak: Split KSTACK_ERASE_CFLAGS from GCC_PLUGINS_CFLAGS
    (no matching commit)
  - [v3,04/13] x86: Handle KCOV __init vs inline mismatches
    (no matching commit)
  - [v3,05/13] arm: Handle KCOV __init vs inline mismatches
    (no matching commit)
  - [v3,06/13] arm64: Handle KCOV __init vs inline mismatches
    https://git.kernel.org/riscv/c/65c430906eff
  - [v3,07/13] s390: Handle KCOV __init vs inline mismatches
    https://git.kernel.org/riscv/c/c64d6be1a6f8
  - [v3,08/13] powerpc/mm/book3s64: Move kfence and debug_pagealloc related calls to __init section
    https://git.kernel.org/riscv/c/645d1b666498
  - [v3,09/13] mips: Handle KCOV __init vs inline mismatch
    https://git.kernel.org/riscv/c/d01daf9d95c9
  - [v3,10/13] init.h: Disable sanitizer coverage for __init and __head
    https://git.kernel.org/riscv/c/381a38ea53d2
  - [v3,11/13] kstack_erase: Support Clang stack depth tracking
    (no matching commit)
  - [v3,12/13] configs/hardening: Enable CONFIG_KSTACK_ERASE
    https://git.kernel.org/riscv/c/4c56d9f7e75e
  - [v3,13/13] configs/hardening: Enable CONFIG_INIT_ON_FREE_DEFAULT_ON
    https://git.kernel.org/riscv/c/437641a72d0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



