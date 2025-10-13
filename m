Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5262CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 11:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSqZsCaeyifb+phyADiRq9RCwi01zTsrsstZYJCLh5I=; b=Qgzi60kuf390duMx2qZ6tJ7XKP
	wNd98WWST1Abbe+SH5KSBd/1JPTDCq5ihPO+h4JH7VoQc09nAUK+Tn8ArQlrXLl9ejnMdkXreCpES
	Tf4DNG7CyTdCkkWSaIAVAd7QfZcN5tSpHu04oXpCUVehKWu7N1WSun3VAc7BVqXcKzPHBEe0uzUyr
	7gwhqSldaIc/0NfrNWTT1VYmOqxINIM6M7Ewax5Qwiy3YAiNNmwkfT6XlJaU+Gs1jKH4WSTMmhIeL
	svdZGjGaJ1js0tkQVewi1WbgDzXYfNMPH/Ftc60YNIkMA1gnVoBD5b95hdqQeMYyCSN8vHZeH+vgR
	0df3F2LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HAe-0000000D3R7-1hVq;
	Mon, 13 Oct 2025 11:56:56 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HAb-0000000D3QD-2D5D;
	Mon, 13 Oct 2025 11:56:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 843E4C093AA;
	Mon, 13 Oct 2025 11:56:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 640BC606C6;
	Mon, 13 Oct 2025 11:56:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1241A102F225F;
	Mon, 13 Oct 2025 13:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760356607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=kSqZsCaeyifb+phyADiRq9RCwi01zTsrsstZYJCLh5I=;
	b=FGIlVqU1ARC0txcIqhMgTCjEbnmOVsxYuNtwj3DQgf8sZXgaaZOsT+IH5cYN8NFKOjFq0W
	8tFHXq6dBMsgZuEjA5cKfs8KAtznSjE6zYK2fVYypXpbZY72lOeTXsU9MyXsH4J11LceJs
	qryByDgxrbQ5xXcCBMtpxA5iy3zlB8ubkI5SRUh+Zy8FeDMcpoWK7cDOH81KUy+TC/28vI
	ujo/wDRKpM6yH2Bnljp9vqrHB8lLAEVQpN0G4FLS2WBFnzl3s0qbZyrokDatVIEAKWRJeC
	r7mB0cIXaQF03TFJh+8YEw4lxrZVMZQ82D7MgU9nAr3WF6ML27205iTmBE7pkQ==
Message-ID: <1753a54d-907c-4861-b83b-89a6b77b589e@bootlin.com>
Date: Mon, 13 Oct 2025 13:56:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] dt-bindings: mtd: sunxi: Add new compatible
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <02864e41-cbf7-42e1-87ba-95bdac6d9e6d@kernel.org>
 <195f3b01-93d9-41da-aa9e-826e82889d83@bootlin.com>
 <12756400.O9o76ZdvQC@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <12756400.O9o76ZdvQC@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_045653_748371_8F289EC3 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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

Le 11/10/2025 à 12:27, Jernej Škrabec a écrit :
> Hi,
> 
> Dne petek, 10. oktober 2025 ob 12:18:56 Srednjeevropski poletni čas je Richard GENOUD napisal(a):
>> Le 10/10/2025 à 10:49, Krzysztof Kozlowski a écrit :
>>> On 10/10/2025 10:40, Richard Genoud wrote:
>>>> +
>>>>    properties:
>>>>      compatible:
>>>>        enum:
>>>>          - allwinner,sun4i-a10-nand
>>>>          - allwinner,sun8i-a23-nand-controller
>>>> +      - allwinner,sun50i-h616-nand-controller
>>>
>>>
>>> Also:
>>> 1. missing new line - why did you remove it?
>>> 2. Keep existing sunxi preferred order of entries. In other platforms it
>>> is alphanumerical, not natural. In case sunxi uses something else, just
>>> be sure you use sunxi order.
> 
> Sunxi order is from oldest generation to newest and then alphabetically
> by soc name.
> 
> This is already correctly ordered.
Ok.

Thanks!

> 
> Best regards,
> Jernej
> 
>> ok, make sens
>>
>> Thanks!
>>
>>>
>>> Best regards,
>>> Krzysztof
>>

