Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BD3F3ED54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vzzkslHFizpQIeDCJz7smxLaXNteXgmbLKQ5z2vxto=; b=RNiHkb8qfPqVeMSV9dsOBFDYGq
	2L8NXfJ9/08W7aTQzQFQ7sDBLkZI6rIiFvqcS7QEwsskRj708I23PxPfSeKh+MehFdcFWSgasmtQv
	R6gNRmMzUEhpQugREklddJmEalNbD7hB+W2LjMG80/l8zV5oaz3eOGopxm37zMEbzRytHBQw46Ne1
	6+AZdlJT17zGYbtigeRXe7i8y/SSDBBIDrzsIFefmhYN1hdveSf+E2nEnO8WUkUTZlu1Axq7K3FP6
	Oz5H3l0Up3Dp00LvIuZhjvZoboF52gJeRKhVNsMI+SCCtrIltkl5iezvtM+Q/ZVbNzMrY5/XvPeoL
	LoZap/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZZ5-0000000DWgd-0Z1G;
	Sat, 11 Apr 2026 14:44:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZZ0-0000000DWfW-3oJG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:43:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E1C66111B;
	Sat, 11 Apr 2026 14:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52AAC19425;
	Sat, 11 Apr 2026 14:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775918637;
	bh=M/Dd9L2qzIpcUS7ptFv5cCpukybNYsKNd5BWguxECEk=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=hRZX0ydodLTH9R6BYjIEK8XsOdnzoNi5oTgYU8qWuNLxrgBIDR1g+4BGewrHNxMst
	 puCgz1EAN4rN6byso+X4SmLml6V9aRSzndagIfsEQrw/OB1rq6wt4hxjwoxfwCadXf
	 cwlkhMbDZ8pmJyVA9ZwGv3hsLfkeZUXcsTcW1jtdIuQUCYOWZJI6QItnGmw1OBJzwj
	 4HYxbCfDXlRYqa1ulcTZ7kRZ1kMCpPjqq9keKahQE2gfHrKwnKy7NYGU6X7uZ6NRwA
	 ANUX4PlmqLTWBbCiiywDbbHQgJsmLnM1Ik7a1yHyzOcNKvkGtnRbOMr1Md7MHsfgwa
	 BEHfnaBoMiCSA==
Content-Type: multipart/mixed; boundary="===============1064452531770258080=="
MIME-Version: 1.0
Message-Id: <e7535d00be73466e4a09621be0cc898e0ab76422427a17996e4d34712d16fbe3@mail.kernel.org>
In-Reply-To: <20260411133847.1042658-3-xukuohai@huaweicloud.com>
References: <20260411133847.1042658-3-xukuohai@huaweicloud.com>
Subject: Re: [PATCH bpf-next v13 2/5] bpf: Pass bpf_verifier_env to JIT
From: bot+bpf-ci@kernel.org
To: xukuohai@huaweicloud.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,memxor@gmail.com,yonghong.song@linux.dev,puranjay@kernel.org,a.s.protopopov@gmail.com,alexis.lothore@bootlin.com,list+bpf@vahedi.org,linux@armlinux.org.uk,yangtiezhu@loongson.cn,hengqi.chen@gmail.com,johan.almbladh@anyfinetworks.com,paulburton@kernel.org,hbathini@linux.ibm.com,chleroy@kernel.org,naveen@kernel.org,luke.r.nels@gmail.com,xi.wang@gmail.com,bjorn@kernel.org,pulehui@huawei.com,iii@linux.ibm.com,hca@linux.ibm.com,gor@linux.ibm.com,davem@davemloft.net,udknight@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Sat, 11 Apr 2026 14:43:56 +0000 (UTC)
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

--===============1064452531770258080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index 3fa3c74869d0..bd96b3a01b99 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c

[ ... ]

> @@ -2553,46 +2530,53 @@ static bool bpf_prog_select_interpreter(struct bpf_prog *fp)
>  	return select_interpreter;
>  }
>
> -static struct bpf_prog *bpf_prog_jit_compile(struct bpf_prog *prog)
> +static struct bpf_prog *bpf_prog_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  #ifdef CONFIG_BPF_JIT
>  	struct bpf_prog *orig_prog;
> +	struct bpf_insn_aux_data *orig_insn_aux;
>
>  	if (!bpf_prog_need_blind(prog))
> -		return bpf_int_jit_compile(prog);
> +		return bpf_int_jit_compile(env, prog);
> +
> +	if (env) {
> +		/* If env is not NULL, we are called from the end of bpf_check(), at this
> +		 * point, only insn_aux_data is used after failure, so it should be restored
> +		 * on failure.
> +		 */

This isn't a bug, but this multi-line comment has text on the
opening /* line. The BPF subsystem preferred style places /* on
its own line:

	/*
	 * If env is not NULL, we are called from ...
	 */

> +		orig_insn_aux = bpf_dup_insn_aux_data(env);
> +		if (!orig_insn_aux)
> +			return prog;
> +	}


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/24284268460
--===============1064452531770258080==--

