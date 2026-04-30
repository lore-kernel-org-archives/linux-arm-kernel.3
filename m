Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB627FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c57fEHjwF8vuz+WqFdpjcepIeX/v21SCKo/7jYiB/jw=; b=pv2rgJ4ENDyG/SZlSymnnPqIPf
	4lBtwijJKmpEi+Gjv2daq6zKXvmXcHrVHz9BFx9Woq1ZapM8imZpU7mV7gQeQobPy8wvY2mCkKw0c
	8WhLZ6b/F484WdUgN/fcIRUk2FYqAocH0vHIuavRRMp6jJMUWb6YxX9eesjxtrxeAw09AQmsnGVl3
	1hs02i38eZ229hZvn7NawCLFESUZc+x9U4ww1el3BrkFiUHVDbsmLIbo7TlTSRmqN8t/+0FV6jd+4
	VS/pPcYXSghKSucbjMZSSW92k1zaCOyYC8QMNl7gusKyZLnMyyErrTn9nBvLw73OUw7EW1Ex72U6x
	H7drN9Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4u-00000004Z9o-0FNq;
	Thu, 30 Apr 2026 03:28:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2R-00000004WWE-2oxt;
	Thu, 30 Apr 2026 03:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BD0F40B7A;
	Thu, 30 Apr 2026 03:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292D4C2BCB8;
	Thu, 30 Apr 2026 03:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519567;
	bh=R60i1i6tdMN1HpucW7gHhlJRra2Kl1V9Gtj4FxNETVk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Yu/jQMW2NROEp2O3mOHp0YT/DLhA4liRauQz0HEyBARaTkOoEnCSFLpxTtNGZOTIA
	 KZDzyWhaL3Phf0IKL3xirNqgWeu8VdkFpbvr1p++42EepIJRk810U1tdSfW3ZVpH4a
	 yI2NKYxdlznVZrWAy52h17IcNRXPyPTyacG5pkt9+in0pAfozwKLphOlUq1nX5ERwA
	 5e5D+93rsbSl1vYoIO/8DkiPql3tgrLs0yjGvR1HFY2RqkPh3GPWgVzJTRTxRg2Dfi
	 s3e7vtGykqD3YzkGd3Pn93agy6tYwajQo/jaGUvgf0T6JeBcwuLjnmNmYwbE9XByY5
	 IUAVB5LBzj4yA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CFB43809A07;
	Thu, 30 Apr 2026 03:25:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next v2 0/2] bpf,
 arm64/riscv: Remove redundant icache flush after pack allocator finalize
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751952229.2274119.6699210354046026962.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:22 +0000
References: <20260413191111.3426023-1-puranjay@kernel.org>
In-Reply-To: <20260413191111.3426023-1-puranjay@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: linux-riscv@lists.infradead.org, bpf@vger.kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, memxor@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, xukuohai@huaweicloud.com,
 catalin.marinas@arm.com, will@kernel.org, luke.r.nels@gmail.com,
 xi.wang@gmail.com, bjorn@kernel.org, pulehui@huawei.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202608_379392_B211CC91 
X-CRM114-Status: GOOD (  10.85  )
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

This series was applied to riscv/linux.git (fixes)
by Alexei Starovoitov <ast@kernel.org>:

On Mon, 13 Apr 2026 12:11:07 -0700 you wrote:
> Changelog:
> v1: https://lore.kernel.org/all/20260413123256.3296452-1-puranjay@kernel.org/
> Changes in v2:
> - Remove "#include <asm/cacheflush.h>" as it is not needed now.
> - Add Acked-by: Song Liu <song@kernel.org>
> 
> When the BPF prog pack allocator was added for arm64 and riscv, the
> existing bpf_flush_icache() calls were retained after
> bpf_jit_binary_pack_finalize(). However, the finalize path copies the
> JITed code via architecture text patching routines (__text_poke on arm64,
> patch_text_nosync on riscv) that already perform a full
> flush_icache_range() internally. The subsequent bpf_flush_icache()
> repeats the same cache maintenance on the same range.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v2,1/2] bpf, arm64: Remove redundant bpf_flush_icache() after pack allocator finalize
    https://git.kernel.org/riscv/c/42f18ae53011
  - [bpf-next,v2,2/2] bpf, riscv: Remove redundant bpf_flush_icache() after pack allocator finalize
    https://git.kernel.org/riscv/c/46ee1342b887

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



