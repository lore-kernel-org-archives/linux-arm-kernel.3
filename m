Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654E1F01821
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2v/ibo0LKo1YbvkECC60AmphWGEZbzDiV7DSUJEct6g=; b=YdyWEsyVYRooe0P4OZmg0AjDST
	0ov0vVW3PvSGyj0GuUg+yN5iSjNCQMr5lcyvSUb92SClxFxlVDtbyAIVDaLu59MwXsov0lmQ0qI7W
	2zMTa+6sJWMKGHzQBmr8vEl1OdJFQdm2kI6DPeGTT9fO23xia7PHYIL/ZmxZduDxDNQUh0utFB0Ia
	Br8CcU0fbsaoBhNhMTWA4HTdkeFIy2cerxdqGD/3k+cVYZibOj39N1U4CklQVgGFye9fjYzekBc2I
	EjKSA38ODx0+hKgNmKlmiKIE0ZVN2b96uJob2F3e0Z4sqKFxwy8w79hTfK9uFp1sY0B8P6qXbZ2yT
	0Tvf8IvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySZM-00000003UBa-2deQ;
	Fri, 06 Mar 2026 10:38:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySZK-00000003UBK-3QNh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:38:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8A1E60130;
	Fri,  6 Mar 2026 10:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19ED1C2BCAF;
	Fri,  6 Mar 2026 10:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772793485;
	bh=JXQcaGq9fREW7V4MaPDiovNi/xMtD05r3fDs02EK3as=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=pFd3z64lmp2CrxfWzQeXzC0qVSTEF+FvEAbfwayrpT5FR+GDKRDeoRS69g/VzNV+7
	 6PfPWUrEphNMHsCEKiYqvzxwgQvyYXVgDtq70vDPmwktAF/20FBCDscJCSPdPbM3ED
	 z48R6XzU/VsPRqDvR/6XLWYElJZxFF+Dx9WC3Hqz1guRCaEMYxoymI7d8ftwU64WWD
	 UTnphwC09Q8AeCWND6BNpiB493RbrjkPS8YVEImhtyf630kjVGZKADgOzNRwhnU2uN
	 kZUA4dy5Cd8QNwnSggUR/6nU6btRahdB3XgJS0JlbIRtkmHZxlYbTpLZOfsPYJLm+b
	 wc40I58ABbKtg==
Content-Type: multipart/mixed; boundary="===============4728792340798176958=="
MIME-Version: 1.0
Message-Id: <48167f373db21bc7817e4e69b8be017c5c0a26bc54b8dd30206dd1b0ebc3a944@mail.kernel.org>
In-Reply-To: <20260306102329.2056216-2-xukuohai@huaweicloud.com>
References: <20260306102329.2056216-2-xukuohai@huaweicloud.com>
Subject: Re: [bpf-next v6 1/5] bpf: Move constants blinding from JIT to verifier
From: bot+bpf-ci@kernel.org
To: xukuohai@huaweicloud.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,yonghong.song@linux.dev,puranjay@kernel.org,a.s.protopopov@gmail.com,list+bpf@vahedi.org,linux@armlinux.org.uk,yangtiezhu@loongson.cn,hengqi.chen@gmail.com,johan.almbladh@anyfinetworks.com,paulburton@kernel.org,hbathini@linux.ibm.com,chleroy@kernel.org,naveen@kernel.org,luke.r.nels@gmail.com,xi.wang@gmail.com,bjorn@kernel.org,pulehui@huawei.com,iii@linux.ibm.com,hca@linux.ibm.com,gor@linux.ibm.com,davem@davemloft.net,udknight@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Fri,  6 Mar 2026 10:38:05 +0000 (UTC)
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

--===============4728792340798176958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index adf84962d579..c5ed9d84c3ae 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c

[ ... ]

> @@ -2201,7 +2170,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  		if (WARN_ON(bpf_jit_binary_pack_finalize(ro_header, header))) {
>  			/* ro_header has been freed */
>  			ro_header = NULL;
> -			prog = orig_prog;
>  			goto out_off;
>  		}

With the orig_prog fallback removed, if bpf_jit_binary_pack_finalize()
fails on the extra pass, prog->bpf_func and prog->jited still hold
the values set during the first pass. At that point ro_header has been
freed, so bpf_func points to freed memory.

In jit_subprogs() the second loop checks:

    old_bpf_func = func[i]->bpf_func;
    tmp = bpf_int_jit_compile(func[i]);
    if (tmp != func[i] || func[i]->bpf_func != old_bpf_func) {

Since bpf_func is unchanged, this does not detect the failure. The
program continues with jited=1 and a stale bpf_func.

The powerpc and riscv JITs handle this correctly in the same commit:

arch/riscv/net/bpf_jit_core.c:bpf_int_jit_compile():

    if (WARN_ON(bpf_jit_binary_pack_finalize(...))) {
            jit_data->ro_header = NULL;
            prog->bpf_func = NULL;
            prog->jited = 0;
            prog->jited_len = 0;
            goto out_offset;
    }

Should the arm64 path also clear bpf_func, jited, and jited_len here
to match?

> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 3bd89f55960d..3a5cc3e88424 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c

[ ... ]

> @@ -2041,7 +2014,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  		if (WARN_ON(bpf_jit_binary_pack_finalize(ro_header, header))) {
>  			/* ro_header has been freed */
>  			ro_header = NULL;
> -			prog = orig_prog;
>  			goto out_free;
>  		}

Same issue as arm64 above. The loongarch JIT also sets prog->jited and
prog->bpf_func before finalize, and the failure path does not clear
them. Would it make sense to add the same clearing here as well?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22758822985
--===============4728792340798176958==--

