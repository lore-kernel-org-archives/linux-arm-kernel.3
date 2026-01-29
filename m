Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939F8D6101A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 15:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVbbNBM8h2hLry9+PjA9Xnf//1plR69ceWUdZQzpcN8=; b=glzzS6QO8jPgomfd48PkTQWnoF
	2LhqvCCWXWvaTqEoS9HhzMCvP9S2nz/DHuP1wiOJ9zUcPR8TeHfz1BDPr0C+M4znKjIrJE2f8FBRI
	zSqDPch67hR0cvWOF69voW8yDiN0BFzWSw5d7n+9TwCTSaPQ9UUYCboOHhZ9Wu1I4edsRCf1y1JTR
	lbaqSL87u39+KRWO0qbPVrXjwNNGmUSk0KIKL8Mb02skzjxS1bPo74fcftpl5O/CYVadcUO6O8MeM
	AFyYbma6afg0yyT8JdPJcvUZotiKrTgJ5hhOdjB/RF3xRRkIMLcRiE00hiU3DxhvjvlrJKU59fuqs
	PGwJupaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTo7-00000000H1J-2u0m;
	Thu, 29 Jan 2026 15:19:43 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTo4-00000000H06-1VZQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 15:19:41 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769699974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DVbbNBM8h2hLry9+PjA9Xnf//1plR69ceWUdZQzpcN8=;
	b=OUq4eMJc8eAdZ74vls9q8VxZhtpQjlW71HAqe06bfYZVmfblin6PvTAr9ovnnwAOqy2SHM
	24swlbe1CfBBQ96jm4P6At9i0DMhjw3nRRxbO665shByg8zcgEDx90niAclRdqcXz0KwLW
	/Khir5oloAjBwkPM0mh1F9tQ6FLJ5xo=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 23:19:19 +0800
Message-Id: <DG16A1T5EJWO.D9L79G1ZE8H9@linux.dev>
Cc: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <martin.lau@linux.dev>, <eddyz87@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <john.fastabend@gmail.com>,
 <kpsingh@kernel.org>, <sdf@fomichev.me>, <haoluo@google.com>,
 <jolsa@kernel.org>, <puranjay@kernel.org>, <xukuohai@huaweicloud.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
 <menglong8.dong@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kernel-patches-bot@fb.com>, <martin.lau@kernel.org>, <clm@meta.com>,
 <ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf-next v3 1/3] bpf: Add bpf_jit_supports_fsession()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Leon Hwang" <leon.hwang@linux.dev>
To: <bot+bpf-ci@kernel.org>, <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
References: <20260129142536.48637-2-leon.hwang@linux.dev>
 <97fd7e67669f887badde4e276fc501a5969ff9dac703a6dccedda386dacd25f1@mail.kernel.org>
In-Reply-To: <97fd7e67669f887badde4e276fc501a5969ff9dac703a6dccedda386dacd25f1@mail.kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_071940_537094_CF571B57 
X-CRM114-Status: GOOD (  12.38  )
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

On Thu Jan 29, 2026 at 10:54 PM +08, bot+bpf-ci wrote:
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index e7ff8394e0..6e0693ac72 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -24874,6 +24874,9 @@ int bpf_check_attach_target(struct bpf_verifier_=
log *log,
>>  	case BPF_TRACE_FENTRY:
>>  	case BPF_TRACE_FEXIT:
>>  	case BPF_TRACE_FSESSION:
>> +		if (prog->expected_attach_type =3D=3D BPF_TRACE_FSESSION &&
>> +		    !bpf_jit_supports_fsession())
>> +			return -EOPNOTSUPP;
>
> This isn't a bug, but other similar bpf_jit_supports_*() checks in
> this file include a bpf_log() message before returning an error. For
> example:
>
>   bpf_jit_supports_kfunc_call() -> "JIT does not support calling kernel f=
unction"
>   bpf_jit_supports_exceptions() -> "JIT does not support calling kfunc...=
"
>   bpf_jit_supports_arena()      -> "JIT doesn't support arena"
>   bpf_jit_supports_private_stack() -> "Private stack not supported by jit=
"
>
> Should this check also include a message like "JIT does not support
> fsession" for consistency with other similar checks in the verifier?
>

That makes sense.

Let me add the log message.

Thanks,
Leon


>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/214822=
97342
>
> AI-authorship-score: low
> AI-authorship-explanation: The commit demonstrates specific debugging con=
text with actual test output and errno values, correct understanding of ker=
nel BPF conventions, and follows established patterns - typical of experien=
ced human kernel developers.
> issues-found: 1
> issue-severity-score: low
> issue-severity-explanation: Minor consistency issue - missing bpf_log() e=
rror message compared to similar checks in the same file; does not affect f=
unctionality or stability.

