Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CC4C624CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 01:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6iCtAnnI49OGLW9ySlZUD0rarIlZ+sSl9c1sQjcB4Y=; b=oPs0JN88DwZaTuYgSvylGv/2YR
	Iz8JFxiG9XU4uwNLb61iJfXHSWNCIv3LpL1ohBLlaolHQDQGTqGMx6sw/gVBIXbDYvGHaU1uGODTD
	vWTvtfmCEbsurBqOBB/engkCWhJUL0cROQfJtTUK/xn92Pp0ZwOL4KoE1M1cY+JbcfkxLzZa3P/L0
	/UiZHYAaoottCh9XJY58a5hFwMhT09N3MNPAuMCaM4x/ILRYfRIwOWgycba3WVYxrBlqtxM62GagT
	mjlgzMpttIJBykig/O8ARmRKlgKhAGQQyJk6xvrFOkPQIC4mute6jMcixZH8Hxaw5JxCLbve5AgYp
	bOPAGNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DLp-0000000Ao8V-1wP8;
	Tue, 01 Sep 2026 01:31:49 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DLl-0000000Ao88-0WoF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 01:31:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=F6iCtAnnI49OGLW9ySlZUD0rarIlZ+sSl9c1sQjcB4Y=;
	b=Pfk2cfdd2lkkfaJghnK1V5QNqCG+vzUjSy5NvwSfX4B5LKYRrHGO5y/b3+mcm3npeDnnDk74n
	JHZ9uyKOirx2g4QqhDDJwtlOaQXSxGeJSRxHscsNWzxD6VFLEZ1a+Zf9W/KXLr7CuAMi/inYI8B
	qtzyPUWt5hHgQK/GXOS1ydM=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hYp2544xMzpTBG;
	Tue,  1 Sep 2026 09:20:13 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id EFBA54058C;
	Tue,  1 Sep 2026 09:31:31 +0800 (CST)
Received: from [10.67.120.139] (10.67.120.139) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Sep 2026 09:31:29 +0800
Message-ID: <c00d649f-aa24-40a8-849e-789ce1a6aca9@huawei.com>
Date: Tue, 1 Sep 2026 09:31:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] hwtracing: hisi_ptt: Add pattern PMU config for
 trace format selection
To: Sizhe Liu <liusizhe5@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <bhelgaas@google.com>, <yangyccccc@gmail.com>,
	<jic23@kernel.org>, <john.g.garry@oracle.com>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <wuzongyu1@huawei.com>
References: <20260827140442.2031128-1-liusizhe5@huawei.com>
 <20260827140442.2031128-8-liusizhe5@huawei.com>
Content-Language: en-US
From: Yushan Wang <wangyushan12@huawei.com>
In-Reply-To: <20260827140442.2031128-8-liusizhe5@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 whupemo500002.china.huawei.com (7.152.185.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_183145_902497_693AC6BA 
X-CRM114-Status: GOOD (  27.92  )
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

On 8/27/2026 10:04 PM, Sizhe Liu wrote:
> Introduce a `pattern` PMU config field (config:36-39) that controls
> which TLP header format the hardware traces. bit[3:1] are reserved for
> future extension and only bit0 is used currently:
>
> - pattern=0 (default, compatibility mode): the driver sets bit[8] of
>   HISI_PTT_TRACE_CTRL so the hardware traces the data in compatibility
>   mode.
> - pattern=1: the driver clears bit[8] of HISI_PTT_TRACE_CTRL so the
>   hardware traces the data pattern including some bitfields of the TLP
>   header defined in PCIe r6.4 sec 2.2.1.2.
>
> Note that bit[8] of HISI_PTT_TRACE_CTRL is inverted with respect to the
> `pattern` value: bit[8]=1 selects the legacy format, bit[8]=0 selects
> the new format. Bit[11:9] is still reserved, which is consistent with the
> PMU config field. The driver validates the 4-bit value in
> hisi_ptt_trace_valid_pattern() and applies it in hisi_ptt_trace_start().
>
> Document the new parameter in Documentation/trace/hisi-ptt.rst.
>
> Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
> ---
>  Documentation/trace/hisi-ptt.rst | 25 +++++++++++++++++++++++--
>  drivers/hwtracing/ptt/hisi_ptt.c | 25 ++++++++++++++++++++++++-
>  drivers/hwtracing/ptt/hisi_ptt.h |  4 ++++
>  3 files changed, 51 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/trace/hisi-ptt.rst b/Documentation/trace/hisi-ptt.rst
> index f6a2655f99e5..c95eaa12f4d3 100644
> --- a/Documentation/trace/hisi-ptt.rst
> +++ b/Documentation/trace/hisi-ptt.rst
> @@ -255,7 +255,28 @@ directly from the TLP header.
>       DW2 [                     Header DW2                            ]
>       DW3 [                     Header DW3                            ]
>
> -5. Memory Management
> +5. Trace pattern
> +-----------------
> +
> +You can control whether the trace is taken with the new version of the
> +TLP header format by specifying the `pattern` parameter. The default
> +value is 0, which means the legacy format is used for backward
> +compatibility. The parameter value is 4 bit and bit[3:1] are currently
> +reserved for extension. Current supported values are shown below:
> +
> +- 4'b0000: legacy trace format
> +    DW2 and DW3 are printed with generic field names only, and
> +    no message-type-basedfield decoding.
> +- 4'b0001: trace format v1
> +    DW2 and DW3 are decoded according to the TLP message type (MWr,
> +    Msg, Atomic, IO, CPL, Cfg) with detailed field names. It is recommended to
> +    use trace format v1 when the current PCIe link generation is higher than
> +    PCIe 6.0.
> +
> +For trace data recorded by an older tracer without the `pattern` parameter,
> +the decoder will work as `pattern` forced to 0.
> +
> +6. Memory Management
>  --------------------
>
>  The traced TLP headers will be written to the memory allocated
> @@ -274,7 +295,7 @@ will commit the AUX buffer first and then apply for a new one with
>  the same size. The size of AUX buffer is default to 16MiB. User can
>  adjust the size by specifying the `-m` parameter of the perf command.
>
> -6. Decoding
> +7. Decoding
>  -----------
>
>  You can decode the traced data with `perf report -D` command (currently
> diff --git a/drivers/hwtracing/ptt/hisi_ptt.c b/drivers/hwtracing/ptt/hisi_ptt.c
> index 94c371c49135..1696c30ac4c9 100644
> --- a/drivers/hwtracing/ptt/hisi_ptt.c
> +++ b/drivers/hwtracing/ptt/hisi_ptt.c
> @@ -233,6 +233,10 @@ static int hisi_ptt_trace_start(struct hisi_ptt *hisi_ptt)
>       val |= FIELD_PREP(HISI_PTT_TRACE_CTRL_TARGET_SEL, hisi_ptt->trace_ctrl.filter);
>       if (!hisi_ptt->trace_ctrl.is_port)
>               val |= HISI_PTT_TRACE_CTRL_FILTER_MODE;
> +     if (!ctrl->pattern)
> +             val |= HISI_PTT_TRACE_CTRL_PATTERN;
> +     else
> +             val &= ~HISI_PTT_TRACE_CTRL_PATTERN;

Hi Sizhe,

This hunk seems not able to be applied to mainstream cleanly, otherwise
this series LGTM.

Reviewed-by: Yushan Wang <wangyushan12@huawei.com>

>
>
>       /* Start the Trace */
>       val |= HISI_PTT_TRACE_CTRL_EN;
> @@ -805,12 +809,14 @@ PMU_FORMAT_ATTR(filter,         "config:0-19");
>  PMU_FORMAT_ATTR(direction,   "config:20-23");
>  PMU_FORMAT_ATTR(type,                "config:24-31");
>  PMU_FORMAT_ATTR(format,              "config:32-35");
> +PMU_FORMAT_ATTR(pattern,             "config:36-39");
>
>  static struct attribute *hisi_ptt_pmu_format_attrs[] = {
>       &format_attr_filter.attr,
>       &format_attr_direction.attr,
>       &format_attr_type.attr,
>       &format_attr_format.attr,
> +     &format_attr_pattern.attr,
>       NULL
>  };
>

[...]



