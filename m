Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C51CCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 10:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVAJyNJ/atriVmfO2odOrzCoxOhZwl6Ix4PMrqVToYk=; b=meEou18f/ZHFlASKC0AoJOvGbU
	grewy60fOwuLbl9twhGapxN53Kn1992dS30fN2S458iJ4ndTZ4dMtGg3nGJyDpqHXApZBEwZK3dsG
	g4CGjmpKL7ettdrhdfV6MEYILXcDjZPFXnOba2iCyKoVToacgbT59Q6fKPlNBXRJNm82Ay+zl+5ew
	dJKHGUji070AdnZSn/NDu7qy8rjcJHJNUdOMWpAE+CvwTnUk3tgYbwHVc6cFW0NICA7ZjD1ueSn5o
	jMn0zn5rHw4MUAWyTWj/5wAHm+iTtXzdONLeZ3cDpUVt+TyjSlQSUJH8yZz+YuS2Jf8JapDMx0JLB
	WeTKpO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7AGX-00000008Fkw-0JoB;
	Fri, 10 Oct 2025 10:22:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7AGT-00000008FkW-46eq;
	Fri, 10 Oct 2025 10:22:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87F4CC08CC7;
	Fri, 10 Oct 2025 10:21:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 28C3B60667;
	Fri, 10 Oct 2025 10:22:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 581C7102F220E;
	Fri, 10 Oct 2025 12:22:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760091737; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LVAJyNJ/atriVmfO2odOrzCoxOhZwl6Ix4PMrqVToYk=;
	b=ksoo2ILUKZ/ObF21JtYOUO92T+BCdn2ME3maRCv+7sMurv6VEfraalOYLbpMQ0EjylyjBy
	WSTKA30jtDXWGYPIHWrBKYrwe3m2XDMq7maal7YBMI7cz9ycXn+pxMlr1VGgRR0nRjsly7
	hXK69PIxeuPJ5mH29t35/QtLoAmMV59TS8V4pJzoJuZZdJrGk7Jz/dFwIcKYDD9gTG+alr
	K2GnEemfK10+4rzRvNMtk9M68xllsp32Vh4XDqhEcyXBCSLGq0GZuWFrWO050Th0dh5yy4
	ajEW4kvqmx7w7KzVSpcPZ6XJ+yZjmVuxZovTWslvdn0E2RMkY9G0HBHXrk3VGQ==
Message-ID: <00f6ec33-bd86-4f57-8011-1c067e9321b4@bootlin.com>
Date: Fri, 10 Oct 2025 12:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] arm64: dts: allwinner: h616: add NAND controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-4-richard.genoud@bootlin.com>
 <82bcd40f-7e94-43ca-99c9-234458011b9b@kernel.org>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <82bcd40f-7e94-43ca-99c9-234458011b9b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_032222_208937_480A3259 
X-CRM114-Status: GOOD (  12.87  )
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

Le 10/10/2025 à 10:47, Krzysztof Kozlowski a écrit :
> On 10/10/2025 10:40, Richard Genoud wrote:
>> The H616 has a NAND controller quite similar to the A10/A23 ones, but
>> with some register differences, more clocks (for ECC and MBUS), more ECC
>> strengths, so this requires a new compatible string.
>>
>> This patch adds the NAND controller node and pins in the device tree.
> 
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94
You're right, I'll reformulate that.


> 
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
> 
> Confusing order of patches. Driver code cannot depend on DTS.
> 
> See submitting patches in DT. It is VERY explicit about it. Please also
> read maintainer soc profile.
Indeed, it's quite explicit in
Documentation/devicetree/bindings/submitting-patches.rst
Sorry for that.

But I don't know what you are referring to as "maintainer soc profile"
I guess soc here doesn't stand for system on chip :)

Thanks!

> 
> Best regards,
> Krzysztof


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

