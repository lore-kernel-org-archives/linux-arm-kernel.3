Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99375606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 23:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r9GV030Z;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fHqhMZ4P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dh/bnyT0JBbnLv1h/bnk9lroIsEMrvUJ0+PR9gCLBfQ=; b=r9GV030ZHRqNMR/tWViT+oPtx0
	AAFDJncIY7JgwGZ+WJc7mL4pVnVYEGVUHJ1MhHbDZ+ekoVgOUR4O7hKrprtixn6FT/amLodyFGfxu
	Qv2dpg31k7BkAGVE6Zp++9MwX/l0VSaj0ViKkk9xtsy/jJ4z00nrK/zN9jlJf9Ht7FnLthIN3gkY8
	uNM3ACIvePFgIxi9oTZt0YMW/2yrC1J1aqQde7OYHFfNpULrx5Vdut6Lkw3h49+PB3gK8a86Z6ae4
	vIJYrxRz85OkBkGtj+5DOWQoDbSruxqFfjNVWtT3HQMmsB3yfS2tFlfJgFXSID9moI/tSI0Hromx4
	sZ3bONlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJJ10-0000000An68-26aL;
	Tue, 20 Oct 2026 23:13:06 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJJ0w-0000000An57-3Km3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 23:13:04 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-366421dc8ebso280547eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 16:13:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792537981; cv=none;
        d=google.com; s=arc-20260327;
        b=mytcVrzYKbjH5/0Dbm2rfpLHwP4v0auGmnzREw3vJMK8UJdwosOusVcEfUevIHwSh/
         Z0xFJwyZ6o0tunIRAz9/4F0swjvqwNImYGXtv3LOtRoMBfRj2foxrobi9QM07QznNXRk
         5DsCjNgFM98hJH91+nMusL1+jofXoY0yGxNZNafPHYra6jDllnP2lgAubCH/6XeD+uBk
         ZScq8THdCuMtS1iZmint3o8vhH5mQWCNhEWjQdHRSMZDMkQj4ZQqvYgt73xgpR1+7XGH
         /lhUFJjKsFQpkOGKyxLttJak88raa3TWWClJzEU9A3Ivc02VoZmE+M0wze73PjqC5va4
         L2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dh/bnyT0JBbnLv1h/bnk9lroIsEMrvUJ0+PR9gCLBfQ=;
        fh=xmSoSWZBbiOkC/RfOL4IavTviRFhu81DYYDbbHnF3l8=;
        b=AWYmGWlotlX3IcQjq5CsAJcWKJ8yTJmNYYZUfxOqnxUxVvXEnuIAl/MhC1qL4PZrtv
         5RyEpVyuagp2IE2JXQa0s+qmD47KDLrGsab8WkCSkrGnSUpUYbxMI8ZPFuB27oQ8VbXZ
         rEUz+TdPA2heOyJNU1FXk8700fRm/Cy1xiRRZoIwzKFIg6jD2DwttiS5T+QzXCbJJz2C
         E5+7j5KW/KH6bSvFY4QwzL5uuxiUa9Ajp64oeAJlQ/TcEgihDx2oRuJzURCOvcMJCQ8A
         XEHK/08bECaE40l1KmTHEOBNtVLngHcYIdSD0hPandmYu+y1OH4X/E4IUWQufav3fdTF
         uwpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792537981; x=1793142781; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dh/bnyT0JBbnLv1h/bnk9lroIsEMrvUJ0+PR9gCLBfQ=;
        b=fHqhMZ4Pu/lrSXA69CDRlk0UaKgbp/A0SO5zckzgV9sW1hmb2rck3w9IYHf3WmmDfT
         kPAKAO7w5vfFHhBUHTl0n6aM6mb9OVMvrFEzZsOGC3Z8l/KUKJyPkRiPrA5UuzwvdfRj
         /G8Y0ChDL6g+DLEnYLpvSDh+s0wMkStx9nVJ3dIu7hsdzVIOgo0HhS5qoCNGHuXBQsV1
         ym2ALt+T0O3xjHS1P9s0Jrox0CIfOew1imK5aTv/pd+9LGmLycX6gDb8H2PB0j4+SSWT
         I5wUeB/H53Rep6TZKy/zSqUmAFjseCsRdDX+eu3o80gYOOc2AVNFs5gxhu1uQ5hhAhPG
         14/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792537981; x=1793142781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dh/bnyT0JBbnLv1h/bnk9lroIsEMrvUJ0+PR9gCLBfQ=;
        b=IyvH0QI0Zi++sACh4cYHjJKWvN2WTESjLaY85qgePJwqGCSIjEpiwxP69RwDU+kwfh
         XIaJR55gIVWRsD5j6NIDwkCmxiuYmT6NPpTEJbWGmH/q0Hynra5/A9iXC0Kk9IY5GndA
         z9cYhWxyCGa/SKad9bmIqVTEGz4n1b1DlumwQwd7+muUDwvew7iWlcHsutC/4uO+eO/U
         s3STdGgOg5GoeELz++n7ULB/2vEyoEM3R7/E9qSlXIwVLi0e5APHBl9/lRIk2eqi4o+D
         wNeLbGn5+orrDgnMC8kgD1oSswGgfcaSDKU4WQo2bMJg9U/0gSerspyi58v8GmeNAejq
         SrCg==
X-Forwarded-Encrypted: i=1; AKwUvBytrkPn9PHuBKfyBNAvzMfLimhV45nE2pHKu4OgTTEwPY1yxHoPreZJFg1CX5NWU41OhClkT5+XaygEJgy+3n76@lists.infradead.org
X-Gm-Message-State: AFq9FYKuPa8IHP6UcZWAQgbIbYEjDEX6/oN9VOYuEOdMeHR9r2xx41HU
	Zz90rRV6ZXj3iVpzC5zEKChfx34PhWZ0R52iJPZkwRK25jgDRKhPbTnBXdLhLraHIxhXUx/L15r
	6pgfMUiS1MzXwCt+s976Jr5rVfsQm3hgkRx/svJL2
X-Gm-Gg: AYBFou0QcWP/1WiyjuzfcJQMvqMYWCcAq2HAWWryI8s2luZ6kxLvy9OZoIE9Gg3KNrk
	afN9f3Ha1RyqaYhAjNIYHz3+4+WoB1xRtSm1paJxd5uBW8+iXhGxsvz3SQ8GABj411b15RpRIYM
	AwREDONgxIM14ZkqdLsGzCQqeUN6er/w6wEQI+4RF/KQn3pwbelZWpeqTsCINuOF17Xr2SipxSs
	J72D6Pvwq8tyHtY2M0WaiXcPGvFzxWpFs97mvJzvWnhhHRLX6anv4tJ5oOfnbZDfmn7BlocBya4
	BW2g3DBcBKi+I6bar1ClZZMHo0zRGEFMKwoocVCv5434jEcMf/d6zQIqKS12tqsGJHHHna9/7OX
	/h1adjeM8yrkGVYMzTwlkcd372tnXIN31GhvkrFbNrzNcSDvQjY30YQWmGSgOLYFQ3g1URROu4y
	DeynNvyLLhgxL0
X-Received: by 2002:a05:701b:2044:20b0:183:840:1dad with SMTP id
 a92af1059eb24-18dbed50064mr4482643c88.14.1792537980138; Tue, 20 Oct 2026
 16:13:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019164241.403644-1-bwicaksono@nvidia.com>
 <20261019164241.403644-5-bwicaksono@nvidia.com> <CAP-5=fWucvdYefDOL3Vn=O=YUPEXE+tngDDfPLv-T5i3WkCJVA@mail.gmail.com>
 <SA1PR12MB67736E99ABA9C126A0E1981EA0672@SA1PR12MB6773.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB67736E99ABA9C126A0E1981EA0672@SA1PR12MB6773.namprd12.prod.outlook.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Tue, 20 Oct 2026 16:12:23 -0700
X-Gm-Features: AclHuK_aNU9kdVSWftIMnRxZ_SwJiwDfg6lcnasTAbePSdlmJHCQQpEbZ_yaUCY
Message-ID: <CAJpZYjVxpQNCjvhK3mmaOiiG8sgJr4EdUwNCn+gVLH=F6Xh0Kg@mail.gmail.com>
Subject: Re: [PATCH 4/6] perf jevents: Add support for NVIDIA Tegra410
 PCIE-TGT PMU aliasing
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: Ian Rogers <irogers@google.com>, "acme@kernel.org" <acme@kernel.org>, 
	"namhyung@kernel.org" <namhyung@kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vikram Sethi <vsethi@nvidia.com>, 
	Rich Wiley <rwiley@nvidia.com>, Sean Kelley <skelley@nvidia.com>, Matt Ochs <mochs@nvidia.com>, 
	Raj Joshi <rajjoshi@nvidia.com>, Thierry Reding <treding@nvidia.com>, 
	Jon Hunter <jonathanh@nvidia.com>, "john.garry@linux.dev" <john.garry@linux.dev>, 
	"will@kernel.org" <will@kernel.org>, "james.clark@linaro.org" <james.clark@linaro.org>, 
	"mike.leach@arm.com" <mike.leach@arm.com>, "leo.yan@linux.dev" <leo.yan@linux.dev>, 
	"mark.rutland@arm.com" <mark.rutland@arm.com>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_161302_857803_F9F79D39 
X-CRM114-Status: GOOD (  38.40  )
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
X-Spam-Status: No, score=-28.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 3:01=E2=80=AFPM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
>
>
> > -----Original Message-----
> > From: Ian Rogers <irogers@google.com>
> > Sent: Monday, October 19, 2026 11:18 PM
> > To: Besar Wicaksono <bwicaksono@nvidia.com>
> > Cc: acme@kernel.org; namhyung@kernel.org; linux-tegra@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linux-perf-users@vger.kernel.org;
> > linux-kernel@vger.kernel.org; Vikram Sethi <vsethi@nvidia.com>; Rich Wi=
ley
> > <rwiley@nvidia.com>; Sean Kelley <skelley@nvidia.com>; Matt Ochs
> > <mochs@nvidia.com>; Raj Joshi <rajjoshi@nvidia.com>; Thierry Reding
> > <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>;
> > john.garry@linux.dev; will@kernel.org; james.clark@linaro.org;
> > mike.leach@arm.com; leo.yan@linux.dev; mark.rutland@arm.com;
> > alexander.shishkin@linux.intel.com; jolsa@kernel.org;
> > adrian.hunter@intel.com; ctshao@google.com
> > Subject: Re: [PATCH 4/6] perf jevents: Add support for NVIDIA Tegra410
> > PCIE-TGT PMU aliasing
> >
> > External email: Use caution opening links or attachments
> >
> >
> > On Mon, Oct 19, 2026 at 9:45=E2=80=AFAM Besar Wicaksono
> > <bwicaksono@nvidia.com> wrote:
> > >
> > > Add alias support for NVIDIA Tegra410 PCIE-TGT PMU events and metrics=
.
> > >
> > > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > > ---
> > >  .../nvidia/t410/sys/uncore-pcie_tgt.json      | 93 +++++++++++++++++=
++
> > >  1 file changed, 93 insertions(+)
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json
> > >
> > > diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-
> > pcie_tgt.json b/tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json
> > > new file mode 100644
> > > index 000000000000..74786fc3d578
> > > --- /dev/null
> > > +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-
> > pcie_tgt.json
> > > @@ -0,0 +1,93 @@
> > > +[
> > > +    {
> > > +        "EventCode": "0x4",
> > > +        "EventName": "PCIE_TGT_CYCLES",
> > > +        "BriefDescription": "Counts cycles at the PCIe interface to =
the Tegra
> > SoC data fabric.",
> > > +        "PublicDescription": "Counts cycles at the PCIe interface to=
 the Tegra
> > SoC data fabric.",
> > > +        "Compat": "1070036b",
> > > +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> >
> > It looks like the PMU names are broken because of the _rc_ in their nam=
es:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree
> > /drivers/perf/arm_cspmu/nvidia_cspmu.c#n901
> > ```
> >    .name_pattern =3D "nvidia_pcie_pmu_%u_rc_%u",
> > ```
> > The convention is for either a numeric (preferable) or hexadecimal suff=
ix:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree
> > /Documentation/ABI/testing/sysfs-bus-event_source-devices
> > Extra information about the PMU belongs in a caps file.
> >
>
> Hi Ian,
>
> Thanks for the pointers.
>
> My interpretation is the ABI document doesn=E2=80=99t prevent driver from=
 naming
> the PMU with multiple numbering format. Other PMUs already did this,
> e.g. HiSilicon hisi_sccl<sccl>_ddrc<n>, Arm NI arm_ni_<ni>_cd_<cd> and
> Qualcomm l3cache_<x>_<y>.

Hi Besar,

The ABI only defines a single _<num> suffix, and that is all perf
supports. perf treats `nvidia_pcie_pmu_0_rc_*` and
`nvidia_pcie_pmu_1_rc_*` as two different PMUs, which is the root
cause of the reporting issues you listed. The hisi_sccl, arm_ni and
Qualcomm PMUs have the same problem.

We can always add a new naming format to the ABI and perf, but each
new format makes PMU name handling harder to maintain.

A PMU per rc, for example, `nvidia_pcie_pmu_<rc>` with one cpu per
socket in its `cpumask` (like Intel uncore_imc_<n>), works with perf
as is.

Thanks,
CT

>
> > By definition nothing can work with wildcard matching using the
> > existing PMU name, so please rename it. If a new suffix convention is
> > necessary then  you should update the ABI and perf tool suffix
> > matching logic like pmu_name_len_no_suffix:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree
> > /tools/perf/util/pmus.c#n65
> >
>
> The JSON "Unit" attribute takes a comma-separated form:
> "nvidia_pcie_pmu_,rc_", like HiSilicon's "hisi_sccl,ddrc", which
> perf_pmu__match_wildcard_uncore() matches against "socketX_pmunameY"
> names. The issues seem to be on the reporting side. The counting looks ok=
.
> I guess JSON "Unit" matching logic is not applied everywhere in perf.
>
> For example below is the counting from my 2-socket machine.
>
> Test workload: read 4 GiB from an NVMe on socket 0 RC 0 and 8 GiB from an=
 NVMe
> on socket 1 RC 0, in parallel (dd ... of=3D/dev/null iflag=3Ddirect).
>
> Counting is correct with the wildcards:
>
> $ perf stat -a -e 'nvidia_pcie_pmu_0_rc*/PCIE_WR_BYTES/,nvidia_pcie_pmu_1=
_rc*/PCIE_WR_BYTES/' -- <workload>
>      4,362,223,228      nvidia_pcie_pmu_0_rc*/PCIE_WR_BYTES/
>      8,623,751,168      nvidia_pcie_pmu_1_rc*/PCIE_WR_BYTES/
>
> $ perf stat -a --per-socket -e 'nvidia_pcie_pmu_*_rc_0/PCIE_WR_BYTES/' --=
 <workload>
> S268435456    1      4,362,207,232      nvidia_pcie_pmu_0_rc_0/nvidia_pci=
e_pmu_*_rc_0,PCIE_WR_BYTES/
> S285212672    1      8,724,414,784      nvidia_pcie_pmu_1_rc_0/nvidia_pci=
e_pmu_*_rc_0,PCIE_WR_BYTES/
>
> The reporting is where it goes wrong:
>
> 1) RC 0 of all sockets is not merged into one line, and the wildcard
>      ends up in the event name:
>
> $ perf stat -a -e 'nvidia_pcie_pmu_*_rc_0/PCIE_WR_BYTES/' -- <workload>
>      4,311,875,584      nvidia_pcie_pmu_0_rc_0/nvidia_pcie_pmu_*_rc_0,PCI=
E_WR_BYTES/
>      8,623,751,168      nvidia_pcie_pmu_1_rc_0/nvidia_pcie_pmu_*_rc_0,PCI=
E_WR_BYTES/
>
> 2) The json event is split per socket, and each line is labelled with
>       RC 0 although it is the sum of all RCs of that socket:
>
> $ perf stat -a -e PCIE_WR_BYTES -- <workload>
>      4,311,880,848      nvidia_pcie_pmu_0_rc_0/PCIE_WR_BYTES/
>      8,724,414,784      nvidia_pcie_pmu_1_rc_0/PCIE_WR_BYTES/
>
> 3) The metric is computed per socket, instead of total. With --metric-onl=
y both values
>      end up under one header, and the reader can't tell which socket is
>      which:
>
> $ perf stat -a -M pcie_avg_wr_bandwidth_to_all_dst --metric-only -- <work=
load>
>  MB/s  pcie_avg_wr_bandwidth_to_all_dst
>                                 3113.5                                622=
7.0
>
> 4) With --per-socket, each row shows both copies: the other socket's
>    copy prints nan, and socket 1's counters is 0 instead of 6:
>
> $ perf stat -a --per-socket -M pcie_avg_wr_bandwidth_to_all_dst --metric-=
only -- <workload>
>        MB/s  pcie_avg_wr_bandwidth_to_all_dst
> S268435456    6                                 3127.5                   =
                nan
> S285212672    0                                    nan                   =
             6182.8
>
> $ perf stat -a --per-socket -j -M pcie_avg_wr_bandwidth_to_all_dst --metr=
ic-only -- <workload>
> {"socket" : "S268435456", "counters" : 6, "MB/s  pcie_avg_wr_bandwidth_to=
_all_dst" : "3087.8", "MB/s  pcie_avg_wr_bandwidth_to_all_dst" : "none"}
> {"socket" : "S285212672", "counters" : 0, "MB/s  pcie_avg_wr_bandwidth_to=
_all_dst" : "none", "MB/s  pcie_avg_wr_bandwidth_to_all_dst" : "6247.8"}
>
> All of these, I think, come from perf treating nvidia_pcie_pmu_0_rc_* and
> nvidia_pcie_pmu_1_rc_* as two different PMUs instead of one PMU, i.e
> nvidia_pcie_pmu.
>
> I will investigate further and see if I can come up with a perf patch to =
fix this.
>
> Regards,
> Besar
>
> > Thanks,
> > Ian Rogers
> >
>

On Tue, Oct 20, 2026 at 3:01=E2=80=AFPM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
>
>
> > -----Original Message-----
> > From: Ian Rogers <irogers@google.com>
> > Sent: Monday, October 19, 2026 11:18 PM
> > To: Besar Wicaksono <bwicaksono@nvidia.com>
> > Cc: acme@kernel.org; namhyung@kernel.org; linux-tegra@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linux-perf-users@vger.kernel.org;
> > linux-kernel@vger.kernel.org; Vikram Sethi <vsethi@nvidia.com>; Rich Wi=
ley
> > <rwiley@nvidia.com>; Sean Kelley <skelley@nvidia.com>; Matt Ochs
> > <mochs@nvidia.com>; Raj Joshi <rajjoshi@nvidia.com>; Thierry Reding
> > <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>;
> > john.garry@linux.dev; will@kernel.org; james.clark@linaro.org;
> > mike.leach@arm.com; leo.yan@linux.dev; mark.rutland@arm.com;
> > alexander.shishkin@linux.intel.com; jolsa@kernel.org;
> > adrian.hunter@intel.com; ctshao@google.com
> > Subject: Re: [PATCH 4/6] perf jevents: Add support for NVIDIA Tegra410
> > PCIE-TGT PMU aliasing
> >
> > External email: Use caution opening links or attachments
> >
> >
> > On Mon, Oct 19, 2026 at 9:45=E2=80=AFAM Besar Wicaksono
> > <bwicaksono@nvidia.com> wrote:
> > >
> > > Add alias support for NVIDIA Tegra410 PCIE-TGT PMU events and metrics=
.
> > >
> > > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > > ---
> > >  .../nvidia/t410/sys/uncore-pcie_tgt.json      | 93 +++++++++++++++++=
++
> > >  1 file changed, 93 insertions(+)
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json
> > >
> > > diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-
> > pcie_tgt.json b/tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json
> > > new file mode 100644
> > > index 000000000000..74786fc3d578
> > > --- /dev/null
> > > +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-
> > pcie_tgt.json
> > > @@ -0,0 +1,93 @@
> > > +[
> > > +    {
> > > +        "EventCode": "0x4",
> > > +        "EventName": "PCIE_TGT_CYCLES",
> > > +        "BriefDescription": "Counts cycles at the PCIe interface to =
the Tegra
> > SoC data fabric.",
> > > +        "PublicDescription": "Counts cycles at the PCIe interface to=
 the Tegra
> > SoC data fabric.",
> > > +        "Compat": "1070036b",
> > > +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> >
> > It looks like the PMU names are broken because of the _rc_ in their nam=
es:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree
> > /drivers/perf/arm_cspmu/nvidia_cspmu.c#n901
> > ```
> >    .name_pattern =3D "nvidia_pcie_pmu_%u_rc_%u",
> > ```
> > The convention is for either a numeric (preferable) or hexadecimal suff=
ix:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree
> > /Documentation/ABI/testing/sysfs-bus-event_source-devices
> > Extra information about the PMU belongs in a caps file.
> >
>
> Hi Ian,
>
> Thanks for the pointers.
>
> My interpretation is the ABI document doesn=E2=80=99t prevent driver from=
 naming
> the PMU with multiple numbering format. Other PMUs already did this,
> e.g. HiSilicon hisi_sccl<sccl>_ddrc<n>, Arm NI arm_ni_<ni>_cd_<cd> and
> Qualcomm l3cache_<x>_<y>.
>
> > By definition nothing can work with wildcard matching using the
> > existing PMU name, so please rename it. If a new suffix convention is
> > necessary then  you should update the ABI and perf tool suffix
> > matching logic like pmu_name_len_no_suffix:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree
> > /tools/perf/util/pmus.c#n65
> >
>
> The JSON "Unit" attribute takes a comma-separated form:
> "nvidia_pcie_pmu_,rc_", like HiSilicon's "hisi_sccl,ddrc", which
> perf_pmu__match_wildcard_uncore() matches against "socketX_pmunameY"
> names. The issues seem to be on the reporting side. The counting looks ok=
.
> I guess JSON "Unit" matching logic is not applied everywhere in perf.
>
> For example below is the counting from my 2-socket machine.
>
> Test workload: read 4 GiB from an NVMe on socket 0 RC 0 and 8 GiB from an=
 NVMe
> on socket 1 RC 0, in parallel (dd ... of=3D/dev/null iflag=3Ddirect).
>
> Counting is correct with the wildcards:
>
> $ perf stat -a -e 'nvidia_pcie_pmu_0_rc*/PCIE_WR_BYTES/,nvidia_pcie_pmu_1=
_rc*/PCIE_WR_BYTES/' -- <workload>
>      4,362,223,228      nvidia_pcie_pmu_0_rc*/PCIE_WR_BYTES/
>      8,623,751,168      nvidia_pcie_pmu_1_rc*/PCIE_WR_BYTES/
>
> $ perf stat -a --per-socket -e 'nvidia_pcie_pmu_*_rc_0/PCIE_WR_BYTES/' --=
 <workload>
> S268435456    1      4,362,207,232      nvidia_pcie_pmu_0_rc_0/nvidia_pci=
e_pmu_*_rc_0,PCIE_WR_BYTES/
> S285212672    1      8,724,414,784      nvidia_pcie_pmu_1_rc_0/nvidia_pci=
e_pmu_*_rc_0,PCIE_WR_BYTES/
>
> The reporting is where it goes wrong:
>
> 1) RC 0 of all sockets is not merged into one line, and the wildcard
>      ends up in the event name:
>
> $ perf stat -a -e 'nvidia_pcie_pmu_*_rc_0/PCIE_WR_BYTES/' -- <workload>
>      4,311,875,584      nvidia_pcie_pmu_0_rc_0/nvidia_pcie_pmu_*_rc_0,PCI=
E_WR_BYTES/
>      8,623,751,168      nvidia_pcie_pmu_1_rc_0/nvidia_pcie_pmu_*_rc_0,PCI=
E_WR_BYTES/
>
> 2) The json event is split per socket, and each line is labelled with
>       RC 0 although it is the sum of all RCs of that socket:
>
> $ perf stat -a -e PCIE_WR_BYTES -- <workload>
>      4,311,880,848      nvidia_pcie_pmu_0_rc_0/PCIE_WR_BYTES/
>      8,724,414,784      nvidia_pcie_pmu_1_rc_0/PCIE_WR_BYTES/
>
> 3) The metric is computed per socket, instead of total. With --metric-onl=
y both values
>      end up under one header, and the reader can't tell which socket is
>      which:
>
> $ perf stat -a -M pcie_avg_wr_bandwidth_to_all_dst --metric-only -- <work=
load>
>  MB/s  pcie_avg_wr_bandwidth_to_all_dst
>                                 3113.5                                622=
7.0
>
> 4) With --per-socket, each row shows both copies: the other socket's
>    copy prints nan, and socket 1's counters is 0 instead of 6:
>
> $ perf stat -a --per-socket -M pcie_avg_wr_bandwidth_to_all_dst --metric-=
only -- <workload>
>        MB/s  pcie_avg_wr_bandwidth_to_all_dst
> S268435456    6                                 3127.5                   =
                nan
> S285212672    0                                    nan                   =
             6182.8
>
> $ perf stat -a --per-socket -j -M pcie_avg_wr_bandwidth_to_all_dst --metr=
ic-only -- <workload>
> {"socket" : "S268435456", "counters" : 6, "MB/s  pcie_avg_wr_bandwidth_to=
_all_dst" : "3087.8", "MB/s  pcie_avg_wr_bandwidth_to_all_dst" : "none"}
> {"socket" : "S285212672", "counters" : 0, "MB/s  pcie_avg_wr_bandwidth_to=
_all_dst" : "none", "MB/s  pcie_avg_wr_bandwidth_to_all_dst" : "6247.8"}
>
> All of these, I think, come from perf treating nvidia_pcie_pmu_0_rc_* and
> nvidia_pcie_pmu_1_rc_* as two different PMUs instead of one PMU, i.e
> nvidia_pcie_pmu.
>
> I will investigate further and see if I can come up with a perf patch to =
fix this.
>
> Regards,
> Besar
>
> > Thanks,
> > Ian Rogers
> >
>

