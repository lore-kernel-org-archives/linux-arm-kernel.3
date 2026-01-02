Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2542FA3729
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 15:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9XrpT/II9J7gpNVR31dLqWVwWAIyIdhjOJQcj/HGRo=; b=KAeuXqNTZhOKElk5eBqMrk3flq
	uRMWkUImPhVE3OJ3upKA6WyPYxlWqkBg99W+61pss2vTPqjmzGwoXeccg9EPmsz5RUd16ZwgCW+IB
	w4TeLOmmBFdUfxlKlrgIibC8NR7N/+zfau5ZpLeaboDKADMtdR/B9vWKgFJvdOtcwdPeY2eJ9BCGS
	3W9rP1lSDrscJZQUWnDqXVRZ/fRE2Y+LZ62X4HwzWDR2MKW8CBkOEXCRWF3VlcpsQHP3SX8Xd9Ic4
	5C9C2YIAaroq1OR8DqC4p5+zfmV3CGuWsdW1BAMq6rddXT37m0QBrudkpJ81q5ThsWbsRhuueM+Mz
	YOQZVTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgxl-00000008QOY-0oEv;
	Fri, 02 Jan 2026 15:21:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgxj-00000008QOG-3kez
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 15:21:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A9B460017;
	Fri,  2 Jan 2026 15:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27EDC116B1;
	Fri,  2 Jan 2026 15:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767367270;
	bh=pMXCQW12wPyvlfidixRLtglysi2HvG9+Wl6UmWXVbTA=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=ZDb6Smp5r1qwHf5O207uvXnwSlFpojpN3A/HXVReK3KkTSOxHLxMEQ/j2WMrJuMiy
	 n+Zei+fXQ07vbkh2w7l57kLDGDVkAeR46Dxkc61yPQ1a/8ihN8C76oCCwF9x8HepVZ
	 lrScZ1Ro6BJO/3boeJ3Zfpg0U/krYZ3Y4R78M7TaEBgQoRPoNVQcDjjKE7TfMC5RXj
	 MQxgeoAB5KWO0fw+Ml+h6bQJYmD+GlqbxArV4vrHdv06E5tkyYP5JCeiEUfinYrtBF
	 weDu5tMwWpipFifeMpWkwFz63wZSAevA5pxIRchyKKGVaenyfmrg2KpYDV+FLjYZUb
	 c8qh6H96DdwnA==
Content-Type: multipart/mixed; boundary="===============7827669722571794812=="
MIME-Version: 1.0
Message-Id: <45f1e1978b7dc28e522dcc0a72954d892b37a85220749bd027c7395edb01d991@mail.kernel.org>
In-Reply-To: <20260102150032.53106-2-leon.hwang@linux.dev>
References: <20260102150032.53106-2-leon.hwang@linux.dev>
Subject: Re: [PATCH bpf-next 1/4] bpf: tailcall: Introduce bpf_arch_tail_call_prologue_offset
From: bot+bpf-ci@kernel.org
To: leon.hwang@linux.dev,bpf@vger.kernel.org
Cc: ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,puranjay@kernel.org,xukuohai@huaweicloud.com,catalin.marinas@arm.com,will@kernel.org,davem@davemloft.net,dsahern@kernel.org,tglx@linutronix.de,mingo@redhat.com,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,hpa@zytor.com,akpm@linux-foundation.org,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,netdev@vger.kernel.org,kernel-patches-bot@fb.com,leon.hwang@linux.dev,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Fri,  2 Jan 2026 15:21:09 +0000 (UTC)
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

--===============7827669722571794812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/arraymap.c b/kernel/bpf/arraymap.c
> index 1eeb31c5b317..beedd1281c22 100644
> --- a/kernel/bpf/arraymap.c
> +++ b/kernel/bpf/arraymap.c
> @@ -127,6 +127,9 @@ static struct bpf_map *array_map_alloc(union bpf_attr *attr)
>  			array_size += (u64) max_entries * elem_size;
>  		}
>  	}
> +	if (attr->map_type == BPF_MAP_TYPE_PROG_ARRAY && bpf_arch_tail_call_prologue_offset())
> +		/* Store tailcall targets */
> +		array_size += (u64) max_entries * sizeof(void *);

Should array_map_mem_usage() also account for this additional space?
Currently array_map_mem_usage() handles special cases for percpu arrays
and mmapable arrays, but has no corresponding check for PROG_ARRAY maps
when bpf_arch_tail_call_prologue_offset() is non-zero. This would cause
the reported memory usage to be lower than the actual allocation when
an architecture implements this function (e.g., x86_64 and arm64 in the
subsequent patches of this series).

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/20660615603

--===============7827669722571794812==--

