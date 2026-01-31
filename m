Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF808E7C6F2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 22:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBIAXjucCyjqO62TOMcv9GnOXHtcJ3wtYY0aA18OwTA=; b=JXvHkHKTg7QPcsZGX+tCAy/Fho
	tabXbwGCde6SjF5XkPfSLqjreJci/ZqYPusQ7BHtaCu41xXYks6m4blM5zrmtEyWQisKGuZGfc7/p
	mlYeZdfRE4dj/K428t6RU+DXxmYfvHyde+ucDePuJcg1cD0ZAiHEztjT+vaMeKgr/XNAoBtcLIz6o
	d3baCmxP6BEHB+6N/VE5Rzn1CVobxPKMMh7KlLu5zgVzlZntLZ1cUZU/4Kz2lKKrjkkqNZBSowTyr
	AyW3AyC/5eJdtFEPSJkLEH+z4peBOgduHh8xBOrKutadBmph/hh+mDRBIWq/hwK8Akl27XAqDju4B
	xl4jg+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmJ15-000000032Vi-2t8Q;
	Sat, 31 Jan 2026 22:00:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmJ11-000000032VO-1t49
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 22:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4CF14423F;
	Sat, 31 Jan 2026 22:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876D9C4CEF1;
	Sat, 31 Jan 2026 22:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769896825;
	bh=SsSdTYBHd+jwsoK1gaPAcocIsd+yEdLGgFoksyOasTI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IrnRAseYFrKTrSpL9AbMy3DAZ7SEucyXeAp8LvoMP8KHky91dOoCOxQyDwRcTDbIT
	 ZSifazYl6nDpj8HKrgIyu9VQ+K+tuda5WS8lTjy57vg72ZC6iF8kru6uz3kbkwrcog
	 ffpuTWX00JHodStlWZq4jFWNXTJZ7cg/7DHZuIh+4fVVO8R+H4s1PxX7yYsqWKIZt1
	 RTPSgbaXCRH/QwmRQneo4QoHXae5TGNSmS9QYW0npev8KTvVJudcrubyCN2qvzmd4y
	 2piPvy0io/nmhkMJyldaAZxcrXLFGXtpfnHvsvl25gfpAnTLN4is9MvZpGPSZLAftY
	 81u8sigR2BrDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BD61380DBD4;
	Sat, 31 Jan 2026 22:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next v5 0/3] bpf, arm64: Add fsession support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176989681714.6968.8564830272874377531.git-patchwork-notify@kernel.org>
Date: Sat, 31 Jan 2026 22:00:17 +0000
References: <20260131144950.16294-1-leon.hwang@linux.dev>
In-Reply-To: <20260131144950.16294-1-leon.hwang@linux.dev>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 xukuohai@huaweicloud.com, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, menglong8.dong@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_140027_515203_C35CE259 
X-CRM114-Status: UNSURE (   8.44  )
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

This series was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Sat, 31 Jan 2026 22:49:47 +0800 you wrote:
> Similar to commit 98770bd4e6df ("bpf,x86: add fsession support for x86_64"),
> add fsession support on arm64.
> 
> Patch #1 adds bpf_jit_supports_fsession() to prevent fsession loading
> on architectures that do not implement fsession support.
> 
> Patch #2 implements fsession support in the arm64 BPF JIT trampoline.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v5,1/3] bpf: Add bpf_jit_supports_fsession()
    https://git.kernel.org/bpf/bpf-next/c/8798902f2b8b
  - [bpf-next,v5,2/3] bpf, arm64: Add fsession support
    https://git.kernel.org/bpf/bpf-next/c/e3aa56b3ac17
  - [bpf-next,v5,3/3] selftests/bpf: Enable get_func_args and get_func_ip tests on arm64
    https://git.kernel.org/bpf/bpf-next/c/7f10da2133b1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



