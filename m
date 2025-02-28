Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8E6C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsbgSY0KdK4WCEQoWD7P7DX8QHItEdhrghN3ri4wOyw=; b=DblAzBS8hNfHQ/m+bm33vDsOCd
	fTDtG7gUF8mxaXB/7tAunzycWNbOeRqPT+1178l2VLv3kTxwrsfY1gL9buxsCB955Av92GAbN4RYA
	lvkYBpQqL4n4eoBBmfJVpC6in11iq766e+ns0pFh/eo8PznRg20r6WKnSftIYLJ7Ulf40vpQnORjt
	++yB15d9JG5zVfGRidjiZ9v9awQimT1kNn0liWPpJP0a6Rnfq5ejOReVA3lZUZN0S/8ltMdl5u9pU
	0KQDWXSJSfs7zV9MPxPrlTJlKgfwWuQXr9SWdrS9Y/LirNmdoazWnM4SebvQhSB+YhDX+NLM/tmXy
	Ynlc0rLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnz1s-0000000ApT8-3NyS;
	Fri, 28 Feb 2025 11:59:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyHx-0000000Ai5g-2RGp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 11:12:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4566D1063;
	Fri, 28 Feb 2025 03:12:32 -0800 (PST)
Received: from [192.168.178.115] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92FD63F673;
	Fri, 28 Feb 2025 03:12:12 -0800 (PST)
Message-ID: <df9784c3-c2ea-4bac-839a-2b7de0a81aac@arm.com>
Date: Fri, 28 Feb 2025 12:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/4] Support SMT control on arm64
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, sudeep.holla@arm.com, tglx@linutronix.de,
 peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, pierre.gondois@arm.com
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 xuwei5@huawei.com, guohanjun@huawei.com, sshegde@linux.ibm.com
References: <20250218141018.18082-1-yangyicong@huawei.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250218141018.18082-1-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_031217_666998_13EA7257 
X-CRM114-Status: GOOD (  10.94  )
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

On 18/02/2025 15:10, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> The core CPU control framework supports runtime SMT control which
> is not yet supported on arm64. Besides the general vulnerabilities
> concerns we want this runtime control on our arm64 server for:
> 
> - better single CPU performance in some cases
> - saving overall power consumption
> 
> This patchset implements it in the following aspects:
> 
> - Provides a default topology_is_primary_thread()
> - support retrieve SMT thread number on OF based system
> - support retrieve SMT thread number on ACPI based system
> - select HOTPLUG_SMT for arm64
> 
> Tests has been done on our ACPI based arm64 server and on ACPI/OF
> based QEMU VMs.

[...]

> Yicong Yang (4):
>   cpu/SMT: Provide a default topology_is_primary_thread()
>   arch_topology: Support SMT control for OF based system
>   arm64: topology: Support SMT control on ACPI based system
>   arm64: Kconfig: Enable HOTPLUG_SMT
> 
>  arch/arm64/Kconfig                  |  1 +
>  arch/arm64/kernel/topology.c        | 66 +++++++++++++++++++++++++++++
>  arch/powerpc/include/asm/topology.h |  1 +
>  arch/x86/include/asm/topology.h     |  2 +-
>  drivers/base/arch_topology.c        | 27 ++++++++++++
>  include/linux/topology.h            | 22 ++++++++++
>  6 files changed, 118 insertions(+), 1 deletion(-)

With the review comments on the individual patches [0-3]/4:

Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>


