Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAE2C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Hj3Ig9qqSChXzvmc2CfcPidrrPzcIdAGU6AhFOvr9w=; b=l4J6TNaILV3RxIS/aDmmd5KAan
	auavWDYLgNXXC5Hyix07L32SRHufZ52YeQ18ZdWiySzNo+PKRqE04ytXqjZntedjPk64Pu5GpYDxA
	iwKW2p1G1VIrTNvMf+ae/A1Tqz8L5GQnOoHmT9V9MLnWJanTNmvqFOuNaaP3p7Gdo3pfwdIvGFOCn
	VB94EfOD99Bw247lHeztvSAKfRR5IwJdSjgsKAnpulNWql/vQiYsv1vR7yts78KiZIQBsQizjFlf7
	U8ZbVIZULAMfZ82q2YL9jdTAObouzJH3ZrTO7RBtPlK/misUNB+/JKc1Z6N0ghpup76pGh0jJz8DV
	a4qURuAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgsk-0000000FWJc-1rb3;
	Wed, 21 May 2025 10:41:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgn1-0000000FVrj-1u4V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 10:35:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01C041515;
	Wed, 21 May 2025 03:34:57 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AE603F6A8;
	Wed, 21 May 2025 03:35:10 -0700 (PDT)
Date: Wed, 21 May 2025 11:35:08 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: acme@kernel.org, namhyung@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, peterz@infradead.org, mingo@redhat.com,
	mark.rutland@arm.com, jolsa@kernel.org, john.g.garry@oracle.com,
	james.clark@linaro.org, leo.yan@linux.dev, irogers@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, jonathan.cameron@huawei.com,
	hejunhao3@huawei.com, linuxarm@huawei.com, wangyushan12@huawei.com,
	caijingtao@huawei.com, xueshan2@huawei.com,
	prime.zeng@hisilicon.com, yangyicong@hisilicon.com
Subject: Re: [PATCH v2 2/3] perf arm-spe: Add support for SPE Data Source
 packet on HiSilicon HIP12
Message-ID: <20250521103508.GA2565659@e132581.arm.com>
References: <20250425033845.57671-1-yangyicong@huawei.com>
 <20250425033845.57671-3-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425033845.57671-3-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_033511_574681_51D0EAE8 
X-CRM114-Status: GOOD (  21.01  )
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

On Fri, Apr 25, 2025 at 11:38:44AM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Add data source encoding for HiSilicon HIP12 and coresponding mapping
> to the perf's memory data source. This will help to synthesize the data
> and support upper layer tools like perf-mem and perf-c2c.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  tools/arch/arm64/include/asm/cputype.h        |  2 +
>  .../util/arm-spe-decoder/arm-spe-decoder.h    | 17 ++++
>  tools/perf/util/arm-spe.c                     | 96 +++++++++++++++++++
>  3 files changed, 115 insertions(+)
> 
> diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
> index 488f8e751349..9a5d85cfd1fb 100644
> --- a/tools/arch/arm64/include/asm/cputype.h
> +++ b/tools/arch/arm64/include/asm/cputype.h
> @@ -129,6 +129,7 @@
>  #define FUJITSU_CPU_PART_A64FX		0x001
>  
>  #define HISI_CPU_PART_TSV110		0xD01
> +#define HISI_CPU_PART_HIP12		0xD06
>  
>  #define APPLE_CPU_PART_M1_ICESTORM	0x022
>  #define APPLE_CPU_PART_M1_FIRESTORM	0x023
> @@ -202,6 +203,7 @@
>  #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
>  #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
>  #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
> +#define MIDR_HISI_HIP12 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP12)
>  #define MIDR_APPLE_M1_ICESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM)
>  #define MIDR_APPLE_M1_FIRESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_FIRESTORM)
>  #define MIDR_APPLE_M1_ICESTORM_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM_PRO)
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index 5d232188643b..881d9f29c138 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -82,6 +82,23 @@ enum arm_spe_ampereone_data_source {
>  	ARM_SPE_AMPEREONE_L2D                           = 0x9,
>  };
>  
> +enum arm_spe_hisi_hip_data_source {
> +	ARM_SPE_HISI_HIP_PEER_CPU		= 0,
> +	ARM_SPE_HISI_HIP_PEER_CPU_HITM		= 1,
> +	ARM_SPE_HISI_HIP_L3			= 2,
> +	ARM_SPE_HISI_HIP_L3_HITM		= 3,
> +	ARM_SPE_HISI_HIP_PEER_CLUSTER		= 4,
> +	ARM_SPE_HISI_HIP_PEER_CLUSTER_HITM	= 5,
> +	ARM_SPE_HISI_HIP_REMOTE_SOCKET		= 6,
> +	ARM_SPE_HISI_HIP_REMOTE_SOCKET_HITM	= 7,
> +	ARM_SPE_HISI_HIP_LOCAL_MEM		= 8,
> +	ARM_SPE_HISI_HIP_REMOTE_MEM		= 9,
> +	ARM_SPE_HISI_HIP_NC_DEV			= 13,
> +	ARM_SPE_HISI_HIP_L2			= 16,
> +	ARM_SPE_HISI_HIP_L2_HITM		= 17,
> +	ARM_SPE_HISI_HIP_L1			= 18,
> +};
> +
>  struct arm_spe_record {
>  	enum arm_spe_sample_type type;
>  	int err;
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 2a9775649cc2..d46e0cccac99 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -571,6 +571,11 @@ static const struct midr_range ampereone_ds_encoding_cpus[] = {
>  	{},
>  };
>  
> +static const struct midr_range hisi_hip_ds_encoding_cpus[] = {
> +	MIDR_ALL_VERSIONS(MIDR_HISI_HIP12),
> +	{},
> +};
> +
>  static void arm_spe__sample_flags(struct arm_spe_queue *speq)
>  {
>  	const struct arm_spe_record *record = &speq->decoder->record;
> @@ -718,9 +723,100 @@ static void arm_spe__synth_data_source_ampereone(const struct arm_spe_record *re
>  	arm_spe__synth_data_source_common(&common_record, data_src);
>  }
>  
> +static void arm_spe__synth_data_source_hisi_hip(const struct arm_spe_record *record,
> +						union perf_mem_data_src *data_src)
> +{
> +	/* Use common synthesis method to handle store operations */
> +	if (record->op & ARM_SPE_OP_ST) {
> +		arm_spe__synth_data_source_common(record, data_src);
> +		return;
> +	}
> +
> +	switch (record->source) {
> +	case ARM_SPE_HISI_HIP_PEER_CPU:
> +		data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +		break;
> +	case ARM_SPE_HISI_HIP_PEER_CPU_HITM:
> +		data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +		break;
> +	case ARM_SPE_HISI_HIP_L3:
> +		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_HIT;
> +		break;
> +	case ARM_SPE_HISI_HIP_L3_HITM:
> +		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> +		break;
> +	case ARM_SPE_HISI_HIP_PEER_CLUSTER:
> +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE1 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +		break;
> +	case ARM_SPE_HISI_HIP_PEER_CLUSTER_HITM:
> +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE1 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +		break;
> +	case ARM_SPE_HISI_HIP_REMOTE_SOCKET:
> +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE2;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_ANY_CACHE;
> +		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +		break;
> +	case ARM_SPE_HISI_HIP_REMOTE_SOCKET_HITM:
> +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE2;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_ANY_CACHE;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> +		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> +		break;
> +	case ARM_SPE_HISI_HIP_LOCAL_MEM:
> +		data_src->mem_lvl = PERF_MEM_LVL_LOC_RAM | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_RAM;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +		break;
> +	case ARM_SPE_HISI_HIP_REMOTE_MEM:
> +		data_src->mem_lvl = PERF_MEM_LVL_REM_RAM1 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_RAM;
> +		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
> +		break;
> +	case ARM_SPE_HISI_HIP_NC_DEV:
> +		data_src->mem_lvl = PERF_MEM_LVL_IO | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_IO;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +		break;
> +	case ARM_SPE_HISI_HIP_L2:
> +		data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +		break;
> +	case ARM_SPE_HISI_HIP_L2_HITM:
> +		data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
> +		break;
> +	case ARM_SPE_HISI_HIP_L1:
> +		data_src->mem_lvl = PERF_MEM_LVL_L1 | PERF_MEM_LVL_HIT;
> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
> +		data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  static const struct data_source_handle data_source_handles[] = {
>  	DS(common_ds_encoding_cpus, data_source_common),
>  	DS(ampereone_ds_encoding_cpus, data_source_ampereone),
> +	DS(hisi_hip_ds_encoding_cpus, data_source_hisi_hip),
>  };
>  
>  static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
> 
> -- 
> 2.24.0
> 

