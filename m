Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB99C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 10:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yDdzlJWw6S/ZjaH5o5QrUiCfJMPKS//hluxSfAV6NI=; b=HGZZOFDLtAKDqeytdw9kGkq/ur
	JIhRuBBcZTjui7QAlA57edaV2ORF7aPOtDVCRB50OYQutxD7xBYbrOeuHKY2MEtmrzyNmpXm4vmg/
	+5ZNg0QI0rdb2mJN96uduS7SNa0Pk5VnC9h/W4rSDEjkGtJ9HtreCogtlj9WHzYCQ/2mmRjfCsYrp
	Xa5cS4pKceLPjVVMoy8qHYORwmr2nBWPmca+h9AFRSZ/pC6Kq0L/b28fBMaiL/f++sEnJ2X5DS2KZ
	wp72ZA2idvI/JDWPpav+mZ77zMmVvyum1Wn6LP2QBh2SvuZGC+iyCRcxkxT1jdREiI3F6eyjefK0X
	GmQis/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTbo-00000006vhT-446j;
	Tue, 17 Jun 2025 10:32:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTQi-00000006teL-3exR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 10:20:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36B681596;
	Tue, 17 Jun 2025 03:20:15 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 921183F58B;
	Tue, 17 Jun 2025 03:20:33 -0700 (PDT)
Message-ID: <4b74ff9d-7451-4c11-b9ad-66ffd83fd2d2@arm.com>
Date: Tue, 17 Jun 2025 11:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] arm64: cpufeature: Introduce MATCH_ALL_EARLY_CPUS
 capability type
To: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 ryan.roberts@arm.com, yang@os.amperecomputing.com, catalin.marinas@arm.com,
 will@kernel.org, jean-philippe@linaro.org, robin.murphy@arm.com,
 joro@8bytes.org, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 james.morse@arm.com, broonie@kernel.org, ardb@kernel.org, baohua@kernel.org,
 david@redhat.com, jgg@ziepe.ca, nicolinc@nvidia.com, jsnitsel@redhat.com,
 mshavit@google.com, kevin.tian@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
 <20250617095104.6772-2-miko.lenczewski@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250617095104.6772-2-miko.lenczewski@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_032036_956735_35EBA4E9 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

On 17/06/2025 10:51, Mikołaj Lenczewski wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
> 
> For system-wide capabilities, the kernel has the SCOPE_SYSTEM type. Such
> capabilities are checked once the SMP boot has completed using the
> sanitised ID registers. However, there is a need for a new capability
> type similar in scope to the system one but with checking performed
> locally on each CPU during boot (e.g. based on MIDR_EL1 which is not a
> sanitised register).
> 
> Introduce ARM64_CPUCAP_MATCH_ALL_EARLY_CPUS which, together with
> ARM64_CPUCAP_SCOPE_LOCAL_CPU, ensures that such capability is enabled
> only if all early CPUs have it. For ease of use, define
> ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE which combines SCOPE_LOCAL_CPU,
> PERMITTED_FOR_LATE_CPUS and MATCH_ALL_EARLY_CPUS.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
> Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
> ---

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


