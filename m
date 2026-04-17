Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E54F4368A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSJBWJthszcj3fU5gV0fhZ21CYYpgsQXz1bG3/i4f3w=; b=c6LpEVu9IkSZqujNCgPQ6hOCkd
	HTRkqTvUl3TxjsVEyG/sK+c6pTEOWKMsHmNdmeQDfi0gQgqUxkoQEupMtwvBL2Ql6Y/BUZLNxr0Ao
	p/unDUkJNbT9awI/QbDKT6zJec973DErUYgpVmbeJmXa/xgCQHe4ipvYf6blvxB0N29dEp8IQBb1V
	ziULcmEEekPNeMIlth6zf7mL5qlI0f4J8P1WuL4VREukrhlfH0Xc5T35182nFy4dk5vHuclpdYK7i
	dTd7k9/HDyQpZwrhrZKVejGQnnJI+T8saGqp60usjdQRclFQRViISmZ9Yo9GoPPXO71uIfhmGZP6N
	VzuynZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhC7-00000003yAX-2H7V;
	Fri, 17 Apr 2026 11:17:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhC6-00000003yAR-0VmJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 11:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46ECD6012A;
	Fri, 17 Apr 2026 11:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78F9C19425;
	Fri, 17 Apr 2026 11:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776424625;
	bh=IAawn5Tg1TJtA56WVcosOWEQScybLi85ivY7YGIFzdQ=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=um9mJYRz4ILdNXVwrlO/9nPAQrChZSN22NxSIGfzrxPeZzQTA0vZKJNldqb3TfcMK
	 I1QlNb3SPtnrVWLIp1l5YLnzHlH3fP8zSXaj+eJaSn3/wLAn3Hcc650/6BxZol2oxi
	 JVdf6I6PjyPtJ1UNn9B10mM0sUUJ0iqJFu4q5kzoA6zTO8ilm9yOjkkz7TFgvgY3e4
	 Eh5+2ZDwUnyurERtYFCS9cS0GxhIY2eSyHY9mJP7P3F3uaTWb7YWulajACfb0oegYN
	 44uCbQKM34b+++AmxL59n62OgJypeGcCG6iagTfHSY0B4N05gF1N5BYYHwJU5UsKMz
	 sbtxlhGbYyA/w==
Content-Type: multipart/mixed; boundary="===============7691660976422228201=="
MIME-Version: 1.0
Message-Id: <0e7bf7fc588d9c45349a7b5b7b7a86504bf39069d9b7a043b53138604547f267@mail.kernel.org>
In-Reply-To: <20260417103004.3552500-1-puranjay@kernel.org>
References: <20260417103004.3552500-1-puranjay@kernel.org>
Subject: Re: [PATCH bpf-next] bpf, arm32: Reject BPF_PSEUDO_CALL in the JIT
From: bot+bpf-ci@kernel.org
To: puranjay@kernel.org,bpf@vger.kernel.org,linux-arm-kernel@lists.infradead.org
Cc: puranjay@kernel.org,jre@pengutronix.de,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,memxor@gmail.com,song@kernel.org,linux@armlinux.org.uk,kernel@pengutronix.de,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Fri, 17 Apr 2026 11:17:04 +0000 (UTC)
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

--===============7691660976422228201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> Fixes: 1c2a088a6626 ("bpf: x64: add JIT support for multi-function programs")

Is this the correct Fixes tag? That commit only modified x64 JIT code
and BPF core infrastructure for BPF-to-BPF calls - it never touched
arch/arm/net/bpf_jit_32.c.

The actual bug was introduced by commit 39c13c204bb1 ("arm: eBPF JIT
compiler") from August 2017, which added the ARM32 eBPF JIT with
BPF_CALL handling but failed to reject BPF_PSEUDO_CALL. The code has
been incorrectly computing function addresses as 'func = __bpf_call_base
+ imm' for BPF_PSEUDO_CALL since the ARM32 JIT was first introduced.

Suggested: Fixes: 39c13c204bb1 ("arm: eBPF JIT compiler")

> diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
> index deeb8f292454..91fef10e88bc 100644
> --- a/arch/arm/net/bpf_jit_32.c
> +++ b/arch/arm/net/bpf_jit_32.c
> @@ -2047,6 +2047,8 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx)
>  	/* function call */
>  	case BPF_JMP | BPF_CALL:
>  	{
> +		if (insn->src_reg == BPF_PSEUDO_CALL)
> +			goto notyet;
>  		const s8 *r0 = bpf2a32[BPF_REG_0];
>  		const s8 *r1 = bpf2a32[BPF_REG_1];
>  		const s8 *r2 = bpf2a32[BPF_REG_2];


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/24561211195
--===============7691660976422228201==--

