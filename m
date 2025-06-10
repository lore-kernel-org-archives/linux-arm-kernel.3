Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB99C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 03:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIEKtN06Lki2LXMwWPqlBYVbjTpO1FFusGuijePViww=; b=1n5BdQKPzEj0G0UaTyIEbA6gQM
	FzbfidJhLG5VeGEIcySnwh9G7dVNlE7M/Ksib3bTRWd+qtuAme0z9jMWPs83gUSEZassaMH856zq2
	y0ko/Eb9d2ZdYiUD8w4pLd7m8oHX4RLSuAnOaWrmA4o5Ma7glnXZf3ADAV6SjFu47SXtXvvzgAAPr
	WRs/vuGceescCmoiw/vLBz0sGySJRDBRpQbaEAlE5qsR2/fPfxYkHq4qLilYMAieh00zT9fnsCfgO
	x0RAN8wgkcXAbFHK8/FqoJAJ00xCLKKS1APvVlvi8FLtf/rnbrOiBbc0M81SMOtgHHWsawplqhR9t
	wD3o5Jlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOpIq-00000005fYh-2PLH;
	Tue, 10 Jun 2025 03:05:32 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOpGd-00000005fLR-08ok
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 03:03:16 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-acae7e7587dso752046666b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 20:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749524593; x=1750129393; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iIEKtN06Lki2LXMwWPqlBYVbjTpO1FFusGuijePViww=;
        b=j1SNNs+7V45cmUSO6PV3hRCIkxspBa1rKZdtd/KJ7S5EHJjIMvk8LxZHXuc0jRN2gT
         md3qibJZzvRn/KYgLXvY16un3TX53KS0VUK2TYt1plgIm5lpKpjB65N7sjI/zJkkfxBa
         Y4nFgbPQmgWfOOuUClHurB1rykMiULYB6Jbd9zifXXfEAAS6vkv9rEwVHbl09es6AM7E
         cQRoZvRwTgnJcXD5rmt8aPxlC+YDgKsVDjazoBfXBC1M5v7ZgZgDzCttt5eL+QEr20d4
         cTxGFZ/uswkyiCqqiEnEL0FXTaJHtJ+ruFKWV7nnh35DfyY6D/3TRBIOOVfnRuO1CKco
         46AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749524593; x=1750129393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIEKtN06Lki2LXMwWPqlBYVbjTpO1FFusGuijePViww=;
        b=cBD/w8zngURVc8UIQ2DwiQ1DM9YJIiGnNzrx+wt0DwZd9yoTuYjUe0YPQEtU4avoYg
         hiu4wNoqM8TY59zD8Z9d2acTIEOrYWGhDZ7b1B4xcJaNDim2n4ynJumNTqcjiga21xxW
         6zTwXN5iJJYTK5laA8odBhySQv0c3YhS8WwHocfMnWStNeo7jVAdyXtty4NcG+wGfTwU
         /FbTYNaXTqRNK89Pkin0kzaiEvp/XE19rHp2P5pdpWiRKHsXnEJOgXCWb313pgAgHxsI
         xDImCLdHiTyVCUdGzTGaqiqJYZz/obAqx7P3xMrIYgsXY9HEgZ67pe6CuufDt+lCVCta
         qLPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr555gn3dgQTfM6u8nmhW/Z4Q+uTsn7NFhNuql/P2SQCl6f0EUtXWRLkh0kz9QS4DPlyYzlt9CYfojbHRLXtBl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4apJGe204CY97fRXhxuy44b3WIsYPKVCGPuXFp6HNgPTUOb/2
	SSfTV6DQY4+x3CDp2vtHsI3l3hUKSoEuz31RDsULAl129SBeOMp7Z3F557R0AD8BsWbFiF+ReCj
	R1P8GvTmoaYf28eKqRe2Nx+0gf3GPJH8=
X-Gm-Gg: ASbGnct6L/JM3dIKZjQQpHBFORfrM0keu2CidfDc7PvT3bGZUTcueFa994fDT9u+3l5
	npRu+nYm3z2/94HqRaCY58yT5eSv5BrtYwMDfz0aOn2DrIyvfeYqBfp1R2q0MR/s7xQZ2iSOc4g
	SJpZOTQnhmM3Ukm6onmzay/xdwqfNlmuL4ujxDosC4gPgOTG9gDeQdIXXBzPBNsmBbNmH7vgFMc
	C+RCRRV0nQaibc1
X-Google-Smtp-Source: AGHT+IGSVrkhyZq9vvvsVr44VoqUZGF3wcQ/tPIjHH2PKLhYYyk/OK3JkxJPJ6OOCePVO2GT4bNI9XVsW4Z5WF4Rz1o=
X-Received: by 2002:a17:906:6a0e:b0:ad5:72d4:85f9 with SMTP id
 a640c23a62f3a-ade1a9c7cd2mr1539157966b.40.1749524592671; Mon, 09 Jun 2025
 20:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250603205800.334980-1-luis.gerhorst@fau.de>
In-Reply-To: <20250603205800.334980-1-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 10 Jun 2025 05:02:36 +0200
X-Gm-Features: AX0GCFsg0jFdSRfQwjdMDtUT5JBYaZq4q7ARo5V7e_WrDdDiMUVd3IyUlXozaCc
Message-ID: <CAP01T76BFe57wUaqsQYFu0vk-ST1kSSk1MghDAUhS3n2F892AQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 0/9] bpf: Mitigate Spectre v1 using barriers
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
	Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen <mrpre@163.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_200315_080765_E4FCEDC9 
X-CRM114-Status: GOOD (  29.03  )
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

On Tue, 3 Jun 2025 at 23:04, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> This improves the expressiveness of unprivileged BPF by inserting
> speculation barriers instead of rejecting the programs.
>
> The approach was previously presented at LPC'24 [1] and RAID'24 [2].
>
> To mitigate the Spectre v1 (PHT) vulnerability, the kernel rejects
> potentially-dangerous unprivileged BPF programs as of
> commit 9183671af6db ("bpf: Fix leakage under speculation on mispredicted
> branches"). In [2], we have analyzed 364 object files from open source
> projects (Linux Samples and Selftests, BCC, Loxilb, Cilium, libbpf
> Examples, Parca, and Prevail) and found that this affects 31% to 54% of
> programs.
>
> To resolve this in the majority of cases this patchset adds a fall-back
> for mitigating Spectre v1 using speculation barriers. The kernel still
> optimistically attempts to verify all speculative paths but uses
> speculation barriers against v1 when unsafe behavior is detected. This
> allows for more programs to be accepted without disabling the BPF
> Spectre mitigations (e.g., by setting cpu_mitigations_off()).
>
> For this, it relies on the fact that speculation barriers generally
> prevent all later instructions from executing if the speculation was not
> correct (not only loads). See patch 7 ("bpf: Fall back to nospec for
> Spectre v1") for a detailed description and references to the relevant
> vendor documentation (AMD and Intel x86-64, ARM64, and PowerPC).
>
> In [1] we have measured the overhead of this approach relative to having
> mitigations off and including the upstream Spectre v4 mitigations. For
> event tracing and stack-sampling profilers, we found that mitigations
> increase BPF program execution time by 0% to 62%. For the Loxilb network
> load balancer, we have measured a 14% slowdown in SCTP performance but
> no significant slowdown for TCP. This overhead only applies to programs
> that were previously rejected.
>
> I reran the expressiveness-evaluation with v6.14 and made sure the main
> results still match those from [1] and [2] (which used v6.5).
>
> Main design decisions are:
>
> * Do not use separate bytecode insns for v1 and v4 barriers (inspired by
>   Daniel Borkmann's question at LPC). This simplifies the verifier
>   significantly and has the only downside that performance on PowerPC is
>   not as high as it could be.
>
> * Allow archs to still disable v1/v4 mitigations separately by setting
>   bpf_jit_bypass_spec_v1/v4(). This has the benefit that archs can
>   benefit from improved BPF expressiveness / performance if they are not
>   vulnerable (e.g., ARM64 for v4 in the kernel).
>
> * Do not remove the empty BPF_NOSPEC implementation for backends for
>   which it is unknown whether they are vulnerable to Spectre v1.
>
> [1] https://lpc.events/event/18/contributions/1954/ ("Mitigating
>     Spectre-PHT using Speculation Barriers in Linux eBPF")
> [2] https://arxiv.org/pdf/2405.00078 ("VeriFence: Lightweight and
>     Precise Spectre Defenses for Untrusted Linux Kernel Extensions")
>
> Changes:
>
> * v3 -> v4:
>   - Remove insn parameter from do_check_insn() and extract
>     process_bpf_exit_full as a function as requested by Eduard
>   - Investigate apparent sanitize_check_bounds() bug reported by
>     Kartikeya (does appear to not be a bug but only confusing code),
>     sent separate patch to document it and add an assert
>   - Remove already-merged commit 1 ("selftests/bpf: Fix caps for
>     __xlated/jited_unpriv")
>   - Drop former commit 10 ("bpf: Allow nospec-protected var-offset stack
>     access") as it did not include a test and there are other places
>     where var-off is rejected. Also, none of the tested real-world
>     programs used var-off in the paper. Therefore keep the old behavior
>     for now and potentially prepare a patch that converts all cases
>     later if required.
>   - Add link to AMD lfence and PowerPC speculation barrier (ori 31,31,0)
>     documentation
>   - Move detailed barrier documentation to commit 7 ("bpf: Fall back to
>     nospec for Spectre v1")
>   - Link to v3: https://lore.kernel.org/all/20250501073603.1402960-1-luis.gerhorst@fau.de/
>

LGTM. For the set,

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

> [...]
>

