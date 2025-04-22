Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2E1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwW4Kp/dKqvhJyXOF2NURvxLzJsS3QaqTeg+K8BwRvw=; b=EcgiG5cvrarnb6SWrbzoRRvZkj
	tSo6uxSV2yR7MmltzejC2fAh3dGGQiJ6ncHKkA77+lzzyCUGW3zpvcOlcKVxyRySdHF5fwQRFZ+u/
	JkIvCcCRQ1y24VYH9+Exb9HEGhp7JRhpYSrQ4BVm83Q/lV5GBGlNUmhr3RJAIgDPKu7f23Upm1SgN
	NTQDyg7wl79JsCBPcwt/pq5mAxVpb4i/Le/KQgfyVsVnTm6Q4ZRZDZcAaimvI7nSdnmwnRIYal19q
	Pgi0FdHjwbeDYUxeoUc6YRqrIsklywGQ7KpgxW+YkHIhyilENkR+HBzt94glRArX7IOXuf/DTNS5D
	1QWij3eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BYu-00000006tpQ-0DkB;
	Tue, 22 Apr 2025 11:13:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7At4-00000006mWm-1hOB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:30:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4045B152B;
	Tue, 22 Apr 2025 03:29:53 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C6AA3F66E;
	Tue, 22 Apr 2025 03:29:57 -0700 (PDT)
Date: Tue, 22 Apr 2025 11:29:52 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Yicong Yang <yangyicong@huawei.com>, jonathan.cameron@huawei.com,
	hejunhao3@huawei.com, linuxarm@huawei.com, wangyushan12@huawei.com,
	caijingtao@huawei.com, xueshan2@huawei.com,
	prime.zeng@hisilicon.com, yangyicong@hisilicon.com, acme@kernel.org,
	namhyung@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
	jolsa@kernel.org, john.g.garry@oracle.com, leo.yan@linux.dev,
	irogers@google.com, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf arm-spe: Add support for SPE Data Source packet on
 HiSilicon HIP12
Message-ID: <20250422102952.GD28953@e132581.arm.com>
References: <20250408122809.37884-1-yangyicong@huawei.com>
 <89741897-6c8f-4b75-8ec3-675111ea60a1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89741897-6c8f-4b75-8ec3-675111ea60a1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_032958_525715_DFDB0789 
X-CRM114-Status: GOOD (  22.23  )
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

On Tue, Apr 22, 2025 at 10:16:40AM +0100, James Clark wrote:
> > 
> > Add data source encoding for HiSilicon HIP12 and coresponding mapping
> > to the perf's memory data source. This will help to synthesize the data
> > and support upper layer tools like perf-mem and perf-c2c.
> > 
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > ---
> >   arch/arm64/include/asm/cputype.h              |   2 +
> >   tools/arch/arm64/include/asm/cputype.h        |   2 +

Please split into two patches.  One is a kernel patch and another is a
tool patch.

[...]

> > --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> > +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> > @@ -82,6 +82,23 @@ enum arm_spe_ampereone_data_source {
> >   	ARM_SPE_AMPEREONE_L2D                           = 0x9,
> >   };
> > +enum arm_spe_hisi_hip_data_source {
> > +	ARM_SPE_HISI_HIP_PEER_CPU		= 0,
> > +	ARM_SPE_HISI_HIP_PEER_CPU_HITM		= 1,
> > +	ARM_SPE_HISI_HIP_L3			= 2,
> > +	ARM_SPE_HISI_HIP_L3_HITM		= 3,
> > +	ARM_SPE_HISI_HIP_PEER_CLUSTER		= 4,
> > +	ARM_SPE_HISI_HIP_PEER_CLUSTER_HITM	= 5,
> > +	ARM_SPE_HISI_HIP_REMOTE_SOCKET		= 6,
> > +	ARM_SPE_HISI_HIP_REMOTE_SOCKET_HITM	= 7,
> > +	ARM_SPE_HISI_HIP_LOCAL			= 8,
> > +	ARM_SPE_HISI_HIP_REMOTE			= 9,
> > +	ARM_SPE_HISI_HIP_NC_DEV			= 13,
> > +	ARM_SPE_HISI_HIP_L2			= 16,
> > +	ARM_SPE_HISI_HIP_L2_HITM		= 17,
> > +	ARM_SPE_HISI_HIP_L1			= 18,
> > +};
> > +
> >   struct arm_spe_record {
> >   	enum arm_spe_sample_type type;
> >   	int err;
> > diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> > index 2a9775649cc2..eceae4219601 100644
> > --- a/tools/perf/util/arm-spe.c
> > +++ b/tools/perf/util/arm-spe.c
> > @@ -571,6 +571,11 @@ static const struct midr_range ampereone_ds_encoding_cpus[] = {
> >   	{},
> >   };
> > +static const struct midr_range hisi_hip_ds_encoding_cpus[] = {
> > +	MIDR_ALL_VERSIONS(MIDR_HISI_HIP12),
> > +	{},
> > +};
> > +
> >   static void arm_spe__sample_flags(struct arm_spe_queue *speq)
> >   {
> >   	const struct arm_spe_record *record = &speq->decoder->record;
> > @@ -718,9 +723,105 @@ static void arm_spe__synth_data_source_ampereone(const struct arm_spe_record *re
> >   	arm_spe__synth_data_source_common(&common_record, data_src);
> >   }
> > +static void arm_spe__synth_data_source_hisi_hip(const struct arm_spe_record *record,
> > +						union perf_mem_data_src *data_src)
> > +{
> > +	/* Use common synthesis method to handle store operations */
> > +	if (record->op & ARM_SPE_OP_ST) {
> > +		arm_spe__synth_data_source_common(record, data_src);
> > +		return;
> > +	}
> > +
> > +	switch (record->source) {
> > +	case ARM_SPE_HISI_HIP_PEER_CPU:
> > +		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
> > +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> > +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> > +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;

Seems it is conflict to set both 'PERF_MEM_SNOOP_NONE' and
'PERF_MEM_SNOOPX_PEER'.

Remove setting 'PERF_MEM_SNOOP_NONE' in this case?

> > +		break;
> > +	case ARM_SPE_HISI_HIP_PEER_CPU_HITM:
> > +		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
> > +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> > +		data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> > +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> > +		break;
> > +	case ARM_SPE_HISI_HIP_L3:
> > +		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
> > +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> > +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> > +		break;
> > +	case ARM_SPE_HISI_HIP_L3_HITM:
> > +		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
> > +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> > +		data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> > +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> > +		break;
> > +	case ARM_SPE_HISI_HIP_PEER_CLUSTER:
> > +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE1 | PERF_MEM_LVL_HIT;
> > +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;

Seems to me, a CPU has L3 cache, would the cluster has a higher level's
cache?

> > +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> > +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;

Ditto for the confliction for the two flags 'SNOOP_NONE' and
'SNOOPX_PEER'.

> > +		break;
> > +	case ARM_SPE_HISI_HIP_PEER_CLUSTER_HITM:
> > +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE1 | PERF_MEM_LVL_HIT;
> > +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> > +		data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> > +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> > +		break;
> > +	case ARM_SPE_HISI_HIP_REMOTE_SOCKET:
> > +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE2;
> > +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_ANY_CACHE;
> > +		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
> > +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> 
> Hi Yicong,
> 
> Is the mem_snoop setting missing from this one?

The field 'mem_snoopx' is an extension to the field 'mem_snoop'.

If the field 'mem_snoopx' is set, it is no need to set 'mem_snoop'.

Thanks,
Leo

