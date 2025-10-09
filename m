Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B6FCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 01:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Godd2xdELLl8pRhLIf389eS3C6nK6bE96pcvVwqQimk=; b=dQRmGkUNzZXXtT/s8hi4MmjbG6
	Qrt7+WN6+YohtRyiZ3HVa6HkJE4XoBKGsqPlaRb3diHXYJeZy23+YIDAwRPZKAg/OZJLTEBce3tI8
	rbAi/HRzKh5YPNcD+F+ee+11hz5qZJqKzSXIy/QNTCyDq+3074FrQUD2Od6QK6blQXxcvc0pkdFvh
	2q4OFyX+j1PU0XqxPgORJooUuTzWU67a8vQwrEwxtC+Zqrkh7LPvpgJHFx0iFtvON012EmKY9N0AK
	xa2NQSEbfdEbPIv+uIPtYIZPQr0PFj2YhzFuz7QQsoJsjJQ9orgNqoPIQa7bHE/hDYFMGxfskIj+0
	vAgaugAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7e-00000004uSK-3IbI;
	Thu, 09 Oct 2025 01:07:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7c-00000004uRJ-2hkN;
	Thu, 09 Oct 2025 01:07:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3A866212F;
	Thu,  9 Oct 2025 01:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE42C4CEF8;
	Thu,  9 Oct 2025 01:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972027;
	bh=VISjCl3028ZdolLBlNDZGd4lu4o1butuKMV03AtZBlw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Z85MDq7bFHAVb7Rv7QvW4jT9Y15cPiI0WVlhCJV3Hb8KzH2ZYtKDIugmNBfAaGySd
	 z5ewF5rNJ+Eg/0lDf4iQ7eqlYgIW0QFXYttqFueGd0EyH0q3YxGVMid01GmetPjhLw
	 CLKH4BhiZk2QE9ZHGNcP1R+Uu7twuBVmXVU7JX+WU6Qkgezekw/tfTay9IqLn/03qv
	 fGM0puNNPNlEwlNS8diIH3zKif6A6uWsftAXlyDWexxIsHVq/Ua4/nh1U3nC4uYics
	 +WuF25l1nNqeg2I6RnH6RhbrrEuRMwXBeUzGy3elVssgawfAsHG1eRRK1qPPGapFZ4
	 MDqB4RaRlBhng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB00C3A41017;
	Thu,  9 Oct 2025 01:06:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/11] vdso: Various cleanups
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175997201575.3661959.11378704835584004005.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:06:55 +0000
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
In-Reply-To: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, luto@kernel.org, tglx@linutronix.de,
 vincenzo.frascino@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, namcao@linutronix.de,
 linux@armlinux.org.uk, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, arnd@arndb.de,
 brauner@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux@rasmusvillemoes.dk
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

This series was applied to riscv/linux.git (for-next)
by Thomas Gleixner <tglx@linutronix.de>:

On Tue, 26 Aug 2025 08:17:03 +0200 you wrote:
> Various cleanups to the generic vDSO infrastructure and a patch for ARM
> which was never applied.
> 
> This series has one trivial syntactic conflict with "dso/datastore: Allow
> prefaulting by mlockall()" [0] and a semantic one with "sparc64: vdso:
> Switch to generic vDSO library" [1], which still uses the removed
> GENERIC_VDSO_DATA_STORE.
> 
> [...]

Here is the summary with links:
  - [01/11] vdso/datastore: Gate time data behind CONFIG_GENERIC_GETTIMEOFDAY
    https://git.kernel.org/riscv/c/7c0c01a216e6
  - [02/11] ARM: VDSO: remove cntvct_ok global variable
    https://git.kernel.org/riscv/c/39f1ee1299c9
  - [03/11] vdso: Move ENABLE_COMPAT_VDSO from core to arm64
    https://git.kernel.org/riscv/c/7d298d25ce81
  - [04/11] vdso/gettimeofday: Remove !CONFIG_TIME_NS stubs
    https://git.kernel.org/riscv/c/f145d6bf8d59
  - [05/11] time: Build generic update_vsyscall() only with generic time vDSO
    https://git.kernel.org/riscv/c/ea1a1fa919a5
  - [06/11] riscv: vdso: Untangle kconfig logic
    https://git.kernel.org/riscv/c/eb3b66aab72c
  - [07/11] vdso: Drop kconfig GENERIC_VDSO_32
    https://git.kernel.org/riscv/c/278f1c933c3f
  - [08/11] vdso: Drop kconfig GENERIC_COMPAT_VDSO
    https://git.kernel.org/riscv/c/bb5bc7bfab06
  - [09/11] vdso: Drop kconfig GENERIC_VDSO_DATA_STORE
    https://git.kernel.org/riscv/c/7b338f6d4e3d
  - [10/11] vdso: Drop kconfig GENERIC_VDSO_TIME_NS
    https://git.kernel.org/riscv/c/bad53ae2dc42
  - [11/11] vdso: Gate VDSO_GETRANDOM behind HAVE_GENERIC_VDSO
    https://git.kernel.org/riscv/c/258b37c6e626

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



