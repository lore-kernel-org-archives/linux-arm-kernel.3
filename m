Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FF1C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 19:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJYT6ZXuMuODnWTrjnxZjizwjH0vp02GLwvaZErh7mQ=; b=SYg7lZGDHUOZrOAriKyFfe1i21
	ODh74YGT9CNQJYqkL0zg2DDmsiHT7EZQDpwbLJ2RR/xRfiVP/DcO0gAEjI0Fal5WLKcCuAWLNGVlF
	cki9MBdChf6Ig8pltsy05B7iwYjknSw1jWf0o4sPpLOCbgK600gxNw1zLZwvLuiVBuHzxxWYAtZtC
	kCX2tFPdlPIthyNTErtqr8WDEPcg4GXs08z794NBw1rYQmnIqsP5ZHkVu52SDVaLfLujSYxi19KII
	9ws2ml1PD4tr+56GaNkOPYmNbdG+y+DwpjwXok81z9Tz2rzJ2o1Iivlf11amu34jnl3mOZI/KZ/1Y
	d/ZMgacQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC17V-00000008MjV-22HJ;
	Mon, 05 May 2025 19:04:53 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC157-00000008MR1-3kmh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 19:02:27 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 28873A05E5;
	Mon,  5 May 2025 21:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=AJYT6ZXuMuODnWTrjnxZ
	jizwjH0vp02GLwvaZErh7mQ=; b=snbSOG35oaQvBdSf6VaV1gV/6zvxxxNyHKQW
	tYw6RhTVHkK16mjkL/r7Db6oPOAhB7rbSd69JFIMNKZM5W6W3zY82sSfQxjdrfbP
	zGnsYbHor5ZonPp9VxpNY8P7sHV2Unt7H7YIaur10jdUVGlDRsmJx2jYDFlOxSLM
	x1NSP5TJ1GEDjnYv19WaXXTSnudSOXqCdOKid5FSj0AGkWhCpM3QHzr3VdMEIEpG
	KBRUMScbM8WdW2axJN2IETyUho7EtH0JMNZLLkpS6YRQ5uAsm2ZzipNod33gcBSu
	iSeMgV8kkwtOcgUR7hWmdVCunD51Tzl3Sk+wZiuvE7OhAIaXm/5Vq3G6hhHpvtNH
	4HxxxorIKW4Hr4GsBwsqvT8tIeoDJfCgZM9kO0lVxtNhZAhYZdv0rxY09AYyj9v2
	kXlhf1nPW4suPKjnzAj3eCVBW5ntxb2zK/u96KHxpbJJDPdhBrhkHlxG/JJWeY9u
	NU+HeQWU1mQvYMqoWyBi0Qb2BTZny5q+Da6nQ8S9E4bL82q8jsfTQXfadCafQixV
	VfRPSOQb4SlJDtjrI2Apqzh8aB2D+yxkfFe6VKcbizZJUIgEOApW3G/duWIDKj9u
	cysUJL3KeJsMu2KudAxIKI7M+ioEfj9HKSfM5H4gldEm7xaybxzWPs3ovo9iIW94
	Rmov+kU=
Message-ID: <8dadb7ae-1a7d-48d4-8dbd-40f6d9f35a6d@prolan.hu>
Date: Mon, 5 May 2025 21:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] pm: runtime: Add new devm functions
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Varshini
 Rajendran" <varshini.rajendran@microchip.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Len
 Brown" <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, "Alexander
 Dahl" <ada@thorsis.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Pavel Machek <pavel@kernel.org>
References: <20250327195928.680771-2-csokas.bence@prolan.hu>
 <20250327195928.680771-3-csokas.bence@prolan.hu>
 <CAJZ5v0jmuzvo-xzGBDhGVBbY7svbrqEdi-SeJrx5BG=qtN6ZiQ@mail.gmail.com>
 <b38b27d4-c3d3-450c-8634-2e07f393a76c@prolan.hu>
 <CAJZ5v0hRsXw45utNMEhLB=i56tsJDz8AvYfV2stPbtRHh09HUg@mail.gmail.com>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <CAJZ5v0hRsXw45utNMEhLB=i56tsJDz8AvYfV2stPbtRHh09HUg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.253.4]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853667166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_120226_170462_8F1F3ACD 
X-CRM114-Status: UNSURE (   7.03  )
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

Hi Rafael,

On 2025. 04. 29. 13:08, Rafael J. Wysocki wrote:
>> Did this end up being applied?
> 
> Just applied as 6.16 material, I'll let you know when the tag to pull
> from is ready.
> 
> Thanks!
> 

Thank you! In the meantime, I submitted the DMA cleanup part as well, 
for now rebased onto pm-next, but there seems to be no diff between it 
and dma-next in the relevant files (drivers/dma/dmaengine.c and 
drivers/spi/atmel-quadspi.c).

Bence


