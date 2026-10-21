Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69504606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hMMjn9hz;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=kfwMJi/k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eptm0nTE5XWF6wwWhwC1vVdEa1trOJQC7h6Lca2PiP4=; b=hMMjn9hzitI7PfKDyth2uCFu4L
	3oqSxqeHwf8SyTQIDh5WK4iScSDxcwx4XXqwtL4vmfTCrZd8qStFPM5HolVrxmDqeQMeldFyr5NKt
	8f7Ygue8wgSYRAjsos4TmM4HyEIn5XrwHNbskkVdFElAEyI0xKO3SCqPKSyjcooEtQE98WA2xx4si
	HjDyLm3hlBsYeH14UEuwajfIbxnGWFTbxWX/H/U23m9PAkzBqiOwZNth7Vv0PdcWG1EwBAsJa9Ng5
	SbvFTCU/rZFHzSk7fVPaBwjAZkTda28cQfxjevurWtY7TOanQTQiqJ9BNn09AD0tvys5yLvxetp59
	SFrDJKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW2W-0000000BrcL-3syN;
	Wed, 21 Oct 2026 13:07:32 +0000
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW2U-0000000Brbq-0NyW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 13:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1792588056; x=1824124056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4XdfwgpkFvzFS14XCzmyfcy7TRjNNYg4aRwWFx3svRg=;
  b=kfwMJi/kS6pdGEOCWhoC8HUuQkGzNW0N1AIHm2TeGqiv/PJ/gdjWNyAK
   5bIGcUn7T+KMctxnxt95xjyuqjK4GyzOkd96TSi87MsOeg0Rw10tyxCoC
   KmeCEi7pNxGyM13dSVJfQo+SRX55dXQkqogD12v/szj9sTnz8eFOJsnvc
   GNf+DUxgJ7O13FaE48ODlsrPevnlrVGGMzKSOU3OjWBbY+iwiiZ8LpkKX
   3OaJiFIIPtCuSALlXFTvd7pJdUnqypEa1njb7z2FEjlYJ3YUI6Sm1Gsh9
   PE6tW0ZZzv88qlMw91iiVi41dZ4n1t65nNppCdTAPFnc4KetrJzQLvfe/
   A==;
X-CSE-ConnectionGUID: HlLapvfKTx6+8KMlCOn5Rw==
X-CSE-MsgGUID: HqVhn821QVm5BqpVxUQT9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="246929062"
X-IronPort-AV: E=Sophos;i="6.27,170,1786978800"; 
   d="scan'208";a="246929062"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 22:07:33 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C35F11C1C704
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 13:07:26 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 73FE3C02F2E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 13:07:26 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.62.79])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with SMTP id 2F17214000EC;
	Wed, 21 Oct 2026 13:07:17 +0000 (UTC)
Date: Wed, 21 Oct 2026 22:07:16 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org, 
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v22 06/10] firmware: arm_rmm: Ensure the RMM has GPT
 entries for memory
Message-ID: <atiyZ7_S7aBxowIQ@FCCLS0092175.localdomain>
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-7-suzuki.poulose@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261002061507.1600269-7-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_060730_545083_59E3D393 
X-CRM114-Status: GOOD (  30.80  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Suzuki,

I've tested this series and found a possible TF-RMM issue.
Please  below.

On 10/02 07:15, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> The RMM maintains the state of all the granules in the system to make
> sure that the host is abiding by the rules. This state can be maintained
> at different granularity, per page (TRACKING_FINE) or per region
> (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on the
> underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region,
> all pages in the region must be of the same state, this implies we need to
> have "fine" tracking for DRAM, so that we can delegate individual pages.
> 
> For now we only support a statically carved out memory for tracking
> granules for the "fine" regions. This can be extended in the future to
> allow modifying the tracking granularity and remove the need for a
> static allocation by the firmware.
> 
> Similarly, the firmware may create L0 GPT entries describing the total
> address space. But if we change the "PAS" (Physical Address Space) of a
> granule, then the firmware may need to create L1 tables to track the PAS
> at a finer granularity. Linux therefore checks if the platform firmware
> manages the PAR region. i.e., the firmware is in charge of managing the
> L1 GPTs (creation and the required memory for the GPT tables - via static
> carveouts) without host intervention. Support for dynamic GPT creation by
> the host will be added later.
> 
> If the firmware requires us to manage the tracking or GPT memory,
> deactivate the RMM and reclaim any memory donated at RMM activation.
> 
> Apply the same checks when hotplugged memory is brought online.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
[...]
> +/*
> + * We do not support creating L1 GPTs yet. So, make sure that all the regions
> + * are managed by the firmware.
> + */
> +static int rmi_verify_gpt_firmware_managed(phys_addr_t start, phys_addr_t end)
> +{
> +	unsigned long l0gpt_sz;
> +	unsigned long next, par_state;
> +
> +	l0gpt_sz = 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
> +					  rmi_feat_reg(1)));
> +	start = ALIGN_DOWN(start, l0gpt_sz);
> +	end = ALIGN(end, l0gpt_sz);
> +
> +	while (start < end) {
> +		long ret = rmi_gpt_info(start, end, &next, &par_state);
> +
> +		if (ret != RMI_SUCCESS) {
> +			pr_err("RMI_GPT_INFO failed for %llx-%llx: (%ld)\n",
> +				start, end, ret);
> +			return -ENXIO;
> +		}
> +
> +		if (WARN_ON(next <= start))
> +			return -ENXIO;
> +
> +		if (par_state != RMI_GPT_PAR_PLAT) {
> +			pr_err("GPT for the region is not managed by firmware %llx-%lx\n",
> +				start, next);
> +			return -ENODEV;

When system RAM starts at a non-L0GPTSZ-aligned address, the alignment
in rmi_verify_gpt_firmware_managed() may cause the queried L0GPT range
to include a memory hole.

On out platform, the relevant memory layout is:

    800c0000000-800dc3fffff : memory hole
    800dc400000-82fffffffff : System RAM

Consequently, Linux queries the following L0GPT range:

    800c0000000-80100000000

The query fails with RMI_GPT_PAR_RESERVED:

    [    8.551855] GPT for the region is not managed by firmware 800c0000000-80100000000

and arm64_init_rmi() subsequently fails.

As I understand it, smc_gpt_info() in TF-RMM checks only the beginning
of the aligned L0GPT range. Since that address is in the hole, the whole
range is reported as RMI_GPT_PAR_RESERVED, even though it contains
platform-managed System RAM.

I believe this should be addressed in TF-RMM. Do you have any thoughts
on the expected RMI_GPT_INFO behavior in this case?

As a side note, we tested this series and the v23 integration branch
with a Linux-side workaround to avoid the problem above, and we have not
observed any other major issues. Sorry for the delay in testing this
series.

Thanks,
Kohei

> +		}
> +		start = next;
> +	}
> +
> +	return 0;
> +}

