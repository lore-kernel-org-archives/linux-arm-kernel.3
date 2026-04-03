Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE215E8536F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsULLJ4tluaP9bXGJ3HtIbjnSUBgVXhyBQ1KFqeeSFo=; b=FtDbJTqP29w5kTw3Tkj+1SnOGV
	mXAKWf1djZdL4jn+GTYCxGv2eB5m9h59LJqTp14Qor/0wNa6RaUvtvt43XG6AgFu5D40LuP9Vl3Qt
	QHu6+HX0KSL+Pa0yNvvBWHl6mNEHPPb/4gyf3A32mob99thXtqU9pzDJgene4wIfm0ZgfmKAUAEXR
	sEqrY7Y3n4nHfc6oc6GgjaB0lobQKMVTon8gfwS1aFyRAJDEikmjKCa9zOm8N7SDbUajuX8xW/yy6
	fV5UcqoYd+LFKgjGrqE+PKCOkZp93jtq77O9bwSoJf4Gk806jCAN4Mc+aEHVqNu55hoKErxPx5eZo
	7HMGVnVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fXy-000000029Iy-217T;
	Fri, 03 Apr 2026 14:30:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fXw-000000029Ir-2VBj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:30:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2FE560121;
	Fri,  3 Apr 2026 14:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA79FC4CEF7;
	Fri,  3 Apr 2026 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775226651;
	bh=EG/4+EnjirMkDZg/s2AKKf6fVlqgREOm7zmiAunJsOk=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=hF5oKMIpkSnVzJ3WsKgH/PKmqSjD1zMtFEPF0s6EGi4R1o3Q9JQIMZHd45Db26d9j
	 WQGO5XHcHtrh5DEGn1aBhnCHm3Ogjl/RrKAig3gh/fOmIXM7xAgDGOWGsQ5QIleq7O
	 QOL6KHuRrvmt+w5O4vG2F4MiyxGHSmGDec8OD1qgueiMmzpRsSzIwLfFD6fXioscRM
	 n1nnbxgbd8UK3T0bcj8UfcZ/aML4gpNI/Rrvy6s+AMil1i8M75Yp3ac5Dr0DZpoXWl
	 USWvfIVrCIWgqQh9vI7sZB8LUIjli/nfjkqCVF+A3UwuzQ/6zSmFS195MwPQ5PTEGe
	 NB/KiYZEZyjQA==
Content-Type: multipart/mixed; boundary="===============2451143287243483675=="
MIME-Version: 1.0
Message-Id: <d7d0c76305b07ae5d485df56061925b95bc2206ad3fe13fb62d4567e51800f46@mail.kernel.org>
In-Reply-To: <20260403132811.753894-2-xukuohai@huaweicloud.com>
References: <20260403132811.753894-2-xukuohai@huaweicloud.com>
Subject: Re: [PATCH bpf-next v12 1/5] bpf: Move constants blinding out of arch-specific JITs
From: bot+bpf-ci@kernel.org
To: xukuohai@huaweicloud.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,yonghong.song@linux.dev,puranjay@kernel.org,a.s.protopopov@gmail.com,alexis.lothore@bootlin.com,list+bpf@vahedi.org,linux@armlinux.org.uk,yangtiezhu@loongson.cn,hengqi.chen@gmail.com,johan.almbladh@anyfinetworks.com,paulburton@kernel.org,hbathini@linux.ibm.com,chleroy@kernel.org,naveen@kernel.org,luke.r.nels@gmail.com,xi.wang@gmail.com,bjorn@kernel.org,pulehui@huawei.com,iii@linux.ibm.com,hca@linux.ibm.com,gor@linux.ibm.com,davem@davemloft.net,udknight@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Fri,  3 Apr 2026 14:30:50 +0000 (UTC)
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

--===============2451143287243483675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index a431b7d50e1b..66cef3744fde 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c

[ ... ]

> +static void restore_insn_aux_data(struct bpf_verifier_env *env,
> +				  struct bpf_insn_aux_data *orig_insn_aux)
> +{
> +	/* the expanded elements are zero-filled, so no special handling is required */
> +	vfree(env->insn_aux_data);
> +	env->insn_aux_data = orig_insn_aux;
> +}

[ ... ]

> +out_restore:
> +	restore_subprog_starts(env, orig_subprog_starts);
> +	restore_insn_aux_data(env, orig_insn_aux);
> +	kvfree(orig_subprog_starts);
> +out_free_aux:
> +	kvfree(orig_insn_aux);
> +out_cleanup:
> +	/* cleanup main prog to be interpreted */
> +	prog->jit_requested = 0;
> +	prog->blinding_requested = 0;
> +	return err;

Is there a double-free of env->insn_aux_data on the out_restore path?

restore_insn_aux_data() sets env->insn_aux_data = orig_insn_aux, then
out_restore falls through to out_free_aux which does
kvfree(orig_insn_aux), freeing the just-restored pointer.

Later, bpf_check() cleanup runs:

    clear_insn_aux_data(env, 0, env->prog->len);
    vfree(env->insn_aux_data);

which would be a use-after-free followed by a double-free.

The out_restore path is reached when bpf_jit_blind_constants() or
__jit_subprogs() fails while blinding was active, which can happen
under memory pressure with multi-subprog BPF programs.

It looks like out_restore needs a goto out_cleanup (or similar) after
kvfree(orig_subprog_starts) to skip the out_free_aux label, since after
restoring, orig_insn_aux is owned by env->insn_aux_data and must not be
freed here.

This regression is not fixed by later commits in the series.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/23948799625
--===============2451143287243483675==--

