Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C8BD46BFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQJribrsEIsJrhibs3riBWIIj1cHIXEpZnzBFXDGXvY=; b=bsBsfKWh9FeYhfMFrOSemhgxGk
	drfl2KEiIixyLmS3x6ggdwnKJ38NivRKrSxzPCUerGWw2e+l3yFmJOZ4Zig0BWOetVM4Cr6HRtBzM
	VufbqMksRJqCrWVWWgaXkl6cKfpyg0mU9BZD+sI05E1aKNmL53Om2q/gOoeeafc0ScBwzjOOVaR3f
	u9KkgMAgB9SFtWkfCzHnq9WpytwEuNG5QA5Z5DmBf4pIDv2lMhLxdvZG3nrRBocpBMoO+Z9xLk6L4
	q7oH34WmutnvP1Vf+NMrBwRYWdvij6fK0Q0Bw7O9dzqK85spMsJM+0/klZda2rTjpGJINGIGjID5r
	GlQysD3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBiD-0000000Gi5C-2FNw;
	Wed, 28 Jan 2026 20:00:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBiD-0000000Gi4g-0z4s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:00:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4421B6000A;
	Wed, 28 Jan 2026 20:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F4CC4CEF1;
	Wed, 28 Jan 2026 20:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769630424;
	bh=AFqUHU1rA8CNlD68xMlcxHEwkgyEguVM4+WYNpslnL8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eLrJOdVKSNhQQAqknu9fmSA4t/SDXSgyskjpSQ1kgFsE466LlQcCnWqO6b+tM9ByL
	 jbzEr9x/wTQS4L5RTRcVlpURKY/Bu63yGyqvMBO03kYLK5h2gBb+VkdsaYeOa/5HSa
	 tKVHqK0n6M3ng59L+cla/LClZLSFaPlOWaqpbfXc3tETjwlWKh5UY5l0CYpn847816
	 m7V3W1px8rOS/EprUfFNDGkb3GB6iguv2y9ELNFm96lauF4QICcLUdxMlaYocL9O9T
	 5zN2znGEWNlTT4TbV7yeeml8SaOz2iN8/EbIgKV0weS96u5EXgbkagh17slo8IR5DT
	 3WXX7ZI/OnSQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BCB539EF96A;
	Wed, 28 Jan 2026 20:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv6 bpf-next 0/9] ftrace,bpf: Use single direct ops for bpf
 trampolines
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176963041735.2209200.7611804745942755088.git-patchwork-notify@kernel.org>
Date: Wed, 28 Jan 2026 20:00:17 +0000
References: <20251230145010.103439-1-jolsa@kernel.org>
In-Reply-To: <20251230145010.103439-1-jolsa@kernel.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: rostedt@kernel.org, revest@google.com, mark.rutland@arm.com,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 menglong8.dong@gmail.com, song@kernel.org
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
by Andrii Nakryiko <andrii@kernel.org>:

On Tue, 30 Dec 2025 15:50:01 +0100 you wrote:
> hi,
> while poking the multi-tracing interface I ended up with just one ftrace_ops
> object to attach all trampolines.
> 
> This change allows to use less direct API calls during the attachment changes
> in the future code, so in effect speeding up the attachment.
> 
> [...]

Here is the summary with links:
  - [PATCHv6,bpf-next,1/9] ftrace,bpf: Remove FTRACE_OPS_FL_JMP ftrace_ops flag
    https://git.kernel.org/bpf/bpf-next/c/4be42c922201
  - [PATCHv6,bpf-next,2/9] ftrace: Make alloc_and_copy_ftrace_hash direct friendly
    https://git.kernel.org/bpf/bpf-next/c/676bfeae7bd5
  - [PATCHv6,bpf-next,3/9] ftrace: Export some of hash related functions
    https://git.kernel.org/bpf/bpf-next/c/0e860d07c29d
  - [PATCHv6,bpf-next,4/9] ftrace: Add update_ftrace_direct_add function
    https://git.kernel.org/bpf/bpf-next/c/05dc5e9c1fe1
  - [PATCHv6,bpf-next,5/9] ftrace: Add update_ftrace_direct_del function
    https://git.kernel.org/bpf/bpf-next/c/8d2c1233f371
  - [PATCHv6,bpf-next,6/9] ftrace: Add update_ftrace_direct_mod function
    https://git.kernel.org/bpf/bpf-next/c/e93672f770d7
  - [PATCHv6,bpf-next,7/9] bpf: Add trampoline ip hash table
    https://git.kernel.org/bpf/bpf-next/c/7d0452497c29
  - [PATCHv6,bpf-next,8/9] ftrace: Factor ftrace_ops ops_func interface
    https://git.kernel.org/bpf/bpf-next/c/956747efd82a
  - [PATCHv6,bpf-next,9/9] bpf,x86: Use single ftrace_ops for direct calls
    https://git.kernel.org/bpf/bpf-next/c/424f6a361096

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



