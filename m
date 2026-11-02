Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42100606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=183/KztR;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I0i/oXxe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TG6233zEpb+rSVfSqflC2boy12f75HN0PuFPajXRgoQ=; b=183/KztRH238ce
	dlfljnt7JUcuDoyHJxUljr8XFLrrkEkj1y0qtihYilOhdp3Vt/z65xDWpCoKhu7U4VnrT64V8CaQ9
	IuZM02N2hRVhx3jhKlrRIHJAxGAzFvGysKprRb9dh8mrBmGnAFqEyAO8HAD6JEO/H+dEGBNAH6kzH
	MV0m76A4nDx1qp1NjmlBFJVvVz8QHi6Ob+VLsKnH6pr5FHgC1O/Y3Nl64ZsUJxr9FGCr6mRoSZn0l
	Jp6N6+Sq1xAr4RVBxueoFVdmnLsrUfFnzSh7/icpJYgvL0VGZDgKkTX0onshYVmzsCubbTxC0TSJb
	hci0IiBpo3pb/+h1kCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpJa-0000000GB2X-3J34;
	Mon, 02 Nov 2026 10:30:58 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpJX-0000000GB1u-0qEa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:30:57 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c3fd91337baso471445066b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 02:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793615453; x=1794220253; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TG6233zEpb+rSVfSqflC2boy12f75HN0PuFPajXRgoQ=;
        b=I0i/oXxejmzcpMeVpBYGVn3CJk93f42Q+RA+d5/eTnd0AOq5WrNY1f1yk08HXS0fYx
         fmBNU+6xCAz5xANKCdGgZG506nISeOCDA5xaURZs7oaq7iUrnZEYfg4T/aoL1MLtyIXS
         l72W9340O/2GhFtcgjNFezliZ+cirZn1RYUSAy+LvbcgSt8ymTcn0fnSPqbGENYjA0V0
         KkPwUGwxy6Yik7+kX3nM76u5dAAM2t1BUmWX0Y5QCKNglMI9w65jyy5IgHaNRbD2ArGy
         fiNYJWUtCn9nqm/Hjmz2rPJSdbKIPqioMEIsNawng4Dp5qTI0yxOA8bcH/ZO3z9YzCWq
         WlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615453; x=1794220253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TG6233zEpb+rSVfSqflC2boy12f75HN0PuFPajXRgoQ=;
        b=rMNvDTdk3j067buIoPmYMG3j/9LpU8ZQmaUX+vnfaAFmWGkyIAyDQoo4EyFgHyJWbn
         wum/oDDS6A4Hcrva6jJOLIrKSqNlDPFNd4Qzu6rVYVfYKhKfYaftMeO56gXjazJlqseM
         Siko1TboG6Vumz66ygBAFYZGzhRnVIHgwKEJtm1bwaHkHS5inu5MB/X2JTxOXLGQYgGL
         7Pn8bXO6lv8mN40q1hZW6ckbCPrCteec+lSybdXvG2YQj8q18UYN8hSpJ/Mf9eZjYhL1
         dCgwhJZkARAByQ15n7CK+xjk34A302nEnRzpM1reqNB4b3AXTWtqlgGsGgy+CjAuA+0Y
         V0Og==
X-Forwarded-Encrypted: i=1; AKwUvBzM+daUXJWwpVyY3YzMCG8EAHYURmDxtzNjdVjfTUvkQ4BOlGVh+C9ddCv3mnLCBKBFxhQf1Mi+Vhkv+VcpUdcB@lists.infradead.org
X-Gm-Message-State: APuU4Z9MwTy1XX2JOM8nKXHRtXsMgZlx/W1yh9AmrnRHTAssxzkCYow3
	HcQIVB3X2tm4FNsohuuKRKGddtozmVIYTOW3BpDy3r8srIB4N5ycz1PVMRWTrw7grdayf5sLL5M
	4m5ay0k8=
X-Gm-Gg: AYBFou0XnlhttrVmd0Rqq+R1mZ1VdPHzLaI6zBW/dTwRNrPF2BHOVSORqC7DefsBzZx
	f9qEY0i5gToYFmzYhqqkiE0jpTEH4mA5IgaY+fny9+Dp9Db1Mzj1J18InLKvM3cnUO0E7uvxH2u
	dogefYXgjXaFIZHLjqRcBJL69T4IHILil+mtWQ1u3gVhicV2QUElUZO6hH+k5H+1hrBHp2m7s4U
	Sn3N8WtQeSGSBaCC60TeqDeqRyk9sZC34vM9iGp/4EHGLLW7+136crO4G76C5Y6q0vA3nVupgT2
	WbC6qRMa3t+vSIZCjQC8R1Zq0GDp/4uwJUKU0T9OHmHGiulYVO0wcy5tPtd/Fs5nQ0aAo4ZIcUM
	Q7XoqnE/EYVP96HAK3LUwxoI7lrf/giL8d+AVIzh7jOaQzSV0rMHeY3vUhlnMxvM8XL5ejz2SDG
	BNgAetf+reh8XZ7HcNuY9aRDB/gpkNQFAyhPAb2OfiH66Dw3+vWb1MKLkxVkBrmYPErx3IkJvK7
	A0RuiD1zzcipd22vJAba7Jak4ZVfNyWdSzxI79r0fo5fd4zjfQYrJLO+H5vTheA08IXbhCx7UvI
	nbx/tkjaPNeSVQISUaEB2Mtlq5MyYKPs
X-Received: by 2002:a17:906:c156:b0:c49:9383:a28 with SMTP id a640c23a62f3a-c4ca7ac537bmr772991066b.35.1793615452931;
        Mon, 02 Nov 2026 02:30:52 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabeb11acsm371161266b.70.2026.11.02.02.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:30:52 -0800 (PST)
Message-ID: <6682e9cf-8350-4410-8acc-1fbeca638e64@linaro.org>
Date: Mon, 2 Nov 2026 10:30:51 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/14] perf cs-etm: Fix bogus branch samples on
 exceptions
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Mike Leach <mike.leach@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_023055_300761_8093A2A3 
X-CRM114-Status: GOOD (  24.28  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 30/10/2026 15:13, Leo Yan wrote:
> CoreSight currently models exception entry by changing the preceding
> instruction range into a taken branch. This can give an IRQ the source
> PC of an instruction that already retired and overwrite a real branch
> immediately before the exception.
> 
> For an untaken B.LS followed by an IRQ, perf script currently reports:
> 
>    hw int  4000f8 => ffff800080010c80  b.ls #0x400118
>    ...
>    iret    ffff800080012284 => 4000fc  eret
> 
> The hardware trace supplies 0x4000fc as the preferred return address.
> For an IRQ, this is the architectural resume PC (Arm ARM, R_VBQMV).
> B.LS has retired, and the saved PC identifies the boundary before the
> following MOV. Using this PC as the IRQ source reflects the
> architectural state at exception entry:
> 
>    hw int  4000fc => ffff800080010c80  movz x2, #0x1796
>    ...
>    iret    ffff800080012284 => 4000fc  eret
> 
> The IRQ sample represents the transfer from this architectural execution
> position to the handler. The series synthesizes exception entries from
> exception packets, preserving the preceding branch and its outcome.
> 
> The supporting changes:
> 
> - Let decoders supply sample.ret_addr so later instruction fetching cannot
>    change thread-stack return addresses. Apply this to Intel PT
>    asynchronous samples as well.
> - Prepare packet ISA and instruction-size handling and share sample
>    synthesis helpers. Mark untaken branches and break history when
>    instruction memory is unavailable.
> - Add a thread-stack regression test and four AArch64 CoreSight tests.
>    IRQs and page faults must resume at the entry PC; SVC and emulated MRS
>    must resume four bytes later.
> 
> Based on the AI search and test on my x86 machine, this matches perf's
> Intel PT handling of IRQs. Intel PT records the next instruction's IP in
> the FUP packet, and Perf uses that IP as the interrupt sample's source.
> 
> This series is verified on Orion6 board with "perf test coresight".
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> Changes in v3:
> - Introduced the pref_ret_addr/end_addr union (James).
> - Clarified zero-size A32/A64 exception handling and why T32 retains
>    per-address instruction decoding (James).
> - Retreed missing exception pairs for up to three recordings,
>    then fail instead of skipping (James).
> - Shorten the IRQ workload (James).
> - Fix FIFO argument quoting and remove redundant ShellCheck source
>    directives (James).
> - Checked instruction length before copying bytes into sample->insn
>    (Sashiko).
> - Retried MRS checks when instruction page faults may match the opcode
>    filter (Sashiko).
> - Rebased onto the updated perf tree and collect review tags.
> - Link to v2: https://lore.kernel.org/r/20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com
> 
> Changes in v2:
> 
> - Rework the fix around exception packets to preserve both exception
>    entries and preceding branches.
> - Add explicit return addresses and the Intel PT asynchronous-branch fix.
> - Split out packet/synthesis preparation, record not-taken branches and
>    handle unreadable instruction memory.
> - Add thread-stack regression coverage and four CoreSight tests.
> - Link to v1: https://lore.kernel.org/r/20260713-perf_cs_etm_fix_non_taken-v1-0-4561607fc69f@arm.com
> 
> ---
> Leo Yan (14):
>        perf sample: Allow decoders to supply branch return addresses
>        perf intel-pt: Preserve return addresses for asynchronous branches
>        perf cs-etm: Break branch history when instruction memory is unavailable
>        perf cs-etm: Centralize packet ISA initialization
>        perf cs-etm: Use the recorded instruction size for A32 and A64
>        perf cs-etm: Mark branches that were not taken
>        perf cs-etm: Factor out final instruction sample synthesis
>        perf cs-etm: Centralize branch sample synthesis checks
>        perf cs-etm: Classify exception calls using the exception packet
>        perf cs-etm: Synthesize exception entries separately from branches
>        perf tests: Check CoreSight IRQ entry and exit
>        perf tests: Check CoreSight syscall entry and exit
>        perf tests: Check CoreSight abort entry and exit
>        perf tests: Check CoreSight emulated instruction entry and exit
> 
>   tools/perf/tests/Build                             |   1 +
>   tools/perf/tests/builtin-test.c                    |   3 +
>   .../perf/tests/shell/coresight/abort_entry_exit.sh |  32 +++
>   tools/perf/tests/shell/coresight/irq_entry_exit.sh |  36 +++
>   .../tests/shell/coresight/syscall_entry_exit.sh    |  32 +++
>   .../perf/tests/shell/coresight/trap_entry_exit.sh  |  39 ++++
>   tools/perf/tests/shell/lib/coresight_exception.sh  | 164 ++++++++++++++
>   tools/perf/tests/tests.h                           |   3 +
>   tools/perf/tests/thread-stack.c                    | 106 +++++++++
>   tools/perf/tests/workloads/Build                   |   4 +
>   tools/perf/tests/workloads/branch_not_taken_loop.c |  33 +++
>   tools/perf/tests/workloads/page_fault_loop.c       |  37 ++++
>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.c    | 106 ++++++---
>   tools/perf/util/cs-etm.c                           | 246 +++++++++++----------
>   tools/perf/util/cs-etm.h                           |   6 +-
>   tools/perf/util/intel-pt.c                         |   7 +
>   tools/perf/util/sample.c                           |   1 +
>   tools/perf/util/sample.h                           |   5 +
>   tools/perf/util/thread-stack.c                     |   5 +-
>   19 files changed, 714 insertions(+), 152 deletions(-)
> ---
> base-commit: 4626d370ae89b8af4d46a45372b269f926ec662d
> change-id: 20260713-perf_cs_etm_fix_non_taken-5b4d7f73f41e
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>


