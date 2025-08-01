Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDEEC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 01:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vgxc1jFZisI2PzPZdnHgZPM5qkls/ofcwGURcVXzrMs=; b=2FnUhqSQSESA54uY+LcNh/mpB8
	wE0rjHmemxtq2GUof1yuURFHKunpAQDicpSJxJlYHZWyie74o9Ng2Kh+ajao3CmEnbw9Eb3gekfpt
	qWVLkFCPumy9VgZ699y9rHFUpO0bPhPFGnGMayfGAn0c5/yAE3QAo35olFC4YVRUNntyZJ1kwUCGd
	hAxkvrqreYwAIKIdE0f9TmqQi3Mv/MEJBObWhWM+8PScbSRSaW4mEkxy5uBjxD1iN8fSB8tKETKoP
	OcIC1H1LUFbWYUQWSfDfLQ0z0QI2ChCLoBg0JVHsLxE+Qt0UuzVbnezn6n3kWlw4IY+PawkePBE3H
	HtpyFOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhedQ-00000004mjt-3l55;
	Fri, 01 Aug 2025 01:32:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uheaq-00000004mUE-1UlU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 01:29:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 536EF5C66B3;
	Fri,  1 Aug 2025 01:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD95C4CEEF;
	Fri,  1 Aug 2025 01:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754011795;
	bh=1BE+9oBhcTylDitTiXbzexLR2EordeI+B2H+uniTVs4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hATgpV+3peMrAg3cQ7RKli+CYasgvWaxBqE4JUXISuIQNKF8+uIAEUfGW+hGVagbu
	 lbeQUzJiD4DsVNHyrDlM3EHA/oHR2Fc5ur1P5rGhNTYXsM9hkKbNvKEpDo/emadXUo
	 3SMYF4ImxD2uH5sOq0RoPZvFkgnI4Z2aSFgSjgWSouAU5aXYudbIm2LVA8kXk8KJRP
	 Dk+uIrXakMtyzbRiDubjnswMPyxViPEpnkZufgg6cv4XEp2705/g5O2LxiYVk/4nd1
	 9NnJMnbYl9nJt4g1EGgtftv7Q7R5LfbomONj8jihKQ4x7uSMfuU2X0sXjsqgx/bDUr
	 rz75pcXv9boWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD39383BF51;
	Fri,  1 Aug 2025 01:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next v14 0/3] Support kCFI + BPF on arm64
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175401181050.3387850.17837483390753961310.git-patchwork-notify@kernel.org>
Date: Fri, 01 Aug 2025 01:30:10 +0000
References: <20250801001004.1859976-5-samitolvanen@google.com>
In-Reply-To: <20250801001004.1859976-5-samitolvanen@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: bpf@vger.kernel.org, puranjay@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, catalin.marinas@arm.com, will@kernel.org,
 andrii@kernel.org, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mbland@motorola.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_182956_431533_C7762537 
X-CRM114-Status: GOOD (  13.66  )
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

This series was applied to bpf/bpf.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Fri,  1 Aug 2025 00:10:05 +0000 you wrote:
> Hi folks,
> 
> These patches add KCFI types to arm64 BPF JIT output. Puranjay and
> Maxwell have been working on this for some time now, but I haven't
> seen any progress since June 2024, so I decided to pick up the latest
> version[1] posted by Maxwell and fix the few remaining issues I
> noticed. I confirmed that with these patches applied, I no longer see
> CFI failures in jitted code when running BPF self-tests on arm64.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v14,1/3] cfi: add C CFI type macro
    https://git.kernel.org/bpf/bpf/c/5ccaeedb489b
  - [bpf-next,v14,2/3] cfi: Move BPF CFI types and helpers to generic code
    https://git.kernel.org/bpf/bpf/c/f1befc82addd
  - [bpf-next,v14,3/3] arm64/cfi,bpf: Support kCFI + BPF on arm64
    https://git.kernel.org/bpf/bpf/c/710618c760c0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



