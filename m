Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0842CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JV3EIWDWySQZcxrb8pQzc3tm/Lck3sm4Zs9zoMzr9xQ=; b=BEXkmcH3WnmaBA6xIrENsg+L1c
	mn0dRZYB9cJlVMXmGBKGamHJf2y4cd6l2jDqwQOxhpXohFTbF9awzQI17eMrVcREshKxBheeq/wYF
	LRMjnQY0SBovCtSobRQssEOJNjisy4Nhe45igmwNgAVt+9VC17qNMVSxShFtKFRCbqC+V+NuiONMt
	n8i8jB37DBwhrpv8DS/7K10KCZfLLfWnRkHPOuMacgm8uT+BmIj63QSO4K5lzJooiNdnHqMp3O0DC
	1Rf2v7tbgAb1DfaLIgboEaZaJdTkoBKrpFwqS7v/huUPtjx0wzOG90Qe86ZjZhyyrkk6l4wCba1VY
	P/SFCQlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShlp-00000006NX7-1GeR;
	Thu, 28 May 2026 20:56:01 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShll-00000006NWA-3VNl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:55:59 +0000
Message-ID: <a81c1628-685e-42dc-9860-8c8ed507328f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780001753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JV3EIWDWySQZcxrb8pQzc3tm/Lck3sm4Zs9zoMzr9xQ=;
	b=qVqIsAvQglegZFfayfKEMzAzl6SkxVK0ShNflUelX4PkfKwlJqMqaIb/qEhNIX79y1qifl
	pR/3USsL6xoY1boiyrBe3aH5SKfRhUdQWwB6dIEdJRTZ5+10ACTS91rtwhmnqGDCTBn7gD
	ltjzhGgG2YLGxjWNAefuOW7koYuDnvg=
Date: Thu, 28 May 2026 13:55:43 -0700
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Use at least 10 args in stack
 argument tests
Content-Language: en-GB
To: Puranjay Mohan <puranjay@kernel.org>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Song Liu <song@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20260528161750.1900674-1-puranjay@kernel.org>
 <20260528161750.1900674-3-puranjay@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260528161750.1900674-3-puranjay@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_135558_216191_8BB35869 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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



On 5/28/26 9:17 AM, Puranjay Mohan wrote:
> On arm64, the first 8 arguments are passed in registers (x0-x7), so
> tests with 8 or fewer arguments never exercise the native stack argument
> path in the JIT. Increase argument counts to at least 10 across all
> BPF-to-BPF subprog and kfunc stack argument tests so that at least 2
> arguments land on the arm64 stack.
>
> For the two-callees test, bump foo1 from 8 to 10 and foo2 from 10 to 12
> args to preserve the different-stack-depth flavor of the test.
>
> The bpf_kfunc_call_stack_arg_mem kfunc is left unchanged at 7 args to
> avoid breaking the precision backtracking test which relies on hardcoded
> verifier log instruction indices.
>
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

Acked-by: Yonghong Song <yonghong.song@linux.dev>


