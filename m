Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E490C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 08:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWGHZqsNwtKYUUdIisKkCeheDTCrQEtsRat0KeidqGg=; b=T0MUJs0CMNkdEME9z1YDF+6uRE
	jTT9VlamOAlkKDo/gRMwoprZJJYpo7sNvv0A0TdZ/tfmhKHJA08uUTRPwv4uWSBewaFxOKJ28WyYi
	L9/V4gv17qd0fZairsS2OqkozeLMg5EXsNKWUdS5rFLJrRl0WmmbqvbxpzXvgcap/DYLAGiItU1NW
	mZwMlKOsjHzXYmkQ+2ZKNUUXABsQEcWoiZWfZKm2PdNxQ35xcKwTd3bxTJNYyWdgHAfSLfNTENACZ
	ero6tuIr40XTfmXppNVgSSlF+qxmgd5uBEPGt/MVx306XqXJNveiZ+T8ms8staP0+guxhQqgCaN40
	mSpiObLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1terZF-0000000Emj1-1g6r;
	Mon, 03 Feb 2025 08:12:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1terXJ-0000000EmKN-2HGu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 08:10:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF97A1476;
	Mon,  3 Feb 2025 00:10:52 -0800 (PST)
Received: from [10.162.16.79] (unknown [10.162.16.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2E1A3F63F;
	Mon,  3 Feb 2025 00:10:23 -0800 (PST)
Message-ID: <e63478e7-de74-4228-9b75-a26a9a3dd294@arm.com>
Date: Mon, 3 Feb 2025 13:40:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 06/11] perf: apple_m1: Don't disable counter in
 m1_pmu_enable_event()
To: "Rob Herring (Arm)" <robh@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-6-1c1300802385@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250202-arm-brbe-v19-v19-6-1c1300802385@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_001029_628513_8C971923 
X-CRM114-Status: GOOD (  13.17  )
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



On 2/3/25 06:13, Rob Herring (Arm) wrote:
> Currently m1_pmu_enable_event() starts by disabling the event counter
> it has been asked to enable. This should not be necessary as the
> counter (and the PMU as a whole) should not be active when
> m1_pmu_enable_event() is called.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/perf/apple_m1_cpu_pmu.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
> index 06fd317529fc..39349ecec3c1 100644
> --- a/drivers/perf/apple_m1_cpu_pmu.c
> +++ b/drivers/perf/apple_m1_cpu_pmu.c
> @@ -396,10 +396,6 @@ static void m1_pmu_enable_event(struct perf_event *event)
>  	user = event->hw.config_base & M1_PMU_CFG_COUNT_USER;
>  	kernel = event->hw.config_base & M1_PMU_CFG_COUNT_KERNEL;
>  
> -	m1_pmu_disable_counter_interrupt(event->hw.idx);
> -	m1_pmu_disable_counter(event->hw.idx);
> -	isb();
> -
>  	m1_pmu_configure_counter(event->hw.idx, evt, user, kernel);
>  	m1_pmu_enable_counter(event->hw.idx);
>  	m1_pmu_enable_counter_interrupt(event->hw.idx);
> 

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

