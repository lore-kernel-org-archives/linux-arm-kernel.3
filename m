Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F930C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWbUC7b/4jXSTc329eON6eIGQpRPNI0FB0qwEB46+rs=; b=fAqLN8Z5IkgpjA
	rg4gonqvQ4H3mAWcvH04KQD/ZjeXLToSBqXSQEixWOpNI4CYJvi+HtxxdoCG7du9uVtXxNmHLtPZR
	8cNae9Zp4Y4Y6rAW5L4zQSuc4NPqPII1/WjT3mMH0sPcND5u2cJXapUhvs+oDcz8pnSHuBba1WhOB
	3yKZk0Z2GLs4wYo6tl5BV6Qz42xR6INv+a9jJhNk/SLEHqpD5OVZa8yh2/vQZppIM6eUhvm89+NBu
	z5VY20tveK7wt/MCY0TtMe1/hYo7s2r5UHcj5EJx4bhRx5efzsD5eYPYrU8a0g5Oag3D+gSIVBgz0
	kKYYdZJvZuWzDCTudAYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZP-00000009AXe-1mfW;
	Wed, 02 Jul 2025 17:48:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX18c-000000097Co-0TK5;
	Wed, 02 Jul 2025 17:20:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0216322D9;
	Wed,  2 Jul 2025 10:20:33 -0700 (PDT)
Received: from [10.57.29.161] (unknown [10.57.29.161])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A5AF3F66E;
	Wed,  2 Jul 2025 10:20:45 -0700 (PDT)
Message-ID: <ec98776a-318e-4dc1-9d40-e9d8b1c4c28f@arm.com>
Date: Wed, 2 Jul 2025 18:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mtd: rawnand: atmel: ECC error after update to kernel 6.6
To: Zixun LI <admin@hifiphile.com>
References: <CA+GyqebQnWQ3fj4Lrb4-hvzRpphuqw+jh4B9En1j2NDTNFumvQ@mail.gmail.com>
 <599c677a-ace0-41fe-b264-51de0fa7badf@arm.com>
 <CA+GyqebFpav_ixDyp84-XA2WcQdrm_t6nfaKckm98tt5MpM2EA@mail.gmail.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB
Organization: Arm Ltd.
In-Reply-To: <CA+GyqebFpav_ixDyp84-XA2WcQdrm_t6nfaKckm98tt5MpM2EA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_102050_190829_1508E0FD 
X-CRM114-Status: GOOD (  15.99  )
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
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, SoC support' <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 01/07/2025 19:04, Zixun LI wrote:

> On Tue, Jul 1, 2025 at 5:49 PM Ada Couprie Diaz <ada.coupriediaz@arm.com> wrote:
>> Hi,
>>
>> I've written a small patch below that I think should fix the issue, but again
>> I don't know if that's upstreamable as-is.
>>
>>> Best regards,
>>> Zixun LI
>>>
>>> [1] https://github.com/torvalds/linux/blob/19583ca584d6f574384e17fe7613dfaeadcdc4a6/drivers/mtd/nand/atmel_nand.c#L1058
>>> [2] https://github.com/torvalds/linux/blob/ffc253263a1375a65fa6c9f62a893e9767fbebfa/drivers/mtd/nand/raw/atmel/pmecc.c#L772
>>>
>> Hopefully that can help !
>> Best regards,
>> Ada
>>
> Hi Ada,
> Thank you for looking into this. Internally I've written the same patch as
> yours and it works fine.

Glad to know that you already have a working solution and that I wasn't too far off !
I got interested and wanted to dig into it, I hope it didn't come off wrong.

> What's more interesting is the issue happens depending on chip individual
> difference or aging. Among 3 chips tested, two with date code of 1933 and
> one with 2223. The 1st one has many ECC errors as in the mail, 2nd one
> has less errors, while the 3rd one passed the nandtest without error.
> Maybe that's why this issue is overlooked.

Really interesting behaviour, that could indeed explain how it might 
have been missed during the original refactor as it seems it was tested 
with similar SoCs.

> Best regards,
> Zixun LI
Best regards,
Ada

