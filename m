Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50207C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LsK2MXDRjynXM+7CGVIwb6k4vRvdO+pgdIiKPk0znQ=; b=S3AVP7sYR/x2MM1DBGOkdhcvZF
	yaujBz+3DGnz/l8kQAtxh92m1Et3X1VHEIcVxuYEUH0xFwg2iTkdXPrt7Xlr2HA1CWJk6J5epAuC5
	TgXv1ScOW0q8VCJYt1dYwhy5eYHoolLSY2sIqIYyivMG6wCC0Eg97qZN/iwQal7xVmucqlGHzRvaK
	/AfkRtxdY/jBJZm0w2HL7jS/yFOeKa8OTBKA/3Pv/MaCJhXyOF1jjs5QGE1G1xoopud3fXdTX4Lc7
	6kaI2pbYajQ+q5eFTP37OQ0AkWkhuLNCTPjZbeS3jb8tXv6J4f/t5a1QlwB0vaVPOlgLhlYg2dXA2
	Ozz9snuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OzT-00000001LCh-0KbR;
	Fri, 04 Sep 2026 08:09:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OzS-00000001LCS-0rOo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:09:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C9CE41370;
	Fri,  4 Sep 2026 08:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AEB1F00A3D;
	Fri,  4 Sep 2026 08:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788509377;
	bh=9LsK2MXDRjynXM+7CGVIwb6k4vRvdO+pgdIiKPk0znQ=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=HKnVJEYqZolyWQKkgqlul1DlzdlHmRsuzib4zRWUqfnZUjZxzo9zwHgZP+HGRXKGJ
	 v2mmnn/FlVKEngmmef/Bx7TfCaTF0Y2tj65GT/jtcFrosLrz6vfRYqzL5EIGOiXolI
	 ISkY7g9vuAf1cOFE6d2OhFS0nUZxvIEmRh3XwD4nNnEEMLgJmvW7vX+3xayBYf/rsy
	 CV8t4ZOvBUmHbUoMSwt36JJZFZaDZuGBLiJasVA1fxSADyBULdx4xcbviwjkkVQRAv
	 z34gDm7JLu+lYYBJSADKd5Fxp5mc17V8u+CU37puJ3S1KBcXGPahKEaJ+fj1PcbdV1
	 EyZMww7tldMxw==
Content-Type: multipart/mixed; boundary="===============7487938568132425462=="
MIME-Version: 1.0
Message-Id: <6aec8f5c91db3edfd8becf6f41bcb33fda2cbea1bb894888cbcdab4579b0f086@mail.kernel.org>
In-Reply-To: <20260904070210.4163193-3-donggeunyoo.kernel@gmail.com>
References: <20260904070210.4163193-3-donggeunyoo.kernel@gmail.com>
Subject: Re: [PATCH bpf 2/2] selftests/bpf: cover the exception callback using its own BPF stack
From: bot+bpf-ci@kernel.org
To: donggeunyoo.kernel@gmail.com,ast@kernel.org,andrii@kernel.org,catalin.marinas@arm.com,daniel@iogearbox.net,eddyz87@gmail.com,emil@etsalapatis.com,ihor.solodrai@linux.dev,jolsa@kernel.org,memxor@gmail.com,mark.rutland@arm.com,martin.lau@linux.dev,puranjay@kernel.org,shuah@kernel.org,song@kernel.org,will@kernel.org,xukuohai@huaweicloud.com,yonghong.song@linux.dev
Cc: bpf@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,linux-kselftest@vger.kernel.org,xukuohai@huawei.com,donggeunyoo.kernel@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Fri,  4 Sep 2026 08:09:36 +0000 (UTC)
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

--===============7487938568132425462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/tools/testing/selftests/bpf/progs/exceptions.c b/tools/testing/selftests/bpf/progs/exceptions.c
> index c8d716fbd4191..cac4e082139a7 100644
> --- a/tools/testing/selftests/bpf/progs/exceptions.c
> +++ b/tools/testing/selftests/bpf/progs/exceptions.c
> @@ -212,6 +212,35 @@ int exception_throw_subprog(struct __sk_buff *ctx)
>  	return 0;
>  }
>
> +__u64 exception_cb_stack_src = 0x1234;
> +
> +/* The address handed to the helper has to be this callback's own stack
> + * slot, not one from a frame that is already gone.
> + */
> +__noinline int exception_cb_stack(u64 cookie)
> +{
> +	volatile __u64 val = 0xdead;
> +
> +	bpf_probe_read_kernel((void *)&val, sizeof(val), &exception_cb_stack_src);
> +	return val;
> +}
> +
> +/* Throws from a subprogram that has a stack of its own. */
> +__noinline static int throwing_subprog_stack(struct __sk_buff *ctx)
> +{
> +	volatile __u64 pad[4] = {};

This isn't a bug, but would 'u64' fit the surrounding declarations in this
file a little better than '__u64' for the three new locals/globals?
Looking at the rest of progs/exceptions.c, every other scalar declaration
uses the short kernel spelling: 'static __noinline int static_func(u64 i)',
'__noinline int exception_cb_mod(u64 cookie)', 'volatile u64 cookie = c;',
and 'u64 time = bpf_ktime_get_ns();'. The new code at lines 215, 222, and
231 is the only place in the file that switches to the '__u64' spelling,
and it sits directly next to 'exception_cb_stack(u64 cookie)' which uses
the other form in the same signature.

> +
> +	bpf_throw(pad[0]);
> +	return 0;
> +}
> +
> +SEC("tc")
> +__exception_cb(exception_cb_stack)
> +int exception_throw_subprog_stack_cb(struct __sk_buff *ctx)
> +{
> +	return throwing_subprog_stack(ctx);
> +}
> +


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33848479344
--===============7487938568132425462==--

