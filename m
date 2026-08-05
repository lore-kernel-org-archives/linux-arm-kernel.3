Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF645C55838
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 01:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3KX9skCpKY11w+0FlGhhpohym5ngk1RFk12GUsJf1c=; b=LLznSEpdKUMNvW3XDoDnPsWVkt
	a5qPpTEOFTRuF3V7bhZUpf/OWGk7mWs7Er/s7dXYz/HzFwmKtRz2x47aPp9rPm6FVFlKgg0pxWy/6
	itlsU3hfN6Vp+2tMo42nNFDCM6YLTXOOa+gq44ApasWPdaUlMhcpfWfS61HxrLah79fiVsOKt89Sf
	KgSsiAtvbvnPa1uh+5r+zvovCqzf7i3eHY7SM0tsaISbJ5kvuvUMLO7CPmmGtAa+vM0qe5+zBmRgj
	eU/xJuK8l4UgUDy/yxH9v3pp13idWJbigA2e//76LpVsAhCKvkB6IKjBtpsu5PQw2sgOQbgoFBg2l
	147PZV6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrQ0A-000000031qV-3cDg;
	Wed, 05 Aug 2026 01:00:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrQ09-000000031q2-31iM;
	Wed, 05 Aug 2026 01:00:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F3C160052;
	Wed,  5 Aug 2026 01:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DB11F00A3E;
	Wed,  5 Aug 2026 01:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785891656;
	bh=o3KX9skCpKY11w+0FlGhhpohym5ngk1RFk12GUsJf1c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZdiRkgYOxwCPkyMP9MXyafK1991EZ2jyJgUEjzC2UWj9+QArYQs43RDm9QZJNPw0m
	 oy0b1mpk81lRd6mP9Kd9YkyGgkV1nRaJrd01I4S90yQpJEKYyP8gRTOLOUS81omaFE
	 xeWYq13BjLzViMjeSeU45Ni79OpHKVfICNf85FDTslgPXrV98IaZvWvqEhmd1q2KTN
	 fG38PHUUcJr3FF2zkt88SvL1ShkgvHtc2+0xQ/wCSJAxsL46ftyEAP0X4WbI5NP3lJ
	 bBHYQLmu27YWWGOIGiaZkH3m31IkjoAIV1qCeQzcqpRZlOvtdE3wFNxW6emnA80SNb
	 c/VoDu4hfMiBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09C53926663;
	Wed,  5 Aug 2026 01:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 00/22] Add Counter delegation ISA extension support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178589161639.3856351.5268442875805678038.git-patchwork-notify@kernel.org>
Date: Wed, 05 Aug 2026 01:00:16 +0000
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
In-Reply-To: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: linux-riscv@lists.infradead.org, jolsa@kernel.org, pjw@kernel.org,
 mark.rutland@arm.com, robh@kernel.org, anup@brainfault.org,
 namhyung@kernel.org, acme@kernel.org, krzk+dt@kernel.org, irogers@google.com,
 will@kernel.org, james.clark@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org,
 conor@kernel.org
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
by Paul Walmsley <pjw@kernel.org>:

On Wed, 01 Jul 2026 01:46:48 -0700 you wrote:
> This series adds the counter delegation extension support. It is based on
> very early PoC work done by Kevin Xue and mostly rewritten after that.
> The counter delegation ISA extension(Smcdeleg/Ssccfg) actually depends
> on multiple ISA extensions.
> 
> 1. S[m|s]csrind : The indirect CSR extension[1] which defines additional
>    5 ([M|S|VS]IREG2-[M|S|VS]IREG6) register to address size limitation of
>    RISC-V CSR address space.
> 2. Smstateen: The stateen bit[60] controls the access to the registers
>    indirectly via the above indirect registers.
> 3. Smcdeleg/Ssccfg: The counter delegation extensions[2]
> 
> [...]

Here is the summary with links:
  - [v8,01/22] RISC-V: perf: fix resource cleanup on driver probe failure
    https://git.kernel.org/riscv/c/bf08074d8a20
  - [v8,02/22] RISC-V: Add Sxcsrind ISA extension CSR definitions
    https://git.kernel.org/riscv/c/7c31031b2974
  - [v8,03/22] RISC-V: Add Sxcsrind ISA extension definition and parsing
    https://git.kernel.org/riscv/c/7fe9435ef9e7
  - [v8,04/22] dt-bindings: riscv: add Sxcsrind ISA extension description
    https://git.kernel.org/riscv/c/010e2b79bd08
  - [v8,05/22] RISC-V: Define indirect CSR access helpers
    https://git.kernel.org/riscv/c/6f1ece4a6691
  - [v8,06/22] RISC-V: Add Smcntrpmf extension parsing
    https://git.kernel.org/riscv/c/935bfae38e57
  - [v8,07/22] dt-bindings: riscv: add Smcntrpmf ISA extension description
    https://git.kernel.org/riscv/c/837eaefa4d63
  - [v8,08/22] RISC-V: Add Sscfg extension CSR definition
    https://git.kernel.org/riscv/c/db40f62b80ec
  - [v8,09/22] RISC-V: Add Ssccfg/Smcdeleg ISA extension definition and parsing
    https://git.kernel.org/riscv/c/2ea70441fe0f
  - [v8,10/22] dt-bindings: riscv: add Counter delegation ISA extensions description
    https://git.kernel.org/riscv/c/b8d69e7159cc
  - [v8,11/22] RISC-V: perf: Restructure the SBI PMU code
    (no matching commit)
  - [v8,12/22] RISC-V: perf: Modify the counter discovery mechanism
    (no matching commit)
  - [v8,13/22] RISC-V: perf: Add a mechanism to defined legacy event encoding
    (no matching commit)
  - [v8,14/22] RISC-V: perf: Implement supervisor counter delegation support
    (no matching commit)
  - [v8,15/22] RISC-V: perf: Skip PMU SBI extension when not implemented
    (no matching commit)
  - [v8,16/22] RISC-V: perf: Use config2/vendor table for event to counter mapping
    (no matching commit)
  - [v8,17/22] RISC-V: perf: Add legacy event encodings via sysfs
    (no matching commit)
  - [v8,18/22] RISC-V: perf: Add Qemu virt machine events
    (no matching commit)
  - [v8,19/22] tools/perf: Support event code for arch standard events
    (no matching commit)
  - [v8,20/22] tools/perf: Add RISC-V CounterIDMask event field
    (no matching commit)
  - [v8,21/22] TEST(do-not-upstream): fake qemu-virt PMU events for cdeleg counter-mask testing
    (no matching commit)
  - [v8,22/22] TEST(do-not-upstream): fake qemu vendor JSON + mapfile entry for CounterIDMask path
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



