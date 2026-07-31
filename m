Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3103C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C445yV0s0WXmr96zXYB1balScTS3idaj5Yug0pncxLY=; b=yCqLuDfV+pe/P05uLBtVg14otQ
	z6lFEPhEK/PmF53gdospcYtfTNLXzbkuKDeLMUEf9tE5Qo9kgA+cVnJiPusKS5vYobM+Ji58bJ09T
	59WM1Ftl0IZ2f+nAy2lTchX23rm4zDBZdeJmcXorFf+cLeQrxQdfS4rWlGLJIQj6RKzAbLb85bv59
	WCTJYxaFLljNx941vHZcDlXvFMXGtIK3xVNiR6jT5ojPYejgXjX5e6/4J2hwve+Brz81Vaq9cgk/i
	P9KVfJM8lPaR0M3OMIfVepgffJU0vJpYpqTxxvarC/RHFG0L1Ulir5aLjmNSfYo3V6uoF73Nv5bDo
	/cX6oNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiVb-0000000C3H6-15LD;
	Fri, 31 Jul 2026 08:22:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiVY-0000000C3Gj-2Je6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 08:22:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B517F204C;
	Fri, 31 Jul 2026 01:22:14 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CB243F86F;
	Fri, 31 Jul 2026 01:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785486138; bh=U3VF5GVtmF6lcujs3Aw2aw4lWnm3cWfi8jxe7nQsYII=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PdKXgchQSaPWd6Qqp7ZXf+fRSlN/nIBZFB7ThXTVUpIRgsXojUyEzYNFKfR8RpvW5
	 hytA+PZJBQqX1FfHuuFBrx+U3ONiF/5IAyxhI2+W+7HxonlwTBgktj7OzeNPU7zGqp
	 Zq0dU53MV8JGm6V1wBb6GU8tUAvu5/rvGMy0uWeA=
Message-ID: <0511693b-5855-4419-8e1a-8444cfdd4253@arm.com>
Date: Fri, 31 Jul 2026 09:22:15 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v6 10/10] arm_mpam: detect and enable MPAM-Fb PCC support
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
 <20260730152539.2712312-11-andre.przywara@arm.com>
 <e09e7d37-59bb-4a4f-b47e-a014c674796e@arm.com>
 <b3224280-4925-41ed-8e45-838eb212d093@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <b3224280-4925-41ed-8e45-838eb212d093@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_012220_695696_764BF85A 
X-CRM114-Status: GOOD (  19.97  )
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

On 7/31/26 09:16, Andre Przywara wrote:
> Hi Ben,
> 
> On 7/30/26 18:13, Ben Horgan wrote:
>> Hi Andre,
>>
>> On 7/30/26 16:25, Andre Przywara wrote:
>>> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
>>> registers through a firmware interface. This requires a shared memory
>>> region to hold the message, and a mailbox to trigger the access.
>>> For ACPI this is wrapped as a PCC channel, described using existing
>>> ACPI abstractions.
>>>
>>> Add code to parse those PCC table descriptions associated with an MSC,
>>> and store the parsed information in the MSC struct.
>>> There can be multiple PCC channels, and each channel can serve multiple
>>> MSCs, so we need to keep track of the channel usage, using a list and
>>> a refcount.
>>>
>>> This will be used by the MPAM-Fb access wrapper code.
>>>
>>> [1] https://developer.arm.com/documentation/den0144/latest
>>>
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> Tested-by: Ritwick Sharma <ritwick.sharma@arm.com>
>> Ritwick gave his Tested-by for the series on v5. Any reason to just add the tag on this patch?
> 
> submitting-patches.rst says:
> "Both Tested-by and Reviewed-by tags, once received on mailing list from tester or reviewer, should
> be added by author to the *applicable* patches when sending next versions."
> 
> I think this system relies on MPAM-Fb, so he couldn't test each patch in isolation, but "just" that
> MPAM-Fb works, which is what only patch 10/10 enables.
> 
> So I find tags given for the whole series always tricky to handle, but in this case I figured patch
> 10/10 would be the right target.

Ok, yes. I agree with that principle - I'm still learning how these things are done. Perhaps patch 8
would have been relevant too.

Thanks,

Ben

> 
>> I guess patch 9 has significant enough changes to drop tags but I don't see it for the others.
> 
> Well, even smaller changes could ruin a whole thing, but IIUC in this case Ritwick's setup doesn't
> even enable error IRQs, so this part wasn't tested anyway.


> 
> Cheers,
> Andre.
> 


