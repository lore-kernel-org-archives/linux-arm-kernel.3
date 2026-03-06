Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4754AFCB602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oY3HvfuQ2RPcpRJL8Bg0JpB6bpNegh/Tuy/J+23nZ7U=; b=Ps5lhS1aXw7pfH+A4rLDdWRUH8
	tv46ZOTxg159fmie7fAgHwQJQ4UwJtdLa1ml4Zpw1qFpuOqf3qBbP+Lirb9MuEWxWRm6sFS3LYPYR
	Mp2hB3LO16NaT+24PW+xKtYD39DIQoTeeFT/DhOpDFAqVUTHSOO49GRJOhkyiaTZOGdCFAqzJzCtN
	OzVHMSmyWmtpx+3M3+ehg8mXrcKHLHNVGKPooE9QN/B7zEZjv07RozOpny6fdZ0xbVCNEP1VluYqM
	ygrg2YlWlI9Qi98rD82DsuiVrpwuIgnMnoqmM75Go3nvk5o71i87pAo4WQOan4iYvpqu5eVtjbIs/
	/3ZDwf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeC2-00000004c65-2Tvs;
	Fri, 06 Mar 2026 23:02:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeC1-00000004c5y-1waI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:02:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87EE260053;
	Fri,  6 Mar 2026 23:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D6CC4CEF7;
	Fri,  6 Mar 2026 23:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772838168;
	bh=CPm6T4ngaXYOLjs5YXkxj5Gxxl3TQtrotGCBz2iSPl0=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=XETr91dqPueusDckBKZsTB6ffl5LmLpXbyvgD/o1pVUldI6H7laXlE3gpv2/wH0GZ
	 99DsHeHormRbbW7aAg3fb+DH4DmgblFueJJJdvclrgCFXKaRa1hR+YZ28W58mOrJ8Q
	 6duam+bKs/o6rmPyFQAX6YE/z5nwFaokFQknmK+Sf10b7wJBPyFC13klr5TsE7TE7F
	 gBn+lnRFO6S4GOLe+HFAePe8zKHMraZEbticMfJM+97Hc+IKDOzsghU8VvXSrBN1WU
	 O3O0gltv95+9pKuehgIN6leVJvQVZ8OrjNqryVqY+ijP3DymDK/JGl1NG1cCw9+Faq
	 L0ORzlS9ieMrg==
Content-Type: multipart/mixed; boundary="===============4119359952923694821=="
MIME-Version: 1.0
Message-Id: <f4c177fb8f90a85b0b47de382630947ca8ac2d04febc56c7b8698041050355d3@mail.kernel.org>
In-Reply-To: <20260306221330.630971-3-yeoreum.yun@arm.com>
References: <20260306221330.630971-3-yeoreum.yun@arm.com>
Subject: Re: [PATCH 2/3] bpf: introduce bpf_jit_insn_aux_data
From: bot+bpf-ci@kernel.org
To: yeoreum.yun@arm.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org,daniel@iogearbox.net,john.fastabend@gmail.com,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,song@kernel.org,yonghong.song@linux.dev,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,puranjay@kernel.org,xukuohai@huaweicloud.com,catalin.marinas@arm.com,will@kernel.org,richardcochran@gmail.com,a.s.protopopov@gmail.com,yeoreum.yun@arm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Fri,  6 Mar 2026 23:02:47 +0000 (UTC)
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

--===============4119359952923694821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index d4a73a34c46b..68152dbe9a24 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c

[ ... ]

> @@ -23020,6 +23026,9 @@ static int jit_subprogs(struct bpf_verifier_env *env)
>  	for (i = 0; i < env->subprog_cnt; i++) {
>  		func[i]->aux->used_maps = NULL;
>  		func[i]->aux->used_map_cnt = 0;
> +		func[i]->aux->insn_aux_data = NULL;
> +		kvfree(func[i]->aux->insn_aux_data);
> +		func[i]->aux->insn_aux_data = NULL;
>  	}

Does this leak insn_aux_data for every subprog on the success path?
The pointer is set to NULL before kvfree() is called, so kvfree()
receives NULL and the allocated memory is never freed.

The error path (out_free) has the correct ordering:

>  		if (func[i]->aux->insn_aux_data) {
>  			kvfree(func[i]->aux->insn_aux_data);
>  			func[i]->aux->insn_aux_data = NULL;;
>  		}

It looks like the success path should match:

		kvfree(func[i]->aux->insn_aux_data);
		func[i]->aux->insn_aux_data = NULL;

Neither __bpf_prog_free() nor bpf_prog_free_deferred() free
insn_aux_data, so this would be a permanent leak for every
successfully JITed BPF program with multiple subprogs.

Also, there is a double semicolon on the NULL assignment in the
error path above.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22784798570
--===============4119359952923694821==--

