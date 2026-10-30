Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2333606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 18:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RfcLgfda;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OKVAltTb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Yee/M/vhaQksyDRzfPy2oYsyP6s0T7Yq+RK3mjeMx4U=; b=RfcLgfdakZChFv
	Zy3+3MT9OyAtmZB9ytd+9566Nh8hSVQaakzU0wN+vP7REZPdziM8otkYJ7N8q4fOSsDZmKkZr7lhK
	oguJqWYHvoRsAnb5HRX1ZlRGKhaQ2K9+OwSdr0yzKQ76GS2m61+ObciCsQbMNoGlRqag/FJcUA+wL
	sS/A3eTCeC/u6R1kcbk9zStv/SCAj+sgC5N7sqH99K6SNeZfkAJBroZLUKMPvEVioX/N8SSNE0+kh
	LUrgzjM24NqDBtI3HGLLjM5zBVbAdMBpMeKUvZzVhpFQW9PZnEGr2TIWDjcYAPtsUYutZyfdhTxQk
	7vVq2q4pg/ozWt0DbvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr0f-0000000CM7t-2OTa;
	Fri, 30 Oct 2026 18:07:25 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr0c-0000000CM7H-2IAj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 18:07:24 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1ae7fc5681dso526c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 11:07:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793383639; cv=none;
        d=google.com; s=arc-20260327;
        b=TJmQslQyWwfw/1tX4tRv2K5vAfNJ7SdysdJOJJhOUuNb7qrc+oOEdk/6K2GQiqPd24
         s9/8wy+hsETvNfzfZfbCyKQWEDwjSSHPewomHhtaR4rB13ghWjix3M0lKeGdcN91Yj2x
         Q+k9z/+RFRmmFdaBd2BBQGWVEyuJxOq7BDbeNXUnSUqyRl1dJ57sEfuAWiaqpBBVV1br
         p03CINNl4BSBhfNkVrCJYNCZqOxFl8Fm/IWk/bcoSO1v3QA8mtW+oGyTV3Krxu4JpWH5
         43Xc3SMH1q4Z6SvSjk5oKNHwy0iMbInLnQYqDD853CVhgCRyIZCDBlKZi59Q2CI7W1uy
         4k2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yee/M/vhaQksyDRzfPy2oYsyP6s0T7Yq+RK3mjeMx4U=;
        fh=7vw+T9bjSIuZTDLDxdUhf10rrviboIOUxrsyi78rdOg=;
        b=X7Gu5/610/HEQL9rh2W4ZzxQH1EbJ8Fne5K0GF5j62yz2MccOf49EH4rt850eAyp5C
         xE2H9fz5qMp8yP2SXSWt3Y6DHZfx9rW72PhrRRTj1kmuUIvP6WYku3zzfeopAOLMYzpt
         pFI+kXRPzsmMYwtDqxOgk0I+jss8F98rUFzp9kWwL8xXaZ7X23N3BA0kk5RE52eLNktp
         IM1vQN7xrmyNVSQcPZ5e7hT9q1oWbHUg1MiD7q/oSUc8/llvbW/yZ0FHneZQNs3klYPr
         yOrbTBuOuKokSR/tpz4azaAWRqRB999MqTw3sB6InCdB+xis+O6BHxw7hjxrALLjn/hU
         KIcg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793383639; x=1793988439; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yee/M/vhaQksyDRzfPy2oYsyP6s0T7Yq+RK3mjeMx4U=;
        b=OKVAltTbIrHgDKr2PQG+S5CDkJQRMVGDP+xexwqHbD2kXGWtU70Obtooep7iPhZDL0
         Qag52fPV7YPXN6D4D0vopJMzkPSs3F+qIEiRXGL+C5T08z05hnpDsA/CccisX9wI5EVl
         am6TTFxOyj5gLxurkwrK5AAwCxwAo8GpNJRDRl4RKPayBfQ0dfmQOyaLfuD//QUYngKm
         JWw92gFDRhn+nYyprdDgu2zdQs7WInagTYqLELEqkhOaMfZwRbQuFcUcPwl2NqLmb2WM
         N1xbXfGciV81K3dVlb1/VdKufYN/lwwpeqp6Lvd6V7myeK08enGO1eB27pa5OVVAZJlV
         GOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383639; x=1793988439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yee/M/vhaQksyDRzfPy2oYsyP6s0T7Yq+RK3mjeMx4U=;
        b=Jd7Pg6MTnmg7IHxRLH2Gqusan/HxyFlzGw3CBUE9mqpo4ITaWa58GvI6aRU5KyL71W
         5oNW75vxO9AwUdz9Bqt6R7UpfBfgo6ANI/3HjRhnnt+JS4jnZLLUldaAk8Z6XzUcFpGZ
         Bnd5wdEMxGGV6KFIgZzjaoz2hE9obfSqT79EMn6vJks9JYIzndi1uOeke7XsvO+kRMEj
         Fh9um1bEWiNPwx4AbBYxPOZbUnH8LqjPiArfFlVrgzsg6Jvz8mzS7u4d8R02UEdB8/Jl
         oT2VUO+pFdKDKNoRrQJa+cwuaRRdK6KbjIl8qWygVIMtzxAdtXwSK4xDQJMZjN2Uesy8
         3+Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwDr7AqZTYdRCLo9ky0GwpJtVdENi9rDj1zSvOnyhhVhcJP25whutW1qK0GQcSMfuzntmF017/u4dijGSj5C+yG@lists.infradead.org
X-Gm-Message-State: AFq9FYKofyq1ssKGU1d5SUuF9I48EM071MspJge/qUnar2JuAuwCZ8Xz
	GxV3a8UPyl4b2z3NZUg9RqZAUg6j68vv0AkfS2U7izYIhCdLMgFb/xYS7Y++aICjC6QFsUfwKVK
	EkUhm76vlCXEHy1qCM/0n2ZUJITLnwisQLuqXmCqy
X-Gm-Gg: AYBFou0kgS7a8lWyVuGlAr2l+1TieNnPfqpahOCYSrHTASMKv/11aiZKUTwvvI8Utpl
	kCcgPzF5V8trLnYvA8KMj3CIS07XXVLg++P+4DpY6BO3HrSHC+NZbLFqpC3m45Ux4Maig20P0/K
	+qF/44WvT2TN8VsWA3e2nYTae/KmOIFDoClGAn2KPgshjUdB4WAa2xr06Hm/u0MFWPY32Gr4vBv
	CmgYYtWw7mksD+uR/v6vnDucOGRDJNONY0bY1oi38Bs0uIT9gFqkY/DVdTw6FI0B9RmGO8qZh9R
	YcoMETv048kSIn1KSUZNxb9PAL3KruIwM0CYkRBgug/nt/iIoTuR9k7la15rK6FeCKUKPLMX8YG
	H2HBnQA0/xwddtCi9pe1MeLptKFUMUFdqvRKq58s1SMObFjyjuNm2EBadMkuzjK9Fb4m97h0Jj+
	Kt5NhwMRA0+YtTdQ==
X-Received: by 2002:a05:701b:418f:10b0:162:1b69:fe06 with SMTP id
 a92af1059eb24-1a99bfb8c44mr948799c88.14.1793383635496; Fri, 30 Oct 2026
 11:07:15 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030174816.1544471-1-bwicaksono@nvidia.com>
In-Reply-To: <20261030174816.1544471-1-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 30 Oct 2026 11:07:03 -0700
X-Gm-Features: AclHuK_KkDFZvz94Iv9OiENJydeV5pIlSlXsWtxJeGMUrrlYUp2oAVSujcV7xFQ
Message-ID: <CAP-5=fUEmNrREh-ipxYMiStr5xCakGDBZW8OmAj1rhACs8qaZw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] perf: Add NVIDIA Tegra410 uncore PMU events and metrics
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: acme@kernel.org, namhyung@kernel.org, ctshao@google.com, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, mochs@nvidia.com, 
	rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, 
	john.garry@linux.dev, will@kernel.org, james.clark@linaro.org, 
	mike.leach@arm.com, leo.yan@linux.dev, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_110722_593930_588F1252 
X-CRM114-Status: GOOD (  25.87  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 10:49=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia=
.com> wrote:
>
> Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> PMUs, and fix perf's aggregation of PMU instances that are numbered in
> more than one parts in their name.
>
> The series covers the UCF, PCIe, PCIe target, CPU memory latency, and
> chip-to-chip interconnect PMUs. It provides symbolic names for the raw
> event encodings and metrics for bandwidth, frequency, and average read
> latency.
>
> The PCIe and PCIe target PMUs are named nvidia_pcie_pmu_<socket>_rc_<rc>
> and nvidia_pcie_tgt_pmu_<socket>_rc_<rc>. Their json Unit uses the
> existing comma-separated form ("nvidia_pcie_pmu_,rc_"), but perf only
> merged instances that differ in the trailing number, so these events and
> metrics gave one result per socket and were reported incorrectly (e.g.
> with --metric-only), as discussed in v1. Patches 6-9 fix this:
>
> - Patch 6 adds a check of the cpumasks of all merged PMU instances to the
>   zero-count skip in perf stat, so a socket that counts nothing shows 0
>   instead of having its row hidden.
> - Patch 7 merges PMU instances that match the same comma-separated json
>   Unit. This also applies to the HiSilicon hisi_sccl PMUs, which use the
>   same json form; not tested on HiSilicon hardware.
> - Patch 8 labels a merged uncore counter after all of its PMUs, e.g.
>   nvidia_pcie_pmu_*_rc_*/cycles/ or nvidia_ucf_pmu/cycles/, instead of
>   after the first instance, such as nvidia_pcie_pmu_0_rc_0/cycles/.
>   Output with --no-aggr is unchanged.
> - Patch 9 describes these PMU names in the ABI document.
>
> Changes in v2:
> - Move the uncore JSON out of the sys directory and remove the
>   "Compat" fields. Thanks to Ian Rogers for the feedback.
> - Drop "perf jevents: Process model files before sys subdirectories",
>   which this series no longer needs.
> - Add UCF SLC and memory bandwidth metrics from all sources to local
>   CMEM (read, write and read+write) and from local sources to local
>   CMEM and to remote memory, PCIe bandwidth metrics to local
>   destinations, and read+write bandwidth metrics for UCF SLC, UCF
>   memory and PCIe. Thanks to Chun-Tse Shao for the suggestion.
> - Add patches 6-9 to fix the PCIe instance aggregation. Thanks to Ian
>   Rogers and Chun-Tse Shao for the pointers.
>
> v1: https://lore.kernel.org/all/20261019164241.403644-1-bwicaksono@nvidia=
.com/

Why don't we look to fix code in drivers/perf? This series introduces
PMU instances, overloads the meaning of aliases, and a bunch of other
silly complexity due to poor reviews and maintenance of drivers/perf -
specifically by not pointing out the ABI issues. Isn't this a
straightforward, whoops we did a bad suffix and here's the patch to
rename our PMU in the driver? Throwing more complexity at the problem
doesn't feel like the right fix.

Thanks,
Ian

> Besar Wicaksono (9):
>   perf jevents: Add support for NVIDIA Tegra410 UCF PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 PCIE PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 PCIE-TGT PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latency PMU
>     aliasing
>   perf jevents: Add support for NVIDIA Tegra410 C2C PMU aliasing
>   perf stat: Check merged PMU instance's cpumasks when skipping zero
>     counts
>   perf pmu: Merge PMU instances that match the same comma-separated json
>     Unit
>   perf evsel: Name a merged uncore counter after all of its PMUs
>   perf Documentation: Describe PMU names numbered in more than one place
>
>  .../testing/sysfs-bus-event_source-devices    |  14 +
>  .../arm64/nvidia/t410/uncore-cpu_mem.json     |  43 +
>  .../arm64/nvidia/t410/uncore-nvclink.json     |  67 ++
>  .../arm64/nvidia/t410/uncore-nvdlink.json     |  43 +
>  .../arm64/nvidia/t410/uncore-nvlink_c2c.json  | 115 +++
>  .../arch/arm64/nvidia/t410/uncore-pcie.json   | 249 ++++++
>  .../arm64/nvidia/t410/uncore-pcie_tgt.json    |  83 ++
>  .../arch/arm64/nvidia/t410/uncore-ucf.json    | 764 ++++++++++++++++++
>  tools/perf/tests/pmu.c                        | 134 +++
>  tools/perf/util/evlist.c                      |   2 +-
>  tools/perf/util/evsel.c                       |  83 +-
>  tools/perf/util/evsel.h                       |   2 +-
>  tools/perf/util/parse-events.c                |   2 +-
>  tools/perf/util/pmu.c                         |  65 ++
>  tools/perf/util/pmu.h                         |   9 +
>  tools/perf/util/pmus.c                        |  47 ++
>  tools/perf/util/pmus.h                        |   1 +
>  tools/perf/util/stat-display.c                |  20 +
>  18 files changed, 1737 insertions(+), 6 deletions(-)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-c=
pu_mem.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vclink.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vdlink.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vlink_c2c.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-p=
cie.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-p=
cie_tgt.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-u=
cf.json
>
> --
> 2.43.0
>

