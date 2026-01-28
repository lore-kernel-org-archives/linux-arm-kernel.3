Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEACD3F074
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJ4n+NXIY+oZEFmVd1tUCGIJY9ggBnwP+N5VboY0b68=; b=V9U0q51Cy/u62soRlsi/xVqXrg
	0rkb7jF+C6q7DQ9wa2Zmi9WQ2Uu1WApPIysvpGYjJG3rAwZuaV6FYFQmpYKNwUyvGgq+Et9mV/2YU
	OXGA+9is8CQaMAFsEPZGCQDO/IOrQN3bVY0K3ICtWfEbeXAjO3p64KOxypnjmMVSFYFX8uO7K2GWH
	MuX2HT153Ag8X2Ww5FWiJN+J7r2X/3UHzMFmAII78yBcIchSPIzEYKKqBIk9AFqr139tfoXs0DhuF
	HLsUqf5nl8UdCWU5WBP0mJty1QG69fMLeEb2+QwjrRSl1fpbc85YsF3IBWbwEVHz2esGg6bunzusQ
	3l/Inw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7RI-0000000GHFA-2LBb;
	Wed, 28 Jan 2026 15:26:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7RG-0000000GHEW-2hUd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:26:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B615E6000A;
	Wed, 28 Jan 2026 15:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A0AC4CEF1;
	Wed, 28 Jan 2026 15:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769613997;
	bh=+x2W09IBIk3INSEl7OwPB86JYpVGAaj9EY3AYr7fB1I=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=e8I+aIISjFUOTCo8UMRVcezinf0WvfCFN3QhWeGtJKpm6q5u4f2nXrJkOUr3F+MBl
	 dCHVC2Ml8fOlSV+tX4TzIS0MPvuN46tLkSfgMCmgMEyQHdTxvemzRG6K6l3NsR0/8d
	 mYJOhpVDe1CY+VzlX/yRZC+TWmeSFwzbypgMqLp1InAE2A4uQQN6WRF78fVXZhtRjJ
	 CS/rFpxgBdS3oSlN55yez6S7OTr5K0MI+tUXhWYGGDG3pLyt9OHJmtVT526VVkxeOY
	 VKbBRWTcYcu3FGezFYGsCsMpJAPjDMDkNxumHyE36JZLuiFuPzblciF+RceZxorr7B
	 rQrz5AAuoxnTg==
Content-Type: multipart/mixed; boundary="===============5864326751367574456=="
MIME-Version: 1.0
Message-Id: <e64c4137e7f262e6fdab272e8ee44c8a129a36eb6d0186914375d6ba20d88474@mail.kernel.org>
In-Reply-To: <20260128150112.8873-2-leon.hwang@linux.dev>
References: <20260128150112.8873-2-leon.hwang@linux.dev>
Subject: Re: [PATCH bpf-next v2 1/3] bpf: Add bpf_arch_supports_fsession()
From: bot+bpf-ci@kernel.org
To: leon.hwang@linux.dev,bpf@vger.kernel.org
Cc: ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,puranjay@kernel.org,xukuohai@huaweicloud.com,catalin.marinas@arm.com,will@kernel.org,shuah@kernel.org,menglong8.dong@gmail.com,leon.hwang@linux.dev,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,linux-kselftest@vger.kernel.org,kernel-patches-bot@fb.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Wed, 28 Jan 2026 15:26:36 +0000 (UTC)
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

--===============5864326751367574456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 5a075e06cf..070ba80e39 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -4112,3 +4112,8 @@ bool bpf_jit_supports_timed_may_goto(void)
>  {
>  	return true;
>  }
> +
> +bool bpf_jit_supports_fsession(void)
       ^^^^^^^^^^^^^^^^^^^^^^^^^^
This is the actual function name in the code.

> +{
> +	return true;
> +}

[ ... ]

> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index e0b8a8a5aa..3b1eb632bf 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -3142,6 +3142,11 @@ bool __weak bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
>  	return false;
>  }
> +
> +bool __weak bpf_jit_supports_fsession(void)
> +{
> +	return false;
> +}


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/21443677441

AI-authorship-score: low
AI-authorship-explanation: The naming inconsistency between commit message and code suggests a human renaming the function during development without updating the commit message, not AI-generated content.
issues-found: 1
issue-severity-score: low
issue-severity-explanation: Documentation-only issue - commit message function name does not match actual code, which may confuse future code archaeology but has no runtime impact.

--===============5864326751367574456==--

