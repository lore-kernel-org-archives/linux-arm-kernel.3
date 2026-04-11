Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C14F3ED55
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99X7n8fCsoWPRfi+LqOzWsORJNQHYt7XUdZ6ltGe9bg=; b=cvrO0BPs1wT4Ehv1JIadQP808s
	KwA69naVoDpaOVPRDYT3oXqvHrIPRmStilYkLNSTI7FVMSDqsuwkv5C6733a4u7zLd5NsMZw1Mtea
	pUQHNiK+ky3PSnpBuzMIqLddiL55YjeEXUlwxRPEfzUhEVHcXanCagSOv5sjIzPlM5AwHZs8QvV2N
	B17sPe387M9uWVp20qrAoJefx/Ibq7LHTPgrJtxAlUgvK1CFBgcX5DbkFzI9L4dowsJTVFJFgNVgd
	CG0taMcmFQn5yFp12gOspB8r1lrdul9/DvtrA/Bwz4EHcaKJtTlu2AQ/75Yk47Vyb4PHiT9ab2QaQ
	fL+wt34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZZ5-0000000DWgu-1peP;
	Sat, 11 Apr 2026 14:44:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZZ2-0000000DWfk-0BQL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:44:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34E9C44492;
	Sat, 11 Apr 2026 14:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF43C4CEF7;
	Sat, 11 Apr 2026 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775918639;
	bh=57CK0l47W/yUIcext4eyuju0/nugILwSpCFYoiLQZ1w=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=YVNETH1dUEX7yY7UewBlhZDFbFt/WffNDaRp7atNEDrAsN+cU2zTUdxljF1UAjRLJ
	 hwLGarf7aRIF6f0Ipxm58l/e4zZdrVrdv+Yl9s15V+qrjlHR8DSXHb87HBugMnDOOH
	 xSpKZo0ocgd+yWwmzjB31dvWG+IvO3IcbEmFeYXq8PCfGbM8dFggH8CKVnTYnISXLE
	 bsqA5sgzbWwQDveasfkEb3NTjILzQZ5z4hx0QZ08YhcrgW56tpf4AyCzXB6FRICbG+
	 39hHNRWBBmNMGTOkEh5mvjcUEViK9T7Pw+ieLQktr+Xfz357kHHSuHjaivQk10ZjwE
	 fC9z7IvBe5Udg==
Content-Type: multipart/mixed; boundary="===============3603684705991622016=="
MIME-Version: 1.0
Message-Id: <ebe116b9417e77b2f1a7d0d9f07cd1fc5d162c23992fe35e84190c1ddbb3ed3c@mail.kernel.org>
In-Reply-To: <20260411133847.1042658-2-xukuohai@huaweicloud.com>
References: <20260411133847.1042658-2-xukuohai@huaweicloud.com>
Subject: Re: [PATCH bpf-next v13 1/5] bpf: Move constants blinding out of arch-specific JITs
From: bot+bpf-ci@kernel.org
To: xukuohai@huaweicloud.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,memxor@gmail.com,yonghong.song@linux.dev,puranjay@kernel.org,a.s.protopopov@gmail.com,alexis.lothore@bootlin.com,list+bpf@vahedi.org,linux@armlinux.org.uk,yangtiezhu@loongson.cn,hengqi.chen@gmail.com,johan.almbladh@anyfinetworks.com,paulburton@kernel.org,hbathini@linux.ibm.com,chleroy@kernel.org,naveen@kernel.org,luke.r.nels@gmail.com,xi.wang@gmail.com,bjorn@kernel.org,pulehui@huawei.com,iii@linux.ibm.com,hca@linux.ibm.com,gor@linux.ibm.com,davem@davemloft.net,udknight@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Sat, 11 Apr 2026 14:43:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_074400_141096_9B60DFD7 
X-CRM114-Status: GOOD (  19.95  )
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

--===============3603684705991622016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> leaving the global env->prog->insni and env->insn_aux_data untouched.

The struct field is insnsi, not insni. The same paragraph also says:

> this approach result in incorrect index for the insni array

Should this be "results in" and "insnsi"?

The commit message also refers to clean_insn_aux_data():

> it is freed by clean_insn_aux_data() at the end of bpf_check().
> Before freeing, clean_insn_aux_data() loops over env->insn_aux_data

The function is actually clear_insn_aux_data(), not
clean_insn_aux_data(). Searching the tree for clean_insn_aux_data
returns no results.

> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index 066b86e7233c..3fa3c74869d0 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -1508,7 +1508,10 @@ static void adjust_insn_arrays(struct bpf_prog *prog, u32 off, u32 len)
>  #endif
>  }
>
> -struct bpf_prog *bpf_jit_blind_constants(struct bpf_prog *prog)
> +/* Now this function is used only to blind the main prog and must be invoked only when
> + * bpf_prog_need_blind() returns true.
> + */
> +struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env, struct bpf_prog *prog)

The BPF subsystem convention is for multi-line comments to have the
opening /* on its own line. Should this be:

/*
 * Now this function is used only to blind the main prog and must be
 * invoked only when bpf_prog_need_blind() returns true.
 */

[ ... ]

> @@ -1550,21 +1557,34 @@ struct bpf_prog *bpf_jit_blind_constants(struct bpf_prog *prog)

[ ... ]

> +		if (env)
> +			env->prog = clone;
> +		else
> +			/* Instructions arrays must be updated using absolute xlated offsets.
> +			 * The arrays have already been adjusted by bpf_patch_insn_data() when
> +			 * env is not NULL.
> +			 */
> +			adjust_insn_arrays(clone, i, rewritten);

Same comment style question here.

[ ... ]

> @@ -2533,6 +2553,34 @@ static bool bpf_prog_select_interpreter(struct bpf_prog *fp)

[ ... ]

> +	prog = bpf_jit_blind_constants(NULL, prog);
> +	/* If blinding was requested and we failed during blinding, we must fall
> +	 * back to the interpreter.
> +	 */
> +	if (IS_ERR(prog))

And here as well.

> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 56fcc96dc780..0cca590915ff 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c

[ ... ]

> +	} else {
> +		if (err != -EFAULT) {
> +			/* We will fall back to interpreter mode when err is not -EFAULT, before
> +			 * that, insn->off and insn->imm should be restored to their original
> +			 * values since they were modified by __jit_subprogs.
> +			 */

Same comment style question.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/24284268460
--===============3603684705991622016==--

