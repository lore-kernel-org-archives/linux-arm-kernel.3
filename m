Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C38FCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 00:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CYqpQij/ZbTz2mq7N+UytPGyMcIDrlrg4OtwazAJ38=; b=BzNPB+uAbZ7hgY+pK3EfEv85uv
	5K/XmUqmc7XiMxG3OZEF34IUyvncXb1ZfEYIrVWTjk8YERoikwM+OJGfhdJsl++wfRqrJVOqNFs1t
	OLTFzQ90XK8IHBokEmu5+YuSqoIQ3AqGAtVtpR50kKWtcMcdgYA7J49baIYYwOu9ee1w3+rkapP7o
	WMLGNRcalImkEsfWBe7x8pjeSOkB2+ujE3Ol0BC2GcLFchbX4VO1PDOUT5KCDrUfRQDAPBfMlc5HM
	j/BgndFAr+wQhqXiI0jsgQx2/KXuW3LdDysqqKD5ojXPp3YuhmXpDSOLZMcujZhqy3ooS6kYHWOh4
	c0sD5jSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTqrE-0000000A0Dz-2Bn6;
	Mon, 01 Jun 2026 00:50:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTqrC-0000000A0Do-2gL7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 00:50:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EAB456014C;
	Mon,  1 Jun 2026 00:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4A01F00893;
	Mon,  1 Jun 2026 00:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780275016;
	bh=2CYqpQij/ZbTz2mq7N+UytPGyMcIDrlrg4OtwazAJ38=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Hxjb5nziPofw0ltdkWLzoQV6RWxmrR6vBq4n3mcBHl2UztllfAqteQ7p2QFzjBq3R
	 ZFndQ7yZXtKtqXnecLhKfWCL9jM+UM4J8dbM1HQNIU9Zt5UG1fjsXFZ2zeooVLOhZV
	 OIYKATY2O55JrIPYpXI9kEpeuJ/yrEEMv8sJAXQD2h7OwsvCuyPnxJb8cKXczM3fu5
	 3QWIlmN+0vWpQEuQSowJiA55GYCQablu85YnfecZmglBuF8BJwUrFFZ1wVdq+eE1j1
	 R0ApIUvanxGNT18VX1CpGOyeSIVRMIlVN1MWnmYJx8Gq9WOsww5bt+cRvDbximXM8o
	 gGdbxg04CXX+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A5639302FC;
	Mon,  1 Jun 2026 00:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next 0/2] bpf, arm64: Stack argument fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178027501939.3441607.3307361090146995963.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jun 2026 00:50:19 +0000
References: <20260528161750.1900674-1-puranjay@kernel.org>
In-Reply-To: <20260528161750.1900674-1-puranjay@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, yonghong.song@linux.dev, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, memxor@gmail.com, song@kernel.org,
 xukuohai@huaweicloud.com, catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

This series was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Thu, 28 May 2026 09:17:46 -0700 you wrote:
> Patch 1 fixes a redundant MOV in the arm64 JIT's
> emit_stack_arg_store_imm() and clarifies the stack layout comments. This
> is not a bug fix but an improvement.
> 
> Patch 2 bumps the stack argument tests from 6-8 args to at least 10 so
> they actually exercise the native stack on arm64, where x0-x7 cover the
> first 8 arguments.
> 
> [...]

Here is the summary with links:
  - [bpf-next,1/2] bpf, arm64: Fix redundant MOV and clarify stack arg comments
    https://git.kernel.org/bpf/bpf-next/c/12a585e607fa
  - [bpf-next,2/2] selftests/bpf: Use at least 10 args in stack argument tests
    https://git.kernel.org/bpf/bpf-next/c/157317ba662a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



