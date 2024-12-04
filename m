Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB6AE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBoNT22bjOCCH26k5KlABL0rZ5aFoWyBOOtQ5GiVdgE=; b=ybNkl5KNIcvOm9bp1LJmOjQRT7
	n5hENTIiyK5S+TzZHCtaU4N+74C3Z8FLlF/DKq3e49wKqBsZ72HURG0l0BV9BdcdsIO2RjiFFK297
	KMWJMlTxtsgZKYhZsAkuVUpzx0GqX4YSW2UCiHMaFdynrnk4LkdvJJaUrK/VdT743L3xIYiRtwkWN
	Bon39Wm/9Nn+9KLjdmSlA7HkzkDqFtvYY0Te7NkmMumX3fHVOWbioWKtINKP+euSGUYMuoTxkQEFq
	PnzS2FlCTwTb39bZtroKx57CLooVG4rdprSqhJ72YwHt/F0/h4pOfoNKMZckaYfmDXwTnHyTVO+ml
	Q7YFfUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlON-0000000BzUG-0vEO;
	Wed, 04 Dec 2024 09:09:55 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlNM-0000000BzHV-1m6C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:08:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86EF320002;
	Wed,  4 Dec 2024 09:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733303327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aBoNT22bjOCCH26k5KlABL0rZ5aFoWyBOOtQ5GiVdgE=;
	b=fZ6TNfcgsKAfXWizpuvYO/VCeUpqVxLoLZU0h80AsSTwqITeBbhUdPjLlXQoRTMhTD83WZ
	BMDO62sEiMIn92tgFQAaZOkJxlNlDDpGzkk6+e+BPQ7J6eWpGcmwWASDrdwBNmoZV0+0nu
	SA3mA9Y1v0+JhDqxImGDJbJeSLQ5no9AOHm88gX9w7kWEAuF3Wg5oX/Y8Rs+tiY8n2LKiZ
	NvDWh4ejpPUPPGSulUjafKPYkRXWNvDtX4JyheQYSYRuvkgiIE0Xh3Is60T+sPjTRV8P/o
	46IVd9CX6nsK+ETjvRUGXahr6FZf6Pmti9v3gWkaaN1FH/UMEgnTV96oaKUdxQ==
Message-ID: <6e47e420-84c4-4539-ba54-5e1e939a37a5@bootlin.com>
Date: Wed, 4 Dec 2024 10:08:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j784s4: use ti,j7200-padconf
 compatible
To: Francesco Dolcini <francesco@dolcini.it>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, u-kumar1@ti.com
Cc: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 gregory.clement@bootlin.com, thomas.petazzoni@bootlin.com,
 richard.genoud@bootlin.com
References: <20241113-j784s4-s2r-pinctrl-v1-1-19aeb62739bc@bootlin.com>
 <20241119190106.GA70080@francesco-nb>
Content-Language: en-US
In-Reply-To: <20241119190106.GA70080@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_010852_760564_3A5C9156 
X-CRM114-Status: GOOD (  11.29  )
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

On 11/19/24 20:01, Francesco Dolcini wrote:
> Hello Thomas and TI folks,
> 
> On Wed, Nov 13, 2024 at 11:43:05AM +0100, Thomas Richard wrote:
>> Like on j7200, pinctrl contexts shall be saved and restored during
>> suspend-to-ram.
>>
>> So use ti,j7200-padconf compatible.
>>
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>> ---
>> Use ti,j7200-padconf compatible to save and restore pinctrl contexts during
>> suspend-to-ram.
>> ---
>>  arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi       |  6 +++---
>>  arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi | 12 ++++++------
> 
> Do j784s4 supports any kind of low power mode and/or suspend to ram? My
> understanding was that this was not supported, but maybe there is some
> details that was lost when I was told this information.

Hello Francesco,

We are working on suspend-to-ram support for j7200 and j784s4.
During suspend-to-ram the SoC is fully powered-off (thanks to the PMIC
which powers off all the power rails except the DDR which is in
self-refresh), like on j7200.
Please let me know if you want more details.

Regards,

Thomas

