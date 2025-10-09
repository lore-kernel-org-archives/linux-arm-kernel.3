Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDA3CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 01:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pf7jqXbWOnWfySIA6lQmKNb481iT1x0PI2Co78K1Es0=; b=0mR52Iyb5Si/DqMi7jGer9usc+
	8VLBplrdI5fW+CAvPCmQ9Zo1jl01vbBGwEc0Pex4/e5dRRW6DjTKzMKFFuTd9twpLOSav7keX0dkO
	1klyAcfV4D506owmF7t5hSfD9dwkgEsu9WxWZS1pOYtuBWuH4h4xrkgdM0aA7+Uem442tGRKHODoG
	+Hwv35+6BZr/w1mRNMgy5L1ryzGxzuTv1mutpbD1/srcfkw0Cuhmt1iKDBq/dltUJtzT9AbPYFBQu
	806v0YSICjJPBvBIiY4HzE5QtIzN01aHn3oJnwIiuC58WpmZHInXK1fw0LWXzrFGHeVK+YvYloNp5
	kcEckM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7q-00000004ucr-3RBl;
	Thu, 09 Oct 2025 01:07:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7n-00000004uZc-4993;
	Thu, 09 Oct 2025 01:07:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8F9748840;
	Thu,  9 Oct 2025 01:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1B5C4CEF5;
	Thu,  9 Oct 2025 01:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972039;
	bh=t6dp3X5zH0EXAKG5SlHHvBagHVmQAF54vkAiSOAzRro=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hjYsA57WUk/Uk8p2fuaW+XkuH44BrQ0BB/rx3wHmvL7Nz5SEpfaDFIXoicRvUMnFO
	 7+UhpTNDXdZYg/SYGwPDbRKGUalwZjDBR3Yk/sn9Iktr2OCSplwbASH1t2VQZjcTOI
	 BU8M4dF6UujKz6YyhNr7/Jj+w1iZJD4BktB8rsRZV7CDWC/Yyj/AVaCJeuCOSA5QqX
	 CIrJ8oV6iWtuTCoNIPR+ExaOEDuwd7AKYGUlUAZVrT0MqW5h8HXO8HcmQktZM72qCh
	 6eCrEa9whwxNi/OPCSMdhTiMm1GJrzQEVPttyBmW4pm8ET69I8Yufn3a78+p7qvGbf
	 VGm+6zkZOIsRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C163A41017;
	Thu,  9 Oct 2025 01:07:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/12] Bump minimum supported version of LLVM for
 building the kernel to 15.0.0
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175997202775.3661959.1535236572113247824.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:07:07 +0000
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 arnd@arndb.de, kees@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, llvm@lists.linux.dev,
 patches@lists.linux.dev, nsc@kernel.org, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux@armlinux.org.uk, ardb@kernel.org,
 linux-arm-kernel@lists.infradead.org, will@kernel.org,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, palmer@dabbelt.com, alex@ghiti.fr,
 elver@google.com, peterz@infraded.org, kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_180720_053056_72C98488 
X-CRM114-Status: UNSURE (   9.07  )
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

This series was applied to riscv/linux.git (for-next)
by Nathan Chancellor <nathan@kernel.org>:

On Thu, 21 Aug 2025 14:15:37 -0700 you wrote:
> s390 and x86 have required LLVM 15 since
> 
>   30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang version to 15.0.0 for s390")
>   7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")
> 
> respectively. This series bumps the rest of the kernel to 15.0.0 to
> match, which allows for a decent number of clean ups.
> 
> [...]

Here is the summary with links:
  - [v2,07/12] riscv: Remove version check for LTO_CLANG selects
    https://git.kernel.org/riscv/c/6578a1ff6aa4
  - [v2,08/12] riscv: Unconditionally use linker relaxation
    https://git.kernel.org/riscv/c/7ccbe91796d7
  - [v2,09/12] riscv: Remove ld.lld version checks from many TOOLCHAIN_HAS configs
    https://git.kernel.org/riscv/c/87b28d71396b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



