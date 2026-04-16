Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808BFF8D74B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 14:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kq4Vb8eWBama88yf+CUt9J5fZmyyuqk1BrgdCs9SIl8=; b=Nn5EiuFcu1xEGxWOnHoXwKobyJ
	FBVIjLRTvM3Ty9yAtNqZA8Sfpm7JYLZfA0wWpZhAJXPuzoOBiHgK2lArmQNd/zCzr+39QEyBGoqFj
	+SQewNLtdv3oV0ETnDg1FuNlXy5/NMwI8EjFJisWjuPTtwx8Nko1joyOk3N0U+uoagyv+GFg9BTQL
	16NJkQ/2xERfeZV12NIPTVSNfYd8i7m+EV/w/vttEJ++wbdM645/KFE2H9xR2WedZHpHL5HO7A7zz
	qmKgvPauEblLizrPbOu5KikQXIl3GxURyfhOXRiRGM4Eu34sA/hUzI+IxJc5Y+H5sPjCqwew4RY35
	VYrT373Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDNQc-00000002Y1G-107O;
	Thu, 16 Apr 2026 14:10:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDNQb-00000002Y11-3300
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 14:10:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD6B460130;
	Thu, 16 Apr 2026 14:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A624C2BCAF;
	Thu, 16 Apr 2026 14:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776348644;
	bh=pX7i/5+LnUDc6Duofn2BILOt1Pooo9KnzAacs/0u3mc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qbQZX91Sd215h+Ii0G9MyMrp1sFoxhOe8u2y/puzg+ZYxqg0xm3EhwJvuCA/u5VtC
	 7CghDvGUyP8TBsM+zm/eUu+dSS7gmPD5J0B6bdyiYCGQtXFTdNveDjPop9poLtw3F6
	 /lHb28E1fLBZhgTrVKpod42Q0Ga+WSBGYlpRbKfYJeQYbE6Df+ASgGeiDuFfV4/Wxi
	 J89STjeG5ZSjR0JsPEj94nnuhdE30xG4IFvUvzRjwEW1B4czQfjPyxmbhEnfaUyvIj
	 5Iry5Ci71iVVbWVT5sVreZaFkOBXKnU6++eg6A3s5pHzCJQzPNcyomhTVE4OrxfrBs
	 UgGhllICwEx8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE13380AA61;
	Thu, 16 Apr 2026 14:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf v15 0/5] emit ENDBR/BTI instructions for indirect
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177634861305.3246567.7251798812226371156.git-patchwork-notify@kernel.org>
Date: Thu, 16 Apr 2026 14:10:13 +0000
References: <20260416064341.151802-1-xukuohai@huaweicloud.com>
In-Reply-To: <20260416064341.151802-1-xukuohai@huaweicloud.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
 yonghong.song@linux.dev, puranjay@kernel.org, a.s.protopopov@gmail.com,
 alexis.lothore@bootlin.com, list+bpf@vahedi.org, linux@armlinux.org.uk,
 yangtiezhu@loongson.cn, hengqi.chen@gmail.com,
 johan.almbladh@anyfinetworks.com, paulburton@kernel.org,
 hbathini@linux.ibm.com, chleroy@kernel.org, naveen@kernel.org,
 luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org,
 pulehui@huawei.com, iii@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 davem@davemloft.net, udknight@gmail.com
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

On Thu, 16 Apr 2026 06:43:36 +0000 you wrote:
> On architectures with CFI protection enabled that require landing pad
> instructions at indirect jump targets, such as x86 with CET/IBT enabled
> and arm64 with BTI enabled, kernel panics when an indirect jump lands on
> a target without landing pad. Therefore, the JIT must emit landing pad
> instructions for indirect jump targets.
> 
> The verifier already recognizes which instructions are indirect jump
> targets during the verification phase. So we can store this information
> in env->insn_aux_data and pass it to the JIT as new parameter, allowing
> the JIT to consult env->insn_aux_data to determine which instructions are
> indirect jump targets.
> 
> [...]

Here is the summary with links:
  - [bpf,v15,1/5] bpf: Move constants blinding out of arch-specific JITs
    https://git.kernel.org/bpf/bpf/c/d3e945223e01
  - [bpf,v15,2/5] bpf: Pass bpf_verifier_env to JIT
    https://git.kernel.org/bpf/bpf/c/d9ef13f72711
  - [bpf,v15,3/5] bpf: Add helper to detect indirect jump targets
    https://git.kernel.org/bpf/bpf/c/07ae6c130b46
  - [bpf,v15,4/5] bpf, x86: Emit ENDBR for indirect jump targets
    https://git.kernel.org/bpf/bpf/c/9a0e89dcc9be
  - [bpf,v15,5/5] bpf, arm64: Emit BTI for indirect jump target
    https://git.kernel.org/bpf/bpf/c/f6606a44bc43

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



