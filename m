Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B9606D81E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=INHsHopQ;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p6t8N8Cb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7WX/ZTMITs0q76Ht6EmOOVK989Ar1uU+fZznXiAFQ00=; b=INHsHopQXR/Rz/
	xvrsCFttzeVKP++GEgaCzDJYtdI8zSE9Rt6PCcak7qyQ4lQ0if0rPuTL8LccdeFW082BFVjSiIAbc
	8pklgyB7Go+/SAPvgzTW/L/3gRtIEerp1TwfBC5BGFa6Y9Dxec5XYIa/N/OlJqorNbtDthHjchmp4
	UsbEFU9JF0tQ/793qOAVfDExlpfoTVT9MfaTtmzl1iAGa9ndrxHBFm0+PHY01OGyGvXaHiKbd0f2w
	ubrEUghTHlD3flVfnnXAkYoM1OnQptl3x3LpewqVay+yf7GuWEKVFOnKuUNApM19ZxFPm3pmdKqNu
	bTHwL9ZRMjDpbo9M/k1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdj4-00000005xQz-1XG9;
	Wed, 04 Nov 2026 16:20:38 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdj0-00000005xPi-1iR9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:20:37 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-535f598d126so326091cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 08:20:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793809232; cv=none;
        d=google.com; s=arc-20260327;
        b=rRcvTCmTYyhRKCg5tzOttiKd2TPX6IFB3z9DSxupbYfw/389Cb3SBC4nnvm4oEECLG
         zn/QDTVgBF9sAtUoo5Sf4e8uEjPd6ciXTlOhD5AKerLCWFH9PHptmJU0BcKf5qL+2/Ii
         CSArNacbkFXYPTghHIHuvhXUZl/5Y3nrdzK2UwqvAd3VX0TQRqZq/qSov2vmXNRHboTD
         ogpixHKvYf1p45t+UGFaBB+1GI+NevWSe2W2tQWOJIAJh0KKQsqGQQhmpE06BIABEqj4
         j3Miw+AmCua994aUWQ4a5YkWDX+GKmbgYyMmAa6QWZRBfvsS4mptq+YGjUMZCE1Sj7oG
         DTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7WX/ZTMITs0q76Ht6EmOOVK989Ar1uU+fZznXiAFQ00=;
        fh=ZtPpYd7z4wlDRhWp/29IuPDWhBBwK+uLsZOX4g3F3TY=;
        b=carmMSopxBHl4mWgUOeWEaMzFC8fKg1z/b9ZFIFBjyrPohxc3XDgi7GJRoe0h4TK/f
         kMD7x+cHPmV8GNLRn/CFZBvmd9KAMJ6gmL+FT7EjMmbifuCGpakiI63bb1BR4LDeCvtT
         ntHys2lvdd0T79Lq/TJQGgK1SPJHRzFTEKICjfskZDwGmoeZDWLBmimyG5jt7t9OAett
         zqZuZVP90xGEUGJTHRwn1SE8UQIwmO3fuJp+wcTrOmIT07Dc6KJczhdvQnA2hc/H25Qm
         SJlO412vpjUd0mG2Gc48v+en12B7cPymSYLf0qoJSnDCPk91N7VX1BQyPQgi0CDR3aKw
         l0fg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793809232; x=1794414032; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7WX/ZTMITs0q76Ht6EmOOVK989Ar1uU+fZznXiAFQ00=;
        b=p6t8N8CbIWAU50GUD/yPPESojH6bfTrtOfQmLByEkAtbEtbgSkBsAPctuZK/cQxXjW
         ZD6bxqad2vGZV6NfUcCkgpfnerAIvx/xkvdMGk3Sf3JIVeBleO2xU/5AB/LoW7X3q43C
         jN6g4lsyOart6BsFGqlUaiQlbyVe40MSYeYrg81pVCd4AkRBDgVoJcX381EHRWNtcj1N
         +FfKyWDI8cnKqYRSVG1qimj14s+aXS7fB4JVELAv0ZfOjbO3lhF1d+TzH9lPfQpA1gmB
         MXb+x3uXeewVMaXXYsXmQkOh3DDP96nLBDnT3bns6nlCGGzy71tFJeOgDE+mvPFA2fLp
         9Jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809232; x=1794414032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WX/ZTMITs0q76Ht6EmOOVK989Ar1uU+fZznXiAFQ00=;
        b=qbBX2465VqyASPqpFfv8hEzjieXyZvFSzS/OB7skkRjqTSAMOfyxHiPUyKcbH3RAOj
         jVXmdpZKis6G41i9wk6BA7B/seSanlUXGorD2KI3Cclglcv1zQwhhjEC71savDl6nEK4
         PI36wmLEFwHH3+olqD3AoMxhQ9kxCehSPkqLMZunEITk43VZEI0GM96MfEVr2E0nNMjm
         qGq/bTC7ra+9qTcLU9RpAmD18bnIRI/0MfYOTJXoqVYzZARXUsYJWn4KKx/vgcZa6oJB
         1fvR8GJjn2C8tsWkObAvxLLk2af7/hjbMy/7r6ftmfdZefCVqRnMirOXHJXV3IfS8Zw+
         Qt4Q==
X-Forwarded-Encrypted: i=1; AKwUvBw6w/lmzz4f3zaMSxegbS0AvNBFlNUAm98uA2g/V9M7eX9yAJ1oexg7B4Zu+hA+f5Xq3+vPbGkOuCybLmsjbebE@lists.infradead.org
X-Gm-Message-State: APuU4Z83NrXpMNCuZd+tJQ1miajpGMZrXzSEVnUUbH9d0/Ia0Yrcqael
	7APSHbTegJZ2AMu6GGxAlgHnkmiIFPsfq112oOPlkrThvdyQH6Pfq3+KHQe9vCgbMOaYT+8GTm1
	ES6rmkXBHiJYQZnDPB7NHtepJysnEUNawdIpQkQMu
X-Gm-Gg: AYBFou0rcOqsNpzM52aW5UH2gENwgdoliFM/HN+B2S2K7EoPp2/2bdNqfgpcNzLqxIw
	zo8fy3pZGwIDMz9FWG6iI/6zSSi4Ot7A5QZoLQqyZLQujfeq58E8Qx0DtCc+9LwdBaMVNR7fPX4
	z9CU1gSMOJQ78s79eqYCM5hpXw6cefaWZ44a3hVT1fjGr/nOxb6LpOQhtJfdeTO/XQq3L0onF+x
	5bBMF0Rkm5725lnZcIgWY5/CBftUeBF2RCsq03ABjOD8z0UaKAWnQTTLH37LhGr39HkJJNqqW0P
	KQ8576y8hst6OtvC4IQ1NFyiuA7q0rmKWcnFzCyYW0qZ09giELmGXQTHnrwScPkSkkBTour38M8
	cLILvlEXo0QoUvb+/uF/pktl5+xEB+obbLoMs9g7rkN3n7xIaZ7W7+6Idh1UntMRAmAgBdE36CG
	BO/brKnYYueHk=
X-Received: by 2002:a05:622a:5a17:b0:533:9731:f0f1 with SMTP id
 d75a77b69052e-54b828def6bmr16257461cf.10.1793809230476; Wed, 04 Nov 2026
 08:20:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104160716.2910873-1-bwicaksono@nvidia.com> <20261104160716.2910873-6-bwicaksono@nvidia.com>
In-Reply-To: <20261104160716.2910873-6-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 4 Nov 2026 08:20:17 -0800
X-Gm-Features: AclHuK8kmY9Y5i9GpPnoLDbH8n_OPilb4d8Fhx3j9bcjOJ8O94IiJtK0q4nuoTg
Message-ID: <CAP-5=fUP4ivJpDySjk5Np5VM=Q3xaSL4ONkZZLumQn=OH_hucA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] perf jevents: Add support for NVIDIA Tegra410 C2C
 PMU aliasing
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
X-CRM114-CacheID: sfid-20261104_082034_528969_0FF0888F 
X-CRM114-Status: GOOD (  19.48  )
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
> Add alias support for NVIDIA Tegra410 C2C PMU events.

What does alias mean in this case? That there are json and sysfs
events? I don't see support being added, only additional events.

Thanks,
Ian

> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>  .../arm64/nvidia/t410/uncore-nvclink.json     |  67 ++++++++++
>  .../arm64/nvidia/t410/uncore-nvdlink.json     |  43 +++++++
>  .../arm64/nvidia/t410/uncore-nvlink_c2c.json  | 115 ++++++++++++++++++
>  3 files changed, 225 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vclink.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vdlink.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vlink_c2c.json
>
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvclink.=
json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvclink.json
> new file mode 100644
> index 000000000000..1e7f8115ff9c
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvclink.json
> @@ -0,0 +1,67 @@
> +[
> +    {
> +        "EventCode": "0x0",
> +        "EventName": "NVCLINK_CYCLES",
> +        "BriefDescription": "Counts NV-CLink interface clock cycles.",
> +        "PublicDescription": "Counts NV-CLink interface clock cycles. Al=
l NV-CLink instances share this clock, so the count is read from the first =
instance.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    },
> +    {
> +        "EventCode": "0x1",
> +        "EventName": "NVCLINK_IN_RD_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding incoming read r=
equests counted by NVCLINK_IN_RD_REQ each NV-CLink interface cycle.",
> +        "PublicDescription": "Accumulates the outstanding incoming read =
requests counted by NVCLINK_IN_RD_REQ each NV-CLink interface cycle. Pair t=
he two for the average read latency.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    },
> +    {
> +        "EventCode": "0x2",
> +        "EventName": "NVCLINK_IN_RD_REQ",
> +        "BriefDescription": "Counts incoming read requests from the remo=
te Tegra SoC at the NV-CLink interface.",
> +        "PublicDescription": "Counts incoming read requests from the rem=
ote Tegra SoC at the NV-CLink interface, where local memory or a local devi=
ce responds with data. Request size can be from 1 to 256 bytes. The count i=
s summed over all NV-CLink instances.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    },
> +    {
> +        "EventCode": "0x5",
> +        "EventName": "NVCLINK_OUT_RD_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding outgoing read r=
equests counted by NVCLINK_OUT_RD_REQ each NV-CLink interface cycle.",
> +        "PublicDescription": "Accumulates the outstanding outgoing read =
requests counted by NVCLINK_OUT_RD_REQ each NV-CLink interface cycle. Pair =
the two for the average read latency.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    },
> +    {
> +        "EventCode": "0x6",
> +        "EventName": "NVCLINK_OUT_RD_REQ",
> +        "BriefDescription": "Counts outgoing read requests from the loca=
l Tegra SoC to the remote Tegra SoC at the NV-CLink interface.",
> +        "PublicDescription": "Counts outgoing read requests from the loc=
al Tegra SoC to the remote Tegra SoC at the NV-CLink interface, where memor=
y on the remote Tegra SoC responds with data. Request size can be from 1 to=
 256 bytes. The count is summed over all NV-CLink instances.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    },
> +    {
> +        "MetricName": "nvclink_freq",
> +        "MetricGroup": "NVCLINK_Frequency;NVCLINK_Latency;NVCLINK_Read_L=
atency",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVCLINK_CYCLES / aggr_nr(NVCLINK_CYCLES)) / 1e9 =
/ duration_time",
> +        "ScaleUnit": "1GHz",
> +        "BriefDescription": "NV-CLink interface clock frequency.",
> +        "PublicDescription": "Average NV-CLink interface clock frequency=
 over the measurement interval.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    },
> +    {
> +        "MetricName": "nvclink_in_avg_rd_latency",
> +        "MetricGroup": "NVCLINK_Latency;NVCLINK_Read_Latency;NVCLINK_Inc=
oming",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVCLINK_IN_RD_CUM_OUTS / NVCLINK_IN_RD_REQ) / nv=
clink_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average latency of incoming read requests f=
rom the remote Tegra SoC at the NV-CLink interface.",
> +        "PublicDescription": "Average latency of the incoming read reque=
sts counted by NVCLINK_IN_RD_REQ, measured at the NV-CLink interface.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    },
> +    {
> +        "MetricName": "nvclink_out_avg_rd_latency",
> +        "MetricGroup": "NVCLINK_Latency;NVCLINK_Read_Latency;NVCLINK_Out=
going",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVCLINK_OUT_RD_CUM_OUTS / NVCLINK_OUT_RD_REQ) / =
nvclink_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average latency of outgoing read requests s=
ent by the local Tegra SoC to the remote Tegra SoC at the NV-CLink interfac=
e.",
> +        "PublicDescription": "Average latency of the outgoing read reque=
sts counted by NVCLINK_OUT_RD_REQ, measured at the NV-CLink interface.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    }
> +]
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvdlink.=
json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvdlink.json
> new file mode 100644
> index 000000000000..7777add3741d
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvdlink.json
> @@ -0,0 +1,43 @@
> +[
> +    {
> +        "EventCode": "0x0",
> +        "EventName": "NVDLINK_CYCLES",
> +        "BriefDescription": "Counts NV-DLink interface clock cycles.",
> +        "PublicDescription": "Counts NV-DLink interface clock cycles. Al=
l NV-DLink instances share this clock, so the count is read from the first =
instance.",
> +        "Unit": "nvidia_nvdlink_pmu_"
> +    },
> +    {
> +        "EventCode": "0x1",
> +        "EventName": "NVDLINK_IN_RD_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding read requests c=
ounted by NVDLINK_IN_RD_REQ each NV-DLink interface cycle.",
> +        "PublicDescription": "Accumulates the outstanding read requests =
counted by NVDLINK_IN_RD_REQ each NV-DLink interface cycle. Pair the two fo=
r the average read latency.",
> +        "Unit": "nvidia_nvdlink_pmu_"
> +    },
> +    {
> +        "EventCode": "0x2",
> +        "EventName": "NVDLINK_IN_RD_REQ",
> +        "BriefDescription": "Counts read requests to local CXL memory at=
 the NV-DLink interface.",
> +        "PublicDescription": "Counts read requests to local CXL memory a=
t the NV-DLink interface, from all requesters, local and remote. Request si=
ze can be from 1 to 256 bytes. The count is summed over all NV-DLink instan=
ces.",
> +        "Unit": "nvidia_nvdlink_pmu_"
> +    },
> +    {
> +        "MetricName": "nvdlink_freq",
> +        "MetricGroup": "NVDLINK_Frequency;NVDLINK_Latency;NVDLINK_Read_L=
atency",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVDLINK_CYCLES / aggr_nr(NVDLINK_CYCLES)) / 1e9 =
/ duration_time",
> +        "ScaleUnit": "1GHz",
> +        "BriefDescription": "NV-DLink interface clock frequency.",
> +        "PublicDescription": "Average NV-DLink interface clock frequency=
 over the measurement interval.",
> +        "Unit": "nvidia_nvdlink_pmu_"
> +    },
> +    {
> +        "MetricName": "nvdlink_in_avg_rd_latency",
> +        "MetricGroup": "NVDLINK_Latency;NVDLINK_Read_Latency",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVDLINK_IN_RD_CUM_OUTS / NVDLINK_IN_RD_REQ) / nv=
dlink_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average latency of read requests to local C=
XL memory at the NV-DLink interface.",
> +        "PublicDescription": "Average latency of the read requests count=
ed by NVDLINK_IN_RD_REQ, measured at the NV-DLink interface.",
> +        "Unit": "nvidia_nvdlink_pmu_"
> +    }
> +]
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvlink_c=
2c.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvlink_c2c.js=
on
> new file mode 100644
> index 000000000000..48a64caaba61
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvlink_c2c.json
> @@ -0,0 +1,115 @@
> +[
> +    {
> +        "EventCode": "0x0",
> +        "EventName": "NVLINK_C2C_CYCLES",
> +        "BriefDescription": "Counts NVLink-C2C interface clock cycles.",
> +        "PublicDescription": "Counts NVLink-C2C interface clock cycles. =
All NVLink-C2C instances share this clock, so the count is read from the fi=
rst instance.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x1",
> +        "EventName": "NVLINK_C2C_IN_RD_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding incoming read r=
equests counted by NVLINK_C2C_IN_RD_REQ each NVLink-C2C interface cycle.",
> +        "PublicDescription": "Accumulates the outstanding incoming read =
requests counted by NVLINK_C2C_IN_RD_REQ each NVLink-C2C interface cycle. P=
air the two for the average read latency. The gpu_mask filter works as desc=
ribed for NVLINK_C2C_IN_RD_REQ.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x2",
> +        "EventName": "NVLINK_C2C_IN_RD_REQ",
> +        "BriefDescription": "Counts incoming read requests from connecte=
d GPUs or a remote Tegra SoC at the NVLink-C2C interface.",
> +        "PublicDescription": "Counts incoming read requests sent by conn=
ected GPUs or a remote Tegra SoC to the local Tegra SoC at the NVLink-C2C i=
nterface, where the local Tegra SoC responds with data. Request size can be=
 from 1 to 256 bytes. The count is summed over all NVLink-C2C instances. Fi=
lters: the gpu_mask filter selects GPUs by index, one bit per GPU. This fil=
ter is available only when GPUs are connected. An unset gpu_mask counts all=
 GPUs.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x3",
> +        "EventName": "NVLINK_C2C_IN_WR_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding incoming write =
requests counted by NVLINK_C2C_IN_WR_REQ each NVLink-C2C interface cycle.",
> +        "PublicDescription": "Accumulates the outstanding incoming write=
 requests counted by NVLINK_C2C_IN_WR_REQ each NVLink-C2C interface cycle. =
Available only when GPUs are connected. Pair the two for the average write =
latency. The gpu_mask filter works as described for NVLINK_C2C_IN_WR_REQ.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x4",
> +        "EventName": "NVLINK_C2C_IN_WR_REQ",
> +        "BriefDescription": "Counts incoming write requests from connect=
ed GPUs to the local Tegra SoC at the NVLink-C2C interface.",
> +        "PublicDescription": "Counts incoming write requests sent by con=
nected GPUs to the local Tegra SoC at the NVLink-C2C interface, where the G=
PU sends the data. Request size can be from 1 to 256 bytes. Available only =
when GPUs are connected. The count is summed over all NVLink-C2C instances.=
 Filters: the gpu_mask filter selects GPUs by index, one bit per GPU. An un=
set gpu_mask counts all GPUs.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x5",
> +        "EventName": "NVLINK_C2C_OUT_RD_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding outgoing read r=
equests counted by NVLINK_C2C_OUT_RD_REQ each NVLink-C2C interface cycle.",
> +        "PublicDescription": "Accumulates the outstanding outgoing read =
requests counted by NVLINK_C2C_OUT_RD_REQ each NVLink-C2C interface cycle. =
Pair the two for the average read latency. The gpu_mask filter works as des=
cribed for NVLINK_C2C_OUT_RD_REQ.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x6",
> +        "EventName": "NVLINK_C2C_OUT_RD_REQ",
> +        "BriefDescription": "Counts outgoing read requests to connected =
GPUs or a remote Tegra SoC at the NVLink-C2C interface.",
> +        "PublicDescription": "Counts outgoing read requests from all req=
uesters to connected GPUs or a remote Tegra SoC at the NVLink-C2C interface=
, where the GPU or remote Tegra SoC responds with data. Request size can be=
 from 1 to 256 bytes. The count is summed over all NVLink-C2C instances. Fi=
lters: the gpu_mask filter selects GPUs by index, one bit per GPU. This fil=
ter is available only when GPUs are connected. An unset gpu_mask counts all=
 GPUs.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x7",
> +        "EventName": "NVLINK_C2C_OUT_WR_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding outgoing write =
requests counted by NVLINK_C2C_OUT_WR_REQ each NVLink-C2C interface cycle."=
,
> +        "PublicDescription": "Accumulates the outstanding outgoing write=
 requests counted by NVLINK_C2C_OUT_WR_REQ each NVLink-C2C interface cycle.=
 Available only when GPUs are connected. Pair the two for the average write=
 latency. The gpu_mask filter works as described for NVLINK_C2C_OUT_WR_REQ.=
",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x8",
> +        "EventName": "NVLINK_C2C_OUT_WR_REQ",
> +        "BriefDescription": "Counts outgoing write requests to connected=
 GPUs at the NVLink-C2C interface.",
> +        "PublicDescription": "Counts outgoing write requests from all re=
questers to connected GPUs at the NVLink-C2C interface, where the requester=
 sends the data. Request size can be from 1 to 256 bytes. Available only wh=
en GPUs are connected. The count is summed over all NVLink-C2C instances. F=
ilters: the gpu_mask filter selects GPUs by index, one bit per GPU. An unse=
t gpu_mask counts all GPUs.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "MetricName": "nvlink_c2c_freq",
> +        "MetricGroup": "NVLINK_C2C_Frequency;NVLINK_C2C_Latency;NVLINK_C=
2C_Read_Latency;NVLINK_C2C_Write_Latency",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVLINK_C2C_CYCLES / aggr_nr(NVLINK_C2C_CYCLES)) =
/ 1e9 / duration_time",
> +        "ScaleUnit": "1GHz",
> +        "BriefDescription": "NVLink-C2C interface clock frequency.",
> +        "PublicDescription": "Average NVLink-C2C interface clock frequen=
cy over the measurement interval.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "MetricName": "nvlink_c2c_in_avg_rd_latency",
> +        "MetricGroup": "NVLINK_C2C_Latency;NVLINK_C2C_Read_Latency;NVLIN=
K_C2C_Incoming",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVLINK_C2C_IN_RD_CUM_OUTS / NVLINK_C2C_IN_RD_REQ=
) / nvlink_c2c_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average latency of incoming read requests a=
t the NVLink-C2C interface.",
> +        "PublicDescription": "Average latency of the incoming read reque=
sts counted by NVLINK_C2C_IN_RD_REQ, measured at the NVLink-C2C interface."=
,
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "MetricName": "nvlink_c2c_in_avg_wr_latency",
> +        "MetricGroup": "NVLINK_C2C_Latency;NVLINK_C2C_Write_Latency;NVLI=
NK_C2C_Incoming",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVLINK_C2C_IN_WR_CUM_OUTS / NVLINK_C2C_IN_WR_REQ=
) / nvlink_c2c_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average latency of incoming write requests =
from connected GPUs at the NVLink-C2C interface.",
> +        "PublicDescription": "Average latency of the incoming write requ=
ests counted by NVLINK_C2C_IN_WR_REQ, measured at the NVLink-C2C interface.=
 Available only when GPUs are connected.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "MetricName": "nvlink_c2c_out_avg_rd_latency",
> +        "MetricGroup": "NVLINK_C2C_Latency;NVLINK_C2C_Read_Latency;NVLIN=
K_C2C_Outgoing",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVLINK_C2C_OUT_RD_CUM_OUTS / NVLINK_C2C_OUT_RD_R=
EQ) / nvlink_c2c_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average latency of outgoing read requests a=
t the NVLink-C2C interface.",
> +        "PublicDescription": "Average latency of the outgoing read reque=
sts counted by NVLINK_C2C_OUT_RD_REQ, measured at the NVLink-C2C interface.=
",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "MetricName": "nvlink_c2c_out_avg_wr_latency",
> +        "MetricGroup": "NVLINK_C2C_Latency;NVLINK_C2C_Write_Latency;NVLI=
NK_C2C_Outgoing",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVLINK_C2C_OUT_WR_CUM_OUTS / NVLINK_C2C_OUT_WR_R=
EQ) / nvlink_c2c_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average latency of outgoing write requests =
to connected GPUs at the NVLink-C2C interface.",
> +        "PublicDescription": "Average latency of the outgoing write requ=
ests counted by NVLINK_C2C_OUT_WR_REQ, measured at the NVLink-C2C interface=
. Available only when GPUs are connected.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    }
> +]
> --
> 2.43.0
>

