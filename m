Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FCCE7E365
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 10:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jy8BkO3kiAA3oVj6TfrZh12oW7ljzxGoR7o/eK2BSPA=; b=NZgpk5mbQgN6G8dsSpkp+ZHxF/
	/Fo27XLNhXzPvVXtaxiyqt37RAVUWqoGeZT8uKf6MFt0CB6JSU2M1Su6XbC29C5WETTwuKDqpuxec
	ILW39SQ4iNdK1CfBPTFPXLrAQoZfheKsH43mQrZ7NzeqsKh1L29O5bIZdVhOYHhNlEWod+mRwARlo
	cJ034SCDq9saanGcM7niEI1OIRZX/Qw49uLyfJfX9wI65zsn/OGn1zItQhnOr2dZrm8byAy4q5hyI
	nYFELqAxIyQObZmyhWyj4b3SIjoKRi+m+fP+XJkDmUtyTqZMFaPXVqeVOCYxzOhs5TX7eLB7DZM3m
	2eA/uHYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ba1-00000001sE5-2rxD;
	Fri, 03 Apr 2026 10:16:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bZz-00000001sDa-2BtD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 10:16:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7C9141A1B;
	Fri,  3 Apr 2026 10:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C875C19424;
	Fri,  3 Apr 2026 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775211401;
	bh=vJcrMCFWi3eVzyJNqr5vaLE810lzwaTLsguHO5sXDbE=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=ar2Nqmqrw2/cBEhIRcDPY5fAvwVyfVAcnpauo/1KqYBG2TCbSBd+9gEbEwRxvUDO1
	 hFBOy3+D3FIw60MHO3K1Qp+vVCVkodRVdVJt3/1xfPJGYmW1Cze1Bz2q+J2u1y61pq
	 lresNR+/SiKpq/FDqxNQuzYcI/yZeoy/xjiybBkm0FwFdRZdrS+50Kh9gZoor2TmiA
	 qNKHw1uQKeGhx9JreI1mroZmZRT7tqq9j75FRZm1ItETTCIeV5GRL1pl4H1vYCrr3e
	 zVkQnWTfIei6Z09bdqhDKjjErNF3pvZwz7c+cMfEXny2gwVt9v/UMOUWf07CNex89c
	 N+JmIeVhByILQ==
Content-Type: multipart/mixed; boundary="===============5612373391882020586=="
MIME-Version: 1.0
Message-Id: <03e4fec040d9458797f717e7778cc61a69ed1fd862782df81a7b59c82fad03c7@mail.kernel.org>
In-Reply-To: <20260403090915.473493-2-xukuohai@huaweicloud.com>
References: <20260403090915.473493-2-xukuohai@huaweicloud.com>
Subject: Re: [PATCH bpf-next v11 1/5] bpf: Move constants blinding out of arch-specific JITs
From: bot+bpf-ci@kernel.org
To: xukuohai@huaweicloud.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,yonghong.song@linux.dev,puranjay@kernel.org,a.s.protopopov@gmail.com,alexis.lothore@bootlin.com,list+bpf@vahedi.org,linux@armlinux.org.uk,yangtiezhu@loongson.cn,hengqi.chen@gmail.com,johan.almbladh@anyfinetworks.com,paulburton@kernel.org,hbathini@linux.ibm.com,chleroy@kernel.org,naveen@kernel.org,luke.r.nels@gmail.com,xi.wang@gmail.com,bjorn@kernel.org,pulehui@huawei.com,iii@linux.ibm.com,hca@linux.ibm.com,gor@linux.ibm.com,davem@davemloft.net,udknight@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Fri,  3 Apr 2026 10:16:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_031643_598357_9D362A66 
X-CRM114-Status: GOOD (  20.55  )
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

--===============5612373391882020586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index a431b7d50e1b..0d6bfccf0dd7 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c

[ ... ]

> +static int jit_subprogs(struct bpf_verifier_env *env)
> +{
> +	int err, i;
> +	bool blinded = false;
> +	struct bpf_insn *insn;
> +	struct bpf_prog *prog, *orig_prog;
> +	u32 *orig_subprog_starts;
> +
> +	if (env->subprog_cnt <= 1)
> +		return 0;
> +
> +	prog = orig_prog = env->prog;
> +	if (bpf_prog_need_blind(orig_prog)) {
> +		if (!IS_ENABLED(CONFIG_BPF_JIT_ALWAYS_ON)) {
> +			orig_subprog_starts = dup_subprog_starts(env);
> +			if (!orig_subprog_starts) {
> +				err = -ENOMEM;
> +				goto out_cleanup;
> +			}
> +		}
> +		prog = bpf_jit_blind_constants(env, NULL);
> +		if (IS_ERR(prog)) {
> +			err = -ENOMEM;
> +			goto out_restore;

When bpf_jit_blind_constants() fails, prog holds an ERR_PTR value.
The goto out_restore falls through to out_cleanup which dereferences
prog:

    prog->jit_requested = 0;

That would be dereferencing ERR_PTR(-ENOMEM).

> +		}
> +		blinded = true;
> +	}
> +
> +	err = __jit_subprogs(env);
> +	if (blinded) {
> +		if (err) {
> +			bpf_jit_prog_release_other(orig_prog, prog);

Similarly, when blinding succeeds but __jit_subprogs() fails,
bpf_jit_prog_release_other() frees the clone through
bpf_prog_clone_free(). After this, prog points to freed memory,
and the goto out_restore falls through to out_cleanup where
prog->jit_requested is a use-after-free.

Both paths could use orig_prog (or env->prog, which was restored)
at out_cleanup instead of the stale prog local variable.

> +			/* roll back to the clean original prog */
> +			env->prog = orig_prog;
> +			goto out_restore;
> +		} else {
> +			bpf_jit_prog_release_other(prog, orig_prog);
> +			if (!IS_ENABLED(CONFIG_BPF_JIT_ALWAYS_ON))
> +				kvfree(orig_subprog_starts);
> +		}
> +	} else if (err) {
> +		/* We will fall back to interpreter mode when err is not -EFAULT, before
> +		 * that, insn->off and insn->imm should be restored to their original values
> +		 * since they were modified by __jit_subprogs.
> +		 */
> +		if (err != EFAULT) {

The comment says "when err is not -EFAULT" but the code checks
err != EFAULT (positive 14).  Since __jit_subprogs() returns
negative error codes, this condition is always true.  Should this
be err != -EFAULT?

> +			for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
> +				if (!bpf_pseudo_call(insn))
> +					continue;
> +				insn->off = 0;
> +				insn->imm = env->insn_aux_data[i].call_imm;
> +			}
> +		}
> +		goto out_cleanup;
> +	}
> +
> +	return 0;
> +
> +out_restore:
> +	if (!IS_ENABLED(CONFIG_BPF_JIT_ALWAYS_ON)) {
> +		restore_subprog_starts(env, orig_subprog_starts);
> +		kvfree(orig_subprog_starts);
> +	}
> +out_cleanup:
> +	/* cleanup main prog to be interpreted */
> +	prog->jit_requested = 0;
> +	prog->blinding_requested = 0;
>  	return err;
>  }

[ ... ]

> @@ -26456,7 +26529,7 @@ int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr, __u3
>  err_unlock:
>  	if (!is_priv)
>  		mutex_unlock(&bpf_verifier_lock);
> -	clear_insn_aux_data(env, 0, env->prog->len);
> +	clear_insn_aux_data(env, 0, env->blinded_insn_aux_len ? : env->prog->len);

When blinding succeeds but JIT fails and jit_subprogs() rolls back
env->prog to the original (shorter) program, blinded_insn_aux_len
is larger than env->prog->len.

clear_insn_aux_data() iterates to blinded_insn_aux_len and calls
bpf_is_ldimm64(&insns[i]) on each entry.  The insns array comes
from env->prog->insnsi, which only has env->prog->len entries.
Can this read past the end of the program instructions array?

>  	vfree(env->insn_aux_data);

---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/23941975318
--===============5612373391882020586==--

