Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D97D6101A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 14:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwaFZnJXZ9tbB4tE6QA0A66eLbK/LS3r0XweaHSW568=; b=X0dx8jT2JIhbJ/1dsQ3WKKxHY7
	JPFfy6uGdYZ2uz4h1tnLKF3hC67APnKtFxQIkPlfG8X2635ds2Horvei5KuUcPLPwL/yS2w7JGw/b
	w2BpuYGDDISaD+71DIt2h1Zv6leZm5FqVICJPcJxYnP4fbwjGw9SyVuAFUL5y8BPDmEO8sxx8aRvE
	Uo47DzU/kwh47HqiAE0o0fsN829OfyZyz41pw0lfOZS4TNqyDmJmJxscgZi+9p/+ACLA4HZTA/pT7
	ruWOwG3dgPZyZ3+YZaElfStjM89cuzTpr+JE2kBOmMnPqbPu38BOI8H8vMi2fuzmiWjUWPuWyeLed
	LZ4Vcl2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTPn-00000000FYU-1BSW;
	Thu, 29 Jan 2026 14:54:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTPk-00000000FY7-3O8w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 14:54:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6549140E1C;
	Thu, 29 Jan 2026 14:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13CBC4CEF7;
	Thu, 29 Jan 2026 14:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769698471;
	bh=uNTYkn+aM8NuAC+kDwXIL4ebrbnUJ+D01SE35TIEzlg=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=gxHDo6NX5nRoVPa8+7m/YvFTxRfnfZnFrhIXmElFdBc5AUiItxV6L4Q63wJ2+FeEC
	 V+Z9PFwGoAwPzbRjfTPYxEUuAyNmidBkW1Z8dk469nZkkcWdx3nUvjZOKWjjOzVHR/
	 iONRNui3M6OydUVjAxX8L4JMRtgLnwt6fXLTpJE0mvgDcLwC5MWqTEEviGLM4pDwbj
	 WSIxT58z0kgTsLEDQpEFmGV+Q85h1YRrb4PqglT20+yagYQwtd4xVhCzoAoxhlUa3b
	 e3CeLVtuCw49jqWKpFaMDPm0ottx+Fw0x1c4HJa3a4Yo+Q7AZKrbMO4dApwcBiJ1U4
	 OS9cdW+bNYeUg==
Content-Type: multipart/mixed; boundary="===============1026379547978389575=="
MIME-Version: 1.0
Message-Id: <97fd7e67669f887badde4e276fc501a5969ff9dac703a6dccedda386dacd25f1@mail.kernel.org>
In-Reply-To: <20260129142536.48637-2-leon.hwang@linux.dev>
References: <20260129142536.48637-2-leon.hwang@linux.dev>
Subject: Re: [PATCH bpf-next v3 1/3] bpf: Add bpf_jit_supports_fsession()
From: bot+bpf-ci@kernel.org
To: leon.hwang@linux.dev,bpf@vger.kernel.org
Cc: ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,puranjay@kernel.org,xukuohai@huaweicloud.com,catalin.marinas@arm.com,will@kernel.org,shuah@kernel.org,menglong8.dong@gmail.com,leon.hwang@linux.dev,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,linux-kselftest@vger.kernel.org,kernel-patches-bot@fb.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu, 29 Jan 2026 14:54:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_065432_868847_4280BBBD 
X-CRM114-Status: GOOD (  11.81  )
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

--===============1026379547978389575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index e7ff8394e0..6e0693ac72 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -24874,6 +24874,9 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
>  	case BPF_TRACE_FENTRY:
>  	case BPF_TRACE_FEXIT:
>  	case BPF_TRACE_FSESSION:
> +		if (prog->expected_attach_type == BPF_TRACE_FSESSION &&
> +		    !bpf_jit_supports_fsession())
> +			return -EOPNOTSUPP;

This isn't a bug, but other similar bpf_jit_supports_*() checks in
this file include a bpf_log() message before returning an error. For
example:

  bpf_jit_supports_kfunc_call() -> "JIT does not support calling kernel function"
  bpf_jit_supports_exceptions() -> "JIT does not support calling kfunc..."
  bpf_jit_supports_arena()      -> "JIT doesn't support arena"
  bpf_jit_supports_private_stack() -> "Private stack not supported by jit"

Should this check also include a message like "JIT does not support
fsession" for consistency with other similar checks in the verifier?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/21482297342

AI-authorship-score: low
AI-authorship-explanation: The commit demonstrates specific debugging context with actual test output and errno values, correct understanding of kernel BPF conventions, and follows established patterns - typical of experienced human kernel developers.
issues-found: 1
issue-severity-score: low
issue-severity-explanation: Minor consistency issue - missing bpf_log() error message compared to similar checks in the same file; does not affect functionality or stability.

--===============1026379547978389575==--

