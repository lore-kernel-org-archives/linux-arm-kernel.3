Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABFFC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0odYW7NrJf/7bf5B9VU2KsGbVt4XzOOmDlQQWtZXDFI=; b=RcDtT3u3P/IBAf42Z28P019YBQ
	VotXsJC1XBIkV7/VqCKfFToos+G9rQNp6p5+9LsmqL93VawNKAUDr+/mMjgC7lKKMDUzec6JbvMbx
	tCBEEwx+HCgZg1H6RCsvG2QZX2KwKEc6y3w9rbdm1/rPc2I8UU2U/RuBNAX3TSAt4AvVxN1wGWukC
	1snU33OGKGoSOlsc7er262oGu1Mb8f0Gud0mcY5XB1YMXr/flyd76GDvFBpBPINWbpzGuYWIioi2F
	d9eO4jf4ysCTneQF9ihn2yu4N1fps08NNraoMVI8rEEi62CaHCcGcOaewdihx3vDEGfyKDddSviDs
	xQ+WTk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujijC-0000000G2yp-3rXY;
	Wed, 06 Aug 2025 18:19:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiVk-0000000G1F2-3Avl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:05:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 071A6176C;
	Wed,  6 Aug 2025 11:05:04 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDF313F738;
	Wed,  6 Aug 2025 11:05:08 -0700 (PDT)
Message-ID: <8860287d-3f3c-4079-b72a-63e8569e8f9a@arm.com>
Date: Wed, 6 Aug 2025 19:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/36] arm_mpam: Add MPAM MSC register layout
 definitions
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-17-james.morse@arm.com>
 <45acead9-d734-42b2-a1cc-a565dbf5fe60@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <45acead9-d734-42b2-a1cc-a565dbf5fe60@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_110512_876605_0DF1C779 
X-CRM114-Status: GOOD (  16.62  )
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

Hi Ben,

On 24/07/2025 15:02, Ben Horgan wrote:
> On 11/07/2025 19:36, James Morse wrote:
>> Memory Partitioning and Monitoring (MPAM) has memory mapped devices
>> (MSCs) with an identity/configuration page.
>>
>> Add the definitions for these registers as offset within the page(s).

>> diff --git a/drivers/platform/arm64/mpam/mpam_internal.h b/drivers/platform/arm64/mpam/
>> mpam_internal.h
>> index d49bb884b433..9110c171d9d2 100644
>> --- a/drivers/platform/arm64/mpam/mpam_internal.h
>> +++ b/drivers/platform/arm64/mpam/mpam_internal.h
>> @@ -150,4 +150,272 @@ extern struct list_head mpam_classes;
>>   int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
>>                      cpumask_t *affinity);
>>   +/*
>> + * MPAM MSCs have the following register layout. See:
>> + * Arm Architecture Reference Manual Supplement - Memory System Resource
>> + * Partitioning and Monitoring (MPAM), for Armv8-A. DDI 0598A.a

> I've been checking this against https://developer.arm.com/documentation/ihi0099/latest/ as
> that looks to be the current document although hopefully the contents are non-
> contradictory.

Yeah, A.a was the first release, they then split that document up and the CPU half got
consumed by the arm-arm. (pacman, but in pdf form).
I've updated this comment to point to the more modern 'system component specification',
aka "all the mmio stuff".


>> +/* MPAMF_IDR - MPAM features ID register */
>> +#define MPAMF_IDR_PARTID_MAX            GENMASK(15, 0)
>> +#define MPAMF_IDR_PMG_MAX               GENMASK(23, 16)
>> +#define MPAMF_IDR_HAS_CCAP_PART         BIT(24)
>> +#define MPAMF_IDR_HAS_CPOR_PART         BIT(25)
>> +#define MPAMF_IDR_HAS_MBW_PART          BIT(26)
>> +#define MPAMF_IDR_HAS_PRI_PART          BIT(27)
>> +#define MPAMF_IDR_HAS_EXT               BIT(28)

> MPAMF_IDR_EXT. The field name is ext rather than has_ext.

Making it the odd one out!
I'll change this in the hope that one day this sort of thing can be generated.


>> +#define MPAMF_IDR_HAS_IMPL_IDR          BIT(29)
>> +#define MPAMF_IDR_HAS_MSMON             BIT(30)
>> +#define MPAMF_IDR_HAS_PARTID_NRW        BIT(31)
>> +#define MPAMF_IDR_HAS_RIS               BIT(32)
>> +#define MPAMF_IDR_HAS_EXT_ESR           BIT(38)

> MPAMF_IDR_HAS_EXTD_ESR. Missing D.

Fixed.


>> +#define MPAMF_IDR_HAS_ESR     BIT(39)
>> +#define MPAMF_IDR_RIS_MAX               GENMASK(59, 56)
>> +
>> +/* MPAMF_MSMON_IDR - MPAM performance monitoring ID register */
>> +#define MPAMF_MSMON_IDR_MSMON_CSU               BIT(16)
>> +#define MPAMF_MSMON_IDR_MSMON_MBWU              BIT(17)
>> +#define MPAMF_MSMON_IDR_HAS_LOCAL_CAPT_EVNT     BIT(31)
>> +
>> +/* MPAMF_CPOR_IDR - MPAM features cache portion partitioning ID register */
>> +#define MPAMF_CPOR_IDR_CPBM_WD                  GENMASK(15, 0)
>> +
>> +/* MPAMF_CCAP_IDR - MPAM features cache capacity partitioning ID register */
>> +#define MPAMF_CCAP_IDR_HAS_CMAX_SOFTLIM         BIT(31)
>> +#define MPAMF_CCAP_IDR_NO_CMAX                  BIT(30)
>> +#define MPAMF_CCAP_IDR_HAS_CMIN                 BIT(29)
>> +#define MPAMF_CCAP_IDR_HAS_CASSOC               BIT(28)
>> +#define MPAMF_CCAP_IDR_CASSOC_WD                GENMASK(12, 8)
>> +#define MPAMF_CCAP_IDR_CMAX_WD                  GENMASK(5, 0)

> nit: Field ordering differs from the other registers.

Fixed,

[..]

>> +/* MPAMF_ESR - MPAM Error Status Register */

>> +#define MPAMF_ESR_PARTID_OR_MON GENMASK(15, 0)

Probably a better name but PARTID_MON is in the specification.

Fixed,

[..]

>> +/*
>> + * MSMON_CFG_CSU_CTL - Memory system performance monitor configure cache storage
>> + *                    usage monitor control register
>> + * MSMON_CFG_MBWU_CTL - Memory system performance monitor configure memory
>> + *                     bandwidth usage monitor control register
>> + */
>> +#define MSMON_CFG_x_CTL_TYPE           GENMASK(7, 0)
>> +#define MSMON_CFG_x_CTL_OFLOW_STATUS_L BIT(15)

> No OFLOW_STATUS_L for csu.

You're suggesting there shouldn't be an 'x' in the middle? Sure.

Overflow is nonsense for the CSU 'counters' as they don't count up, so can't overflow.
(and yet they have an overflow status bit!)


>> +#define MSMON_CFG_x_CTL_MATCH_PARTID   BIT(16)
>> +#define MSMON_CFG_x_CTL_MATCH_PMG      BIT(17)
>> +#define MSMON_CFG_x_CTL_SCLEN          BIT(19)

>> +#define MSMON_CFG_x_CTL_SUBTYPE        GENMASK(23, 20)
> GENMASK(22,20)> +#define MSMON_CFG_x_CTL_OFLOW_FRZ      BIT(24)
>> +#define MSMON_CFG_x_CTL_OFLOW_INTR     BIT(25)

(Are you using Outlook?)


>> +#define MSMON_CFG_x_CTL_OFLOW_STATUS   BIT(26)
>> +#define MSMON_CFG_x_CTL_CAPT_RESET     BIT(27)
>> +#define MSMON_CFG_x_CTL_CAPT_EVNT      GENMASK(30, 28)
>> +#define MSMON_CFG_x_CTL_EN             BIT(31)
>> +
>> +#define MSMON_CFG_MBWU_CTL_TYPE_MBWU            0x42
>> +#define MSMON_CFG_MBWU_CTL_TYPE_CSU            0x43
>> +
>> +#define MSMON_CFG_MBWU_CTL_SUBTYPE_NONE                 0
>> +#define MSMON_CFG_MBWU_CTL_SUBTYPE_READ                 1
>> +#define MSMON_CFG_MBWU_CTL_SUBTYPE_WRITE                2
>> +#define MSMON_CFG_MBWU_CTL_SUBTYPE_BOTH                 3

> I'm not sure where these come from? SUBTYPE is marked unused in the spec. Remove?> +

Looks like an earlier version of RWBW feature. I'll rip these out.


>> +#define MSMON_CFG_MBWU_CTL_SUBTYPE_MAX                  3
>> +#define MSMON_CFG_MBWU_CTL_SUBTYPE_MASK                 0x3

> Remove for same reason.


>> +
>> +/*
>> + * MSMON_CFG_MBWU_FLT - Memory system performance monitor configure memory
>> + *                     bandwidth usage monitor filter register
>> + */
>> +#define MSMON_CFG_MBWU_FLT_PARTID               GENMASK(15, 0)
>> +#define MSMON_CFG_MBWU_FLT_PMG                  GENMASK(23, 16)
>> +#define MSMON_CFG_MBWU_FLT_RWBW                 GENMASK(31, 30)
>> +
>> +/*
>> + * MSMON_CSU - Memory system performance monitor cache storage usage monitor
>> + *            register
>> + * MSMON_CSU_CAPTURE -  Memory system performance monitor cache storage usage
>> + *                     capture register
>> + * MSMON_MBWU  - Memory system performance monitor memory bandwidth usage
>> + *               monitor register
>> + * MSMON_MBWU_CAPTURE - Memory system performance monitor memory bandwidth usage
>> + *                     capture register
>> + */
>> +#define MSMON___VALUE          GENMASK(30, 0)
>> +#define MSMON___NRDY           BIT(31)
>> +#define MSMON_MBWU_L_VALUE     GENMASK(62, 0)

> This gets renamed in the series. I think all registers layout definitions can be added in
> this commit.

Yup, I've pulled that hunk in. (and spotted there is another)
Adding them all here was the plan. (and there will be a few that don't get used)


Thanks for going through all those!

James

