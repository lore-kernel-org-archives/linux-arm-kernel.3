Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CE2C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 05:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8KcFLv4DqVEx9XwYGx3ar2NISVMl8LUhOOb7RrhJxY=; b=fFIMrvIxZxKeA/CjB/M/IsD4jY
	KhqlivjAOKPdP59fI5FupVar9AtpNYgJez8kGSXRHjIE9BwI6J3Y2sKzxVpFfIkRuPA2s+Z21ICzg
	Dj8Bp6KH4c62YqfE+QLT8si7Dieu1jgchRvX6yOoC7siqeHDTfTVcscHHB1IsDp5zWVHzEu6/LICh
	Y5fdqtqjto0jv8bqnF5ES2xslVjvsYMu/GzwTg0Z+v/kTNBERFhJ4BU753RoFWwwMtfSYh7VEVRIX
	yB/TDdutBOS1r1jFMBRO3okX0VhXK4lZS+oal1ovqa3uqmQShN/v6xpK0WseVNgg+rMgBB3Cn1mkH
	ku4dcPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOraw-00000005qVI-1ReK;
	Tue, 10 Jun 2025 05:32:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrYn-00000005qCr-3zQZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 05:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10BF2614E0;
	Tue, 10 Jun 2025 05:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CF0C4CEEF;
	Tue, 10 Jun 2025 05:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749533408;
	bh=AirqLxaAn1XDcww7YIT/2rzH+IYyH+8RkAxc6uGReYs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KVrYpgesvClwcE62Y4eoV7SPMtyy0KeY1N9kYJS6gk6L+ykyW0g4V/rmMlRwsHekm
	 e5b/s6tAKzy+VIsxLBLkGQDD6LY1mkeIUKS9+BKAOVk1QV5Iu9Xl8/ymgkykmhyiIi
	 qCF8YFGPF3nAqDWaBMaSQmhtnCIlJT1fZ6h7VLeMUv9/GR3IQL13mRFA8cv1/skCSI
	 v1ObDw7MhTmaj9QOP+rsMT8ne4vhAbSuSm9bE2EYkO0jwY5H4lS+68vnt9mThfMih0
	 AsujfctxEEua0TUSrPFraj3Ycg0QWLUnMJAMP896nShsL1RmqIy95R7nJ42gITAAHS
	 T2NuytqPyee7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C0C3822D49;
	Tue, 10 Jun 2025 05:30:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next v4 0/9] bpf: Mitigate Spectre v1 using barriers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174953343925.1751142.14175959764771904757.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 05:30:39 +0000
References: <20250603205800.334980-1-luis.gerhorst@fau.de>
In-Reply-To: <20250603205800.334980-1-luis.gerhorst@fau.de>
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 xukuohai@huaweicloud.com, catalin.marinas@arm.com, will@kernel.org,
 hbathini@linux.ibm.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, mykolal@fb.com,
 shuah@kernel.org, henriette.herzog@rub.de, skb99@linux.ibm.com,
 cupertino.miranda@oracle.com, mrpre@163.com, m.shachnai@gmail.com,
 dimitar.kanaliev@siteground.com, shung-hsi.yu@suse.com, dxu@dxuuu.xyz,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
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

On Tue,  3 Jun 2025 22:57:51 +0200 you wrote:
> This improves the expressiveness of unprivileged BPF by inserting
> speculation barriers instead of rejecting the programs.
> 
> The approach was previously presented at LPC'24 [1] and RAID'24 [2].
> 
> To mitigate the Spectre v1 (PHT) vulnerability, the kernel rejects
> potentially-dangerous unprivileged BPF programs as of
> commit 9183671af6db ("bpf: Fix leakage under speculation on mispredicted
> branches"). In [2], we have analyzed 364 object files from open source
> projects (Linux Samples and Selftests, BCC, Loxilb, Cilium, libbpf
> Examples, Parca, and Prevail) and found that this affects 31% to 54% of
> programs.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v4,1/9] bpf: Move insn if/else into do_check_insn()
    https://git.kernel.org/bpf/bpf-next/c/8b7df50fd40d
  - [bpf-next,v4,2/9] bpf: Return -EFAULT on misconfigurations
    https://git.kernel.org/bpf/bpf-next/c/fd508bde5d64
  - [bpf-next,v4,3/9] bpf: Return -EFAULT on internal errors
    https://git.kernel.org/bpf/bpf-next/c/6b84d7895d78
  - [bpf-next,v4,4/9] bpf, arm64, powerpc: Add bpf_jit_bypass_spec_v1/v4()
    https://git.kernel.org/bpf/bpf-next/c/03c68a0f8c68
  - [bpf-next,v4,5/9] bpf, arm64, powerpc: Change nospec to include v1 barrier
    https://git.kernel.org/bpf/bpf-next/c/dff883d9e93a
  - [bpf-next,v4,6/9] bpf: Rename sanitize_stack_spill to nospec_result
    https://git.kernel.org/bpf/bpf-next/c/9124a4508007
  - [bpf-next,v4,7/9] bpf: Fall back to nospec for Spectre v1
    https://git.kernel.org/bpf/bpf-next/c/d6f1c85f2253
  - [bpf-next,v4,8/9] selftests/bpf: Add test for Spectre v1 mitigation
    https://git.kernel.org/bpf/bpf-next/c/4a8765d9a527
  - [bpf-next,v4,9/9] bpf: Fall back to nospec for sanitization-failures
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



