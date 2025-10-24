Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC76CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ORYaQDkijF7os/6QWengA8q7tbB0Mw5sGUM65DCgW0=; b=OJBkgrctrpmCUkntAI7ueDROZK
	lm+BIep4YVLZEy9QfsSJH/dgufuWOwuWtM1mQzw/Apd093ffj5pQ6l4ktycUkaD1B/h+r4FaTj7+f
	Tzpj4mUNaURoQu+alYWZMvwAeLLpFluC8OCoS2Atf5S5pHys+JoHs84kx7Vkx2NYv8e3MzS85uNpZ
	HVHxXFvlTbYWZNVmbmY/hQw61ErUWJyfWADsbpMcJgkWT42grK8QgLtaOrwo2GHhCiLw8eumj6ijR
	PDtmFSTwUyyYCD/8AQv+V/FnQpC5BB0qsNcFuQahemIkTASS00KIbVycsV95g7AaSWYU0Wo8UkxW6
	CGEmYsdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCbQ-00000008Zwe-0yVJ;
	Fri, 24 Oct 2025 07:52:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCbM-00000008Zvr-1lR1;
	Fri, 24 Oct 2025 07:52:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A74191A1636;
	Fri, 24 Oct 2025 07:52:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B92960703;
	Fri, 24 Oct 2025 07:52:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73F97102F23EC;
	Fri, 24 Oct 2025 09:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761292360; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5ORYaQDkijF7os/6QWengA8q7tbB0Mw5sGUM65DCgW0=;
	b=r2dtT+baNbNBquHdAut5IY/5GURVJRkMnkhCpDIazOsLkNOBMSg9a8XjqlTTdgK7Rao36n
	QaiSjjcspFfgNJ3lWHkqT0lB6CPk/z4eErWvmXrcgc4PoQNWlb8klJf19n9bMVLLEpz35m
	tvzSZMtU4MnmhRi/3KdQUuAwki+jH10HEA7wLi/+zYTZ9ENq3vj0XiN9CH8zDtJVXy40sO
	VYZdadazMXQP96iNzcQJcjalhcNTATvJNR92ni8Hp1LMi+PrPNeZfIQguK1X78P7mLfFu5
	LZKY22AT2zCcLdLyTJKs3XrYIcQky6Dow93q3vw3X8RN8f/4NfLEQGTudUQJ6w==
Message-ID: <afd40022-012a-4fa5-90f1-a27f11aa9549@bootlin.com>
Date: Fri, 24 Oct 2025 09:52:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] mtd: rawnand: sunxi: introduce ecc_mode_mask in
 sunxi_nfc_caps
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
 <20251020101311.256819-8-richard.genoud@bootlin.com>
 <87jz0ntigx.fsf@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <87jz0ntigx.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_005244_588929_C400448F 
X-CRM114-Status: GOOD (  13.34  )
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

Hi,
Le 22/10/2025 à 11:05, Miquel Raynal a écrit :
> Hi Richard,
> 
> On 20/10/2025 at 12:13:03 +02, Richard Genoud <richard.genoud@bootlin.com> wrote:
> 
>> The H6/H616 ECC_MODE field is not at the same offset, and has not the
>> same size.
>> So move the mask into sunxi_nfc_caps.
>>
>> No functional change.
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   drivers/mtd/nand/raw/sunxi_nand.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
>> index 70c940840dda..4118307cac15 100644
>> --- a/drivers/mtd/nand/raw/sunxi_nand.c
>> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
>> @@ -29,8 +29,9 @@
>>   #include <linux/iopoll.h>
>>   #include <linux/reset.h>
>>   
>> -/* non compile-time field get */
>> +/* non compile-time field get/prep */
>>   #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
>> +#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) &
>> (_mask))
> 
> This could probably require a mention in the commit message, as for the
> introduction of the field_get() helper.
> 
> No need to resend just for this either.
Ok, will do.

> 
> Thanks,
> Miquèl
> 
Thanks!

-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

