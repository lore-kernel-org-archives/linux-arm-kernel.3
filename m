Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB55C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 18:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdvaN06rYbXttOfugRFj2P0n6BUm0AH43O0rAkiSLiI=; b=JSWxNi3UrgI/Wl0GnKyLZ8J+1r
	KLcMSCYK64SaHKrHYEVkwxgMQgMSiKZMv8lLFqfkCJiLxZnS3MLgmoXy/VkQEBsdPZ4PUYf9HZ+Ec
	8GZo/+M81gXSeHq8w5mCUnPVEebnUGkgAj37onk207bVcIBDjVqo50taGv4+5XGFDEYBHPMgaayNS
	/AQTpW0b8gpCkygdkbmafMvsNOQfDhYv7zRcflwHewJzNdUScTiYf5C2wxXmpasal0hIae1T/VSWT
	KHCdsRjx6m6doEG0Hl0pB42K4v3PpkjFSVcZ9P13vsSswWahh90jbUdw82ViQI6s0w18JYdR5AH7P
	x8X4I6BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJynC-0000000BKm6-09FM;
	Tue, 27 May 2025 18:12:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJyam-0000000BIzn-1nd3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 18:00:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0A535C5794;
	Tue, 27 May 2025 17:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828BBC4CEE9;
	Tue, 27 May 2025 17:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748368798;
	bh=tGyF8P4S3EbpCGhv5Z7+NumLX4kyyVCYj56OYjztRUc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ggt6+u75DuvvhATXL/Ewb/Tq5FV0I1Sxv6il87g5pmcWFTwGMNBYEIz0F+RpIpq2L
	 y5xDFiwe5FhVeBpkceQMQDA11szxUtqBezuC4ejM7PnpXXCsvb/leNkeqUCU2jyP+L
	 iCzGf9c30L1bTSveU3ZRMPLosVFHfbFNftZUkyWSFKCOrqpO+AsoItqhbJYktg9BPe
	 XRpxjQziE+o8xnvHVP8IjsEfpwzKrvJi+Q0lDl1yoCFm69wfQApAUbYYYr2KkM4ovI
	 f1XcwM6CypG/fOxjpYJsYlGkXCYiKKwY5NoWZgzMzSjIosmKx9ZvbILKzeTX9Ha16t
	 X7BNVlEMOv7pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB29F380AAE2;
	Tue, 27 May 2025 18:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next v3 0/2] bpf, arm64: support up to 12 arguments
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174836883250.1728518.5524041990135634472.git-patchwork-notify@kernel.org>
Date: Tue, 27 May 2025 18:00:32 +0000
References: <20250527-many_args_arm64-v3-0-3faf7bb8e4a2@bootlin.com>
In-Reply-To: <20250527-many_args_arm64-v3-0-3faf7bb8e4a2@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29_=3Calexis=2Elothore=40bo?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?q?otlin=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 xukuohai@huaweicloud.com, catalin.marinas@arm.com, will@kernel.org,
 mykolal@fb.com, shuah@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, revest@chromium.org,
 bastien.curutchet@bootlin.com, ebpf@linuxfoundation.org,
 thomas.petazzoni@bootlin.com, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 xukuohai@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_110000_553595_D3BFF789 
X-CRM114-Status: GOOD (  18.18  )
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

On Tue, 27 May 2025 12:06:02 +0200 you wrote:
> Hello,
> 
> this is the v2 of the many args series for arm64, being itself a revival
> of Xu Kuhoai's work to enable larger arguments count for BPF programs on
> ARM64 ([1]).
> 
> The discussions in v1 shed some light on some issues around specific
> cases, for example with functions passing struct on stack with custom
> packing/alignment attributes: those cases can not be properly detected
> with the current BTF info. So this new revision aims to separate
> concerns with a simpler implementation, just accepting additional args
> on stack if we can make sure about the alignment constraints (and so,
> refusing attachment to functions passing structs on stacks). I then
> checked if the specific alignment constraints could be checked with
> larger scalar types rather than structs, but it appears that this use
> case is in fact rejected at the verifier level (see a9b59159d338 ("bpf:
> Do not allow btf_ctx_access with __int128 types")). So in the end the
> specific alignment corner cases raised in [1] can not really happen in
> the kernel in its current state. This new revision still brings support
> for the standard cases as a first step, it will then be possible to
> iterate on top of it to add the more specific cases like struct passed
> on stack and larger types.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v3,1/2] bpf, arm64: Support up to 12 function arguments
    https://git.kernel.org/bpf/bpf-next/c/9014cf56f13d
  - [bpf-next,v3,2/2] selftests/bpf: enable many-args tests for arm64
    https://git.kernel.org/bpf/bpf-next/c/149ead9d7e3d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



