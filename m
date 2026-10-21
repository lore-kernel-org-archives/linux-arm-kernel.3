Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD8A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VxCpJE3A;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=h7pfr6W4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqSXevxtbUPzruyogfRR5D3qm9uGXtBSUWQoF9Cs71Q=; b=VxCpJE3APiuWlxZFi6qcnExlv5
	fpgJLGEn2t+IE95wHVcYvSESLNVZD2U3tShMK4OkOdfkPf81OTwCsYlOOZvM+pi1bppte4FBJF3mn
	OaVzYH1KLr6bcNDDxWvAFaczKKU5MqqM3/ZVzx7u71ooj49h4HHKNWdJvyn74yEnB/cyaxOuPOYoI
	V+dC6aDa7vvltaJKpRn9wT7Kk9Pr0WUqiycZxn6uqV4bewYQNN5qDFSfZVMbwx7PQC6eUJ+uBoz/Y
	qtYQfKwX47WY3T2lvl7nijA18SPoAJ+qoiGkHCsYiyWcqSJZexo/akNxB42SYoBNJ5JAwfU8x7Upo
	urL1X5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWrq-0000000C1sT-2YgQ;
	Wed, 21 Oct 2026 14:00:34 +0000
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWri-0000000C1rD-0IdZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1792591232; x=1824127232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9DK2OEbFztWGhhecyDGTA244bbTa6mPCoyishduGujU=;
  b=h7pfr6W4SoFVjTejFiQoXwx1RW0di8LHQDjLQMtXZ+Hqgbafz1XxLRsg
   nhv6QZgWhQMcx7OtbD0FiLwFsjIKvzMqCe9BPlgHybo7ck56iDpi6ezqx
   jNA/Xj4rXnQ4L2nfXU1ecrpUZV/eKp6bxxP8JwGiq6kLokjVHSErcaM29
   5RkGqKXLRMMIpBvWeSPDUxqGBUVH1Ca3eJLH2JIIEIpzFT27yr3/NV0Kn
   /+lmsK0rvINTgEBYH73ZKSfpatMv1rzptfa0CJXnanr60nvi5bNcMwVFU
   tIZOOzb3+sISbsvZD/Dqzo8w0oJg7dFCIcXJrDcHhpcChhg/vN1PEQMkS
   g==;
X-CSE-ConnectionGUID: HnwmNJigT4q3AP6npybCfQ==
X-CSE-MsgGUID: LtfV3p2nTlajDbdsqiTPWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="246931011"
X-IronPort-AV: E=Sophos;i="6.27,170,1786978800"; 
   d="scan'208";a="246931011"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 23:00:30 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0C7711C00659
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:00:24 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id AAE9F1803209
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:00:23 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.62.79])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with SMTP id 28952405E2E;
	Wed, 21 Oct 2026 14:00:14 +0000 (UTC)
Date: Wed, 21 Oct 2026 23:00:13 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org, 
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com, 
	Soby Mathew <Soby.Mathew@arm.com>
Subject: Re: [PATCH v22 06/10] firmware: arm_rmm: Ensure the RMM has GPT
 entries for memory
Message-ID: <atjEkyLimpQSL4d4@FCCLS0092175.localdomain>
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-7-suzuki.poulose@arm.com>
 <atiyZ7_S7aBxowIQ@FCCLS0092175.localdomain>
 <34bf0c98-35b1-4402-842f-a100245cb9a7@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34bf0c98-35b1-4402-842f-a100245cb9a7@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_070030_122033_D63BE932 
X-CRM114-Status: GOOD (  48.12  )
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

On 10/21 14:35, Suzuki K Poulose wrote:
> Hi
> 
> On 21/10/2026 14:07, Kohei Enju wrote:
> > Hi Suzuki,
> > 
> > I've tested this series and found a possible TF-RMM issue.
> > Please  below.
> > 
> > On 10/02 07:15, Suzuki K Poulose wrote:
> > > From: Steven Price <steven.price@arm.com>
> > > 
> > > The RMM maintains the state of all the granules in the system to make
> > > sure that the host is abiding by the rules. This state can be maintained
> > > at different granularity, per page (TRACKING_FINE) or per region
> > > (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on the
> > > underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region,
> > > all pages in the region must be of the same state, this implies we need to
> > > have "fine" tracking for DRAM, so that we can delegate individual pages.
> > > 
> > > For now we only support a statically carved out memory for tracking
> > > granules for the "fine" regions. This can be extended in the future to
> > > allow modifying the tracking granularity and remove the need for a
> > > static allocation by the firmware.
> > > 
> > > Similarly, the firmware may create L0 GPT entries describing the total
> > > address space. But if we change the "PAS" (Physical Address Space) of a
> > > granule, then the firmware may need to create L1 tables to track the PAS
> > > at a finer granularity. Linux therefore checks if the platform firmware
> > > manages the PAR region. i.e., the firmware is in charge of managing the
> > > L1 GPTs (creation and the required memory for the GPT tables - via static
> > > carveouts) without host intervention. Support for dynamic GPT creation by
> > > the host will be added later.
> > > 
> > > If the firmware requires us to manage the tracking or GPT memory,
> > > deactivate the RMM and reclaim any memory donated at RMM activation.
> > > 
> > > Apply the same checks when hotplugged memory is brought online.
> > > 
> > > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > > Tested-by: Gavin Shan <gshan@redhat.com>
> > > Signed-off-by: Steven Price <steven.price@arm.com>
> > > Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > ---
> > [...]
> > > +/*
> > > + * We do not support creating L1 GPTs yet. So, make sure that all the regions
> > > + * are managed by the firmware.
> > > + */
> > > +static int rmi_verify_gpt_firmware_managed(phys_addr_t start, phys_addr_t end)
> > > +{
> > > +	unsigned long l0gpt_sz;
> > > +	unsigned long next, par_state;
> > > +
> > > +	l0gpt_sz = 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
> > > +					  rmi_feat_reg(1)));
> > > +	start = ALIGN_DOWN(start, l0gpt_sz);
> > > +	end = ALIGN(end, l0gpt_sz);
> > > +
> > > +	while (start < end) {
> > > +		long ret = rmi_gpt_info(start, end, &next, &par_state);
> > > +
> > > +		if (ret != RMI_SUCCESS) {
> > > +			pr_err("RMI_GPT_INFO failed for %llx-%llx: (%ld)\n",
> > > +				start, end, ret);
> > > +			return -ENXIO;
> > > +		}
> > > +
> > > +		if (WARN_ON(next <= start))
> > > +			return -ENXIO;
> > > +
> > > +		if (par_state != RMI_GPT_PAR_PLAT) {
> > > +			pr_err("GPT for the region is not managed by firmware %llx-%lx\n",
> > > +				start, next);
> > > +			return -ENODEV;
> > 
> > When system RAM starts at a non-L0GPTSZ-aligned address, the alignment
> > in rmi_verify_gpt_firmware_managed() may cause the queried L0GPT range
> > to include a memory hole.
> 
> > 
> > On out platform, the relevant memory layout is:
> > 
> >      800c0000000-800dc3fffff : memory hole
> >      800dc400000-82fffffffff : System RAM
> > 
> 
> Thanks for the report.
> 
> > Consequently, Linux queries the following L0GPT range:
> > 
> >      800c0000000-80100000000
> > 
> > The query fails with RMI_GPT_PAR_RESERVED:
> > 
> >      [    8.551855] GPT for the region is not managed by firmware 800c0000000-80100000000
> > 
> > and arm64_init_rmi() subsequently fails.
> > 
> > As I understand it, smc_gpt_info() in TF-RMM checks only the beginning
> > of the aligned L0GPT range. Since that address is in the hole, the whole
> > range is reported as RMI_GPT_PAR_RESERVED, even though it contains
> > platform-managed System RAM.
> > 
> > I believe this should be addressed in TF-RMM. Do you have any thoughts
> > on the expected RMI_GPT_INFO behavior in this case?
> 
> I believe the RMM should report a value that represents the situation
> better. In this case, there is a hole, and some conventional memory
> areas. For the conventional memory, the RMM has to manage the GPTs.
> (This applies to the tf-RMM implementation of TRACKING Granule state
> too. It only looks at the first granule and reports the type of memory.)
> 
> RMI_GPT_PAR_RESERVED is not accurate as the memory region is not
> reserved, unless it is reserved for firmware (in which case the
> memory description is wrong).
> 
> I would say RMI_GPT_PAR_PLAT  is accurate if the L1GPT exists, as the
>  region covered by the L0GPT has some memory that are delegable.
> 
> Otherwise it must be reported as RMI_GPT_HOST_NOT_CREATED.
> 
> The information that a given memory region is not "memory" (i.e. hole)
> is basically TRACKING_STATE returned as RMI_MEM_CATEGORY_NONE

Thanks for the clarification. Could you please raise this with the TF-RMM
team? Please let me know if I can help with testing or provide any
additional information.

Thanks,
Kohei

> 
> 
> > 
> > As a side note, we tested this series and the v23 integration branch
> > with a Linux-side workaround to avoid the problem above, and we have not
> > observed any other major issues. Sorry for the delay in testing this
> > series.
> 
> Thanks for the testing !
> 
> Suzuki
> > 
> > Thanks,
> > Kohei
> > 
> > > +		}
> > > +		start = next;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> 

