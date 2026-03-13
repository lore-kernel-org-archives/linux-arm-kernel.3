Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29944105F7A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOFoYAGJVyyk6xus0Z9WrQazmgihSHEPBTdXrGtZqcU=; b=gQTQly9zqTnT7hGc9W+BWpOISL
	7TqAO9dlYb1wc4CkUNo9wcWds9YZlhnhrZ3yKvvATSTi4/IOtnXPaXV0nHeAh7RIkTyyQWxWXk43l
	cd5H5ma3y/WqJS1azv9OHFaqPy8y+nX1XTJDrZwM0/QaG3G4RuYOc1pTpgUuITqsWrh0whJUkJuED
	xu5unEB3Nh03MrNBS09/4USqReX819Guzx8yizs3xgU1eZk4i3ClcHk5LkV9lO0u0nyCHVnZS7rrS
	cICr3a1YYZoeyKsoFq7LL2VAHsB0wEhyjm0t1XzFvtjnkvRn5MQ6A9/z/CPeCrtCmvAx6xuLIOm0v
	ZfounKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12OH-00000000Ci2-1V8d;
	Fri, 13 Mar 2026 13:17:21 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12OE-00000000Cfw-1AGB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:17:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4C69EC4270C;
	Fri, 13 Mar 2026 13:17:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFCFA60027;
	Fri, 13 Mar 2026 13:17:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8601B10369EFA;
	Fri, 13 Mar 2026 14:17:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773407832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JOFoYAGJVyyk6xus0Z9WrQazmgihSHEPBTdXrGtZqcU=;
	b=VvoaKN1dElbt5A/ybhYmCk6wEI1Ngpxe3iW3oiNxdyeYLq1bqdTWhYNUJrTky/N5PLukYP
	+SX8Pxiy0Amwukf7dJZ0u1o3+9D+hjQri/gJIOkGvLzoeunqOR83EhbIwSNY4T1MfA2fpq
	OjmOjaa8OKvYpQP173AzLyfCYegCnyzfkYNCfLRi8p/Q2rq79ZosUn3F4oKIUPvVZCWtoR
	rW6a1Fdzan6FZ6YcGjglY+5bxobYNRmAVtVpYqAFHIWdMLbrf09qfKh6Z/59CMG/T6UzDS
	AHhAfsXlSebetCMmVajdULN7rrm8taDoo3nq/adst4SvEmeygDrg3B+PiH1DiQ==
Message-ID: <8d33c193-995c-4225-9998-8c81a2268065@bootlin.com>
Date: Fri, 13 Mar 2026 14:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] mtd: rawnand: sunxi: introduce variable user data
 length
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Wentao Liang <vulab@iscas.ac.cn>,
 Maxime Ripard <mripard@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
 <20260305100137.2558423-7-richard.genoud@bootlin.com>
 <87a4wdkt3y.fsf@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <87a4wdkt3y.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_061718_451349_B477404E 
X-CRM114-Status: GOOD (  17.89  )
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

Le 12/03/2026 à 15:41, Miquel Raynal a écrit :
> Hello Richard,
> 
> On 05/03/2026 at 11:01:37 +01, Richard Genoud <richard.genoud@bootlin.com> wrote:
> 
>> In Allwinner SoCs, user data can be added in OOB before each ECC data.
>> For older SoCs like A10, the user data size was the size of a register
>> (4 bytes) and was mandatory before each ECC step.
>> So, the A10 OOB Layout is:
>> [4Bytes USER_DATA_STEP0] [ECC_STEP0 bytes]
>> [4bytes USER_DATA_STEP1] [ECC_STEP1 bytes]
>> ...
>> NB: the BBM is stored at the beginning of the USER_DATA_STEP0.
>>
>> Now, for H6/H616 NAND flash controller, this user data can have a
>> different size for each step.
>> And the vendor has chosen a different layout from the one on A10, using
>> 8 bytes for step 0 and nothing for further steps:
>> [8bytes USER_DATA_STEP0] [ECC_STEP0 bytes] [ECC_STEP1 bytes]...
>> (Still with BBM stored at the beginning of the USER_DATA_STEP0)
> 
> I would rather be in favour of not following $(random vendor) firmware
> layout. Upstream, it makes probably more sense to just allow access to
> the maximum number of bytes that can be covered by the ECC engine, so I
> would rather be in favour of computing the maximum size that you can set
> for each step, without going over the OOB size.
Ok, I'll write an implementation for that.

Thanks !

> 
> Once this set up, I believe adapting the driver locally (out of tree) to
> match a specific vendor layout would be rather straightforward, as all
> the configuration pieces would already be in place.
> 
> Thanks,
> Miquèl




