Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25442CCF2C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 17:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alVgM7JNjtQyVEsr6eqrjixjUFTZ4mZp4fI31RIjWLk=; b=pgRd28suOhSUCf
	RXmZesgDxbrJJs61JLiDfu//NVD2XjsP5DbtXPd8gbGbBfaX4QZtNPQVQ1kMATs/PFpEQiP7asK6e
	Hx7GyL75L7CThylhMd0kGrgWlEShxdZassufC8NwY5adDlzZ1sGYiMHFOLOAygq2mujJ/mlPSPXBR
	Clus88sPpwKkV0vYBFiyDcoH7ZTahhlM8QGmi4U7ZO7KH/ZG7UcdreqPoP3OA8jPq3qAy8ykix9jX
	MM75M6COeZ9B+qPVPhYWmNPQ7DH+Xw8E6q9fKgLH1hKx6XLRSXYztCcvV4EtTHUdkL0hkFszQEbFv
	AVt8d/3fxFW3dnOfWVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlyF-00000003aG5-1z9I;
	Fri, 16 Oct 2026 17:43:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlyC-00000003aFX-0n2q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 17:43:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 169781477;
	Fri, 16 Oct 2026 10:43:48 -0700 (PDT)
Received: from [10.33.8.90] (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E85B3F673;
	Fri, 16 Oct 2026 10:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792172631; bh=iLl+pZEoD2Vsymgc38jkD3tbsIaYo6YNMK9eLraqZMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jA7KvQmo55cG34trJ2QczQIf6ukIMrcQfZT+hQotxxN3MDeoUVoNziIwKQKL5/1OY
	 HbubVGGQn3wsxR9EB9HIQYoSTzc0z1Syi/nD/LsezMHuafcly2dQ7eKPzdZURbYnPP
	 D9YkjaC6a118pHx3GmiQdKlITd/xKeIs4RZl/oXY=
Message-ID: <b5f4bdca-28e8-4b66-853d-7a3dbbbdca07@arm.com>
Date: Fri, 16 Oct 2026 18:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] firmware: smccc: lfa: Register DT interrupt
To: Sudeep Holla <sudeep.holla@kernel.org>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-7-andre.przywara@arm.com>
 <20260921-aloof-sympathetic-python-54aa7d@sudeepholla>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260921-aloof-sympathetic-python-54aa7d@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_104352_327763_CB5DA57B 
X-CRM114-Status: GOOD (  22.61  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

(sorry, forgot to send the reply earlier, that goes together with the 
ACPI reply)

On 9/21/26 18:09, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 04:11:09PM +0200, Andre Przywara wrote:
>> The Arm Live Firmware Activation spec describes an asynchronous
>> notification mechanism, where the platform can notify the host OS about
>> newly pending image updates.
>> In the absence of the ACPI notification mechanism also a simple
>> devicetree node can describe an interrupt.
>>
>> Add code to find the respective DT node and register the specified
>> interrupt, to trigger the activation if needed.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/firmware/smccc/lfa_fw.c | 39 +++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
>> index 7a55b4a6785d8..a23df331ffde9 100644
>> --- a/drivers/firmware/smccc/lfa_fw.c
>> +++ b/drivers/firmware/smccc/lfa_fw.c
>> @@ -16,6 +16,8 @@
>>   #include <linux/list.h>
>>   #include <linux/module.h>
>>   #include <linux/nmi.h>
>> +#include <linux/of.h>
>> +#include <linux/of_irq.h>
>>   #include <linux/psci.h>
>>   #include <linux/stop_machine.h>
>>   #include <linux/string.h>
>> @@ -871,6 +873,37 @@ static void lfa_remove_acpi(struct device *dev)
>>   }
>>   #endif
>>   
>> +static irqreturn_t lfa_irq_handler_thread(int irq, void *dev_id)
>> +{
>> +	int ret;
>> +
>> +	while (!(ret = activate_pending_image()))
>> +		;
> 
> Yet again trusting firmware too much!

Yes, same problem as with the ACPI patch, and will be fixed by the same 
new code.
>> +
>> +	if (ret != -ENOENT)
>> +		pr_warn("notified image activation failed: %d\n", ret);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int lfa_register_dt(struct device *dev)
>> +{
>> +	struct device_node *np;
>> +	unsigned int irq;
>> +
>> +	np = of_find_compatible_node(NULL, NULL, "arm,lfa");
>> +	if (!np)
>> +		return -ENODEV;
>> +
>> +	irq = irq_of_parse_and_map(np, 0);
>> +	of_node_put(np);
>> +	if (!irq)
>> +		return -ENODEV;
>> +
>> +	return devm_request_threaded_irq(dev, irq, NULL, lfa_irq_handler_thread,
>> +					 IRQF_COND_ONESHOT, NULL, NULL);
> 
> And where can I find free_irq() ? Yes devm_() can do that for you but how
> does that work with races around removal of device for example. I prefer
> to have free_irq() at the very beginning of lfa_remove().

OK, added that.

> 
>> +}
>> +
>>   static int lfa_smccc_probe(struct arm_smccc_device *sdev)
>>   {
>>   	struct arm_smccc_1_2_regs reg = { 0 };
>> @@ -913,6 +946,12 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
>>   			pr_info("registered LFA ACPI notification\n");
>>   		if (err != -ENODEV)
>>   			return err;
>> +	} else {
>> +		err = lfa_register_dt(&sdev->dev);
>> +		if (!err)
>> +			pr_info("registered LFA DT notification interrupt\n");
>> +		if (err != -ENODEV)
>> +			return err;
> 
> More code addition with absolutely no error handling 🙁.

Right, but fixed now by the same code that fixed the ACPI part.

Cheers,
Andre

> 
> 
>>   	}
>>   
>>   	return 0;
>> -- 
>> 2.43.0
>>
> 


