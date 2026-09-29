Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF20CCA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+p5rGxZ5V5tQydlGXLxR0em4nDuY6g4ivG1QunNskUA=; b=T5qCtDEwO0x/mgey3gqC2W/Ak/
	3EFCo56JcrixNo1/fp1dnU8Uxq4lH5/x6IFyfp0dMUXaC6CyYM2NSFWP2c8E40fNCdJthM+YLxJ8r
	cthfjWsqUvk8sidq/34ufeHFMbWC1Kn55FK0LMFV1if1P4YddICCPSOPQ4eaCn+nPHnpmQjUIof/S
	4g5F3N1+vkQHTrktN6zjvtVONmt7J/XzcC37qQPN2xlgDfttK6GlHsTEIhS2HJ5rtDUJ2bkyocWtD
	nM4FmMUn3tmL7+rpxzK7S8KxbhAL88ZhGRZ5vxc8QR2EF/rOU2vWQppTrLXBVU6yGvCznv/ghARux
	OfA1odSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWjI-00000003Uu3-2cuW;
	Tue, 29 Sep 2026 12:14:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWjG-00000003Uta-26HF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:14:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C140A1516;
	Tue, 29 Sep 2026 05:14:32 -0700 (PDT)
Received: from [10.57.12.116] (unknown [10.57.12.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C2F83F86F;
	Tue, 29 Sep 2026 05:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790684076; bh=KpbRo5wvWYYEvhUJ8NixQglOE8FclIcuHa9+3zDEXSg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gj3lVZyccDDRPlbotO7N9QaG7/lLlhFDj/O4VW4/SVs/zSipgDwsdhSfIr35e/TwW
	 Kbm62sJwIYm+/mS3vWKQOXaPkD4vwsdzVO04Ch4k4woBd0+4Jj/v8rhORtdte4EgHn
	 f4jELitrKpY8/XVi6KsgpNC4q2ErFwxb6jvKrq1c=
Message-ID: <b9744fc2-ecc6-406b-ae33-62ba374a87fc@arm.com>
Date: Tue, 29 Sep 2026 13:14:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 0/7] firmware: arm_rmm: Add RMM v2.0 base RMI support
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <aruWz-QkcdD9ETbC@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aruWz-QkcdD9ETbC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_051438_667324_5C8C889B 
X-CRM114-Status: UNSURE (   8.72  )
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

On 29/09/2026 11:50, Catalin Marinas wrote:
> On Thu, Sep 24, 2026 at 02:51:54PM +0100, Suzuki K Poulose wrote:
>>   arch/arm64/Kconfig                |    1 +
>>   arch/arm64/kernel/cpufeature.c    |    1 +
>>   drivers/firmware/Kconfig          |    1 +
>>   drivers/firmware/Makefile         |    1 +
>>   drivers/firmware/arm_rmm/Kconfig  |   25 +
>>   drivers/firmware/arm_rmm/Makefile |    2 +
>>   drivers/firmware/arm_rmm/rmi.c    | 1072 +++++++++++++++++++++++++++++
>>   include/linux/arm-rmi-cmds.h      |  558 +++++++++++++++
>>   include/linux/arm-smccc-rmi.h     |  505 ++++++++++++++
> 
> One more nit: patches 1 and 2 I think add new header files without a
> MAINTAINERS entry. You can add them to arm64.

Ack, I have added them. Thanks

Suzuki
> 


