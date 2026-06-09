Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888A2CD8CAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjDdX3vciOF19PxithdDPrRHmvsQu1FVpC/1SU6RqHs=; b=036H/gftw9/R5BGhNxkMrvPQCv
	mtgS7POh0AhN7Z42EJ4Ln/+yQY0zSQeUmN2t4X9HbGiRMFkqtbInfE7Lcck6tLns1l42lglRbgKMW
	w8RfWuchnl2iGzUbzyb2Z4srpyAzqDvsgthCwpyfEbq7QmyaR/t+8l3NvuBhEq/LYxZzRwqx6ebZ5
	LQyqSdCgwV0xntQ4kYbpou78zzM2ONPLx/8sS2ZueQ3AbLb1DN4eVa8RIAYeNDBP0YMMIfiZnVlmm
	YYAYiP3zVj3deAcD0G3awmAVId/uqTHasvtVXrFDWr9CBrnYz053tpGUnIiEtT744ibzpREMr5GJ/
	ZBQa2Stw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWs7o-000000056OY-0Bng;
	Tue, 09 Jun 2026 08:47:56 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWs7l-000000056Nt-2f72
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:47:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7FCF51A060D;
	Tue,  9 Jun 2026 08:47:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4810A5FFC1;
	Tue,  9 Jun 2026 08:47:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4163106A2AC4;
	Tue,  9 Jun 2026 10:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780994866; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YjDdX3vciOF19PxithdDPrRHmvsQu1FVpC/1SU6RqHs=;
	b=ISpERdkX3duCHiXejPbFzvffW7F4yI9mZSAqibAXZRDOS5dhq7ubqMdN+moqHgxnQLg9Jx
	hwdzoXVU1SAANvZTq6vsCFH6SkPou/QuDLszyJnJGCnVdeB6K3ZueYWLl1rzgLpgfeOnUV
	nCRWeqc0nVSwoMk2hh6S8OrKQu7NyzzNmyugGBsRatDQur+H+PxeD2mxojrJg1SYJxPM+i
	Zt3uw97k9gKDSFAAyoOXMWF4HRHbS68V71sngePYfbVIzefB5XUJKKlmT7rgb7EyJnHVEJ
	CD3h8BarmuhxOLzK2tLJGvI+HiyjkzyCcgYZ3BAbGUrsuN2M3YepKtLuaqcrWA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 10:47:36 +0200
Message-Id: <DJ4DZHRVAV59.SPVM2QDQN0C@bootlin.com>
Cc: <ebpf@linuxfoundation.org>, <bastien.curutchet@bootlin.com>,
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <martin.lau@kernel.org>,
 <clm@meta.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <bot+bpf-ci@kernel.org>, <alexis.lothore@bootlin.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <john.fastabend@gmail.com>,
 <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
 <shuah@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf-next v2 2/8] bpf: add BPF_JIT_KASAN for KASAN
 instrumentation of JITed programs
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260604-kasan-v2-2-c066e627fda8@bootlin.com>
 <1e7ab52954b9ff584d6871c2ec234a7155b577f29128564d0d597809cafad826@mail.kernel.org>
In-Reply-To: <1e7ab52954b9ff584d6871c2ec234a7155b577f29128564d0d597809cafad826@mail.kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_014753_812275_85FFFFD0 
X-CRM114-Status: GOOD (  16.94  )
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

On Thu Jun 4, 2026 at 11:13 PM CEST, bot+bpf-ci wrote:
>> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
>> index eb3de35734f0..a8e004f88b92 100644
>> --- a/kernel/bpf/Kconfig
>> +++ b/kernel/bpf/Kconfig
>
> [ ... ]
>
>> @@ -101,4 +105,9 @@ config BPF_LSM
>>
>>  	  If you are unsure how to answer this question, answer N.
>>
>> +config BPF_JIT_KASAN
>> +	bool
>> +	depends on HAVE_EBPF_JIT_KASAN
>> +	default y if BPF_JIT && KASAN_GENERIC && KASAN_VMALLOC && VMAP_STACK
>> +
>>  endmenu # "BPF subsystem"
>
> This isn't a bug, but a design concern raised on an earlier posting of
> this work doesn't look fully resolved.
>
> In the v1 (RFC) discussion, the suggestion was to not add a config knob
> at all and instead do the instrumentation inside the JIT whenever
> KASAN_GENERIC is set:
>
>   "Let's not add more config knobs. Even this patch looks redundant.
>    Inside JIT do instrumentation when KASAN_GENERIC is set."
>
>   https://lore.kernel.org/bpf/CAADnVQLj=3DUosnsC-4V2+mN92Fe0-kW++U+m-O9c9=
3kk6BwiXgw@mail.gmail.com/
>
> The reasoning given for keeping the internal Kconfig was that it lets
> selftests adapt their behavior without sprinkling arch and KASAN
> conditionals, and another reviewer agreed that approach was reasonable.
>
> That "this patch looks redundant" objection was never explicitly
> retracted or re-acked, yet the BPF_JIT_KASAN config is retained here.
>
> Has this design point been settled?

I still advocate to keep this BPF_JIT_KASAN, which is used later in
patch 7/8 to check whether kasan tests should be executed or not.

Alexis
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/269783=
80520




--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


