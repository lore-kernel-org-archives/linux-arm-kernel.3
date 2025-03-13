Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAEDC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 11:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAl2PWHZNNQUJSpTsWEbGq+4kHjVgyYP9mc0YCIPJkI=; b=eSHSP0vfSU423k6Gl7pCQZD8dc
	1Oj3KgQaFJdMWmIkQqdzjRVw8P39iMeH8IP0P26XJRzC3hy1j7cNnbuq+nH7wFpD7m1EguojE6H0Z
	Bg40cuHi5n8pU0a6YO0Yeh/OtCwuOS1b66zzffEUfwNjofKESYcwFSoAMZToMpg50T5Maf7BXKn1r
	s5q2O9b4UC94fQcb7/p0s7nOOE4rlbltYYccW6C95oIvlcf5Dq0IknQUuWLII2aSooGzy3rEtFbTi
	gzuytQb1a0vWY3OulRZMtMiG1y+JaqAJhjgzf0dQoZIs8zQX6Kr3dvYzUaG2Zo1HhRYFSAduUbuok
	Uzsf0EIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgg9-0000000B1w5-3pd7;
	Thu, 13 Mar 2025 11:24:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgdl-0000000B1es-10OQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:22:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C0171C00;
	Thu, 13 Mar 2025 04:22:24 -0700 (PDT)
Received: from [10.1.32.45] (Suzukis-MBP.cambridge.arm.com [10.1.32.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C09D33F673;
	Thu, 13 Mar 2025 04:22:08 -0700 (PDT)
Message-ID: <e8749c86-fe93-4123-aa2e-5677e7a2c695@arm.com>
Date: Thu, 13 Mar 2025 11:22:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Initial BBML2 support for contpte_convert()
Content-Language: en-GB
To: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 ryan.roberts@arm.com, yang@os.amperecomputing.com, corbet@lwn.net,
 catalin.marinas@arm.com, will@kernel.org, jean-philippe@linaro.org,
 robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
 mark.rutland@arm.com, joey.gouly@arm.com, maz@kernel.org,
 james.morse@arm.com, broonie@kernel.org, anshuman.khandual@arm.com,
 oliver.upton@linux.dev, ioworker0@gmail.com, baohua@kernel.org,
 david@redhat.com, jgg@ziepe.ca, shameerali.kolothum.thodi@huawei.com,
 nicolinc@nvidia.com, mshavit@google.com, jsnitsel@redhat.com,
 smostafa@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev
References: <20250313104111.24196-2-miko.lenczewski@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250313104111.24196-2-miko.lenczewski@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_042217_368836_409C3388 
X-CRM114-Status: GOOD (  18.14  )
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

Hi Miko,

On 13/03/2025 10:41, Mikołaj Lenczewski wrote:
> Hi All,
> 
> This patch series adds adding initial support for eliding
> break-before-make requirements on systems that support BBML2 and
> additionally guarantee to never raise a conflict abort.
> 
> This support elides a TLB invalidation in contpte_convert(). This
> leads to a 12% improvement when executing a microbenchmark designed
> to force the pathological path where contpte_convert() gets called.
> This represents an 80% reduction in the cost of calling
> contpte_convert().
> 
> This series is based on v6.14-rc4 (d082ecbc71e9).
> 
> Patch 1 implements an allow-list of cpus that support BBML2, but with
> the additional constraint of never causing TLB conflict aborts. We
> settled on this constraint because we will use the feature for kernel
> mappings in the future, for which we cannot handle conflict aborts
> safely.
> 
> Yang Shi has a series at [1] that aims to use BBML2 to enable splitting
> the linear map at runtime. This series partially overlaps with it to add
> the cpu feature. We believe this series is fully compatible with Yang's
> requirements and could go first.
> 

Nothing about the patch functionality, but :

Minor nit: Generally it is a good idea to add "What changed" from the
previous posting.  That gives the reviewers an idea of what to look for
in the new version. Something like:

Changes since V2:
  {Adding a link to the posting is an added bonus, as we can look up the 
discussions easily}
  - blah blah
  - ..


Cheers
Suzuki


> [1]:
>    https://lore.kernel.org/linux-arm-kernel/20250304222018.615808-1-yang@os.amperecomputing.com/
> 
> Mikołaj Lenczewski (3):
>    arm64: Add BBM Level 2 cpu feature
>    iommu/arm: Add BBM Level 2 smmu feature
>    arm64/mm: Elide tlbi in contpte_convert() under BBML2
> 
>   .../admin-guide/kernel-parameters.txt         |  3 +
>   arch/arm64/Kconfig                            | 11 +++
>   arch/arm64/include/asm/cpucaps.h              |  2 +
>   arch/arm64/include/asm/cpufeature.h           |  6 ++
>   arch/arm64/kernel/cpufeature.c                | 76 +++++++++++++++++++
>   arch/arm64/kernel/pi/idreg-override.c         |  2 +
>   arch/arm64/mm/contpte.c                       |  3 +-
>   arch/arm64/tools/cpucaps                      |  1 +
>   .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  3 +
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  3 +
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  4 +
>   11 files changed, 113 insertions(+), 1 deletion(-)
> 


