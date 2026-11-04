Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F44606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gpk6yWEm;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nF53MeSp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=02xlunbPJG9twMrNC4lzpNV5WoLplwFKW8EyaQv0RmE=; b=Gpk6yWEmL651fs
	5b1Nt0rMqGRZ8teKlJ6GDc7ns0mz2f5gBwyNBkR3lASBgw21xXMRsAFEJ8x0RGbJkEoejxc/jsgp1
	Vi5DZ2XIHu2wfeEYc3rPuZt2CpPAT+SnPE/OO7OXE3YcZX1whaUfahVdXlNFMsl5QvcmysQr4wJU+
	/tzHyCMgciT80qVxTW3PGVVkfGrL1tDAGfwlpeYHdSNukMqN9mWLqAxWyPrJiKMO2M9fubuhBcnwc
	jT0OKV76tvOUDShj54WaHfjEYD9flTsOwJx3ulSS2Zi4xQ5n7X46HzXWqXrZ9RY3P729ZQwyymX7g
	EYYxhtkPVOv12YHSVA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdoU-00000005yHc-2KSj;
	Wed, 04 Nov 2026 16:26:14 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdoQ-00000005yFn-2Xs3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:26:12 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-54492d8a988so355321cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 08:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793809569; cv=none;
        d=google.com; s=arc-20260327;
        b=ZkjeBQ+m6BWcI7Ak24g0mJHu9468p2a1ddOhVv7LrWQs7EYCYAPPknB2Mnnpcgp+Gx
         59XsGOJGf8/NSQBHB2zaLfKZ2zD4lg9jRMssx0BOXoI9uWOB7mFYjj8hJ0fnozTRWPTY
         r29oBAg3/7kUZbwNLonJ61nIHcXziE0yitbezikd4ME4FpYE71fFPpppIcNJgAF1hDwG
         Dyc1LFvfCgVAtWTAeKjX7v/CZeUVD5psl8tAOluZlggbMwfC4Umlo+Aw3HaGu0jIJT1G
         XhXk8zhgW33+Z7nU+rzx85fwFM1ky8yH8eEuT4fkeueWf7e3c/Arl/WS9ppMszUpCHfW
         2B9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=02xlunbPJG9twMrNC4lzpNV5WoLplwFKW8EyaQv0RmE=;
        fh=mfxDg5rusiK/zbYnFMWMAQE735tJwq81el7UlGQSjxc=;
        b=jCdbEN2IsXo9sHhkfFLEXpXNH+MmGkb4YpOhUM/m3Q2gyr0RAfhwBucW1WnqwpO+Va
         ceFmVICa13RIetcFchcTzyDP65bE/3Ozf1SvPlAfppBk7fzVF2baRV5hY1CraSpTVHTm
         jj1asz2R60bS1fu+CQPDIZnrfshTj923NVORKflT2kMWviYr0Bnzm5M/jtMdOw0STm38
         EQr3baKHqocbL5N4sd2MRC+5veGTfkUKcR8Zij80j0Gomw4TKybmj846byBXSGbOwaZM
         jMeDGmmELbM4ytf8AYM5hzyary2iLWKf62HDibBh58CEUcizBxU3NSIGz5zq6XolnKds
         Z4gw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793809569; x=1794414369; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=02xlunbPJG9twMrNC4lzpNV5WoLplwFKW8EyaQv0RmE=;
        b=nF53MeSpALBsGhXGCrSId/tlDNVFxOU8P5tOIm224Qx8u0clli8WhtNFBkPiO3xQsE
         Ij5RONuiEbFt6GQ0yFW7MgT9Jt+w/m3kLGOlQqFFVaUZ5aaCg2XD/jWZCpR0tz37a8XT
         cbmRE2n1fLVWTp38ue/4rnYcOFdkQaape1MOGau1DoIKPqLT3roNscqUIO/+vB8SzZCH
         R1P76HmeS3nTqF2DJ6dk4g95BN4Fl7x3QVpMdjl53n4/bm/JQsUzwCmxB3Ih5pkkV5zg
         o7wIE2TI9R+owX5qGecqihxviPRSRLynQLYcbNffqNfL9lT1G8cwHViJSFBqaULdP91B
         9w4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809569; x=1794414369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02xlunbPJG9twMrNC4lzpNV5WoLplwFKW8EyaQv0RmE=;
        b=yMGpWEZJN047ePyWBLijr6etSS/+ipvqEesL+YbqIqWgZOWyqWuQ65T9Z/EYiN0fKW
         G/qVKi6rzEX+JWsZk7kdYqkeQQCtf1uPf0E+ubitgqmy+vizDzmoyltk+UYwOxNVtVKL
         3aTnA0v75YsnqicW5XngpAyGk/BeGp81FwpeD06REvjzgogMvE8G0KNilPPo5I1D0Sst
         Q1g/Y9DT+mqfZ7Z8nMwuyfR8tU4BzkvnaXPmkJHnj4Ddd9hXLYdbL2AZqFBiPVYAQqCH
         jUeq2OVp/fiKd2Gjz9wQtVyavwquaBqHOWuSMCNHT5UGHhFOZ07yK7Df+3sXjhLFxKEL
         F2/g==
X-Forwarded-Encrypted: i=1; AKwUvByip1VnCIUUvY7jsfmpg1hk99j5VQ+WZUdBJOEQnhnDEq4vIAsIGZY1iijiBvA2rkQFLGitZYz/zu0AmBl1L4UO@lists.infradead.org
X-Gm-Message-State: APuU4Z/BIuv7bKwvBYU0aJHYOfAEQdCU3E+lbeXczvNngoEUgsFc9Ve7
	dACUDqKAu2bXD/czD+RorZ2SfBw+8KlbbYa6mgAcr+jjlwcumrNwn/RXSaTyx8jpFgLN5fGWo/K
	cknW0dlTUnmjyHsEmu8j8DmK93ADrKWxBUPO7WRji
X-Gm-Gg: AYBFou3YaGo2Ch25jxWKpv5nqBWsCHoxcj1Tv5lvuCVM7nA6gfJtAstvRwASSURREO+
	QZo9trvqiDNM217EFH+wTcuxyk43+cnUXkCFC2BkPRB/OhKgdApHjryo+rHMpGYdAHRK2xcK341
	LgjDrJsDLrtmjycw/Bj2dWna/zKJThtAjr7GxmHex6GJxBX2Aau78Un7HyX7+vSUpNZiMd/HOH9
	BqfJ5qxey3v/sO6U4RrE3/TjJ1Y9VKY7JPFhOAq700VnvbidG0fqSd+dlL0haCI+KzUtpbDc2eY
	RzfH10om7AXFVHFxpDXR7WXU4fIJjlZHXGZS6pf0s/UedtsONgP0NqgIIxaekMcq0zFmIpbT4KU
	8QufxrTH4wH3NrEivBYRoo2jhDU0i3YX3D5CIhAWmVAAt2/UwkI3lHFsjYergKudheznPYYLAl/
	/UUMYAXQPuuO4=
X-Received: by 2002:a05:622a:4894:b0:535:9aa3:5ebb with SMTP id
 d75a77b69052e-54b4cd278d4mr21858561cf.8.1793809568468; Wed, 04 Nov 2026
 08:26:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104160716.2910873-1-bwicaksono@nvidia.com>
In-Reply-To: <20261104160716.2910873-1-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 4 Nov 2026 08:25:57 -0800
X-Gm-Features: AclHuK-GeTinNBFNoWnfPGGAtOY6Xq1W9g3atyK1ujiBfiA8CNbeKnUu-zkauLA
Message-ID: <CAP-5=fXriq3akwKxsxSuBZ0M=1OMuCe8ig_j-r6ehfCeCVAYcQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] perf: Add NVIDIA Tegra410 uncore PMU events and metrics
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
X-CRM114-CacheID: sfid-20261104_082610_662950_6D4D341D 
X-CRM114-Status: GOOD (  23.82  )
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 4, 2026 at 8:08=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia.c=
om> wrote:
>
> Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> PMUs, and fix perf's aggregation of the Tegra410 PCIe PMU instances.
>
> The series covers the UCF, PCIe, PCIe target, CPU memory latency, and
> chip-to-chip interconnect PMUs. It provides symbolic names for the raw
> event encodings and metrics for bandwidth, frequency, and average read
> latency.
>
> The PCIe and PCIe target PMUs are named nvidia_pcie_pmu_<socket>_rc_<rc>
> and nvidia_pcie_tgt_pmu_<socket>_rc_<rc>. perf only strips the number at
> the end of a PMU name, so the instances of each socket were treated as a
> different PMU, and these events and metrics gave one result per socket
> and were reported incorrectly (e.g. with --metric-only), as discussed in
> v1 and v2. Patches 6 and 7 fix this:
>
> - Patch 6 adds a check of the cpumasks of all merged PMU instances to the
>   zero-count skip in perf stat, so a socket that counts nothing shows 0
>   instead of having its row hidden.
> - Patch 7 treats both numbers of the NVIDIA PCIe PMU names as the
>   suffix, so the instances on all sockets are merged as nvidia_pcie_pmu
>   or nvidia_pcie_tgt_pmu. Per-RC results are still available with
>   --no-aggr or -A.
>
> Changes in v3:
> - Replace v2 patches 7-9 (merging PMU instances that match the same
>   comma-separated json Unit, naming a merged counter after all of its
>   PMUs, and the ABI document) with a special case for the NVIDIA PCIe
>   PMU names in pmu_name_len_no_suffix(), perf_pmu__match_wildcard() and
>   pmu_name_cmp(). Thanks to Ian Rogers for the suggestion.
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
> v2: https://lore.kernel.org/all/20261030174816.1544471-1-bwicaksono@nvidi=
a.com/
> v1: https://lore.kernel.org/all/20261019164241.403644-1-bwicaksono@nvidia=
.com/
>
> Besar Wicaksono (7):
>   perf jevents: Add support for NVIDIA Tegra410 UCF PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 PCIE PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 PCIE-TGT PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latency PMU
>     aliasing
>   perf jevents: Add support for NVIDIA Tegra410 C2C PMU aliasing
>   perf stat: Check merged PMU instance's cpumasks when skipping zero
>     counts
>   perf pmus: Treat both numbers of NVIDIA PCIe PMU names as suffix

Other than the nit the that commit messages adding events refer to it
as "PMU aliasing":

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

>  .../arm64/nvidia/t410/uncore-cpu_mem.json     |  43 +
>  .../arm64/nvidia/t410/uncore-nvclink.json     |  67 ++
>  .../arm64/nvidia/t410/uncore-nvdlink.json     |  43 +
>  .../arm64/nvidia/t410/uncore-nvlink_c2c.json  | 115 +++
>  .../arch/arm64/nvidia/t410/uncore-pcie.json   | 249 ++++++
>  .../arm64/nvidia/t410/uncore-pcie_tgt.json    |  83 ++
>  .../arch/arm64/nvidia/t410/uncore-ucf.json    | 764 ++++++++++++++++++
>  tools/perf/util/pmu.c                         |   9 +
>  tools/perf/util/pmus.c                        |  23 +
>  tools/perf/util/stat-display.c                |  20 +
>  10 files changed, 1416 insertions(+)
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

