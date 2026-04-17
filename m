Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CD2F436BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 19:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkLyXopo0326Y0gBOX9utU7deU3xx10pqA66trSVq90=; b=ji7nVroOJgJ3RYJf3WzKaz771D
	g5WuvN8tbcabvNdHN65JwbUPiUwxzFN/OZ7upyKyVw+BZusK6+KEcjr9TO0NILMy+3CimHlcsJ6A8
	j34g454uD5iE8yXJ6m7S2rsY5DmFUESHECscXicoeOlRXqiwMsAg7cjIISsk5h0GwdMMrHZEhq0QG
	0DBiWq9HL3A/bHKi2pEq7KqLhlE9SqJqGFeVi4WTYYd384OMb8v+XcD5AtqFCQ3gb2vHTH5vTizYX
	YrEZ1RNb8JupjSzyouEjgavMq3yhXLMseAYZC7Q4A0P8TJ//cWJJFMjncof4M/ioZC/O5kJIINRyT
	39Az/Iew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDoaR-00000004Om7-155l;
	Fri, 17 Apr 2026 19:10:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDoaP-00000004Om1-19Hy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 19:10:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F240760052;
	Fri, 17 Apr 2026 19:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A307CC19425;
	Fri, 17 Apr 2026 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776453039;
	bh=hT3nHMS9BmQbAC/+1/zXcKuzWvbdejzAcm6FMHtJqbU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QT1N/JIhJyj30yvXb/Vp9UxtVdSx2qgotoztM//ipKRVPEvVWXM9mj8LgdZd9rtfT
	 2P02s4XChDBKywtqSV9Zclr4Tru4W++5Sf3+tTlum4qTMOIwMgX++tKdM+rPdx8+VE
	 G/2KF8zuqGbKeGqrdIfP/hhlYN95lKMTVKoWwarGq73rmyyypSAP6Fs8U9Zm/XxmLM
	 lRb4SmA59vFNShO8gpVpGXUJ4tMyrlooPOj7mTdyZhdSYU+l0i65hKRbGbfpHT/4Rk
	 fiInr9dmyQ7n+RnbZuXYvBs1qxj7kKdHnDX9c2m657+dnFJfwGuR6Is7m/3guidIMl
	 eSDbUocdLnhsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD6F380CEE7;
	Fri, 17 Apr 2026 19:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next v2] arm32,
 bpf: Reject BPF-to-BPF calls and callbacks in the JIT
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177645300705.123271.2913681268096807075.git-patchwork-notify@kernel.org>
Date: Fri, 17 Apr 2026 19:10:07 +0000
References: <20260417143353.838911-1-puranjay@kernel.org>
In-Reply-To: <20260417143353.838911-1-puranjay@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jre@pengutronix.de, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com, song@kernel.org,
 linux@armlinux.org.uk, kernel@pengutronix.de
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

This patch was applied to bpf/bpf.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Fri, 17 Apr 2026 07:33:52 -0700 you wrote:
> The ARM32 BPF JIT does not support BPF-to-BPF function calls
> (BPF_PSEUDO_CALL) or callbacks (BPF_PSEUDO_FUNC), but it does
> not reject them either.
> 
> When a program with subprograms is loaded (e.g. libxdp's XDP
> dispatcher uses __noinline__ subprograms, or any program using
> callbacks like bpf_loop or bpf_for_each_map_elem), the verifier
> invokes bpf_jit_subprogs() which calls bpf_int_jit_compile()
> for each subprogram.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v2] arm32, bpf: Reject BPF-to-BPF calls and callbacks in the JIT
    https://git.kernel.org/bpf/bpf/c/e1d486445af3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



