Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4188CF31B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9/v5xqnmZkFVjtdysROSYnBVkudiSUhwZw2XBxrnKQ=; b=SwqQtqAcobkPJjFTOQwVNLhay0
	bep75wh+EeyvnQKbwBXX/5kE2+ZTDKL44MCX9KebmVpvlPWtK8aIbdf3MyKMxWGlA3UABJYv0dLD2
	3Pjfxyj7jwO9ixIBivZ/ZTgxwYwLag466xrzRAroPJRkQE7nDmWRBJ7ZXtkZisMpCtPWZl+nrWGNI
	JE1KEsA2fjhL/C1rhmwEX1olMNfju6Xz279bVUG24+ZCRuHvVeow3+wb8dg2RHV9HjKtNz3/TczY1
	bQ/Rywpjakl27aFRCaNsTfh8/E5/jvNuOu9lytcHiRE1vir+wPURSFtHgVrtGY/Idtp+4yoD59c8Q
	S9HCjBYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhKq-00000003A9F-2PDy;
	Wed, 19 Nov 2025 12:30:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhKo-00000003A78-0Kr9;
	Wed, 19 Nov 2025 12:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 68FFA602C6;
	Wed, 19 Nov 2025 12:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9258EC4AF62;
	Wed, 19 Nov 2025 12:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763555452;
	bh=T+uuXoZYcmTf+MuDvFOO70O2O5xbNfTyuRzJxZQG9cQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=avXEy9sBvfTHQYZ31wm48f6V6vM8KArF63yBBl3JIG2MB5vtBrhKNrmpM49so2AMt
	 Ou8fivgKvK5b/arnHJIVVcUe0iVtiE0z35QRVMKmiUKI2jaQR3p+pI3QCFDb1PFyex
	 FcqEdPMgT5SO/wBu5wKbDFEMxwJCLoIDaNq+xg9AbT46pL7CMjw+HZcwYqBCIrgEK3
	 fkgJtA4b1NFMmkjbZMdRCdXFWTjPpElJHDonl9//3Rau8uf44aylDBsft4JbcNRxNc
	 NsPE9ykUO15Ng2GtsmItQGwNaEYqDJ5620TwFmItmlP7S1Vqel9mJiLAsCVeL5Y2DG
	 VM/HkBOmP569g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DC3380AA40;
	Wed, 19 Nov 2025 12:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 0/5] riscv: add support for SBI Supervisor Software
 Events
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176355541775.758643.18140349571928540394.git-patchwork-notify@kernel.org>
Date: Wed, 19 Nov 2025 12:30:17 +0000
References: <20251105082639.342973-1-cleger@rivosinc.com>
In-Reply-To: <20251105082639.342973-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, hchauhan@ventanamicro.com,
 apatel@ventanamicro.com, luxu.kernel@bytedance.com, atishp@atishpatra.org,
 bjorn@rivosinc.com, cuiyunhui@bytedance.com
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

On Wed,  5 Nov 2025 08:26:32 +0000 you wrote:
> The SBI Supervisor Software Events (SSE) extensions provides a mechanism
> to inject software events from an SBI implementation to supervisor
> software such that it preempts all other supervisor level traps and
> interrupts. This extension is introduced by the SBI v3.0 specification[1].
> 
> Various events are defined and can be send asynchronously to supervisor
> software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
> as platform specific events. Events can be either local (per-hart) or
> global. Events can be nested on top of each other based on priority and
> can interrupt the kernel at any time.
> 
> [...]

Here is the summary with links:
  - [v8,1/5] riscv: add SBI SSE extension definitions
    https://git.kernel.org/riscv/c/7bba38249b8a
  - [v8,2/5] riscv: add support for SBI Supervisor Software Events extension
    https://git.kernel.org/riscv/c/b52179e6de7d
  - [v8,3/5] drivers: firmware: add riscv SSE support
    https://git.kernel.org/riscv/c/5ffe60d26107
  - [v8,4/5] perf: RISC-V: add support for SSE event
    https://git.kernel.org/riscv/c/c6f3f04d2a9c
  - [v8,5/5] selftests/riscv: add SSE test module
    https://git.kernel.org/riscv/c/a123316660af

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



