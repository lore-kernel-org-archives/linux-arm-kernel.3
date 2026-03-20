Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1911093177
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 06:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PIzdafjN7WCYYuCQALUYYZgX3e21Tqrr/6yaH1Xmd4=; b=fNHC3XvzeOC3iRoJx/WrOtEv/i
	wv/8ILglKa5nR3TnLqoQkE1gqH3toLvaueGhFgzjdHKiWGt4WOQGH+tHSIxTDU+/a/0DRR9/fly4y
	aOunar5DvUsSMyThNhhiovSth+6B45e5MVDr50K7WqKNdlA8nsCDn83ocb4sV0L8SEZvpkh2f+uD7
	MlEvLYKC7ZEZPFw5xzZPJ3f/BUlLcnwwHmbeOLkB1ysSMZtOnsS4cujqn5A+QoLf6UQu8TBA9jEHm
	X/M7lZJkX6q0bPxyIKIHwP9bP1LbcJBeyMlJQxns8SGtU4gF3mYjLfPVhn1Zwoo3Pp+PJwsFULgQ0
	DbBYySRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3T0I-0000000C96s-3pv7;
	Fri, 20 Mar 2026 06:06:38 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3T0G-0000000C96X-1yTN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 06:06:37 +0000
Received: from [10.94.176.97] (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id A8F9920B710C;
	Thu, 19 Mar 2026 23:06:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A8F9920B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773986795;
	bh=6PIzdafjN7WCYYuCQALUYYZgX3e21Tqrr/6yaH1Xmd4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=EJV3r3BkpE7aJTbBal2JjdirNnfl+n5AorOuHd2tLfUqLlnVv3mB/PUltJStlToSY
	 hxXjfdZNbFf0eOyEE4zBh7bWcKM5LeEZPjI5/EroW/dpHHbbQYh7AhnGCvfvu5rKEM
	 WiXs/OKebvVAVI8IDwqCuXPW7HEa/Ufut6tr72uQ=
Message-ID: <ea83916c-36cd-4d73-af14-a80565984064@linux.microsoft.com>
Date: Fri, 20 Mar 2026 11:36:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: xilinx: Shutdown and free rx mailbox channel
To: Michal Simek <michal.simek@amd.com>, jay.buddhabhatti@amd.com,
 marco.crivellari@suse.com, tejas.patel@xilinx.com, rajan.vaja@xilinx.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260317133517.1324319-1-ptsm@linux.microsoft.com>
 <20260317143643.1329013-1-ptsm@linux.microsoft.com>
 <fa75334e-6cce-4a6e-8072-132b8823deb9@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <fa75334e-6cce-4a6e-8072-132b8823deb9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_230636_842197_A56ABDD6 
X-CRM114-Status: GOOD (  16.77  )
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



On 18-03-2026 21:36, Michal Simek wrote:
> 
> 
> On 3/17/26 15:36, Prasanna Kumar T S M wrote:
>> [Some people who received this message don't often get email from 
>> ptsm@linux.microsoft.com. Learn why this is important at https:// 
>> aka.ms/LearnAboutSenderIdentification ]
>>
>> A mbox rx channel is requested using mbox_request_channel_byname() in
>> probe. In remove callback, the rx mailbox channel is cleaned up when the
>> rx_chan is NULL due to incorrect condition check. The mailbox channel is
>> not shutdown and it can receive messages even after the device removal.
>> This leads to use after free. Also the channel resources are not freed.
>> Fix this by checking the rx_chan correctly.
>>
>> Fixes: ffdbae28d9d1 ("drivers: soc: xilinx: Use mailbox IPI callback")
>> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
>> ---
>>   drivers/soc/xilinx/zynqmp_power.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/ 
>> zynqmp_power.c
>> index aa35b63b45a3..5086c1e6797e 100644
>> --- a/drivers/soc/xilinx/zynqmp_power.c
>> +++ b/drivers/soc/xilinx/zynqmp_power.c
>> @@ -398,7 +398,7 @@ static void zynqmp_pm_remove(struct 
>> platform_device *pdev)
>>   {
>>          sysfs_remove_file(&pdev->dev.kobj, &dev_attr_suspend_mode.attr);
>>
>> -       if (!rx_chan)
>> +       if (rx_chan)
>>                  mbox_free_channel(rx_chan);
> 
> 
> Please also clear that global variable because when the driver is re- 
> bound there will be old reference to rx_chan which shouldn't be there.
> 
>           if (rx_chan) {
>                   mbox_free_channel(rx_chan);
>                   rx_chan = NULL;
>           }
> 
> And please send both patches as one thread.
> 
> Thanks,
> Michal

Hi Michal,

Thanks for the review. Sent v2.

Thanks,
Prasanna

