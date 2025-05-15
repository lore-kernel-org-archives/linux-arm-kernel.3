Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D7FC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubCfZqnUCO4PP/bK7tVaPooeXZwMddulOK5iV2CA9+w=; b=xlh8C0oQ7UxST8P8AM4K4Q4CJg
	r1pjwsI5/hKzWkJers3TOMITfhWSjz/FUH4bKDpFNY7ZdsFVJPYfdGVfsvLX7ygkG+Y9JemF8RRJ6
	tyc7iHOzdpT4rzrIi/A8llw3nQDb6KjzcG9ZyykTqOnf+kS0lQqaAyezAdkDRUMwqBOXWI0XWaeHZ
	m1sBdwE4fx+4+2chh5M89Ez4+IS1MSvI0HXGoMxO17r77pHNP0QDOAFxUcDU+LZHIGcbkfwdiV8w+
	5kmIxIAFM7XxQtsWqfyaLbvWf2jACbFAvObodywR3wpzVss5DaTXr4LSS/xdWcIZvFbYTW0edrgnk
	dFS+osSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUzT-00000000Ang-3eiD;
	Thu, 15 May 2025 09:35:00 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUrk-000000009YI-0lMM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:27:01 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 780BCA0149;
	Thu, 15 May 2025 11:26:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=ubCfZqnUCO4PP/bK7tVa
	PooeXZwMddulOK5iV2CA9+w=; b=pLkczEHjHfzoDsoFPgNwkuAKJL+9PunTHLhx
	tgUiuREirMWir6ZXaPHUPerKZST1XdJLonM2kdiuvzyaREXhUSl+whgNGA7C6crB
	S6F5iFaPVvnU+2TEfYpgbXYmh38WdDpKb7JxweaJusQ35Mi2dIwU7ibb3uI0J+KR
	k4mfqfl4q18OzECYimwK9zWgRTWQYruap8fcRYnhyO7aUKtiCPIUrD+oRyenU8+K
	n/CcICixGzzaz9Gdfejusx/JrcjyIEYvd1HVCoHUpvrRSDa5mJsadMWogpO3Zlbk
	2f8ZrDGnz8riHlG86Prpd/Um0+xe+eS+i2R1xYNsUAwHuEoWSi9Y2LlJfJ5I6nZ3
	a7b0helHriLNUldNahETbvZCgCfLNJJMSsHaLRleW8n2yK7WrUHD3LEXsMkKDA/N
	bmGq/Pr1XRDQSUI/sVlex1QhfLsbMLqJ3RFNjq28WbELXB7isS9RgLVgxrY83Ks+
	vEK4cUYgOKK59B4jNHN5dzzOrePbCjGp+APfAl6TVBk4SEj+qYJWuAqtSG0Vo6vI
	Gs9XmmzC2sae83NjO8VwEsjfimmavGYdZkmChEfwYSCGVxaQEyRNO1ZFXFW2qlo0
	hNbvndPXTXVflP4bsDVXcaLuz5pnWkIYLPSuR9NFgBx3cU/sPOJQv6wtOL7UROuK
	U6YQat8=
Message-ID: <9d384301-3f73-4120-a82b-580eb5f1a4ed@prolan.hu>
Date: Thu, 15 May 2025 11:26:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] Add `devm_dma_request_chan()` to simplify probe
 path in atmel-quadspi.c
To: Mark Brown <broonie@kernel.org>
CC: <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Vinod
 Koul" <vkoul@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>
References: <20250515083132.255410-1-csokas.bence@prolan.hu>
 <aCWpjplhAXUvr9fj@finisterre.sirena.org.uk>
 <e4e6c7a9-9b7a-4012-8bda-75804229ec95@prolan.hu>
 <aCWyXsJ2iRXRUmOi@finisterre.sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <aCWyXsJ2iRXRUmOi@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D617062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_022700_373603_925F5E76 
X-CRM114-Status: GOOD (  15.03  )
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

On 2025. 05. 15. 11:22, Mark Brown wrote:
> On Thu, May 15, 2025 at 11:14:22AM +0200, Csókás Bence wrote:
>> On 2025. 05. 15. 10:45, Mark Brown wrote:
> 
>>> I can't tell what the plan is here, or what the status is for the first
>>> patch (since I'm not CCed).  The second patch depends on a new API
>>> introduced in the first patch so it can't be merged independently.
> 
>> Yes, the situation is a bit convoluted. Obviously 2/2 will be applied after
>> 1/2, in a similar vein than the former PM series.
> 
>> So what I was trying to say: Vinod should be able to apply 1/2 to his branch
>> (dma/next) right now, which can then be merged to spi/for-next. This merged
>> branch should be able to then cleanly apply 2/2.
> 
> I wouldn't expect to pull the whole DMA tree in, that'll have a huge
> amount of extra stuff in it - if I was going to pull something I'd
> expect a topic branch. 

Fair point.

> Wouldn't it be simpler for me to just apply both
> patches at this point if there's no conflicts with the DMA tree?  We're
> at -rc6 now...

That also works for me. I should send 1/2 to you as well, correct?

Bence


