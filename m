Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE19E85372
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hrv5xmJ+W4v6dhfjJG9pCJo08zLp83BWgniQY3tIO2s=; b=jlIL6Q4724wS1z0ZCzq4tqFuV+
	/wnSdLyBngysQ4cLYQ9kultQotIQpGUTrNofX6ulHFnX5Uv58t/9JIIooivL/JahJPacRXUgpzA8I
	aY1UWRGLlVDhzhWYBHz7198G9V4Rt4Nbgm/j/llWtsU3X1KKMaunwlFYtbiEUi/BgxWlpU2HyS9jk
	8eo71CIwcAqLznY4a3ieCoOlDQ1NheyWjiDRsE1y0uOoCzQwtRRZOl0y8qQA5xsCgeWasyxss1dh/
	ojcIDdo6YPhqJF7pEb+UTFhGCAlIDWArP+ggIIL6J2q7tzyd4qqC55NSAIlcrlfla3N6rrpIVn+Xf
	aPVrgFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fXz-000000029JM-3Jfp;
	Fri, 03 Apr 2026 14:30:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fXy-000000029Ix-2Oyn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 900EB60133;
	Fri,  3 Apr 2026 14:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EEEC19421;
	Fri,  3 Apr 2026 14:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775226653;
	bh=Ph0s8jNFWIbP2rJPQvULbZ2x0gslejGFneauyzarkl0=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=Njo06mBfUW4Vie5R5F38MZRVRU7KKvM6YoYP1OUXT9wHYW4E89HvJoMu4bKIxmyYO
	 1D4jT8ZVQFtD6ZHGnSnAUreicxMxZbfcD6hfzOdN237AY1KOmYr4JT7mvB+XZsKVKC
	 GlX7o4nH4syMNF0dYaxEo0A3oULo1LpsTL5MxE3Xzq0fudTO8aBWAKwRcaoGl+tV1n
	 bR0ZmoH8yWHqfncMlE/m7wd2UdJktk5+apZ5fcsaZ9kfW3DdKqG/cqQB4BjA5bB2lF
	 M0pGg6DY+qWOWbaBfpWOsVBvxB6FgRfl1zPsJbYo7dj+l4XyaTNNdNB53hrrOof/ZT
	 lXjE1ZSfOdlDw==
Content-Type: multipart/mixed; boundary="===============9218033960697897612=="
MIME-Version: 1.0
Message-Id: <ad939c6a7364bd33eabc4eeadb80f904a947bb769093b550002d2cd818260a36@mail.kernel.org>
In-Reply-To: <20260403132811.753894-3-xukuohai@huaweicloud.com>
References: <20260403132811.753894-3-xukuohai@huaweicloud.com>
Subject: Re: [PATCH bpf-next v12 2/5] bpf: Pass bpf_verifier_env to JIT
From: bot+bpf-ci@kernel.org
To: xukuohai@huaweicloud.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,yonghong.song@linux.dev,puranjay@kernel.org,a.s.protopopov@gmail.com,alexis.lothore@bootlin.com,list+bpf@vahedi.org,linux@armlinux.org.uk,yangtiezhu@loongson.cn,hengqi.chen@gmail.com,johan.almbladh@anyfinetworks.com,paulburton@kernel.org,hbathini@linux.ibm.com,chleroy@kernel.org,naveen@kernel.org,luke.r.nels@gmail.com,xi.wang@gmail.com,bjorn@kernel.org,pulehui@huawei.com,iii@linux.ibm.com,hca@linux.ibm.com,gor@linux.ibm.com,davem@davemloft.net,udknight@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Fri,  3 Apr 2026 14:30:52 +0000 (UTC)
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

--===============9218033960697897612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index cc61fe57b98d..093ab0f68c81 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c

[ ... ]

> @@ -2551,47 +2528,63 @@ static bool bpf_prog_select_interpreter(struct bpf_prog *fp)
>  	return select_interpreter;
>  }
>
> -static struct bpf_prog *bpf_prog_jit_compile(struct bpf_prog *prog)
> +static struct bpf_prog *bpf_prog_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  #ifdef CONFIG_BPF_JIT
>  	bool blinded = false;
>  	struct bpf_prog *orig_prog = prog;
> +	struct bpf_insn_aux_data *orig_insn_aux;
>
>  	if (bpf_prog_need_blind(orig_prog)) {
> +		if (env) {
> +			/* If env is not NULL, we are called from the end of bpf_check(), at this
> +			 * point, only insn_aux_data is used after failure, so we only restore it
> +			 * here.
> +			 */
> +			orig_insn_aux = bpf_dup_insn_aux_data(env);
> +			if (!orig_insn_aux)
> +				return orig_prog;
> +		}
> +		prog = bpf_jit_blind_constants(env, orig_prog);

[ ... ]

> +	return prog;
> +
> +out_restore:
> +	bpf_restore_insn_aux_data(env, orig_insn_aux);
> +out_free:
> +	kvfree(orig_insn_aux);
>  #endif
>  	return prog;
>  }

When the out_restore label is reached (blinding or JIT failure with
env != NULL), bpf_restore_insn_aux_data() sets env->insn_aux_data to
point to orig_insn_aux:

kernel/bpf/verifier.c:bpf_restore_insn_aux_data() {
    vfree(env->insn_aux_data);
    env->insn_aux_data = orig_insn_aux;
}

The code then falls through to the out_free label, which calls
kvfree(orig_insn_aux). This frees the memory that env->insn_aux_data
now points to, leaving it as a dangling pointer.

Since this function is called from inside bpf_check() via
__bpf_prog_select_runtime(), the subsequent cleanup in bpf_check()
accesses the freed memory:

kernel/bpf/verifier.c:bpf_check() {
    ...
    clear_insn_aux_data(env, 0, env->prog->len);
    vfree(env->insn_aux_data);
}

Could the out_restore path return directly instead of falling through
to out_free, since after the restore env now owns orig_insn_aux and
bpf_check() will free it during normal cleanup?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/23948799625
--===============9218033960697897612==--

