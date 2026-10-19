Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A70606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 17:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2+8e3Do6;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=X94fJJcN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxr3yy5APwTjGC/8MQQ5vWLHB19nNrJrEZoaHSPj4Ms=; b=2+8e3Do6nu97RnsH7ZyCjnN9Oa
	yGXwmT+qblBU62XMnO2mxJreTHKZYby7U6sLjvzK0QwyB/g1JP8dxcUPipnWSwsmZXzfgvRdnCK/6
	wOG/aFULDkGMJBFbDy66LGW/JmXyI6zIT3GADqhGq6QlhF3DumcbhaYfr94z9cOSQqBZptF7EAssn
	GnbR2uU7vfFMSFv94Heh0wylM6hKJ7nu0+C+0cxz13358Hc0jO7/szLimao0nb2zFq+YAZUZUmHGf
	SNWu7k8mfN08g1km9csJUI14JENAndZIoOlRv/6JfJNM28pLi877zShM1SEnM+w715fbNFRzn8/H0
	dM3iw9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIrVa-000000087DA-1FVc;
	Mon, 19 Oct 2026 17:50:50 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIrVW-000000087CB-2Ecn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 17:50:49 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-14394530ec6so1306735c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 10:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792432245; cv=none;
        d=google.com; s=arc-20260327;
        b=HLHexHU5ZIoCoXYWnmzbgwf7ib4oyyZubNd5M5cGcsMRMxCZA0GsB4YGDg3rKfwpZF
         A82aqd8bCWrL+HEX3pRo9c0plI4snH3fgP/Kat68wjqEMHFfsrp//DFSAS9G/re0Enqp
         7fgx6xeEoq1WiT9Z5Fkql2B8fzX3yhRGd5fzWzMo8Xp9KwAUw2qDh5u6n0o+2SO2JMcQ
         my7Lo9XtMI6tV55RZr8KCw+BwCfiS4lFMMjNRPIiHnqI4JIkYSrNty/uXjG6caPhhLbT
         KT7i5AULeo/hE19rQSkk54nqdqB7UK0tREcnxLyG5SD1kHafJolytuoMwj+FGA/gCqQg
         vRYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yxr3yy5APwTjGC/8MQQ5vWLHB19nNrJrEZoaHSPj4Ms=;
        fh=zarmFWerEjjWGWeY8IJT/xe13v5U1S1bwdhRiWnUIZg=;
        b=gkOYPzGagfgFwfsfHqXiBX30erBzNUp/nmel9kBZyk04mN1/FUn8bln4I/lY/qSnBA
         VTOlDXZoj+qzwBOKwH++qKVUq9DqrLykbYuzpyjNBfkOv6RfEkaq5V2yIodQIuDR5pau
         RrolM3nysMzF3agdQVY9pZYHc1itln4rAd0wSa1p/XzqJQFiHqX3TmoL5zJtsNstvkQh
         JIsZq1znH7H77LmcPWtZu8rMiy4bwboa2I5urNC1XbpGRnm5e3xgisBVAipYmy22YYZj
         5oZaLol0nJSwcyLXYE5v+DSrgfEb5SBMKRVhAZ+7LnfAU6TZyA/fo2jy2izP79Xo1h16
         UXdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792432245; x=1793037045; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yxr3yy5APwTjGC/8MQQ5vWLHB19nNrJrEZoaHSPj4Ms=;
        b=X94fJJcN6WgT8uds2apjKEVmETaVRjRrCyGidzcrLzLNF4zsGtC0lHD1ZfW8xrkmY2
         HE5zkoCS/SvdkKzgL7DQLE8yNtobw3m1sJfJdzZbojPgn13Jj0mNSZlmNEeWN+bqyg5T
         ig3LrPETQPZxuhIT5yt5OWVYpwT9jhvvQBr+eJedsNFFxSNXmcxdNqjyAJ1gopLpVPnJ
         +tCFH8tIw8uBNKPnRjVZQTqPvW9zsuPsn2djGcLhgHUlJBbpBdmNJeeBHexGhOS97mZN
         QCEHofxP99yBlt7Ow1w4nLF+plBIZ+1M0QlnZqDfPDN/xx4cb/6OSvP57r5lVL5dHxa0
         jIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792432245; x=1793037045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxr3yy5APwTjGC/8MQQ5vWLHB19nNrJrEZoaHSPj4Ms=;
        b=f4zFyb1M+LCiYVpfA006tu6flGJcOT5h4bW2sLwUiEzRiKxp62es4Wz81G1FNDVT/S
         YX67ocwqLSVvSUrdX1ZbLkzljH8yPCofT1TIjN4oR/EN1WJGhDxdRfetmZ3obzNoXIhX
         G8Be6HgM/zNdlJ8vAKqUzM8Ule8rRn41yv4h6ficuhSPSlZTkbUhOhJj/cgzuIID3cTw
         rtfPeRJ7yVL7yS18/5I8R8+KMz343umXi10JntVLS+O5CZCVYCpzq7WwEghljT6nL2+H
         BTgs/lV++z+O+TV5Sajl5Gtr2aaV/W2mx31vLbsNctssnGQ9GorfgoxR8rKzZnsF1T6C
         juyw==
X-Forwarded-Encrypted: i=1; AKwUvBx+hVVgII7JHFeYb7CnfY8HCloT5epBGAOoJz0TT9VIbckuKSmwQNR8qKc2STxDxMnCFCKfFm/DFkZre6AmXvKu@lists.infradead.org
X-Gm-Message-State: AFq9FYLIvCckJ1aCTW8/y7YuQyqEupesrc3OFMVxL+a9s5Mp7JNThvD1
	Ti5ykNS1mHz/AxnFs1ZHOvCGaOWKX8qHhPRVHNzrxX4h7rJhSFTkrPw5hu64S5B6vhLNRDHEtaH
	IIVkByaVm0+mWM4NOJa0CIodxIiY0nJdyzdmWnVJ1
X-Gm-Gg: AYBFou1PEwwX6xlFJ3xxbTJQ0/pBODcN9FByqtwoiG/Z3Uagsu0jVf5zB9QrkFBK+sI
	kEEoAwr8COYYsM0gPhnjYI6A3lcYzWjbg9Kwx9fFcgF/DzD8bbIkz/jXFz9RXyn/G/uwk32+pCg
	22l7oTZ7zE2K6GtBi/u/3o7ZOkr3spEcBZlthCeUdk+OXTNV0lvUP+VEloZvq1dlOr//WgmtXrX
	xHwm0upYR9yp0B4anb6DTXs2QCEBwdr5qr/hCvepdT5PDDMMYvog4dWVxRLLz6rdLXxuSRnThLF
	qi68M3M6DrYjJsXZMRj0unrFYxUxvU4k/P/4q+JaIYcKMLlad/7DN6RSe9uRXoH2tOJZg7mcoiM
	J35CZu68lrw==
X-Received: by 2002:a05:7023:901:b0:138:30b1:4c00 with SMTP id
 a92af1059eb24-1850c40d8d0mr14069971c88.3.1792432242358; Mon, 19 Oct 2026
 10:50:42 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019164241.403644-1-bwicaksono@nvidia.com> <20261019164241.403644-4-bwicaksono@nvidia.com>
In-Reply-To: <20261019164241.403644-4-bwicaksono@nvidia.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Mon, 19 Oct 2026 10:50:03 -0700
X-Gm-Features: AclHuK-k9em4UinzRLY1SwpkrF-Fn3v95lx1FapCdO9mAXeOsitZvqSqnBbEdcc
Message-ID: <CAJpZYjURztEO088Z4ms01UmxST+OYD5-t9u4ymGe-iig9jO_jg@mail.gmail.com>
Subject: Re: [PATCH 3/6] perf jevents: Add support for NVIDIA Tegra410 PCIE
 PMU aliasing
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: acme@kernel.org, namhyung@kernel.org, irogers@google.com, 
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
X-CRM114-CacheID: sfid-20261019_105046_620879_5F6C7311 
X-CRM114-Status: GOOD (  20.46  )
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
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Besar,

Thanks for the series. I tested this on a 2-socket Tegra410. With
--metric-only, each PCIe metric shows up once per socket, with `nan`
("none" with -j) in the other socket's column, so -j has the same key
twice in each row. "counters" is also 0 for socket 1, because it comes
from the first event, which belongs to socket 0:

```
$ perf stat -a --per-socket -M pcie_avg_wr_bandwidth_to_all_dst -j
--metric-only -- sleep 1
{"socket" : "S268435456", "counters" : 6, "MB/s
pcie_avg_wr_bandwidth_to_all_dst" : "0.1", "MB/s
pcie_avg_wr_bandwidth_to_all_dst" : "none"}
{"socket" : "S285212672", "counters" : 0, "MB/s
pcie_avg_wr_bandwidth_to_all_dst" : "none", "MB/s
pcie_avg_wr_bandwidth_to_all_dst" : "0.9"}
```

As in [1], a single PMU per RC with cpumask `0,88`, or the socket last
in the PMU name, would fix this.

[1] https://lore.kernel.org/linux-perf-users/CAJpZYjWLRiyNbzoGpA-2KE0zHgQn2=
gc0V943WxJEr5K5aZtRYA@mail.gmail.com/

Thanks,
CT

On Mon, Oct 19, 2026 at 9:45=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
> Add alias support for NVIDIA Tegra410 PCIE PMU events and metrics.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>  .../arm64/nvidia/t410/sys/uncore-pcie.json    | 247 ++++++++++++++++++
>  1 file changed, 247 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/unco=
re-pcie.json
>
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie=
.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie.json
> new file mode 100644
> index 000000000000..37c3eac305e5
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie.json
> @@ -0,0 +1,247 @@
> +[
> +    {
> +        "EventCode": "0x100000000",
> +        "EventName": "PCIE_CYCLES",
> +        "BriefDescription": "Counts cycles at the PCIe interface to the =
Tegra SoC data fabric.",
> +        "PublicDescription": "Counts cycles at the PCIe interface to the=
 Tegra SoC data fabric.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x2",
> +        "EventName": "PCIE_RD_REQ",
> +        "BriefDescription": "Counts read requests from PCIe devices unde=
r this PCIe root complex to memory or another PCIe device.",
> +        "PublicDescription": "Counts read requests from PCIe devices und=
er this PCIe root complex to memory or another PCIe device, where the targe=
t responds with data. Request size can be from 1 to 256 bytes. Filters: src=
_rp_mask selects the requesting root ports. Alternatively, src_bdf with src=
_bdf_en selects one requesting device (BDF); it cannot be combined with src=
_rp_mask and applies to all counters of this PMU. Destination filters selec=
t the memory type of the request address: dst_loc_cmem local CMEM, dst_loc_=
gmem local GMEM, dst_loc_pcie_p2p local PCIe peer addresses, dst_loc_pcie_c=
xl local CXL memory, dst_rem remote memory. This is the address's home type=
, not where the data currently resides; local or remote is determined by th=
e home socket of the address. An unset source filter counts all root ports;=
 an unset destination filter counts all destinations.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x3",
> +        "EventName": "PCIE_WR_REQ",
> +        "BriefDescription": "Counts write requests from PCIe devices und=
er this PCIe root complex to memory or another PCIe device.",
> +        "PublicDescription": "Counts write requests from PCIe devices un=
der this PCIe root complex to memory or another PCIe device, where the PCIe=
 device sends data. Request size can be from 1 to 256 bytes. Filters: src_r=
p_mask selects the requesting root ports. Alternatively, src_bdf with src_b=
df_en selects one requesting device (BDF); it cannot be combined with src_r=
p_mask and applies to all counters of this PMU. Destination filters select =
the memory type of the request address: dst_loc_cmem local CMEM, dst_loc_gm=
em local GMEM, dst_loc_pcie_p2p local PCIe peer addresses, dst_loc_pcie_cxl=
 local CXL memory, dst_rem remote memory. This is the address's home type, =
not where the data currently resides; local or remote is determined by the =
home socket of the address. An unset source filter counts all root ports; a=
n unset destination filter counts all destinations.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x0",
> +        "EventName": "PCIE_RD_BYTES",
> +        "BriefDescription": "Counts bytes transferred by the read reques=
ts counted by PCIE_RD_REQ.",
> +        "PublicDescription": "Counts bytes transferred by the read reque=
sts counted by PCIE_RD_REQ. Source and destination filters work as describe=
d for PCIE_RD_REQ.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x1",
> +        "EventName": "PCIE_WR_BYTES",
> +        "BriefDescription": "Counts bytes transferred by the write reque=
sts counted by PCIE_WR_REQ.",
> +        "PublicDescription": "Counts bytes transferred by the write requ=
ests counted by PCIE_WR_REQ. Source and destination filters work as describ=
ed for PCIE_WR_REQ.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x4",
> +        "EventName": "PCIE_RD_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding read requests c=
ounted by PCIE_RD_REQ each cycle at the PCIe interface.",
> +        "PublicDescription": "Accumulates the outstanding read requests =
counted by PCIE_RD_REQ each cycle at the PCIe interface. Pair the two under=
 the same filters for the average read latency. Source and destination filt=
ers work as described for PCIE_RD_REQ.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_freq",
> +        "MetricGroup": "PCIE_Frequency;PCIE_Read_Latency",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_CYCLES / aggr_nr(PCIE_CYCLES)) / 1e9 / dura=
tion_time",
> +        "ScaleUnit": "1GHz",
> +        "BriefDescription": "Frequency of the cycles at the PCIe interfa=
ce to the Tegra SoC data fabric.",
> +        "PublicDescription": "Average frequency of the cycles at the PCI=
e interface to the Tegra SoC data fabric over the measurement interval.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_all_dst",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_To_All_Destinations",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_cmem=3D1,dst_loc_gmem=3D1,d=
st_loc_pcie_p2p=3D1,dst_loc_pcie_cxl=3D1,dst_rem=3D1@ / 1e6 / duration_time=
",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to all destinations.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to all destinations: local CMEM=
, local GMEM, local PCIe peer addresses, local CXL memory and remote memory=
.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_all_dst",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_To_All_Destinations",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_cmem=3D1,dst_loc_gmem=3D1,d=
st_loc_pcie_p2p=3D1,dst_loc_pcie_cxl=3D1,dst_rem=3D1@ / 1e6 / duration_time=
",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to all destinations.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to all destinations: local CME=
M, local GMEM, local PCIe peer addresses, local CXL memory and remote memor=
y.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_all_dst",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_To_All_Destinations",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_cmem=3D1,dst_loc_gmem=
=3D1,dst_loc_pcie_p2p=3D1,dst_loc_pcie_cxl=3D1,dst_rem=3D1@ / PCIE_RD_REQ@d=
st_loc_cmem=3D1,dst_loc_gmem=3D1,dst_loc_pcie_p2p=3D1,dst_loc_pcie_cxl=3D1,=
dst_rem=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to all destinations.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to all destinations: local CMEM, =
local GMEM, local PCIe peer addresses, local CXL memory and remote memory."=
,
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_local_cmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Local_CMEM",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_cmem=3D1@ / 1e6 / duration_=
time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to local CMEM.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to local CMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_local_cmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Local_CMEM",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_cmem=3D1@ / 1e6 / duration_=
time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to local CMEM.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to local CMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_local_cmem",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Local_CMEM",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_cmem=3D1@ / PCIE_RD_REQ=
@dst_loc_cmem=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to local CMEM.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to local CMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_local_gmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Local_GMEM",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_gmem=3D1@ / 1e6 / duration_=
time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to local GMEM.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to local GMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_local_gmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Local_GMEM",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_gmem=3D1@ / 1e6 / duration_=
time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to local GMEM.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to local GMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_local_gmem",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Local_GMEM",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_gmem=3D1@ / PCIE_RD_REQ=
@dst_loc_gmem=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to local GMEM.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to local GMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_local_cxlmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Local_CXLMEM",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_pcie_cxl=3D1@ / 1e6 / durat=
ion_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to local CXL memory.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to local CXL memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_local_cxlmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Local_CXLMEM",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_pcie_cxl=3D1@ / 1e6 / durat=
ion_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to local CXL memory.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to local CXL memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_local_cxlmem",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Local_CXLMEM=
",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_pcie_cxl=3D1@ / PCIE_RD=
_REQ@dst_loc_pcie_cxl=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to local CXL memory.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to local CXL memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_remote_mem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Remote_Memory",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_rem=3D1@ / 1e6 / duration_time"=
,
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to remote memory.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to remote memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_remote_mem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Remote_Memory"=
,
> +        "MetricExpr": "PCIE_WR_BYTES@dst_rem=3D1@ / 1e6 / duration_time"=
,
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to remote memory.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to remote memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_remote_mem",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Remote_Memor=
y",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_rem=3D1@ / PCIE_RD_REQ@dst_=
rem=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to remote memory.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to remote memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_local_pcie_peer",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Local_PCIE_Peer=
",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_pcie_p2p=3D1@ / 1e6 / durat=
ion_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to local PCIe peer addresses.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to local PCIe peer addresses.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_local_pcie_peer",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Local_PCIE_Pee=
r",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_pcie_p2p=3D1@ / 1e6 / durat=
ion_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to local PCIe peer addresses.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to local PCIe peer addresses."=
,
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_local_pcie_peer",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Local_PCIE_P=
eer",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_pcie_p2p=3D1@ / PCIE_RD=
_REQ@dst_loc_pcie_p2p=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to local PCIe peer addresses.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to local PCIe peer addresses.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    }
> +]
> --
> 2.43.0
>

