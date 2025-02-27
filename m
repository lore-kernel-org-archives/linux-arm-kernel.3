Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75324C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZhNgcCn5cZnUuzeMSL8VZ2F71Q+VzQTBJcd0+1+j1o=; b=FFgwIgVM24XsYe6SCsf30bs2jg
	p2Rv7qzfc7PsAsr+5l2Gx9x9ozldgc+sReBferEYYV5Wmsh9a+zzDFXoAoBkqzbqfz5jtT28u3Z+z
	AYIQjgDLc6IhStC6mt1yiwBdN5VTWQReoDOpUHp11C2NXEX1/tQeTOk+i9GS0XxXhE5SkYkFnV7Yl
	3eL6S5hwSSbNv+pp9hpQ+egdD//oMpVsBNYTSIC7QKhzaL0rQZmx2eQYeIkYJsQSQqL1UYOET8L0n
	nJ126CRgUH7SDI/N8YKTPRHrn99jlCZwhhA0n0vDlgNix5EjYV5t1ahwkurHKp/kLMjuFkwNUVjki
	rl9FPLTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjj9-00000008Xbs-2uU8;
	Thu, 27 Feb 2025 19:39:23 +0000
Received: from mx-rz-1.rrze.uni-erlangen.de ([131.188.11.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngQk-000000080cA-0iOL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 16:08:12 +0000
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Z3bpb3VrFz8srK;
	Thu, 27 Feb 2025 17:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1740672471; bh=1ZhNgcCn5cZnUuzeMSL8VZ2F71Q+VzQTBJcd0+1+j1o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From:To:CC:
	 Subject;
	b=bBnWSgf2rQDw0eQmbPQOGBqE+dif5J/EtcnklD8jOSWYiNFw53zbUkG0Zna5udkgL
	 C2Q/GiKEq6PNkyCJRReUGY6xiCVFlSp7c3rDGGhXljMuB6RO8u8GR5PH1SgYFPEIQW
	 rpMk0HV4yPJvu9GMfVfd/zErRXXE8M6DMTii+rC2h6MJyZa4/w+p9/pboVf19pYfQx
	 c0S0b7pUbQ/pQiYh7Qzs8dDgOjHuspheIfC5qzZ2SHs7eNHCgGiLEVEeV6oolqCmqM
	 ziDFbYCl7vIgXdnPFLribmG6A2OY0BwyiuzRWcqhCHtU4H3TMcTouCeRzQkIvIBQva
	 Er4gB2fFkIkdw==
X-Virus-Scanned: amavisd-new at boeck4.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 91.57.235.199
Received: from [192.168.212.208] (p5b39ebc7.dip0.t-ipconnect.de [91.57.235.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX18yIGrez3keadnnnZZCFhsb+TdVPKW3B3A=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Z3bpW05Kjz8sc4;
	Thu, 27 Feb 2025 17:07:46 +0100 (CET)
Message-ID: <e8041b56-396b-427f-b9cb-d51004a40f57@fau.de>
Date: Thu, 27 Feb 2025 17:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/9] bpf: Fall back to nospec if v1 verification fails
To: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Xu Kuohai <xukuohai@huaweicloud.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
 Henriette Herzog <henriette.herzog@rub.de>,
 Cupertino Miranda <cupertino.miranda@oracle.com>,
 Matan Shachnai <m.shachnai@gmail.com>,
 Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
 Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
References: <20250224203619.594724-1-luis.gerhorst@fau.de>
 <20250224204744.599963-1-luis.gerhorst@fau.de>
Content-Language: en-US, de-DE
From: Luis Gerhorst <luis.gerhorst@fau.de>
Autocrypt: addr=luis.gerhorst@fau.de; keydata=
 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
 Bjq2LIJlJ8czDxmxpGv0CjsHjGkXwBgsoeAK9A==
Organization: I4
In-Reply-To: <20250224204744.599963-1-luis.gerhorst@fau.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_080810_646071_64144451 
X-CRM114-Status: GOOD (  17.41  )
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

On 24/02/2025 21:47, Luis Gerhorst wrote:
> +		} else if (error_recoverable_with_nospec(err) && state->speculative) 
> {
> +			WARN_ON_ONCE(env->bypass_spec_v1);
> +			WARN_ON_ONCE(env->cur_state != state);
> +
> +			/* Prevent this speculative path from ever reaching the
> +			 * insn that would have been unsafe to execute.
> +			 */
> +			cur_aux(env)->nospec = true;

This allows us to accept more programs, but it has the downside that 
Spectre v1 mitigation now requires BPF_NOSPEC to be emitted by every JIT 
for archs vulnerable to Spectre v1. This currently is not the case, and 
this patch therefore may regress BPF's security.

The regression is limited to systems vulnerable to Spectre v1, have 
unprivileged BPF enabled, and do NOT emit insns for BPF_NOSPEC. The 
latter is not the case for x86 64- and 32-bit, arm64, and powerpc 64-bit 
and they are therefore not affected by the regression. According to [1], 
LoongArch and mips are not vulnerable to Spectre v1 and therefore also 
not affected by the regression.

Also, if any of those regressed systems is also vulnerable to Spectre 
v4, the system was already vulnerable to Spectre v4 attacks based on 
unpriv BPF before this patch and the impact is therefore further 
limited.

As far as I am aware, it is unclear which other architectures (besides 
x86 64- and 32-bit, arm64, powerpc 64-bit, LoongArch, and mips) 
supported by the kernel are vulnerable to Spectre v1 but not to Spectre 
v4. Also, I am not sure if barriers are available on these 
architectures. Implementing BPF_NOSPEC on these architectures therefore 
appears non-trivial (probably impossible) to me. Searching gcc / the 
kernel for speculation barrier implementations for these architectures 
yielded no result. Any input is very welcome.

As an alternative, one could still reject programs if the architecture 
does not emit BPF_NOSPEC (e.g., by removing the empty BPF_NOSPEC-case 
from all JITs except for LoongArch and mips where they appear 
justified). However, this will cause rejections on these archs and some 
may have to re-add the empty case. Even if this happens, some may not do 
it and only rejecting the programs on some archs might complicate BPF 
selftests.

Do you think the potential regression is acceptable or should we err on 
the side of caution?

[1] a6f6a95f25803500079513780d11a911ce551d76 ("LoongArch, bpf: Fix jit 
to skip speculation barrier opcode")

