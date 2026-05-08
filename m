Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74FECD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 09:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tzi78l9kdvniXfDx5aAG0mSppxO+GIQomKZynRWcED4=; b=fgM6bDvPpewkLYStq6whSg/mN3
	sUS6LJmmeMb8S3zNE2FBYh3W5YqDAYBjTIvWWHG1fybeZkV9t0+9CSXl8Jjld2R0CELA03pFtU0TC
	l/5k6u80eqkDjlLY6eB0rZ15C5DxFOrsLPVThZF4Tc0NuacHC/t34L2BXrJl/mnlXhGDCp2GOCko9
	JYNZVdrFxjjFyUjJp02sc/PDqhSwiFmpO7PukUteD7RVKF8Cvt8BLzt8bC3vWw/kHUaq8Rfu9kk/p
	W9u/6qzFRWVzbq0+HEDzkIm65ZKS0+Jf2VtFF35VguEvTOaBB0LntifVL/PEAnN5AZD1cAekzaP0y
	Thf86Ncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHex-000000068CO-3SXq;
	Fri, 08 May 2026 09:38:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHeu-000000068Aq-2J5u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 09:38:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF62F1BCA;
	Fri,  8 May 2026 02:38:03 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1390C3FAF5;
	Fri,  8 May 2026 02:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778233089; bh=VwmEXXw0tSFbY6/crtHABcMmJJSuggKfOPrbxXWUh0c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vJ2W0+4lrQpJAoTPpmCQDF8cSKPXZ77CfdJnTLjAhQoAarTOYomfu4Q3VyjqfpueG
	 VdSeWGvubLNw7ezXXAr8my+7vTJupdrKEsFyZ3wRYLcihPIcKTm1Pkwuime4URrNtd
	 gmfJOz2D4G4SQ7VwpPpXhG9RER4HrQC7zkOImV8U=
Message-ID: <ff95000d-d4ee-493a-b3cd-d573bd32abd0@arm.com>
Date: Fri, 8 May 2026 10:37:58 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v2 2/2] arm_mpam: Update architecture version check for
 MPAM MSC
To: Zeng Heng <zengheng4@huawei.com>, James Morse <james.morse@arm.com>,
 xry111@xry111.site, catalin.marinas@arm.com, maz@kernel.org,
 ardb@kernel.org, yang@os.amperecomputing.com, ryan.roberts@arm.com,
 kevin.brodsky@arm.com, reinette.chatre@intel.com, miko.lenczewski@arm.com,
 will@kernel.org, suzuki.poulose@arm.com, thuth@redhat.com,
 james.clark@linaro.org, lpieralisi@kernel.org, broonie@kernel.org,
 oupton@kernel.org, anshuman.khandual@arm.com, yeoreum.yun@arm.com,
 leo.yan@arm.com, mrigendra.chaubey@gmail.com, fenghuay@nvidia.com,
 ahmed.genidi@arm.com, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 wangkefeng.wang@huawei.com
References: <20260203095406.6437-1-zengheng4@huawei.com>
 <20260203095406.6437-3-zengheng4@huawei.com>
 <b9900d7a-eaaf-4f1a-b79e-aa968a7b6e29@arm.com>
 <01ef61ca-7ba7-b282-7ec6-b1df5c301aa5@huawei.com>
 <cdddd32a-a485-0ef9-180b-edf29f4738bd@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <cdddd32a-a485-0ef9-180b-edf29f4738bd@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_023812_690859_A4F9A6DE 
X-CRM114-Status: GOOD (  15.50  )
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

Hi James and Zeng,

On 5/8/26 04:47, Zeng Heng wrote:
> Hi James,
> 
> On 2026/5/8 10:26, Zeng Heng wrote:
> 
>>> I think its simpler to rule out the unsupported combinations, something like:
>>> | static bool mpam_msc_check_aidr(struct mpam_msc *msc)
>>> | {
>>> |     u32 rev;
>>> |
>>> |     rev = __mpam_read_reg(msc, MPAMF_AIDR) & MPAMF_AIDR_ARCH_REV;
>>> |
>>> |      /*
>>> |      * v0.0 and >v2.x aren't supported, but anything else should be backward
>>> |     * compatible to v0.1 or v1.0.
>>> |     */
>>> |     if (!rev)
>>> |         return false;
>>> |     if (rev & MPAMF_AIDR_ARCH_MAJOR_REV > MPAM_ARCHITECTURE_V1)
>>> |         return false;
>>> |
> 
> Oops, after more complete version number testing, I found there's an
> operator precedence issue here. The correct fix is:
> 
>     if ((rev & MPAMF_AIDR_ARCH_MAJOR_REV) > MPAM_ARCHITECTURE_V1)
>         return false;
> 
> Note that '>' has higher precedence than '&'.

Isn't it better to use FIELD_GET()?  We could also avoid creating MPAMF_AIDR_ARCH_REV and use MPAMF_AIDR_ARCH_MAJOR_REV
and MPAMF_AIDR_ARCH_MINOR_REV directly to stop splitting the logic over two files. mpam_msc_check_aidr() could become:

static bool mpam_msc_check_aidr(struct mpam_msc *msc)
{
	u32 aidr = __mpam_read_reg(msc, MPAMF_AIDR);
	u32 major = FIELD_GET(MPAMF_AIDR_ARCH_MAJOR_REV, aidr);
	u32 minor = FIELD_GET(MPAMF_AIDR_ARCH_MINOR_REV, aidr);

	/*
	 * v0.0 and >v2.x aren't supported, but anything else should be backward
	 * compatible to v0.1 or v1.0.
	 */
	if (!major && !minor)
		return false;
	if (major > MPAM_ARCHITECTURE_V1)
		return false;

	return true;
}


Thanks,

Ben

> 
> 
> With this fix included:
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> 
> 
>>> |     return true;
>>> | }
>>>
>>>> +    if (!mpam_msc_check_aidr(msc)) {
>>>> +        dev_err_once(dev, "MSC does not match MPAM architecture\n");
>>>>           return -EIO;
>>>>       }
>>>
>>> I'd like to keep the 'v1.x' in this message - this should help folk with old stable
>>> kernels running on new hardware work out why the feature isn't available.
>>> (assuming they have some documentation that says v2.0 in it!)
>>>
>>> I've rebased this with the above changes, which I'll post shortly for fixes.
>>>
>>>
>>
>> Agreed. Keep the backward compatibility extension for versions
>> (compatible with v0.x(x>0) and 1.x), and remove the redundant
>> MPAM_ARCHITECTURE_Vx_x macro definitions.
>>
>> I've verified locally that everything works fine.
>>
> 
> 


