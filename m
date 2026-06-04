Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FC0CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 21:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpZ3QvNzyLq6MCDStBRoFi5pI56pBgPE12+T/xtOUmg=; b=LlBjvJviLQ3cXQWnYV0SoiYMy1
	zNFsIIf3V/NlxM9Tp2dpA733FUBZZ0mYkKLjlPKt4nlsHmvE3+TkgewfiG8R9j2Zkm958hN8VrC2o
	bTRwv4geuXh5gYDRMoK0QlYFDA27K1l1+dUTxcn9BlSUyw1vduuqa6W0er5HRISr9VTHiZ8ROekvN
	Oih0uca3bTexnpXhMXVArtB74aPC4WtmG1YBhTl7atKe9ATDLMWHEavJ3zzcVn1bO1cCH1nElGkg1
	yofIJd6QFLUSPbRmDdzdyx/6g7KNYI99ynwHLoPy32tdpDF9let1SDARFP0cCFP3yFaXmR4Z9a2lG
	VvuBYRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVFNQ-0000000HJTb-0YCb;
	Thu, 04 Jun 2026 21:13:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVFNO-0000000HJTF-0pis
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 21:13:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 572EA40E21;
	Thu,  4 Jun 2026 21:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26711F00893;
	Thu,  4 Jun 2026 21:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780607597;
	bh=MpZ3QvNzyLq6MCDStBRoFi5pI56pBgPE12+T/xtOUmg=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=DiwgBurVitMzJUb2m1D70814eZtSeLV6fzWGh1T2qAO3fIHYGN7fF6kO/SrAKQjvX
	 8KwBI4Slif3WPLWLLG+H0ocAbC5Bq1YGBsxs6YxCzrETQKxKe3rlGXXsTN/y3MXau+
	 F9BwpD8Quj3la/DeROcj+6ufk01ZCIBIe73AK/sNC8YmGSt76noC5is2RVBvBg/s8U
	 HZiKleQmM9wlj/qZeVAS0qg/RG32HNoU16vexEx2IEStUJnwoma57gmiVl+bLNTPib
	 +VTcLHOBALlAYOiKOypCREXI/to5P1Lw4xGpsPCy5b5Fr5o9uzIeOPVRuX9afv3Dz0
	 zydMNdGWcdnhA==
Content-Type: multipart/mixed; boundary="===============4379291998619388122=="
MIME-Version: 1.0
Message-Id: <0e5fcc7f26d096479c14eda3b51a238cecfdeff065ab6f33c50f71e54eee0ff0@mail.kernel.org>
In-Reply-To: <20260604-kasan-v2-1-c066e627fda8@bootlin.com>
References: <20260604-kasan-v2-1-c066e627fda8@bootlin.com>
Subject: Re: [PATCH bpf-next v2 1/8] bpf: mark instructions accessing program stack
From: bot+bpf-ci@kernel.org
To: alexis.lothore@bootlin.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,memxor@gmail.com,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,john.fastabend@gmail.com,tglx@kernel.org,mingo@redhat.com,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,hpa@zytor.com,shuah@kernel.org,mcoquelin.stm32@gmail.com,alexandre.torgue@foss.st.com,ihor.solodrai@linux.dev
Cc: ebpf@linuxfoundation.org,bastien.curutchet@bootlin.com,thomas.petazzoni@bootlin.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-kselftest@vger.kernel.org,linux-stm32@st-md-mailman.stormreply.com,linux-arm-kernel@lists.infradead.org,alexis.lothore@bootlin.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu,  4 Jun 2026 21:13:16 +0000 (UTC)
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

--===============4379291998619388122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index a656a8572bdb..393d9eacd215 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c

[ ... ]

> @@ -1583,6 +1583,22 @@ bool bpf_insn_is_indirect_target(const struct bpf_verifier_env *env, const struc
>  	return env->insn_aux_data[insn_idx].indirect_target;
>  }
>
> +bool bpf_insn_accesses_stack_only(const struct bpf_verifier_env *env,
> +				  const struct bpf_prog *prog, int insn_idx)
> +{
> +	struct bpf_insn *insn;
> +
> +	/* cBPF: we have no verifier state, do a best-effort check based on
> +	 * dst/src reg
> +	 */
> +	insn_idx += prog->aux->subprog_start;
> +	insn = (struct bpf_insn *)prog->insnsi + insn_idx;
> +	if (!env)
> +		return insn->dst_reg == BPF_REG_FP ||
> +		       insn->src_reg == BPF_REG_FP;
> +	return !env->insn_aux_data[insn_idx].non_stack_access;
> +}
> +

Sashiko bot raised a concern about this code in v2 review: When JIT
compiling an eBPF subprogram, prog points to the subprogram and
prog->insnsi only spans the subprogram's instructions.

By adding prog->aux->subprog_start to insn_idx, doesn't this result in
out-of-bounds pointer arithmetic for insn? Even though the pointer is not
dereferenced here because of the if (!env) check, could this trigger UBSAN
bounds-checking traps?

Should the insn pointer calculation be deferred until inside the !env block
where it is genuinely needed for cBPF?

Reference: https://lore.kernel.org/bpf/20260604203644.81EF51F00893@smtp.kernel.org/

> diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
> index 5aa3f7d99ac9..5228c910fbf5 100644
> --- a/kernel/bpf/fixups.c
> +++ b/kernel/bpf/fixups.c

[ ... ]

> @@ -185,16 +185,22 @@ static void adjust_insn_aux_data(struct bpf_verifier_env *env,
>  	}
>
>  	/*
> -	 * The indirect_target flag of the original instruction was moved to the last of the
> -	 * new instructions by the above memmove and memset, but the indirect jump target is
> -	 * actually the first instruction, so move it back. This also matches with the behavior
> -	 * of bpf_insn_array_adjust(), which preserves xlated_off to point to the first new
> -	 * instruction.
> +	 * The indirect_target and non_stack_access flags of the original
> +	 * instruction were moved to the last of the new instructions by the
> +	 * above memmove and memset, but those actually match the first
> +	 * instruction, so move them back. This also matches with the behavior
> +	 * of bpf_insn_array_adjust(), which preserves xlated_off to point to
> +	 * the first new instruction.
>  	 */
>  	if (data[off + cnt - 1].indirect_target) {
>  		data[off].indirect_target = 1;
>  		data[off + cnt - 1].indirect_target = 0;
>  	}
> +
> +	if (data[off + cnt - 1].non_stack_access) {
> +		data[off].non_stack_access = 1;
> +		data[off + cnt - 1].non_stack_access = 0;
> +	}
>  }

Sashiko bot raised a concern about this logic in v2 review: When
bpf_patch_insn_data() expands a single instruction into multiple
instructions, this logic restricts the non_stack_access flag to only the
first instruction of the patched sequence and clears it for the rest.

Since the actual memory load or store in a patched sequence often occurs on
subsequent instructions rather than the first, wouldn't they lose this flag
and incorrectly bypass KASAN checks during JIT compilation?

Reference: https://lore.kernel.org/bpf/20260604203644.81EF51F00893@smtp.kernel.org/



---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/26978380520
--===============4379291998619388122==--

