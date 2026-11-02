Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A63606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gwaS1hnG;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ljPQypVd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y6R/7JiyY+QNpdkHpLxoucL3TEKilfqNsAl22fI4rCc=; b=gwaS1hnGGXkSfH
	Kp5DP7NxsMLxb2qUJdROtdW5YAqT8b560kdJzr1ccPO0iHB7qwAnksUj4lF1VOMhGU7qQSlKI+TEY
	XM2Ff3ue/VEnJJ5Jj0xI6u8e41blOEa5OU5YXlSoL1+dhv0yPoNCMRJVWw38EXwCnF7JxXzwJx2+y
	Woxh+1tp8UdZQPVaC4eI17Bq9UzwBELKcoNTe9WGxF5ES/tIqvW/bwjSXp191LgqWM6wCU/kjaxj6
	X2SDBMRKk/rCgfhsjEG8KNwm21uJ9HTG4T56J8/WV4eZgVNP1hXsXc/tDcmDH5CYl/wVewNLY6OLc
	xNe00hE/Rm8NeRyceN3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1q8-00000000hrE-286H;
	Mon, 02 Nov 2026 23:53:24 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1q5-00000000hqt-1xGh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:53:23 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5383c97c8cfso38491cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 15:53:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793663600; cv=none;
        d=google.com; s=arc-20260327;
        b=FvUKldGVZndcqfsLKgbzsMLa6gdim3BwW3Z8GEbh2rpwDVibtXF+wheu2kfYmWIU5e
         2pWlKUjrGt7QMFw7VWVqTPlcbDJgk4r9GegeFXuSjWAXGjCY31tnFRRhodV5PCMNGrxr
         10VbQtA4QrRC03QkLQG0+Jy55HksdrMIg3jmptqpTHfqBRx4nd+elJOuKddQgE99EPEv
         gObDtSprOkZ2RQSPoDUjETMbIhc0Yc/7Jze7ydeXoVS0jpME8XGZ9eus8zg+NbuPjFKv
         U225VnISWcC/cWDDlw1VJ0CFj8CwD258r4cWYCuT08XPO+vO7dU47CQ582HxJlHZh0Df
         V6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y6R/7JiyY+QNpdkHpLxoucL3TEKilfqNsAl22fI4rCc=;
        fh=32XOoBb9LnXfpcxj7pKbQMOG3wxyndh+viKdR4mffL0=;
        b=Qg4i3w6NeOoACRMX48R2/H4qVB9IkytLHYiFtWvNYr4T3xL2fK0QBmWeDlHqrtQC5C
         wfNIL4x22DPjyXhm2M15I1ujk+kJjGzLbHzUzVlLQwjFK01vD35bZ5e7PoRYFQAmNvH2
         aoI8HlGRjx1Y4ZjjtzggKja5WE1kLgeh1szsC0g9rZq1zcJrolM/+FqlerRfqdTmdX18
         2PV71bW9ijAfulgiKX0HnmXRihmq+Enwj+LkRdn10omeR6vB11A51iBX0now54l5Jv+2
         Lszq3D9rN2vtNKaOnLaCa0H+UUDxVYiVsG1YjuKdsDDtm44HsvS6qJzHYVGMF7GsBCUl
         nCGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793663600; x=1794268400; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6R/7JiyY+QNpdkHpLxoucL3TEKilfqNsAl22fI4rCc=;
        b=ljPQypVdjGfRvd781QA58SFPwCMK6hpoG0eSxL72UtrZNbBMgDBcTgDDIq+hLRDIva
         tdyZoMKb8ld2djxQUpF+DH1q/p4/ZorC4wGdaznAL26UDk68xGIEaPidJ60o6UqAvN8+
         38wiB0TbtSoU3iAFlp/fZf3aHIv67OboXg7mR8Qih947zQaDEK8GCGtTDjsCAhDHr5sh
         XyO0XttfkqZxSN/NXF3mLUQDLZCRBTmkxvig5IE1kyeIpHdFy4w5HgzwL6EgMvLntRGz
         2aNyFlrG3Q9dcSYfggEPrHBXGz6YlRfxo//KBwAvVjLOvODoQP5wlNLJYk13meVOH6DI
         xkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793663600; x=1794268400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6R/7JiyY+QNpdkHpLxoucL3TEKilfqNsAl22fI4rCc=;
        b=TDq8iFNnYCR5xtvJrwfBUnFp6rY1Hy5HhkDdSF1XPJ+vRoScvC/pO7xBDBSkkzKAfg
         mGLd5WwVL9Ko158S7NhDEorxkPCKV/OqJZWFdYs76cJEdnENrXJjd9WNDQEs66YHTtay
         Rtt2ZjL4C004mr8i1K9Z34DgqGZs38r4G1rp3/QBFsF1SVyxUnaBdpTAwfW1wZ8wKHva
         xPbrO52gVt58EHTLe2zyQz94A8+NCVbBV1fljagTlD8En4b+0yUAbIHCnURtWccKBAtr
         fOTTCO9LMoS53lRPCETZ4g4phJgJy88gAvLhExBuUF/hcJnVLTkDUU464EIfGvJe49UP
         Xp5A==
X-Forwarded-Encrypted: i=1; AKwUvBxfSttx+z8p9BWXqH2skVlkgxeCMBcMj/LtI+sEYMTpNOeeR/UrZE04NgFuEz1S46ChTXSfnJdw9FWi0zO0Jo4m@lists.infradead.org
X-Gm-Message-State: AFq9FYI+2WPv9tpj76rTfvW90+AeMEpVfDdjpGyfsvhP0sq1UMybABsh
	yWiz3j2yXqS5mODuwzImxLVs9sXsHpwOsMbF1sdhZ67iAEriBcyZSJUgmNDKkZWB8v2TaH1sKIq
	RwuNA48/MEBYvU5Vr0jAA0Yd1b3hj4tV52/CS/X03
X-Gm-Gg: AYBFou2OdJ5MYbUV8WixMAsYV3yXPxQfNgTHXxU51W3EPyeEjcWKDHGwLGmIZ1RRRs3
	PlnMlHFFI09Z0T9AoTGMxPOh0QV6PNErM56UAtu9FranC9/9jQtXgITNiseO/V+FWczqhIUJhnV
	2PHh94Qjf/R/adDrGdCs8E3Z43M1rLUl/cSGESQNWf45PICW3PkvenjAv9ndLyf6G3BO7/kXXmy
	tZja8F/+4RxGMiKx6oDRLYOJb89sfcfzZQ5YWe0y7Jq7mRF4MJsRoKgaJld6cc8lUGiAuESj1QQ
	qsnqmx6pvocl7t4UkWzVxmyfjspRMmlwcf4QcxsojWCHDWWM7OQtKZJcVPNwiweA1JnPnCDbzDm
	yVN8Jaw/O1H1/6L2DPE5HJ1rNJnw2BCKlwFfyRQ==
X-Received: by 2002:a05:622a:1c11:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-549b675d2f3mr2787571cf.0.1793663599242; Mon, 02 Nov 2026
 15:53:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030174816.1544471-1-bwicaksono@nvidia.com>
 <CAP-5=fUEmNrREh-ipxYMiStr5xCakGDBZW8OmAj1rhACs8qaZw@mail.gmail.com>
 <SA1PR12MB6773B13BD3EB2B60FBED6013A06D2@SA1PR12MB6773.namprd12.prod.outlook.com>
 <CAP-5=fWJn=Fws6ew_HCsxVo6Bcqvvgn-8g=21+nvoEHA5GhLKA@mail.gmail.com> <SA1PR12MB6773A9E13CCFD7322501EE0BA06A2@SA1PR12MB6773.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB6773A9E13CCFD7322501EE0BA06A2@SA1PR12MB6773.namprd12.prod.outlook.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 2 Nov 2026 15:53:07 -0800
X-Gm-Features: AclHuK9AmugvMqLXDCOPc8pKZIzILBtJSEV_O6t_Xr6tdxsqP1qTjRrJzqawtBs
Message-ID: <CAP-5=fWKC7GD43BebLd_nP+TM87aS0fBKg2o=q-C156tAgCLGQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261102_155321_582689_9C4E07E5 
X-CRM114-Status: GOOD (  54.94  )
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

On Mon, Nov 2, 2026 at 3:08=E2=80=AFPM Besar Wicaksono <bwicaksono@nvidia.c=
om> wrote:
>
> > -----Original Message-----
> > From: Ian Rogers <irogers@google.com>
> > Sent: Saturday, October 31, 2026 4:18 AM
> > To: Besar Wicaksono <bwicaksono@nvidia.com>
> > Cc: Will Deacon <will@kernel.org>; acme@kernel.org;
> > namhyung@kernel.org; ctshao@google.com; linux-tegra@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linux-perf-users@vger.kernel.org;
> > linux-kernel@vger.kernel.org; Vikram Sethi <vsethi@nvidia.com>; Rich Wi=
ley
> > <rwiley@nvidia.com>; Sean Kelley <skelley@nvidia.com>; Matt Ochs
> > <mochs@nvidia.com>; Raj Joshi <rajjoshi@nvidia.com>; Thierry Reding
> > <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>;
> > john.garry@linux.dev; james.clark@linaro.org; mike.leach@arm.com;
> > leo.yan@linux.dev; mark.rutland@arm.com;
> > alexander.shishkin@linux.intel.com; jolsa@kernel.org;
> > adrian.hunter@intel.com
> > Subject: Re: [PATCH v2 0/9] perf: Add NVIDIA Tegra410 uncore PMU events
> > and metrics
> >
> > External email: Use caution opening links or attachments
> >
> >
> > On Fri, Oct 30, 2026 at 3:19=E2=80=AFPM Besar Wicaksono
> > <bwicaksono@nvidia.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: Ian Rogers <irogers@google.com>
> > > > Sent: Friday, October 30, 2026 6:07 PM
> > > > To: Besar Wicaksono <bwicaksono@nvidia.com>
> > > > Cc: acme@kernel.org; namhyung@kernel.org; ctshao@google.com;
> > linux-
> > > > tegra@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-=
perf-
> > > > users@vger.kernel.org; linux-kernel@vger.kernel.org; Vikram Sethi
> > > > <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Sean Kelley
> > > > <skelley@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Raj Joshi
> > > > <rajjoshi@nvidia.com>; Thierry Reding <treding@nvidia.com>; Jon
> > Hunter
> > > > <jonathanh@nvidia.com>; john.garry@linux.dev; will@kernel.org;
> > > > james.clark@linaro.org; mike.leach@arm.com; leo.yan@linux.dev;
> > > > mark.rutland@arm.com; alexander.shishkin@linux.intel.com;
> > > > jolsa@kernel.org; adrian.hunter@intel.com
> > > > Subject: Re: [PATCH v2 0/9] perf: Add NVIDIA Tegra410 uncore PMU
> > events
> > > > and metrics
> > > >
> > > > External email: Use caution opening links or attachments
> > > >
> > > >
> > > > On Fri, Oct 30, 2026 at 10:49=E2=80=AFAM Besar Wicaksono
> > > > <bwicaksono@nvidia.com> wrote:
> > > > >
> > > > > Add event aliases and derived metrics for the NVIDIA Tegra410 unc=
ore
> > > > > PMUs, and fix perf's aggregation of PMU instances that are number=
ed
> > in
> > > > > more than one parts in their name.
> > > > >
> > > > > The series covers the UCF, PCIe, PCIe target, CPU memory latency,=
 and
> > > > > chip-to-chip interconnect PMUs. It provides symbolic names for th=
e
> > raw
> > > > > event encodings and metrics for bandwidth, frequency, and average
> > read
> > > > > latency.
> > > > >
> > > > > The PCIe and PCIe target PMUs are named
> > > > nvidia_pcie_pmu_<socket>_rc_<rc>
> > > > > and nvidia_pcie_tgt_pmu_<socket>_rc_<rc>. Their json Unit uses th=
e
> > > > > existing comma-separated form ("nvidia_pcie_pmu_,rc_"), but perf
> > only
> > > > > merged instances that differ in the trailing number, so these eve=
nts and
> > > > > metrics gave one result per socket and were reported incorrectly =
(e.g.
> > > > > with --metric-only), as discussed in v1. Patches 6-9 fix this:
> > > > >
> > > > > - Patch 6 adds a check of the cpumasks of all merged PMU instance=
s to
> > the
> > > > >   zero-count skip in perf stat, so a socket that counts nothing s=
hows 0
> > > > >   instead of having its row hidden.
> > > > > - Patch 7 merges PMU instances that match the same comma-
> > separated
> > > > json
> > > > >   Unit. This also applies to the HiSilicon hisi_sccl PMUs, which =
use the
> > > > >   same json form; not tested on HiSilicon hardware.
> > > > > - Patch 8 labels a merged uncore counter after all of its PMUs, e=
.g.
> > > > >   nvidia_pcie_pmu_*_rc_*/cycles/ or nvidia_ucf_pmu/cycles/, inste=
ad
> > of
> > > > >   after the first instance, such as nvidia_pcie_pmu_0_rc_0/cycles=
/.
> > > > >   Output with --no-aggr is unchanged.
> > > > > - Patch 9 describes these PMU names in the ABI document.
> > > > >
> > > > > Changes in v2:
> > > > > - Move the uncore JSON out of the sys directory and remove the
> > > > >   "Compat" fields. Thanks to Ian Rogers for the feedback.
> > > > > - Drop "perf jevents: Process model files before sys subdirectori=
es",
> > > > >   which this series no longer needs.
> > > > > - Add UCF SLC and memory bandwidth metrics from all sources to lo=
cal
> > > > >   CMEM (read, write and read+write) and from local sources to loc=
al
> > > > >   CMEM and to remote memory, PCIe bandwidth metrics to local
> > > > >   destinations, and read+write bandwidth metrics for UCF SLC, UCF
> > > > >   memory and PCIe. Thanks to Chun-Tse Shao for the suggestion.
> > > > > - Add patches 6-9 to fix the PCIe instance aggregation. Thanks to=
 Ian
> > > > >   Rogers and Chun-Tse Shao for the pointers.
> > > > >
> > > > > v1: https://lore.kernel.org/all/20261019164241.403644-1-
> > > > bwicaksono@nvidia.com/
> > > >
> > > > Why don't we look to fix code in drivers/perf? This series introduc=
es
> > > > PMU instances, overloads the meaning of aliases, and a bunch of oth=
er
> > > > silly complexity due to poor reviews and maintenance of drivers/per=
f -
> > > > specifically by not pointing out the ABI issues. Isn't this a
> > > > straightforward, whoops we did a bad suffix and here's the patch to
> > > > rename our PMU in the driver? Throwing more complexity at the
> > problem
> > > > doesn't feel like the right fix.
> > >
> > > Hi Ian,
> > >
> > > My apologies for the names not following perf's PMU naming convention=
.
> > > I will be more careful about this in future.
> > >
> > > These names (nvidia_pcie_pmu_<socket>_rc_<root complex> and
> > > nvidia_pcie_tgt_pmu_<socket>_rc_<root complex>) have been upstream
> > > since v7.1, and several customers already rely on them. Renaming them=
 in
> > > the driver would break their use case.
> >
> > It only breaks their use case if they name the PMU with an event. You
> > have multiple naming conventions for the PMU and only those involving
> > multiple sockets have a broken suffix.
> >
>
> Naming the PMU in the event is currently the main way to use the PCIE PMU=
s,
> which we can't break.
>
> > > Given that, what would you suggest as the next step? Would handling
> > these
> > > names in perf, as in patch 7 and 8, be reasonable, or do you have ano=
ther
> > > approach in mind?
> >
> > So we don't need a new abstraction, I've been reducing aggregation
> > abstractions in the perf tool. As I pointed to previously, the suffix
> > is computed with pmu_name_len_no_suffix:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-
> > next.git/tree/tools/perf/util/pmus.c?h=3Dperf-tools-next#n66
> > So you can do something like (untested):
> > ```
> > size_t pmu_name_len_no_suffix(const char *str)
> > {
> >   if (strstarts(str, "nvidia_") && strstr(str, "_rc_")) {
> >     // nvidia PMU with a non-ABI suffix of nvidia_..._[0-9]+_rc_[0-9]+
> >     const char *p =3D str + strlen(str);
> >     int n =3D 3;
> >     while(p > str && n > 0) {
> >        if (*p-- =3D=3D '_')
> >           n--
> >      }
> >      return p - str;
> >   }
> >   // The rest of the existing pmu_name_len_no_suffix code.
> >   ...
> > }
> > ```
>
> Thanks for the suggestion. I can replace the changes in patch 7 and 8
> with NVIDIA PCIE RC specific check in pmu_name_len_no_suffix().
>
> While trying it, I noticed two side effects:
> 1. perf list now combines the nvidia_pcie_pmu_<socket>_rc_<rc> PMUs and
>    shows their events as nvidia_pcie_pmu/<event>/, but "perf stat" doesn'=
t
>    accept just "nvidia_pcie_pmu" on the command line, e.g.
>    "perf stat -e nvidia_pcie_pmu/rd_req/" can't find the PMU.
> 2. After fixing no.1, "perf stat -A -a  -e nvidia_pcie_pmu/rd_req/"
>    lists the result in sysfs directory order. On my system, it gives the
>    result for RC 0, 5, 3, 1, 4, 2.
>
> Both look like they can be handled with a similar NVIDIA specific check
> in perf_pmu__match_wildcard() and pmu_name_cmp():
>
> /* perf_pmu__match_wildcard() */
> if (strstarts(pmu_name, "nvidia") && strstr(pmu_name, "_rc_")) {
>         /* NVIDIA PMU with a non-ABI suffix of nvidia_..._[0-9]+_rc_[0-9]=
+. */
>         if (tok_len =3D=3D pmu_name_len_no_suffix(pmu_name) && !strncmp(p=
mu_name, tok, tok_len))
>                 return true;
> }
>
> /* pmu_name_cmp()*/
> if (lhs_num =3D=3D rhs_num && strstarts(lhs_pmu_name, "nvidia")) {
>         /*
>          * NVIDIA PMU with a non-ABI suffix of nvidia_..._[0-9]+_rc_[0-9]=
+:
>          * compare the RC too.
>          */
>         const char *lhs_rc =3D strstr(lhs_pmu_name, "_rc_");
>         const char *rhs_rc =3D strstr(rhs_pmu_name, "_rc_");
>         if (lhs_rc && rhs_rc) {
>                 lhs_num =3D strtoull(lhs_rc + 4, NULL, 10);
>                 rhs_num =3D strtoull(rhs_rc + 4, NULL, 10);
>         }
> }
>
> What do you think about these additional changes?

Sounds good to me. I really hate we didn't fix cycles -> cpu_cycles
and instead have to carry:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/builtin-record.c?id=3Dc5a244bf17caf2de22f9e100832b75f72b3=
1d3e6#n1389
given the other event is called bus_cycles and the documentation
literally calls the event CPU cycles (and Linus wants `perf record -e
cycles` not to complain).

Things in Linux do get fixed over time. For example, PMU devices in
/sys/devices/ will one day disappear and only be accessible under
/sys/bus/event_source/devices . Given the PMU name only appeared in
January IIRC, it hasn't appeared in an LTS Linux release yet. So, yes,
someone running a non-LTS kernel on a dual socket machine and using
the PMU name in the event name would be impacted by renaming the PMU.
The pain I feel about that will be momentary, while carrying around
NVIDIA non-ABI specific PMU suffix code will be long lasting.

Thanks,
Ian

> Regards,
> Besar
>
> > I'd much rather we didn't add bespoke behavior to the tool for every
> > new PMU. This happened previously when PMUs were merged in
> > drivers/perf with hex instead of numeric suffixes. We already handle
> > certain PMUs specially due to their lack of hotplug support:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-
> > next.git/tree/tools/perf/arch/arm/util/pmu.c?h=3Dperf-tools-next#n41
> > And due to event name fiascos:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-
> > next.git/tree/tools/perf/builtin-record.c?h=3Dperf-tools-next#n1395
> > At some point, perf's internals become so forked due to mismatched
> > conventions that every code path will have a variant. This saddens me
> > as something that we've much improved this year is being able to say
> > `perf stat record` on one machine type and then `perf stat report` on
> > another.
> >
> > Thanks,
> > Ian
> >
> > > Will, do you have any comment on this?
> > >
> > > Thanks,
> > > Besar
> > >
> > > >
> > > > Thanks,
> > > > Ian
> > > >
> > > > > Besar Wicaksono (9):
> > > > >   perf jevents: Add support for NVIDIA Tegra410 UCF PMU aliasing
> > > > >   perf jevents: Add support for NVIDIA Tegra410 PCIE PMU aliasing
> > > > >   perf jevents: Add support for NVIDIA Tegra410 PCIE-TGT PMU alia=
sing
> > > > >   perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latenc=
y
> > > > PMU
> > > > >     aliasing
> > > > >   perf jevents: Add support for NVIDIA Tegra410 C2C PMU aliasing
> > > > >   perf stat: Check merged PMU instance's cpumasks when skipping z=
ero
> > > > >     counts
> > > > >   perf pmu: Merge PMU instances that match the same comma-
> > separated
> > > > json
> > > > >     Unit
> > > > >   perf evsel: Name a merged uncore counter after all of its PMUs
> > > > >   perf Documentation: Describe PMU names numbered in more than
> > one
> > > > place
> > > > >
> > > > >  .../testing/sysfs-bus-event_source-devices    |  14 +
> > > > >  .../arm64/nvidia/t410/uncore-cpu_mem.json     |  43 +
> > > > >  .../arm64/nvidia/t410/uncore-nvclink.json     |  67 ++
> > > > >  .../arm64/nvidia/t410/uncore-nvdlink.json     |  43 +
> > > > >  .../arm64/nvidia/t410/uncore-nvlink_c2c.json  | 115 +++
> > > > >  .../arch/arm64/nvidia/t410/uncore-pcie.json   | 249 ++++++
> > > > >  .../arm64/nvidia/t410/uncore-pcie_tgt.json    |  83 ++
> > > > >  .../arch/arm64/nvidia/t410/uncore-ucf.json    | 764
> > > > ++++++++++++++++++
> > > > >  tools/perf/tests/pmu.c                        | 134 +++
> > > > >  tools/perf/util/evlist.c                      |   2 +-
> > > > >  tools/perf/util/evsel.c                       |  83 +-
> > > > >  tools/perf/util/evsel.h                       |   2 +-
> > > > >  tools/perf/util/parse-events.c                |   2 +-
> > > > >  tools/perf/util/pmu.c                         |  65 ++
> > > > >  tools/perf/util/pmu.h                         |   9 +
> > > > >  tools/perf/util/pmus.c                        |  47 ++
> > > > >  tools/perf/util/pmus.h                        |   1 +
> > > > >  tools/perf/util/stat-display.c                |  20 +
> > > > >  18 files changed, 1737 insertions(+), 6 deletions(-)
> > > > >  create mode 100644 tools/perf/pmu-
> > > > events/arch/arm64/nvidia/t410/uncore-cpu_mem.json
> > > > >  create mode 100644 tools/perf/pmu-
> > > > events/arch/arm64/nvidia/t410/uncore-nvclink.json
> > > > >  create mode 100644 tools/perf/pmu-
> > > > events/arch/arm64/nvidia/t410/uncore-nvdlink.json
> > > > >  create mode 100644 tools/perf/pmu-
> > > > events/arch/arm64/nvidia/t410/uncore-nvlink_c2c.json
> > > > >  create mode 100644 tools/perf/pmu-
> > > > events/arch/arm64/nvidia/t410/uncore-pcie.json
> > > > >  create mode 100644 tools/perf/pmu-
> > > > events/arch/arm64/nvidia/t410/uncore-pcie_tgt.json
> > > > >  create mode 100644 tools/perf/pmu-
> > > > events/arch/arm64/nvidia/t410/uncore-ucf.json
> > > > >
> > > > > --
> > > > > 2.43.0
> > > > >

