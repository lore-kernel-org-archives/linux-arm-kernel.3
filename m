Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4446360A2625
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nnOg+waQ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YLtzwK85
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zWjchA1R3k2PWinfdPa1bmSSkYcmsFonhHSsoHtMyf0=; b=nnOg+waQT3WbFF
	kR7jnL7c6odnq3xbfI73mfGWzBMTe9H3u/BKnMGjqd5YyRxNwPUNN3c53JAraeiT/kJyRjpK9na34
	sya4qejyY0DUgl56ecSrbOMILcryGMCRHghZPxCWsU3cpr7KbpubSdmY02/ABK8fEYKWEq84Wwb7F
	ROxH1n2CR1UOzZukLvvsbB6AELvEsDcqqeXYDgrXn0mO0ljK7k8JnLuZxNJhU/Kpk1wLGrqyoU/iM
	ga+Qf92md6lI+OX2nkNKIFog/zBuSrWsXzVPrLh7Or2NTr4FnT1cr8ZD4jD8PlXWsBnX/6mRTgWTo
	bva4nF1ktOA5BIHUZ1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqA-0000000Eys1-3MVl;
	Sun, 01 Nov 2026 22:15:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdq9-0000000Eypa-07VY;
	Sun, 01 Nov 2026 22:15:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2CE043EBB;
	Sun,  1 Nov 2026 22:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8672C1F000C1;
	Sun,  1 Nov 2026 22:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571348;
	bh=zWjchA1R3k2PWinfdPa1bmSSkYcmsFonhHSsoHtMyf0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=YLtzwK85l4hGxLyA70UvP4j1W3M7aK0AnO65y/AzsiFBwFu+o+am4lM03VbtHtJ5K
	 SS29sY8vrSYrA6jdvWzfwe5K90LxJtzoHxZZu0mTSUAvpZkN1PYLCGRsEs6UgYx0aB
	 97oKuIhcSNLzzTU7IsY2JDbPwHgALU8UUMTUIacoZU37AQpC6KtulGbzQ30fh/1Pj7
	 439Gr0UJypJlNRfMtvA0ZTTdkqVe4hPq7HarsqK8Usmvu9Wk0QYv2Bnam4S5juFWnH
	 d/jArMh+zoyROvtkvZe5ytr6PBXG3TqNVsxhJFaqiJVBj+Botefdp40TKRHbDajTSy
	 ztyxsj6TJTA0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D5C738003B8;
	Sun,  1 Nov 2026 22:15:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/15] vdso: Clean up the vsyscall.h headers
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357134704.2624073.7289302544673229273.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:47 +0000
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, luto@kernel.org, tglx@kernel.org,
 vincenzo.frascino@arm.com, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Wed, 09 Sep 2026 10:51:13 +0200 you wrote:
> The vsyscall.h headers are a mess. Some of that was necessary back when
> some architectures where not using the generic vDSO infrastructure.
> Now that this is not necessary anymore, the headers can be cleaned up
> and many of the can be deleted altogether.
> 
> The recipient list is trimmed to only the vDSO maintainers and the
> architecture lists.
> 
> [...]

Here is the summary with links:
  - [01/15] vdso: Move the kernel-side time update helpers to a new header
    https://git.kernel.org/riscv/c/35f0a96848a7
  - [02/15] vdso/gettimeofday: Define fallback __arch_get_vdso_u_time_data() in gettimeofday.c
    https://git.kernel.org/riscv/c/4fba7bb3e73a
  - [03/15] vdso/getrandom: Define fallback __arch_get_vdso_u_rng_data() in getrandom.c
    https://git.kernel.org/riscv/c/ca0da001d3cf
  - [04/15] vdso/vsyscall: Define fallback time synchronization functions in vsyscall.c
    https://git.kernel.org/riscv/c/e4eeeaa14d8d
  - [05/15] vdso: Delete asm-generic/vdso/vsyscall.h
    https://git.kernel.org/riscv/c/8579b901d150
  - [06/15] x86/vdso: Move vDSO page definitions to asm/vdso.h
    https://git.kernel.org/riscv/c/8051a0f482e6
  - [07/15] sparc/vdso: Move __VDSO_PAGES to asm/vdso.h
    https://git.kernel.org/riscv/c/782478555fc6
  - [08/15] s390/vdso: Delete asm/vdso/vsyscall.h inclusions
    https://git.kernel.org/riscv/c/d5b1dadd2ef0
  - [09/15] sparc/vdso: Delete asm/vdso/vsyscall.h inclusion
    https://git.kernel.org/riscv/c/cc729f844815
  - [10/15] x86/vdso: Delete asm/vdso/vsyscall.h inclusions
    https://git.kernel.org/riscv/c/3086b69ee00f
  - [11/15] arm64/vdso: Delete asm/vdso/vsyscall.h inclusions
    https://git.kernel.org/riscv/c/128b1c7d3ac8
  - [12/15] riscv/hwprobe: Include vdso/datapage.h
    https://git.kernel.org/riscv/c/0d10af5db481
  - [13/15] vdso: Remove unnecessary vdso/vsyscall.h includes
    https://git.kernel.org/riscv/c/d6df494a0135
  - [14/15] vdso: Add asm-generic/vdso/vsyscall.h
    https://git.kernel.org/riscv/c/996b01393e93
  - [15/15] vdso: Remove __ASSEMBLER__ guards from vsyscall.h
    https://git.kernel.org/riscv/c/9e61cabcce2b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



