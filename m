Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB24DF4213B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 19:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCPwkc74kTaw5rgUGubQT7xbJa4/0gECOb9aFL1y5Z8=; b=zDREjpcTyEpM9NAoO8HHyBeYWk
	lKZcFLLxc7jvKO1XNR5q2tkU7Kutyl7iSVykJ7u2oDjFpQjEuE/cEEySpAfszmGM82VneRbEGOJjC
	4UlGCt+eQWfEKouUHmpY2KlMhx/wh5vUm196dP5g8V9PHH8I5v15of/jwlR5guNoHbeaEkQhzzZ3b
	Y4uwX5XBaxCoV7Dvg/5dj8xqq2zKsjJdrxcVneE411AifHRS6VWUFenkmfQryo6KQVhiwyWacQy4E
	MARN3vMIAwseoUo8UR/I5ZzVeckAblLJRbBthiQQ2FkE1ukLpVgqXHsaozpJyW9RyoTqZoNaeHTp1
	fLzoZQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD5nC-00000001XPq-2y2W;
	Wed, 15 Apr 2026 19:20:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD5nB-00000001XPh-2wRV;
	Wed, 15 Apr 2026 19:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B63AB60126;
	Wed, 15 Apr 2026 19:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C47C19424;
	Wed, 15 Apr 2026 19:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776280852;
	bh=0cjfS3TGKA503XLC0Jjhfl8lB0O9FAFYE5IhFAGvE10=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QOeJAJiIVtMakhI6OY4h+mhte77jxFS3dhb45Ej3LPjznJGAP8P8FCPFVRUo2nBxG
	 oEKU0k2PaPtEH+0l+6jV1h6tVkFh1lrSpdrsvw4ogeFvEmlLaxFGXgSLbrbz/syvMT
	 X8/tBgGQCan17xASz+HLv0pHzOvhDq7Z7qvdvEh0LylzWHZM7ARCF3/3/2MSlbF+cw
	 S7KZSSOJUAdytWKR6jBFj4jZxBJ///gk0QAxXPhnWVOVH7cr2SaO1XUyDtBSgXwWKn
	 HWAgUUii5f0t0B6qgtptHPn4rmKNUdseOvwHmRRG4COSEtiu5Rc7C3oyZJKcxVEOSN
	 /ENfBdYJpLSgg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D03380A963;
	Wed, 15 Apr 2026 19:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next v2 0/2] bpf,
 arm64/riscv: Remove redundant icache flush after pack allocator finalize
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177628082153.2402333.2124499687552930382.git-patchwork-notify@kernel.org>
Date: Wed, 15 Apr 2026 19:20:21 +0000
References: <20260413191111.3426023-1-puranjay@kernel.org>
In-Reply-To: <20260413191111.3426023-1-puranjay@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 xukuohai@huaweicloud.com, catalin.marinas@arm.com, will@kernel.org,
 luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org,
 pulehui@huawei.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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
    https://git.kernel.org/bpf/bpf/c/42f18ae53011
  - [bpf-next,v2,2/2] bpf, riscv: Remove redundant bpf_flush_icache() after pack allocator finalize
    https://git.kernel.org/bpf/bpf/c/46ee1342b887

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



