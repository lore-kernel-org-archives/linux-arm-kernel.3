Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88083C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 05:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijoXj6D3ao9xjhKDSHIBWiEm1mRJLo6+iyZj8hvRuuk=; b=j0jtQ+T9Y2yQ/tjCO4S51PTO0X
	6GsyhXk41EPmEuyMWsFpkh6zvVJWrDTW6iQhuQOEgNb/g+ZncrcW+kgD0PD+Eo6YMIBQERPyNsLBe
	PjWPlL0GpmmWqTSV+JGcAL01PMpquW5mLt30wKhHb+1Z1KG/wduCH+Ldsb4PbEayAJJk9oNkrXEU5
	Jb/BTe0snL4ecT6YszvfyS/keh6OwI1Lvkz5vl2mCKw7JCtggKmS79nDPFn4dmzwGm11d7KSjixP8
	0AWwbP/zSjX+eRCR/XWnGcpLahaz0UMZjBLRCziMCD5J/0HwTP+cqHO7vY5JoY7i/2AsbdADuB0I+
	EVkfITkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tphDZ-000000071eC-1oz2;
	Wed, 05 Mar 2025 05:22:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tphC0-000000071Wx-1HTb
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 05:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ijoXj6D3ao9xjhKDSHIBWiEm1mRJLo6+iyZj8hvRuuk=; b=b1fmkE2uPBkYZT44VTsm4Qqfm9
	4dujO4wOPX4f0U68elZlzAVZT3z/xjpm81+BV2WLvvjnq+J8WHQxzCrZLarH3jN1eUkJZvu8aM0bB
	d3dIu6ISfI3Yq1pkBICFUILEF5/9c1SPbAGck9UFuFUZSE57kKxciFyoNOyQVr28VvFeWFJEEDW9v
	FysWWFtk1yWB/gtPQz5POsada0dvSDaddwhBiezYIm2FGdgmKQBDpCOkfF1SHa6rZhT2SpeAIzIH2
	wUYy2/4vDiO8w1lDrb8GEtXJFqQRuBGkjWg7QvmqR6oSY8HxATRMU8h1FmJ25RWdYS8apvIFI3+CE
	5hcI91sA==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tphBw-00000000MvA-3TlR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 05:21:14 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5255KrIT3769565
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Mar 2025 23:20:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741152053;
	bh=ijoXj6D3ao9xjhKDSHIBWiEm1mRJLo6+iyZj8hvRuuk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=d3k3IzMMwQHMqRvHIz1I3WSFLblEUfV3ckhP5Qq3G+yJxAUkwldRjER9dxjHSQ/cM
	 wPY1FFGyDl3rxZA+I/UgPXsEFix7rod1VUimOi8Wk/y8Apqw8+3ukjImUrl/GTipVb
	 2Ke63Sx08evB8dIGxDSJiYd93XWZ/04huCX5ofMY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5255Kqao026316
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Mar 2025 23:20:53 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Mar 2025 23:20:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Mar 2025 23:20:52 -0600
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5255KmhZ080040;
	Tue, 4 Mar 2025 23:20:48 -0600
Message-ID: <cf468c08-6808-49a2-b6d9-5c2b00d654de@ti.com>
Date: Wed, 5 Mar 2025 10:50:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: ti: icssg-prueth: Add ICSSG FW Stats
To: Jakub Kicinski <kuba@kernel.org>
CC: Meghana Malladi <m-malladi@ti.com>, Diogo Ivo <diogo.ivo@siemens.com>,
        Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
        "David
 S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>
References: <20250227093712.2130561-1-danishanwar@ti.com>
 <20250303172543.249a4fc2@kernel.org>
 <33c38844-4fbe-469c-bb5f-06bdb7721114@ti.com>
 <20250304162437.0160f687@kernel.org>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20250304162437.0160f687@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_052113_327315_38DCE5AB 
X-CRM114-Status: GOOD (  24.93  )
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

Hi Jakub,

On 05/03/25 5:54 am, Jakub Kicinski wrote:
> On Tue, 4 Mar 2025 13:46:39 +0530 MD Danish Anwar wrote:
>> On 04/03/25 6:55 am, Jakub Kicinski wrote:
>>> On Thu, 27 Feb 2025 15:07:12 +0530 MD Danish Anwar wrote:  
>>>> +	ICSSG_PA_STATS(FW_PREEMPT_BAD_FRAG),
>>>> +	ICSSG_PA_STATS(FW_PREEMPT_ASSEMBLY_ERR),
>>>> +	ICSSG_PA_STATS(FW_PREEMPT_FRAG_CNT_TX),
>>>> +	ICSSG_PA_STATS(FW_PREEMPT_ASSEMBLY_OK),
>>>> +	ICSSG_PA_STATS(FW_PREEMPT_FRAG_CNT_RX),  
>>>
>>> I presume frame preemption is implemented in silicon? If yes -
>>> what makes these "FW statistics"? Does the FW collect them from   
>>
>> The statistics are maintained / updated by firmware and thus the name.
>>
>> Preemption is implemented partially in both the hardware and firmware.
>> The STATE MACHINE for preemption is in the firmware. The decision to
>> when to PREEMEPT / ASSEMBLE a packet is made in firmware.
>>
>> These preemption statistics are updated by the firmware based on the
>> action performed by the firmware. Driver can read these to know the
>> statistics of preemption. These stats will be able used by
>> ethtool_mm_stats once the support for Preemption is added in the driver.
> 
> That was going to be my next question. If the statistic is suitable 
> for a standard interface it should not be reported via ethtool -S.
> 

Sure. I will not report it via `ethtool -S`. This will only be reported
via ethtool_get_mm_stats. I will do something similar to
`icssg_miig_stats`. Have a boolean to indicate whether the stat is
getting reported by some standard interface or not.

> Please leave the stats for unimplemented features out.
> 

Sure. For now I will remove the FW_PREEMPT stats since the feature is
not implemented yet. Once the implementation is done, I will add the
stats to icssg_all_pa_stats() and read it via
emac_update_hardware_stats() and report it via ethtool_get_mm_stats.

>>>> +/* Incremented if a packet is dropped at PRU because of a rule violation */
>>>> +#define FW_DROPPED_PKT		0x00F8  
>>>
>>> Instead of adding comments here please add a file under
>>> Documentation/networking/device_drivers/ with the explanations.
>>> That's far more likely to be discovered by users, no?  
>>
>> Sure I will drop these MACRO comments and create a .rst file in
>> Documentation/networking/device_drivers/
>>
>> One question though, should I create a table for the stats and it's
>> description or should I create a section for each stats?
>>
>> Something like this,
>>
>> FW_RTU_PKT_DROP
>> ---------------
> 
> Let's document the user-visible names! The strings from ethtool -S
> 
>> Diagnostic error counter which increments when RTU drops a locally
>> injected packet due to port being disabled or rule violation.
>>
>> Please let me know what do you think.
> 
> Taking inspiration from:
>   Documentation/networking/device_drivers/ethernet/meta/fbnic.rst
> should be a safe choice, I hope.

This looks to be a good choice. I will do the changes and send out a v2.
Thanks for the review.

-- 
Thanks and Regards,
Danish

