Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19E2F55102
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 17:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zidBe82QXxFFRIR7WHPFczHiWRVMVxQyM89ZCfUGlTE=; b=sxxurAOftR4kUNosOZfJjEJM1v
	DVZdCZd7dB1e1l1UhsCJ02GuvoBkVQOxY5ObpO5IXl50/yGBSYRS2X0i6eLeVRpXUSFNiQkfwUI65
	+856kvi8yzIdyjrZAuuS6L+OuS+az4SsBpywVw/MZFa5vFVd/8j/NYWzr1uxxMe9/8Drzkzn7BzHH
	z6JawWWLsE4WC+/Ao0QQmNwABJuxqCf6oWzTMPBxbQGospVs1wDnwPiyFoimzDVW784aWs1ecwp82
	angI/Jld8jewk/THt7l3X9SuKAhHd5W+yRkmuJjmqSyoyVaTsL+2F8MBU99TNI8jKm6n0X1IJUcRd
	GdxYDTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyvER-00000005NxS-04HB;
	Sat, 07 Mar 2026 17:14:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyvEP-00000005NxI-3iwY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 17:14:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A162560051;
	Sat,  7 Mar 2026 17:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4CCC19422;
	Sat,  7 Mar 2026 17:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772903664;
	bh=wvZwCWzoV2syxel4bj9Num7rqlKF203cjboJ2bIy5os=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=IS8+3rL6RB502TfkKEXzwAn5AFGRVyuTCJw5q7ZBwEizqrRWLHH8PMtZ1VowKnACT
	 kjcdRxbvbDnN7bYPUCWaCoHtJ6/WLK+CGRKbYE4SQdgB1ZgE7PIFso4BEH5ouAtJxV
	 Kh091a69PK1EM+dj+qSwgo4TvGKuuu1NpteP+knzwQWYOuD0HENSxIqu478wPyQjUd
	 N9wGUhAKgspQwMknQ/ZMorLOMYbh2WiXDUjkH2hMyWP6RiMNCMf8reomc+Mde9I4Vm
	 POXZG0p95e6lwN2hXNru55BlF7mn4qv8Jnx/1riDM7yeIDHPCFZjvclfdN9hrYDoAW
	 7oRiHM6Pw5VfQ==
Content-Type: multipart/mixed; boundary="===============0778104764128759318=="
MIME-Version: 1.0
Message-Id: <ca484ba53c9ce4dac51c7ae3e8888cfe561b31c3826880c6fc89d5581c6de2fa@mail.kernel.org>
In-Reply-To: <20260307103949.2340104-4-xukuohai@huaweicloud.com>
References: <20260307103949.2340104-4-xukuohai@huaweicloud.com>
Subject: Re: [bpf-next v7 3/5] bpf: Add helper to detect indirect jump targets
From: bot+bpf-ci@kernel.org
To: xukuohai@huaweicloud.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,yonghong.song@linux.dev,puranjay@kernel.org,a.s.protopopov@gmail.com,list+bpf@vahedi.org,linux@armlinux.org.uk,yangtiezhu@loongson.cn,hengqi.chen@gmail.com,johan.almbladh@anyfinetworks.com,paulburton@kernel.org,hbathini@linux.ibm.com,chleroy@kernel.org,naveen@kernel.org,luke.r.nels@gmail.com,xi.wang@gmail.com,bjorn@kernel.org,pulehui@huawei.com,iii@linux.ibm.com,hca@linux.ibm.com,gor@linux.ibm.com,davem@davemloft.net,udknight@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Sat,  7 Mar 2026 17:14:23 +0000 (UTC)
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

--===============0778104764128759318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -1475,11 +1475,30 @@ int bpf_jit_blind_constants(struct bpf_verifier_env *env)
>  		insn = prog->insnsi + i + insn_delta;
>  		insn_cnt += insn_delta;
>  		i        += insn_delta;
> +
> +		/* bpf_patch_insn_data() calls adjust_insn_aux_data() to adjust insn_aux_data. The
> +		 * indirect_target flag for the original instruction is moved to the last of the new
> +		 * instructions, but the indirect jump target is actually the first one, so move
> +		 * it back.
> +		 */
> +		if (env->insn_aux_data[i].indirect_target) {
> +			env->insn_aux_data[i].indirect_target = 0;
> +			env->insn_aux_data[i - insn_delta].indirect_target = 1;
> +		}

This fixup handles the displacement caused by
bpf_jit_blind_constants() itself, but adjust_insn_aux_data() has
the same displacement behavior in every caller of
bpf_patch_insn_data(). Several patching passes run before
bpf_jit_blind_constants() in bpf_check():

  convert_ctx_accesses()      ->  bpf_patch_insn_data()
  do_misc_fixups()            ->  bpf_patch_insn_data()
  opt_subreg_zext_lo32_rnd_hi32() -> bpf_patch_insn_data()
  fixup_call_args()           ->  bpf_jit_blind_constants()  <-- only fixup here

All of these call adjust_insn_aux_data() which does:

  memmove(data + off + cnt - 1, data + off, ...)
  memset(data + off, 0, ...)

This moves indirect_target from data[off] to data[off + cnt - 1].
Meanwhile, bpf_insn_array_adjust() preserves xlated_off == off:

  if (insn_array->values[i].xlated_off <= off)
      continue;

So after an earlier pass patches an indirect target instruction,
the insn_array still says the target is at off, but
insn_aux_data has indirect_target set at off + cnt - 1.

If an indirect jump target is also, say, a helper call that
do_misc_fixups() replaces with multiple instructions, would
bpf_insn_is_indirect_target() return the wrong result for that
instruction? It seems like the fixup might need to be in
adjust_insn_aux_data() itself rather than only in
bpf_jit_blind_constants().


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22803043949
--===============0778104764128759318==--

