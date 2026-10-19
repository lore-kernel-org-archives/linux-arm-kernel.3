Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CF8606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 23:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=czdVzBQK;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hoiI6/5s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkEO/OSiRmfTcfnZn00ylSAwEOQz293NLx30J9yMRbI=; b=czdVzBQKBihr+iB4Ai+p+aXPkC
	rdtSzryhyh7kEAfYNk1vIlG+0hbmjMHp8QCQYNTgtv6mjpSbgHeWQ0HC/4kSEP3ko/hPQF58Wa5rM
	wR6Thh60QXL5J1vgCgPTerEQlGl+gVVRn6tf+Svhp6+/cwEuDuJJSkJah6Xwnkb6UVQ5o94hikayN
	qKutbH0ZwnlsEU/BkSgj/rF4VqAhvDP2+OpzWsCdhWaBLyAcmq9OG5tURhICNh+Bh8Egaex4tcyji
	vOdrcTkjjVbtBft2gMoncbm1MxirDI63+cfG2kzq6e1tdBdba69pdVAfkldEPi53Wj+x0Rwv/JNzq
	b9NwEohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIwcY-00000008Wuo-23vg;
	Mon, 19 Oct 2026 23:18:22 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIwcV-00000008WuB-2Dmu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 23:18:20 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-5337fa12431so72391cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 16:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792451896; cv=none;
        d=google.com; s=arc-20260327;
        b=ced4mU7/Ny5EyZ7ZFjh7vCreUnxRgIxG3a2lbfBtP7oy5zZUIMeIDfHTfGZGfK1jKc
         le9oV6F7azh9T+r8GzolE+ObwxChsZXwfAvP3LFI4Ii8FsoU9yKxakpNTBqt9PE5XN1V
         cs+AnjmOJHIzJgdXYjzs4STpG0DI3oosF1pooidSRV9m7ZE9dZ8o2Iaeij22QHTER0MV
         Zd1rwzStUL3EbYqQuVPH7FR/yUR+ADNnBzeBm8hVoS2KJmYTTYe/OXjMH83rWWgZBwS/
         Fq8L4B1IUnrH/MK0CFQULALgJsiYCAPkrSu91YHr1JSKTRWsWMfrL68RMSft0hPn0255
         iDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xkEO/OSiRmfTcfnZn00ylSAwEOQz293NLx30J9yMRbI=;
        fh=I18V9TE3CMuM+3dtZGNF9ImCmo7L41m7dHepMBfq3l0=;
        b=r/2wnH5K93W9DKRtEUEPunWWxdBreLwcdgKX2aP8FU9ybE2y7b6JaRhasn79u5DXAO
         7L0LlG+I63s5tVTpQ8/RcweYzEvkeS6ktcgIFPEusBH141dl8+PjjHIqPK9Xs3Q+yzdc
         tgdcH88CPU+Auxm+OL2++lN99qPFdR1WPCcEuNhBra17j/1c5AGPoMeEi0Udu6vg7l0C
         x9p9EjqAAW9Nr4A0WV4yTBYQ5i+JZOQyS2WAD51tGhJjXUosV+6uvqLYLshRb6YStwQG
         84IMmZKfekXCO6/XwHtwK/Un4hHRBbMp607siLmZ0x2dOEjmcirdt6VHLOxtxNTcubnl
         IBWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792451896; x=1793056696; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xkEO/OSiRmfTcfnZn00ylSAwEOQz293NLx30J9yMRbI=;
        b=hoiI6/5svdb1as7CFK5r8M2esg38jU1u0Z7RNliG7YB9DvmYj44PiBV9rFMBqT3ucl
         sxHfoqEYTQQ7l5PoOZjx1HEz/Zwn5+bAiJTCT10PFKeBVPs8WiY6+ENjF7maRNztzLCq
         vxWpGK86gMZFvgVWVNz7nB63qO+Dm0AQUjnDfvf5iDvArWsPrnu9P/qRqE+qEohH8OcV
         zJTVgCjOwmQIMyatqbsI+IdSXl9KafKfR8A6ZXXMwabDOoa+2a+2llMOd+syHCfzDHmc
         PudSS74aX2fAaeo+GO6W9QTPmFB/XLbZIXENfXxYEeK5+GQp9ZHt3HzLqeTozmIUoHF6
         oaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451896; x=1793056696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkEO/OSiRmfTcfnZn00ylSAwEOQz293NLx30J9yMRbI=;
        b=y2sgPlUa1S0IF30UsCIkwdXkUzVtirnVdwjziwvmLS0WztVHpT1qrtQtoGWPNBo1gx
         ZxqogX7rQ1h/pJBMO2J00gKE/vqf1Vj9d5Sp0jalp+hWJel8QjgyzjEHmv7HyPbsj9B8
         TO6fJoMSbJdCoO6+yDOEAQ2c+MvwDZqwe3T38wx4/3EKYxwQRXYqVyTC4cVDFZlnO9wO
         vvGKQPtAtaZJCPM6ZTlzuPTKOzSelA+zh/ls4KOf0F8Clv5NpYeroE07eiTHdnwyZxwC
         gWiHE/TGqzDQZIc7BZcuySobcpKP5Y1H+2XfBnp2e4eacjzQz7qllu8I+Om29PjsODdz
         IpGA==
X-Forwarded-Encrypted: i=1; AKwUvBxctuTalHEY82wUhjlxvW9rjjApbZHXe/BGrMCqjLSC/wBNI8L/mRVLweRp62cg3Dv48dm3hfvJXkyd+NeSdJRq@lists.infradead.org
X-Gm-Message-State: AFq9FYLuLuRuce04zDI3StpN6l+1iFEqzhhe+cAhOohWq+9znkohyy6B
	YHDfcZQNDadQMEgdZZY+aFCdujp0z/p6Oofoz+cGXD7YFnIgvIL2TrzVeDKNxy8d/iq+S5aGC50
	CUT3sn65C80Kl3OJ52I1m9sXB7W7AkGNexEcSFDMU
X-Gm-Gg: AYBFou3z7XLofVoKfWqB5cdpwf817k+WKdwwLi+/YJ37Tz/x0Bv85NmH/Fuacnhbqdk
	A4FEBsZPTdW7+gWI1oINgfX7Z/OIeb7aiG2sTBWYuyDNh7/XM7Nrn1dBB4+mIe+3fDdrKxU6qgO
	XQxEM2brYALnmYG7ecD2h/yO1if0cXsMNVXwYnpQb0cpj4+dZj0ZfWIII6nhpSMvj5Mrgmryuhz
	ZVSJTk0NwlFd/RYzEtFle6P1SRwmA9TjniMkQ+RIyu6ZEscScpvDVeLwL9pjNumHtNVbLMTeR+M
	JIRl0ej/6+W+dw3hqol1r1YnJc5TWgHSxiWYP1OnA9tutQl+z0WFK1D/+7NAuGaVpzhCjYx8xaT
	6/7x0/R0/9fuEMPn6mhQq7Ph5g5ySgjiUDC3lLt8+1yy3juxSYXvng3vFBg==
X-Received: by 2002:a05:622a:418c:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-53688361cc0mr3730081cf.14.1792451895603; Mon, 19 Oct 2026
 16:18:15 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019164241.403644-1-bwicaksono@nvidia.com> <20261019164241.403644-5-bwicaksono@nvidia.com>
In-Reply-To: <20261019164241.403644-5-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 19 Oct 2026 16:18:02 -0700
X-Gm-Features: AclHuK-P4jTEpdJSRDgE-1GK0BbwVAkaLE7mt8LMQ_UZz4JJYrKoVTt4WXDObg8
Message-ID: <CAP-5=fWucvdYefDOL3Vn=O=YUPEXE+tngDDfPLv-T5i3WkCJVA@mail.gmail.com>
Subject: Re: [PATCH 4/6] perf jevents: Add support for NVIDIA Tegra410
 PCIE-TGT PMU aliasing
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: acme@kernel.org, namhyung@kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vsethi@nvidia.com, rwiley@nvidia.com, 
	skelley@nvidia.com, mochs@nvidia.com, rajjoshi@nvidia.com, treding@nvidia.com, 
	jonathanh@nvidia.com, john.garry@linux.dev, will@kernel.org, 
	james.clark@linaro.org, mike.leach@arm.com, leo.yan@linux.dev, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, ctshao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_161819_617014_721AA3D5 
X-CRM114-Status: GOOD (  19.62  )
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

On Mon, Oct 19, 2026 at 9:45=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
> Add alias support for NVIDIA Tegra410 PCIE-TGT PMU events and metrics.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>  .../nvidia/t410/sys/uncore-pcie_tgt.json      | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/unco=
re-pcie_tgt.json
>
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie=
_tgt.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie_tg=
t.json
> new file mode 100644
> index 000000000000..74786fc3d578
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.js=
on
> @@ -0,0 +1,93 @@
> +[
> +    {
> +        "EventCode": "0x4",
> +        "EventName": "PCIE_TGT_CYCLES",
> +        "BriefDescription": "Counts cycles at the PCIe interface to the =
Tegra SoC data fabric.",
> +        "PublicDescription": "Counts cycles at the PCIe interface to the=
 Tegra SoC data fabric.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"

It looks like the PMU names are broken because of the _rc_ in their names:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/perf/arm_cspmu/nvidia_cspmu.c#n901
```
   .name_pattern =3D "nvidia_pcie_pmu_%u_rc_%u",
```
The convention is for either a numeric (preferable) or hexadecimal suffix:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/ABI/testing/sysfs-bus-event_source-devices
Extra information about the PMU belongs in a caps file.

By definition nothing can work with wildcard matching using the
existing PMU name, so please rename it. If a new suffix convention is
necessary then  you should update the ABI and perf tool suffix
matching logic like pmu_name_len_no_suffix:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/perf/util/pmus.c#n65

Thanks,
Ian Rogers

>
> +    },
> +    {
> +        "EventCode": "0x2",
> +        "EventName": "PCIE_TGT_RD_REQ",
> +        "BriefDescription": "Counts read requests from any source to PCI=
e BAR or CXL HDM ranges under this PCIe root complex.",
> +        "PublicDescription": "Counts read requests from any source to PC=
Ie BAR or CXL HDM ranges under this PCIe root complex, where the target res=
ponds with data. Request size can be from 1 to 256 bytes. Filters: dst_rp_m=
ask selects PCIe BAR traffic to root ports (bit n =3D root port n). dst_add=
r_en with dst_addr_base and dst_addr_mask selects PCIe BAR or CXL HDM addre=
sses that equal the base in the mask's set bits. If both dst_rp_mask and th=
e address filter are set, a request matching either is counted. With no fil=
ter, PCIe BAR traffic to all root ports is counted.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x3",
> +        "EventName": "PCIE_TGT_WR_REQ",
> +        "BriefDescription": "Counts write requests from any source to PC=
Ie BAR or CXL HDM ranges under this PCIe root complex.",
> +        "PublicDescription": "Counts write requests from any source to P=
CIe BAR or CXL HDM ranges under this PCIe root complex, where the source se=
nds data. Request size can be from 1 to 256 bytes. Filters: dst_rp_mask sel=
ects PCIe BAR traffic to root ports (bit n =3D root port n). dst_addr_en wi=
th dst_addr_base and dst_addr_mask selects PCIe BAR or CXL HDM addresses th=
at equal the base in the mask's set bits. If both dst_rp_mask and the addre=
ss filter are set, a request matching either is counted. With no filter, PC=
Ie BAR traffic to all root ports is counted.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x0",
> +        "EventName": "PCIE_TGT_RD_BYTES",
> +        "BriefDescription": "Counts bytes transferred by the read reques=
ts counted by PCIE_TGT_RD_REQ.",
> +        "PublicDescription": "Counts bytes transferred by the read reque=
sts counted by PCIE_TGT_RD_REQ. Destination filters work as described for P=
CIE_TGT_RD_REQ.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x1",
> +        "EventName": "PCIE_TGT_WR_BYTES",
> +        "BriefDescription": "Counts bytes transferred by the write reque=
sts counted by PCIE_TGT_WR_REQ.",
> +        "PublicDescription": "Counts bytes transferred by the write requ=
ests counted by PCIE_TGT_WR_REQ. Destination filters work as described for =
PCIE_TGT_WR_REQ.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_freq",
> +        "MetricGroup": "PCIE_TGT_Frequency",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_TGT_CYCLES / aggr_nr(PCIE_TGT_CYCLES)) / 1e=
9 / duration_time",
> +        "ScaleUnit": "1GHz",
> +        "BriefDescription": "Frequency of the cycles at the PCIe interfa=
ce to the Tegra SoC data fabric.",
> +        "PublicDescription": "Average frequency of the cycles at the PCI=
e interface to the Tegra SoC data fabric over the measurement interval.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_avg_rd_bandwidth_to_all_dst",
> +        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR_CXL_HDM"=
,
> +        "MetricExpr": "PCIE_TGT_RD_BYTES@dst_addr_en=3D1,dst_addr_base=
=3D0,dst_addr_mask=3D0@ / 1e6 / duration_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth to all PCIe BAR and =
CXL HDM ranges under this PCIe root complex.",
> +        "PublicDescription": "Average read bandwidth of requests from an=
y source to all PCIe BAR and CXL HDM ranges under this PCIe root complex.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_avg_wr_bandwidth_to_all_dst",
> +        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR_CXL_HDM"=
,
> +        "MetricExpr": "PCIE_TGT_WR_BYTES@dst_addr_en=3D1,dst_addr_base=
=3D0,dst_addr_mask=3D0@ / 1e6 / duration_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth to all PCIe BAR and=
 CXL HDM ranges under this PCIe root complex.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ny source to all PCIe BAR and CXL HDM ranges under this PCIe root complex."=
,
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_avg_rd_bandwidth_to_pcie_bar",
> +        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR",
> +        "MetricExpr": "PCIE_TGT_RD_BYTES / 1e6 / duration_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth of PCIe BAR traffic =
to all root ports under this PCIe root complex.",
> +        "PublicDescription": "Average read bandwidth of PCIe BAR traffic=
 from any source to all root ports under this PCIe root complex.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_avg_wr_bandwidth_to_pcie_bar",
> +        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR",
> +        "MetricExpr": "PCIE_TGT_WR_BYTES / 1e6 / duration_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth of PCIe BAR traffic=
 to all root ports under this PCIe root complex.",
> +        "PublicDescription": "Average write bandwidth of PCIe BAR traffi=
c from any source to all root ports under this PCIe root complex.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    }
> +]
> --
> 2.43.0
>

