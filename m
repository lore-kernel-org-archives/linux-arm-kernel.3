Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220E7C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 10:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfVaqGwlH59g5Wo4ouEEZtBDZOeY0YEak/gu+Fgtiao=; b=IGUWQWYCpIljR8OBBtIEk7omJZ
	AH24jhXV6XyKx1Y2qAp+MRupHPa9zFII1oTKqk4OgQ29c4WjEdcxOljlferGOcSMtUtRJBOQJ/gXi
	8Du1sNRSDD9DXW2/4gZm5US27GhQcRhi+CIB1PbYlWmU6lJbR7KzErqKVCEdL0HcUKJa8iuljV+nd
	xrw/HKbTFqP6C5cMmz68Q8bd6p921Lj6DjgPG4UrcY5+xIwsfVECPQHusCvrUud21jMexMu4e7/Ce
	4KfceYNpD1yuolqiaIQujuSb5F3M0+wlV8SK1XfOIGqTHNKVZNz6Qgb98lHYwlu1rFaznqdUENA/p
	gp8Pvzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3Jw-00000000NxQ-23kI;
	Mon, 03 Mar 2025 10:46:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp35n-00000000Kzc-2G2Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 10:32:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 092C1113E;
	Mon,  3 Mar 2025 02:32:25 -0800 (PST)
Received: from e133081.arm.com (unknown [10.57.37.136])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AC8F3F66E;
	Mon,  3 Mar 2025 02:32:03 -0800 (PST)
Date: Mon, 3 Mar 2025 10:32:01 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, suzuki.poulose@arm.com,
	catalin.marinas@arm.com, will@kernel.org, joro@8bytes.org,
	jean-philippe@linaro.org, mark.rutland@arm.com, joey.gouly@arm.com,
	oliver.upton@linux.dev, james.morse@arm.com, broonie@kernel.org,
	maz@kernel.org, david@redhat.com, akpm@linux-foundation.org,
	jgg@ziepe.ca, nicolinc@nvidia.com, mshavit@google.com,
	jsnitsel@redhat.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v2 4/4] iommu/arm: Add BBM Level 2 smmu feature
Message-ID: <20250303103201.GD13345@e133081.arm.com>
References: <20250228182403.6269-2-miko.lenczewski@arm.com>
 <20250228182403.6269-6-miko.lenczewski@arm.com>
 <b46dc626-edc9-4d20-99d2-6cd08a01346c@os.amperecomputing.com>
 <43732270-8fd0-4a18-abec-096e383a6a4d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43732270-8fd0-4a18-abec-096e383a6a4d@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_023211_663887_2D24A815 
X-CRM114-Status: GOOD (  25.70  )
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

On Mon, Mar 03, 2025 at 10:17:28AM +0000, Ryan Roberts wrote:
> On 01/03/2025 01:32, Yang Shi wrote:
> > 
> > 
> > 
> > On 2/28/25 10:24 AM, Mikołaj Lenczewski wrote:
> >> For supporting BBM Level 2 for userspace mappings, we want to ensure
> >> that the smmu also supports its own version of BBM Level 2. Luckily, the
> >> smmu spec (IHI 0070G 3.21.1.3) is stricter than the aarch64 spec (DDI
> >> 0487K.a D8.16.2), so already guarantees that no aborts are raised when
> >> BBM level 2 is claimed.
> >>
> >> Add the feature and testing for it under arm_smmu_sva_supported().
> >>
> >> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
> >> ---
> >>   arch/arm64/kernel/cpufeature.c                  | 7 +++----
> >>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 3 +++
> >>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 3 +++
> >>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 4 ++++
> >>   4 files changed, 13 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> >> index 63f6d356dc77..1022c63f81b2 100644
> >> --- a/arch/arm64/kernel/cpufeature.c
> >> +++ b/arch/arm64/kernel/cpufeature.c
> >> @@ -2223,8 +2223,6 @@ static bool has_bbml2_noabort(const struct
> >> arm64_cpu_capabilities *caps, int sco
> >>               if (!cpu_has_bbml2_noabort(__cpu_read_midr(cpu)))
> >>                   return false;
> >>           }
> >> -
> >> -        return true;
> >>       } else if (scope & SCOPE_LOCAL_CPU) {
> >>           /* We are a hot-plugged CPU, so only need to check our MIDR.
> >>            * If we have the correct MIDR, but the kernel booted on an
> >> @@ -2232,10 +2230,11 @@ static bool has_bbml2_noabort(const struct
> >> arm64_cpu_capabilities *caps, int sco
> >>            * we have an incorrect MIDR, but the kernel booted on a
> >>            * sufficient CPU, we will not bring up this CPU.
> >>            */
> >> -        return cpu_has_bbml2_noabort(read_cpuid_id());
> >> +        if (!cpu_has_bbml2_noabort(read_cpuid_id()))
> >> +            return false;
> >>       }
> >>   -    return false;
> >> +    return has_cpuid_feature(caps, scope);
> > 
> > Do we really need this? IIRC, it means the MIDR has to be in the allow list
> > *AND* MMFR2 register has to be set too. AmpereOne doesn't have MMFR2 register set.
> 
> Miko, I think this should have been squashed into patch #1? It doesn't belong in
> this patch.

Yes, 100%. Missed this, will put into patch #1.

