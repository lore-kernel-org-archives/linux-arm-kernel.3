Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A2CF44844
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SHbq3a6IocKBGCuibrNaS1TAiCcLhaCIj5wUD8AytE=; b=zQ9jUpyuThl5XnSig+6HWpkye0
	DYvjEr6Tfmodqx2jzKMGSOvQ8gRRRav3zGs/KaLhjkin8w/v1sZCrs79ziIf14jRZMf24j6wImb13
	QZZah32W7DpniPePuluhcLMo9CEp8YVivsZ9Qx6U5uMqXxmoTQs+BE6jL82QOCtmyRK5U8X6lgRpO
	df57YgfGkBYflXBdlxrsotbWT5eRivL5myE12ePgz3XTZGuEWG0NLInXNxETgZyU295Rwj2wgXkBv
	x6LcVyOi8qX38x2eWuibGFGatOn3b5e0IULHlhlfw65sReHYisfhcZLwPrsE7I5lgnhvXL+QPVFcC
	qojWaTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAeL-0000000C7yD-1IsU;
	Fri, 10 Apr 2026 12:07:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAeI-0000000C7xo-3jeN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 12:07:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F253F1DB5;
	Fri, 10 Apr 2026 05:07:36 -0700 (PDT)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A43533F632;
	Fri, 10 Apr 2026 05:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775822862; bh=PBPEIkPfiCepOPjFH4e7wRaebjN5PVqKZxeWMBytThY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MWxTRcCuppU6dzrIFN6G/jMv8zUovaPZLaizogO1XSuzRTKsKhTzqcPgkSkwCYi0e
	 hardPVlJK7OcUHDj8mLXeulGlOgawyIE/hmNe1PSfLr4+umktS5kKT37WPjdRuo4RO
	 SbO2iH1TVJcEMghygqBS0UZdTc+SAMciAFgNUy6E=
Message-ID: <65629411-0e1c-4c9c-bc9f-6488097bd77f@arm.com>
Date: Fri, 10 Apr 2026 13:07:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm-smmu-v3: Add PMCG child support and update PMU
 MMIO mapping
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20260408-smmu-perf-v1-0-d75dac96e828@nxp.com>
 <2c1a1694-9597-400d-b441-714225b5377b@arm.com> <adZcaEKm3vIYSy3N@shlinux89>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <adZcaEKm3vIYSy3N@shlinux89>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_050747_078017_7312E14F 
X-CRM114-Status: GOOD (  19.20  )
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

On 08/04/2026 2:47 pm, Peng Fan wrote:
> On Wed, Apr 08, 2026 at 12:15:31PM +0100, Robin Murphy wrote:
>> On 2026-04-08 8:51 am, Peng Fan (OSS) wrote:
>>> This patch series adds proper support for describing and probing the
>>> Arm SMMU v3 PMCG (Performance Monitor Control Group) as a child node of
>>> the SMMU in Devicetree, and updates the relevant drivers accordingly.
>>>
>>> The SMMU v3 architecture allows an optional PMCG block, typically
>>> associated with TCUs, to be implemented within the SMMU register
>>> address space. For example, mmu700 PMCG is at the offset 0x2000 of the
>>> TCU page 0.
>>
>> But what's wrong with the existing binding? Especially given that it even has
>> an upstream user already:
>>
>> https://git.kernel.org/torvalds/c/aef9703dcbf8
>>
>>> Patch 1 updates the SMMU v3 Devicetree binding to allow PMCG child nodes,
>>> referencing the existing arm,smmu-v3-pmcg binding.
>>>
>>> Patch 2 updates the arm-smmu-v3 driver to populate platform devices for
>>> child nodes described in DT once the SMMU probe succeeds.
>>>
>>> Patch 3 updates the SMMUv3 PMU driver to correctly handle MMIO mapping when
>>> PMCG is described as a child node. The PMCG registers occupy a sub-region
>>> of the parent SMMU MMIO window, which is already requested by the SMMU
>>
>> That has not been the case since 52f3fab0067d ("iommu/arm-smmu-v3: Don't
>> reserve implementation defined register space") nearly 6 years ago, where the
>> whole purpose was to support Arm's PMCG implementation properly. What kernel
>> is this based on?
> 
> Seems I am wrong. I thought PMCG is in page 0, so there were resource
> conflicts. I just retest without this patchset, all goes well.
> 
> But from dt perspective, should the TCU PMCG node be child node of
> SMMU node?

No. PMCGs can be used entirely independently of the SMMU itself, and 
while most of the events do relate to SMMU translation and thus aren't 
necessarily meaningful if it's not in use, there are still some which 
can be useful for basic traffic counting, monitoring GPT/translation 
activity from _other_ security states (if observation is delegated to 
Non-Secure) and possibly other things, even if the "main" Non-Secure 
SMMU interface isn't advertised at all. It would be unreasonable to 
require the SMMU node to be present and enabled *and* have a driver to 
populate PMCGs, to monitor events which are outside the scope of that 
driver.

Thanks,
Robin.

