Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF469606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 04:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yUTCLP6v;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b8QhtM8T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AOG8HUZz8XxdrGd9dGbJMFpZyN7UoKyKrEdlEI23Z9M=; b=yUTCLP6v3dn6n/
	ptxRgOGMk0sBuqNGyT6EDQRcL3PbYSwheA3e/ZTl8IpS28FEFa885ATgCT8Hzw59ZRp4qrUcnI2hw
	H2CdCFHHjWNEN6Z3rkyFsh8NIk8wQoV/KsWd9MwHjYhYpkgJiRChlrJy98zzA/2OZgMuPVSJ3qgF9
	jom0Q4CjBf1gY6amHw5EoLpsSIVkFrfySiDQj+oL0WZAeSQaLX3uzpkrgxeIjD7vEg6L4NY4/PWS2
	2frmL79cb1J/NiRfgRhgJgKWya4rWV4qqpVUFNdfNZ/9FtYnLKbRu+hG1CA8QwgbwyB5MyVOEp+TZ
	BedEwAy1t+y3EiOPLRrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN0Xl-0000000CvzY-4BqH;
	Sat, 31 Oct 2026 04:18:14 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN0Xi-0000000CvzD-3ncA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 04:18:13 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-533202fe429so138651cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 21:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793420289; cv=none;
        d=google.com; s=arc-20260327;
        b=ODux/dpZdvJT8PW9+zQXK/5SItJohJpf/3O0rK8WQ9XFYdYAs2QeCy03k3DfUhmk0j
         sL63pvixAZPdKKysOzi2tFUtpWE1PU5J9E3M6H31bhGZ3Fz6s8Wct6LpU1xq7+2WKw2G
         lVUpXap+ccdFuQ55umki3mHiN6Lh4queHuDPfhvpfUwcJzK0+pY0fRGTKOtmdv4+1YVv
         GAxuEgcJiVrkKd0HJ7jw8dokH+Y1YRgDhH9yh7vmzQM8Va+Dnc5Yl8/4lgM7sdShHUDL
         HvmUSXPN/x4gUovsvvuDDxnQ16XpVcdBM5OwKcFuWjIxZWixF1naDg0hLe3YfcteZUoW
         KjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AOG8HUZz8XxdrGd9dGbJMFpZyN7UoKyKrEdlEI23Z9M=;
        fh=zDN36Jcvey4iGGOhqUXRerGUo2vlvQBiSauKyA4NWo4=;
        b=CFM9kEZOiEz4FTIJSX8UNuPYYuD3VDbO5LNFXtkaMjcD8oGiFQlYh/KlaNZLWTcGQ+
         kEmoclCZ4RtKFC+gQ9fiylizSeFlZROVlpa97dv9towO1WodliIHNWlrDUr35KixmkZ1
         ghudas8xHb/x2GT99kGSbJFvPU0ZgLvRc1TCSMVAptHLIl6AKthAS16ViD2ZTibh8/fX
         l63Ej6yQpDS4iVM8M9ONFu7rGy4zFZfFWAYg21YJDcdEjfP+zbXl0vtOkHugNtRWxgF/
         484qPuzqT1LN/2F98hRxsyKcxdToWLp/Jd9yYkDEP4syCTvDwvRUa+NRsxq6FKsBC4x1
         2ymw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793420289; x=1794025089; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AOG8HUZz8XxdrGd9dGbJMFpZyN7UoKyKrEdlEI23Z9M=;
        b=b8QhtM8TN3wi+SjoMfvwxhxhonhsAko3BB+A3ZxcLsamKx6laJF6rRHT/xM+C0chir
         4UigkQiHBmxwQ1wwOrxJXH8xzHr45LdvrNOKKEf5QMJYr6Gn0PrsgFUJIIuVDgBG36rO
         Mt8Rb9B12DmGEk5hiEpgdmJ7ULUJEV/oZ2gPusX7e6JvrAxU6k60TfXpQ7Yov8k83s/0
         P+94l7efZ3YK+z1HFP4Ok8A546jwpp/ZFLNUo1NVhECmhjl0Hhk1AFc94Jrlrvs8k+gu
         BnZa0oXdba1e+nfra1V38t/XfLHyvth4X+hRx+1bPKDxTNVxCsXnDXysJeHnH6uVRl/0
         dznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793420289; x=1794025089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOG8HUZz8XxdrGd9dGbJMFpZyN7UoKyKrEdlEI23Z9M=;
        b=miHFMNtofxkhnWanaNezZ//94Zxx6Ra+kodIVFCkvj6wAbxaEiPBg3MobqAE0p1mKT
         cW2m/z+7jz0Ai0dY0XpsH71/nxxb9y5xSSl/B9u4gYzl0gcUjIwSrJNkjP6p25RYoxwH
         tvSqPWZcOyUQYFG2BcESQl4KwQVHX8Ahww4d+xR9FGcXAQRdjWjEMoKKWtBiMBM1G33f
         4Jfdn87dyMU2/+hGiDwlx7BGZYErtKor1WX29OjqTLYn3sQcDjjc32VkdJzA03hvdiTH
         e2kuuKkWf7wXE6C9E2uWmE7GRoCDnsbTDOEENb7LD4+OryhmDywYOr1GpVRZPnNMAj8C
         B6Wg==
X-Forwarded-Encrypted: i=1; AKwUvBwe452BNZFPrXejg3llG/kk8x2cZW7/6pI+4inA95ReCOGwiZqhpL1eQsnHqcC9gKKUpBDvBauiyXcPh3o/Cft7@lists.infradead.org
X-Gm-Message-State: AFq9FYKcwNrEWqETnLd2V/mIh09xIJoQ78nuc5gBf4uoUGZk+9SnAeLw
	LCzQSAYy6ddCiD58RMOjg1X8EGP0Zamt3RXQDFlYV8Kolhy8rl3hsmc9CAg3N3mDknOc8NumjV7
	43FIss1DiIdejcMlOYH2Da5PrJ3idGstqsIpThKLe
X-Gm-Gg: AYBFou1juF55k0F/7jlXhMr45eV8aeHmZylRmEchfMEZUHv5YhFoaeb2uRT6nB1LjJW
	5Q8n4wgJjoahz5Mnps/ELA3KSmLR4fb+eeXNxqJRU+q6tlfbJQ4QmopvAkyJffOkIVZA6QQOrMO
	foN2sNBggLzxzJmV90c+e8H2+KqEB4qbqjTE/sb0Fz8VVPl7bmsk9g+OAit03L7DLVyL2RtybiY
	kvF1a8kZLuMG8MTfVCE9xZuuvAOKjeqPkNjq/spM1GL8L/gj6r5Gc6VfKMCWPLghfefk3zfSlr4
	BtuGjGwgAUMWnP17oddyCfpX1VNNv0PjYBH5kzpiYV9BL9tmdYnShIe7hpNc2i+l1c1V7EfaoUE
	1+yOm+vUm3MX2r3G3CiktJ2lCXA8DG5q6ePw+pw==
X-Received: by 2002:ac8:690d:0:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-5414d92c15bmr56455931cf.8.1793420288686; Fri, 30 Oct 2026
 21:18:08 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030174816.1544471-1-bwicaksono@nvidia.com>
 <CAP-5=fUEmNrREh-ipxYMiStr5xCakGDBZW8OmAj1rhACs8qaZw@mail.gmail.com> <SA1PR12MB6773B13BD3EB2B60FBED6013A06D2@SA1PR12MB6773.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB6773B13BD3EB2B60FBED6013A06D2@SA1PR12MB6773.namprd12.prod.outlook.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 30 Oct 2026 21:17:56 -0700
X-Gm-Features: AclHuK_OY8SV1nYCVpefSonLzrvbO-Js_d73IE_n_dvtQxEV32bei9opm-np6oo
Message-ID: <CAP-5=fWJn=Fws6ew_HCsxVo6Bcqvvgn-8g=21+nvoEHA5GhLKA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] perf: Add NVIDIA Tegra410 uncore PMU events and metrics
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: Will Deacon <will@kernel.org>, "acme@kernel.org" <acme@kernel.org>, 
	"namhyung@kernel.org" <namhyung@kernel.org>, "ctshao@google.com" <ctshao@google.com>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vikram Sethi <vsethi@nvidia.com>, 
	Rich Wiley <rwiley@nvidia.com>, Sean Kelley <skelley@nvidia.com>, Matt Ochs <mochs@nvidia.com>, 
	Raj Joshi <rajjoshi@nvidia.com>, Thierry Reding <treding@nvidia.com>, 
	Jon Hunter <jonathanh@nvidia.com>, "john.garry@linux.dev" <john.garry@linux.dev>, 
	"james.clark@linaro.org" <james.clark@linaro.org>, "mike.leach@arm.com" <mike.leach@arm.com>, 
	"leo.yan@linux.dev" <leo.yan@linux.dev>, "mark.rutland@arm.com" <mark.rutland@arm.com>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_211811_031226_B75959AE 
X-CRM114-Status: GOOD (  45.22  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 3:19=E2=80=AFPM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
> > -----Original Message-----
> > From: Ian Rogers <irogers@google.com>
> > Sent: Friday, October 30, 2026 6:07 PM
> > To: Besar Wicaksono <bwicaksono@nvidia.com>
> > Cc: acme@kernel.org; namhyung@kernel.org; ctshao@google.com; linux-
> > tegra@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-perf=
-
> > users@vger.kernel.org; linux-kernel@vger.kernel.org; Vikram Sethi
> > <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Sean Kelley
> > <skelley@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Raj Joshi
> > <rajjoshi@nvidia.com>; Thierry Reding <treding@nvidia.com>; Jon Hunter
> > <jonathanh@nvidia.com>; john.garry@linux.dev; will@kernel.org;
> > james.clark@linaro.org; mike.leach@arm.com; leo.yan@linux.dev;
> > mark.rutland@arm.com; alexander.shishkin@linux.intel.com;
> > jolsa@kernel.org; adrian.hunter@intel.com
> > Subject: Re: [PATCH v2 0/9] perf: Add NVIDIA Tegra410 uncore PMU events
> > and metrics
> >
> > External email: Use caution opening links or attachments
> >
> >
> > On Fri, Oct 30, 2026 at 10:49=E2=80=AFAM Besar Wicaksono
> > <bwicaksono@nvidia.com> wrote:
> > >
> > > Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> > > PMUs, and fix perf's aggregation of PMU instances that are numbered i=
n
> > > more than one parts in their name.
> > >
> > > The series covers the UCF, PCIe, PCIe target, CPU memory latency, and
> > > chip-to-chip interconnect PMUs. It provides symbolic names for the ra=
w
> > > event encodings and metrics for bandwidth, frequency, and average rea=
d
> > > latency.
> > >
> > > The PCIe and PCIe target PMUs are named
> > nvidia_pcie_pmu_<socket>_rc_<rc>
> > > and nvidia_pcie_tgt_pmu_<socket>_rc_<rc>. Their json Unit uses the
> > > existing comma-separated form ("nvidia_pcie_pmu_,rc_"), but perf only
> > > merged instances that differ in the trailing number, so these events =
and
> > > metrics gave one result per socket and were reported incorrectly (e.g=
.
> > > with --metric-only), as discussed in v1. Patches 6-9 fix this:
> > >
> > > - Patch 6 adds a check of the cpumasks of all merged PMU instances to=
 the
> > >   zero-count skip in perf stat, so a socket that counts nothing shows=
 0
> > >   instead of having its row hidden.
> > > - Patch 7 merges PMU instances that match the same comma-separated
> > json
> > >   Unit. This also applies to the HiSilicon hisi_sccl PMUs, which use =
the
> > >   same json form; not tested on HiSilicon hardware.
> > > - Patch 8 labels a merged uncore counter after all of its PMUs, e.g.
> > >   nvidia_pcie_pmu_*_rc_*/cycles/ or nvidia_ucf_pmu/cycles/, instead o=
f
> > >   after the first instance, such as nvidia_pcie_pmu_0_rc_0/cycles/.
> > >   Output with --no-aggr is unchanged.
> > > - Patch 9 describes these PMU names in the ABI document.
> > >
> > > Changes in v2:
> > > - Move the uncore JSON out of the sys directory and remove the
> > >   "Compat" fields. Thanks to Ian Rogers for the feedback.
> > > - Drop "perf jevents: Process model files before sys subdirectories",
> > >   which this series no longer needs.
> > > - Add UCF SLC and memory bandwidth metrics from all sources to local
> > >   CMEM (read, write and read+write) and from local sources to local
> > >   CMEM and to remote memory, PCIe bandwidth metrics to local
> > >   destinations, and read+write bandwidth metrics for UCF SLC, UCF
> > >   memory and PCIe. Thanks to Chun-Tse Shao for the suggestion.
> > > - Add patches 6-9 to fix the PCIe instance aggregation. Thanks to Ian
> > >   Rogers and Chun-Tse Shao for the pointers.
> > >
> > > v1: https://lore.kernel.org/all/20261019164241.403644-1-
> > bwicaksono@nvidia.com/
> >
> > Why don't we look to fix code in drivers/perf? This series introduces
> > PMU instances, overloads the meaning of aliases, and a bunch of other
> > silly complexity due to poor reviews and maintenance of drivers/perf -
> > specifically by not pointing out the ABI issues. Isn't this a
> > straightforward, whoops we did a bad suffix and here's the patch to
> > rename our PMU in the driver? Throwing more complexity at the problem
> > doesn't feel like the right fix.
>
> Hi Ian,
>
> My apologies for the names not following perf's PMU naming convention.
> I will be more careful about this in future.
>
> These names (nvidia_pcie_pmu_<socket>_rc_<root complex> and
> nvidia_pcie_tgt_pmu_<socket>_rc_<root complex>) have been upstream
> since v7.1, and several customers already rely on them. Renaming them in
> the driver would break their use case.

It only breaks their use case if they name the PMU with an event. You
have multiple naming conventions for the PMU and only those involving
multiple sockets have a broken suffix.

> Given that, what would you suggest as the next step? Would handling these
> names in perf, as in patch 7 and 8, be reasonable, or do you have another
> approach in mind?

So we don't need a new abstraction, I've been reducing aggregation
abstractions in the perf tool. As I pointed to previously, the suffix
is computed with pmu_name_len_no_suffix:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/pmus.c?h=3Dperf-tools-next#n66
So you can do something like (untested):
```
size_t pmu_name_len_no_suffix(const char *str)
{
  if (strstarts(str, "nvidia_") && strstr(str, "_rc_")) {
    // nvidia PMU with a non-ABI suffix of nvidia_..._[0-9]+_rc_[0-9]+
    const char *p =3D str + strlen(str);
    int n =3D 3;
    while(p > str && n > 0) {
       if (*p-- =3D=3D '_')
          n--
     }
     return p - str;
  }
  // The rest of the existing pmu_name_len_no_suffix code.
  ...
}
```
I'd much rather we didn't add bespoke behavior to the tool for every
new PMU. This happened previously when PMUs were merged in
drivers/perf with hex instead of numeric suffixes. We already handle
certain PMUs specially due to their lack of hotplug support:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/arch/arm/util/pmu.c?h=3Dperf-tools-next#n41
And due to event name fiascos:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/builtin-record.c?h=3Dperf-tools-next#n1395
At some point, perf's internals become so forked due to mismatched
conventions that every code path will have a variant. This saddens me
as something that we've much improved this year is being able to say
`perf stat record` on one machine type and then `perf stat report` on
another.

Thanks,
Ian

> Will, do you have any comment on this?
>
> Thanks,
> Besar
>
> >
> > Thanks,
> > Ian
> >
> > > Besar Wicaksono (9):
> > >   perf jevents: Add support for NVIDIA Tegra410 UCF PMU aliasing
> > >   perf jevents: Add support for NVIDIA Tegra410 PCIE PMU aliasing
> > >   perf jevents: Add support for NVIDIA Tegra410 PCIE-TGT PMU aliasing
> > >   perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latency
> > PMU
> > >     aliasing
> > >   perf jevents: Add support for NVIDIA Tegra410 C2C PMU aliasing
> > >   perf stat: Check merged PMU instance's cpumasks when skipping zero
> > >     counts
> > >   perf pmu: Merge PMU instances that match the same comma-separated
> > json
> > >     Unit
> > >   perf evsel: Name a merged uncore counter after all of its PMUs
> > >   perf Documentation: Describe PMU names numbered in more than one
> > place
> > >
> > >  .../testing/sysfs-bus-event_source-devices    |  14 +
> > >  .../arm64/nvidia/t410/uncore-cpu_mem.json     |  43 +
> > >  .../arm64/nvidia/t410/uncore-nvclink.json     |  67 ++
> > >  .../arm64/nvidia/t410/uncore-nvdlink.json     |  43 +
> > >  .../arm64/nvidia/t410/uncore-nvlink_c2c.json  | 115 +++
> > >  .../arch/arm64/nvidia/t410/uncore-pcie.json   | 249 ++++++
> > >  .../arm64/nvidia/t410/uncore-pcie_tgt.json    |  83 ++
> > >  .../arch/arm64/nvidia/t410/uncore-ucf.json    | 764
> > ++++++++++++++++++
> > >  tools/perf/tests/pmu.c                        | 134 +++
> > >  tools/perf/util/evlist.c                      |   2 +-
> > >  tools/perf/util/evsel.c                       |  83 +-
> > >  tools/perf/util/evsel.h                       |   2 +-
> > >  tools/perf/util/parse-events.c                |   2 +-
> > >  tools/perf/util/pmu.c                         |  65 ++
> > >  tools/perf/util/pmu.h                         |   9 +
> > >  tools/perf/util/pmus.c                        |  47 ++
> > >  tools/perf/util/pmus.h                        |   1 +
> > >  tools/perf/util/stat-display.c                |  20 +
> > >  18 files changed, 1737 insertions(+), 6 deletions(-)
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/uncore-cpu_mem.json
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/uncore-nvclink.json
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/uncore-nvdlink.json
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/uncore-nvlink_c2c.json
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/uncore-pcie.json
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/uncore-pcie_tgt.json
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/uncore-ucf.json
> > >
> > > --
> > > 2.43.0
> > >

