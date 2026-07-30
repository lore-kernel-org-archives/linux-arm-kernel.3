Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7F2C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 17:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEV1SeAY7e9fur5jsw64YihesSttf5xPw9v8EsYpE7w=; b=WzENm8lfez9vWQZt+sY9vaFjUe
	sIpuqvr5w36GMFwp2X1TKrQPxXT2WNvkY5W+ctpOM1i2E9AlOdIjJOUlXM4pSEr5wvrLoUQMnl6dy
	2m9sdPXl4/pU5G7xHp2yzLtlTgG79r8YBmj35tdGz8KYR62aDSrHxXMyXxhfevpfhAf1Pt30s60gC
	fFI9CJO8/I6crfxaK0+eBPwET51UCyMLYd7fj1Fbu2oNzQwmUTYIsL+cxX6QAJv6+jolbANTTHXCA
	0b0biK1NItCgWT+lys86X9Q7gEMF9FQ4WzW3h/RFNFmLyC5D6BOO13V49C6DHqn78Ei1cjIVsuEHC
	2brEwnUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpUHK-0000000B4PY-0h4u;
	Thu, 30 Jul 2026 17:10:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpUHE-0000000B4On-0DCV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 17:10:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8165C15A1;
	Thu, 30 Jul 2026 10:10:30 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABEEB3F7B4;
	Thu, 30 Jul 2026 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785431434; bh=NEV1SeAY7e9fur5jsw64YihesSttf5xPw9v8EsYpE7w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rKfe24nHrRUQFSs7BPeQVC3d7nntvLRKXTHJnKrjfXFM0j9YtvPULxv7b26v23U6Z
	 vF4B+v10W3rmV33Aqo2JzjWUVF/Bb7Yd5scIjuNwJ2PSfY8ByP9FDeP1Ed2s9qTXm1
	 QsLIDgQesgSQP1tZSl6JoW5eTQDWNfsxzWcYzaxA=
Message-ID: <af820923-c423-4f19-99dd-7d8fdd2da864@arm.com>
Date: Thu, 30 Jul 2026 18:10:30 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v6 00/10] arm_mpam: Add MPAM-Fb firmware support
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260730152539.2712312-1-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260730152539.2712312-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_101036_245674_28148248 
X-CRM114-Status: GOOD (  13.38  )
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

Hi Andre,

On 7/30/26 16:25, Andre Przywara wrote:
[...]
> The first six patches rework all MSC access wrappers to propagate error
> information. Pure MMIO based MSC accesses would never fail, but the
> MPAM-Fb access can go wrong in multiple ways. The patches have been split
> up purely for reviewing reasons, if the number is a problem, we could as
> well squash them. Please note that until the very last patch of this series
> any MSC accesses would always only return 0, it's only the final enablement
> of MPAM-Fb that could possibly introduce errors. Hence all former patches
> can add error handling gradually, those code paths wouldn't be triggered
> before patch 10/10.

I had a go at injecting some errors and noticed that at least some aren't getting to user space.
When writing the schemata file any MPAM-Fb error is not propagated to the user. The
resctrl_arch_update_domains() continues to return 0 as there are some missing links in the chain
down to the writes, e.g. __write_config() always returns 0.

Thanks,

Ben


