Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68BFC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7YPFkKsM8XEdUC86jlkdQ4IF2PnbIQWQ0GDK0pNlj0=; b=xVzgUXO5o3ytiFc9GQc5c7mcTL
	FVc9QiS6N9iWj9cDIjUaC6e4OQItyCZxFTx5OvV67oGc9Q97TfGUHNP6hK5Zh01geqiRcJonc5ZHv
	kuMWL4ISp62If/xRDXDvDFv2iX0h+bgjUuOvhmoiZc2kFbtEVTfm7wU7cUXqJDYqpTPiPUFdqCxhk
	jBeD3JbDPL6IzeMtrng03SyRBhUXM7FfeQkGRsXOLVYgUZhSb9gu7Kw7tPrwlATcEmyNZ+KpHXZTH
	YS8soznRp/Enq9lkk/O/DREi9JW/Q/gu/pvmlyf6snofkSoQBfh36+4xJzk0QqfcrBDpGZENm4Ej6
	sp/ga1Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUKC-00000004pUK-2MHQ;
	Fri, 09 May 2025 20:28:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSdU-00000004atb-3qTU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 18:39:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 011D5A4C747;
	Fri,  9 May 2025 18:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A65C4CEE4;
	Fri,  9 May 2025 18:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746815991;
	bh=Wz4glreSt8DlgIrM5HvJHSb+qrAyVPEKF6wXqMPedMQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OubpBByXk3rxJnekSB6DqSDgiFfKLhWsBxZh0t1IZ2Pfr50qJu2Nq3RMnlOgR3obn
	 T+tUkNTYQdvQn4il0XqegaKDa0YOAYslfjRz+fdINWnhDl/c6TP+bpquW/nIinjqvv
	 6nvWLogb/LAzmEdxv3+rCzk3z+vqyRiQpFwK7ewGA+9TBly/HIIMouhFsYiL+QsLbU
	 IMP8XwXoUyPisDHs1ZE67QVTv8OO3Np+b06XC1tNbqRBlqMltRKlQ6Vpgc55nf6En+
	 AwHPBoZZlLsuLktnkZy/zaPBr67dbDqQtru0wDZ7JeA3kh/wmGZmPhg1NusYS7MqrM
	 lnKxF1tllRmNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34071380DBCB;
	Fri,  9 May 2025 18:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next v3 00/11] bpf: Mitigate Spectre v1 using barriers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174681603001.3715348.12288999798860158953.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 18:40:30 +0000
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-1-luis.gerhorst@fau.de>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_113953_098854_DDAA9F32 
X-CRM114-Status: GOOD (  11.10  )
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

On Thu,  1 May 2025 09:35:51 +0200 you wrote:
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
  - [bpf-next,v3,01/11] selftests/bpf: Fix caps for __xlated/jited_unpriv
    https://git.kernel.org/bpf/bpf-next/c/cf15cdc0f0f3
  - [bpf-next,v3,02/11] bpf: Move insn if/else into do_check_insn()
    (no matching commit)
  - [bpf-next,v3,03/11] bpf: Return -EFAULT on misconfigurations
    (no matching commit)
  - [bpf-next,v3,04/11] bpf: Return -EFAULT on internal errors
    (no matching commit)
  - [bpf-next,v3,05/11] bpf, arm64, powerpc: Add bpf_jit_bypass_spec_v1/v4()
    (no matching commit)
  - [bpf-next,v3,06/11] bpf, arm64, powerpc: Change nospec to include v1 barrier
    (no matching commit)
  - [bpf-next,v3,07/11] bpf: Rename sanitize_stack_spill to nospec_result
    (no matching commit)
  - [bpf-next,v3,08/11] bpf: Fall back to nospec for Spectre v1
    (no matching commit)
  - [bpf-next,v3,09/11] selftests/bpf: Add test for Spectre v1 mitigation
    (no matching commit)
  - [bpf-next,v3,10/11] bpf: Allow nospec-protected var-offset stack access
    (no matching commit)
  - [bpf-next,v3,11/11] bpf: Fall back to nospec for sanitization-failures
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



