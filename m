Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE640106ACD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kg9hUzKHbhCYALNgzTiam+WBq+jyj3BckJioppHrELk=; b=Vv/LpRxbGLIc5RM+mgWZaCVY4L
	gGJ/hWRkCsCOm0wvK3PwKzTgiXcfTlpGciORdx7DQJtqTNGIJNsY+Ux7WmWPKOkU14akctwwnRvhd
	yXXjEY4gsB5QouuIt/ZrflaMTKSNHz4kOlRMmdRUSE6hN16c0jt+Q1g5pJ2NWhrTufH9VcPcnACh3
	4I8rwgRwl5AH9h3w4+XEi0n2hBS5E00tlwNrxLUk451cLygq/IrUJVQdBj+4QPVYY6KCHzzmMhhpP
	a1B75w3rwrHCM2CsBIAjYyILfJd/dM/VYNbOWblxERNOG9w+2/cIKiBoeAv2/nEkLUW4HDb1VGE66
	2eWuTBNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kB2-0000000EmLO-1Dfo;
	Thu, 12 Mar 2026 17:50:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kAz-0000000EmKa-0OcY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 17:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05804418A2;
	Thu, 12 Mar 2026 17:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46092C4CEF7;
	Thu, 12 Mar 2026 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337822;
	bh=7LHsz76bEPqqBt9H8LYH0PqAphw8gf+XDpTaqmgHOmI=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=Y5MfLluO4eYtVYnyRsyCg4YgMaE467xspw1/uiQe2SJreUpRoMggueZPG5j5w54io
	 3WOmwjGq6lyvPFvi5DwbaCAhnMOlpKUGghaWXTs9XvDrZzvtZslSbz3chuRz+2aA+T
	 qpSFAJ5gcYJu44pF1C5lrS3ADap7MIWLI7oEgZfvyNkk6B5CK6zUYNxoZJolKEHv1k
	 CG9BeD02oAmwoShQsfAhaVjqXXTLQiqH/QwEPOrnShxBYoWdSerxnzBRNpy3uYbgI6
	 IaEshcZZ4Y8MtsEOqPorJ5lamF7AftIP8NExndqjcldWd0XLsLh9dXPZWBt/wMFt5C
	 cTe61v1IpLI5Q==
Content-Type: multipart/mixed; boundary="===============1276411357989145504=="
MIME-Version: 1.0
Message-Id: <23f4b038b245167ff440b79c0a445fcbc12e0a102884759623dd59b3d64d2ade@mail.kernel.org>
In-Reply-To: <20260312170255.3427799-2-xukuohai@huaweicloud.com>
References: <20260312170255.3427799-2-xukuohai@huaweicloud.com>
Subject: Re: [PATCH bpf-next v9 1/5] bpf: Move constants blinding out of arch-specific JITs
From: bot+bpf-ci@kernel.org
To: xukuohai@huaweicloud.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,yonghong.song@linux.dev,puranjay@kernel.org,a.s.protopopov@gmail.com,alexis.lothore@bootlin.com,list+bpf@vahedi.org,linux@armlinux.org.uk,yangtiezhu@loongson.cn,hengqi.chen@gmail.com,johan.almbladh@anyfinetworks.com,paulburton@kernel.org,hbathini@linux.ibm.com,chleroy@kernel.org,naveen@kernel.org,luke.r.nels@gmail.com,xi.wang@gmail.com,bjorn@kernel.org,pulehui@huawei.com,iii@linux.ibm.com,hca@linux.ibm.com,gor@linux.ibm.com,davem@davemloft.net,udknight@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu, 12 Mar 2026 17:50:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_105025_175536_7A106276 
X-CRM114-Status: GOOD (  15.91  )
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

--===============1276411357989145504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 4fbacd2149cd..3ccefd13121b 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c

[ ... ]

> @@ -22843,17 +22843,23 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
>
>  static int jit_subprogs(struct bpf_verifier_env *env)
>  {
> -	struct bpf_prog *prog = env->prog, **func, *tmp;
> +	struct bpf_prog *orig_prog = env->prog, *prog, **func, *tmp;
>  	int i, j, subprog_start, subprog_end = 0, len, subprog;
>  	struct bpf_map *map_ptr;
>  	struct bpf_insn *insn;
>  	void *old_bpf_func;
>  	int err, num_exentries;
> -	int old_len, subprog_start_adjustment = 0;
> +	bool blinded = false;
>
>  	if (env->subprog_cnt <= 1)
>  		return 0;
>
> +	prog = bpf_jit_blind_constants(env, NULL);
> +	if (IS_ERR(prog))
> +		return -ENOMEM;
> +	if (prog != orig_prog)
> +		blinded = true;

When env is non-NULL, bpf_jit_blind_constants() uses
bpf_patch_insn_data() to insert blinding instructions.
bpf_patch_insn_data() calls adjust_insn_aux_data(), which expands
and shifts entries in env->insn_aux_data to match the now-longer
blinded program.

> +
>  	for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {

[ ... ]

> @@ -23114,6 +23122,10 @@ static int jit_subprogs(struct bpf_verifier_env *env)
>  	}
>  	kfree(func);
>  out_undo_insn:
> +	if (blinded) {
> +		bpf_jit_prog_release_other(orig_prog, prog);
> +		env->prog = prog = orig_prog;
> +	}
>  	/* cleanup main prog to be interpreted */
>  	prog->jit_requested = 0;
>  	prog->blinding_requested = 0;
> +	for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
>  		if (!bpf_pseudo_call(insn))
>  			continue;
>  		insn->off = 0;
>  		insn->imm = env->insn_aux_data[i].call_imm;
>  	}

After bpf_jit_prog_release_other() reverts to orig_prog, this loop
iterates using the original program's indices and length. However,
env->insn_aux_data was expanded and shifted by bpf_patch_insn_data()
during blinding to match the blinded program's instruction count.

The call_imm values were saved at blinded indices (earlier in
jit_subprogs, after the bpf_jit_blind_constants call), so reading
them back at original indices gets the wrong aux data entries.

On !CONFIG_BPF_JIT_ALWAYS_ON configs, could this cause incorrect
imm values to be restored into pseudo_call instructions, breaking
interpreter fallback?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/23013190773
--===============1276411357989145504==--

