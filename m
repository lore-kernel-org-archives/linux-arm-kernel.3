Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA98C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0jsvW5qGDpbtuuWWKY/lQM+7zZGRkTT6Ww9voKeKO4=; b=WQ1J/ok0GzzHkukUj0TecpZNQA
	Xd+y3ialxwP9Kpt+7ZwiHRhQXpvsiY8b2ayn2O4d7LFUu4zpK+3lWxPEnLLplgr1lKkcVe4dUfNJ2
	bu5AaM8TPsC65m8HxD9hV5x6oFQFh7Ez/scTB24yTfkZtioXZZ76nm+QpYrClj5tSIp6YdsYoNpWh
	9qkPylk41k42neIzStHpiv4ZFckonsswxCA/ROLY3Qgfwd4j/mbqA3HL2Z/dpUeZ9H4jzL59jcFta
	AkVmD9wAufet+oNsC+C0Y67WN64cnsSuMakvdUGZJoj6+1ya+z8NC3jB5gmq5Zraxbkn76E3iAcio
	oXE2mGOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7f5-00000000Dex-2Jne;
	Mon, 28 Sep 2026 09:28:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7f3-00000000De5-0JYC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:28:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B53681595;
	Mon, 28 Sep 2026 02:28:30 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C5C13F763;
	Mon, 28 Sep 2026 02:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790587714; bh=uP3vTQXZtzAeaAZv+6YX+YSO0w12PlBKUn8pseTb+Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bM9akU5SlyI3b64Zov0KeHC1Sj09KC1x8hbI82z6m+V4PSOd5TpznWKQUsy22jDf1
	 ucZSePmQCDQp85e3rY8vm2KWD73kE8B+0GSQofWdwddw/npvyQW9/kCJ43rUwhnsPD
	 JANrhcdXIcnY8JGgT8Y++SNmZimsYiHsAQqObTvg=
Date: Mon, 28 Sep 2026 10:28:20 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v19 4/7] firmware: arm_rmm: Add support for SRO
Message-ID: <arozNIQ-fQ0XQViI@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-5-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924135201.850038-5-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_022837_161358_866C2C4C 
X-CRM114-Status: GOOD (  13.50  )
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

On Thu, Sep 24, 2026 at 02:51:58PM +0100, Suzuki K Poulose wrote:
> +long rmi_sro_memxfer_execute(struct rmi_sro_state *sro, gfp_t gfp)
> +{
> +	struct arm_smccc_1_2_regs *regs = &sro->regs;
> +	bool cancelled = false;
> +	unsigned long sro_handle;
> +
> +	rmi_smccc_invoke(regs);
> +
> +	sro_handle = regs->a1;
> +	while (RMI_RESULT_STATUS(regs->a0) == RMI_INCOMPLETE) {
> +		bool can_cancel = RMI_RESULT_CAN_CANCEL(regs->a0) == RMI_OP_CAN_CANCEL;
> +		int ret = 0;
> +
> +		switch (RMI_RESULT_MEMREQ(regs->a0)) {
> +		case RMI_OP_MEM_REQ_NONE:
> +			rmi_op_continue(sro_handle, RMI_CONTINUE_KEEP_GOING,
> +					regs);
> +			break;
> +		case RMI_OP_MEM_REQ_DONATE:
> +			ret = rmi_sro_donate(sro, sro_handle, regs->a2, regs,
> +					     gfp);
> +			break;
> +		case RMI_OP_MEM_REQ_RECLAIM:
> +			ret = rmi_sro_reclaim(sro, sro_handle, regs);
> +			break;
> +		default:
> +			WARN_ON_ONCE(1);
> +			ret = -ENXIO;
> +			break;
> +		}

Another thing I came across while looking whether we can defer the
activation. It seems that the spec (I_JVYCH) lists some SROs as
PE-bound. Nothing here or in rmi_sro_execute() disables migration and
the memory allocation paths can even sleep with GFP_KERNEL.

Do we need to disable preemption (only for rmi_sro_execute()) or at
least migration (the memxfer path)? We did something similar for the RSI
attestation token loop, commit 24f55f511b9e ("virt: arm-cca-guest: use
migrate_disable() for attestation token requests").

With only migration disabled, another thread on the same CPU
issuing a PE-bound SRO would get RMI_BLOCKED (R_NDXSG). In theory, we
can get a priority inversion case (maybe this doesn't happen with the
current implementation, just looking at the API design). The RMI_BLOCKED
fix not to loop forever probably saves us but the caller would have to
actively sleep or give up before retrying (i.e. don't move the busy loop
higher app the call stack).

Another option is to have a per-CPU mutex here and serialise the SROs
which are PE-bound (there are some precedents for per-CPU mutexes in the
kernel).

-- 
Catalin

