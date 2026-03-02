Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1161CE9B357
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ckhn9DGeZgYT2J/BeYkwrCGdi0ubyhaE2yfugPYAIM=; b=tI7EsBZADscrPQcg5HLH8WqrIe
	toRUi0kE8uiFjWTrdptiisELD3LQ9KbMjra4HWrma/L4G95Z2zxvZlzhh+Z1hHqpDHxg2ftHnguXU
	LL/tTcCI1iCUZn5yQSEXdjQp2dwydp+NODVLg4Hj7xrM+dbm6keC2eYUuFeR+bF7vXVhDGFOuSMri
	ogR6D5DZs29+RtfI3dcmWBgrrFgBFrQVgysgO+Nsb1NljTKG2olOs2ov03CWcrgXyPlvQNe0bn2dQ
	CFxQXixxGVKOyy8TZKuEGDi+kikb5u2T/eWV3QtINcTNAm8hRX9EuHc7FrH9ql8TV5T7yX5EsPLj4
	5BdI5lHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0nX-0000000Cjml-21ue;
	Mon, 02 Mar 2026 10:46:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0nU-0000000Cjm0-2jBV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:46:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9199D402B3;
	Mon,  2 Mar 2026 10:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A53C19423;
	Mon,  2 Mar 2026 10:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772448403;
	bh=mRfUlHrS586k2FuQiBvSGHu6OuLzbXNHA5neBpISxiM=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=WQQLhZbo0Xgxn3IvHIU9hbySnqnUuWRbCx+Ts3KIxJM3/gYsRP1Tx9d6jBg2X++Eb
	 eEMPO0rmguDM3XcBAXTmPyVTv2GxPAwxs0zInEwUXLTsRpA78uCMFLLS4mdufL3+bf
	 osUSeG54d8M3Ecsn8FUdHGq6EKh+/jdULGbOIFoV2+BkvfHxcE88yvzmw8bzA/RsCS
	 gscgRxbD/HcRfAkA+Ypxpgzwso5ulC1WmeIFSV9C8c22AOMKAQheH6258IfGXamQsC
	 1p2LldK+SFZITq0rKRIo8UGCGOwggtZZzO6zF7ezKSEBLNu+5wUtjHvQ7LUDCYwWzo
	 abiDzpTxQqJjA==
Content-Type: multipart/mixed; boundary="===============2186911870242448320=="
MIME-Version: 1.0
Message-Id: <cae8a7cfe54f2f1f66bde10df2026eb2c1076998bef9e483b513abd3bb5722c3@mail.kernel.org>
In-Reply-To: <20260302102726.1126019-2-xukuohai@huaweicloud.com>
References: <20260302102726.1126019-2-xukuohai@huaweicloud.com>
Subject: Re: [PATCH bpf-next v5 1/5] bpf: Move JIT for single-subprog programs to verifier
From: bot+bpf-ci@kernel.org
To: xukuohai@huaweicloud.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,yonghong.song@linux.dev,puranjay@kernel.org,a.s.protopopov@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon,  2 Mar 2026 10:46:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_024644_734703_4E111A9A 
X-CRM114-Status: GOOD (  14.81  )
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

--===============2186911870242448320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index fc4ccd1de569..ab2bc0850770 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -26086,6 +26086,11 @@ int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr, __u3
>  		convert_pseudo_ld_imm64(env);
>  	}
>
> +	/* constants blinding in the JIT may increase prog->len */
> +	len = env->prog->len;
> +	if (env->subprog_cnt == 1)
> +		env->prog = bpf_prog_select_jit(env->prog, &ret);
> +
>  	adjust_btf_func(env);
>
>  err_release_maps:

[ ... ]

> @@ -26111,7 +26116,7 @@ int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr, __u3
>  err_unlock:
>  	if (!is_priv)
>  		mutex_unlock(&bpf_verifier_lock);
> -	clear_insn_aux_data(env, 0, env->prog->len);
> +	clear_insn_aux_data(env, 0, len);
>  	vfree(env->insn_aux_data);

Can the len variable be stale when reaching clear_insn_aux_data()
through an error path?

At the top of bpf_check(), len is first assigned as:

    len = (*prog)->len;

This original value is used to allocate insn_aux_data. Later,
instruction rewriting passes like convert_ctx_accesses() and
do_misc_fixups() can change env->prog->len and resize
insn_aux_data to match via bpf_patch_insn_data().

The second assignment added by this patch:

    len = env->prog->len;

is only reached on the success path, after all instruction
rewriting and after the maps/btfs allocation. If an error occurs
between the rewriting passes and this reassignment, for example
bpf_vlog_finalize() returning an error, copy_to_bpfptr_offset()
failing, or kmalloc for used_maps/used_btfs failing, the code
jumps to err_release_maps and eventually reaches
clear_insn_aux_data(env, 0, len) with the original program length
rather than the current post-rewriting length.

If rewriting increased env->prog->len (the common case for
programs with context accesses), the iteration stops short of
the actual insn_aux_data size, potentially leaking jt fields in
the unvisited entries.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22571297111

AI-authorship-score: low
AI-authorship-explanation: Standard kernel refactoring by a known BPF contributor with non-native English patterns in the commit message.
issues-found: 1
issue-severity-score: low
issue-severity-explanation: Stale len variable in bpf_check error paths can cause insn_aux_data jt field memory leaks when instruction rewriting changed prog->len before an error between rewriting and the len reassignment.

--===============2186911870242448320==--

