Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7D8C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 19:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rmc92MtYMUK0rVBUseFXn4AXEHCvrKCMvR/VM/m9C9M=; b=X4DRKniuaJPTdjlR+FsjeGnm+F
	GEr/MiwyWJINkqT3cSTA87+xFKY2mSlom1l3AVGc60VvE7eiwcHqkjw0FgZRKwrT64kEPdBs86kS+
	pfH2tG1Tpsfoa0s1gPOMz7aPU1/cDV8xDCCSwnYZaoJnMtdwaLBxmuZ2ZsgqLqu9sqZB7lQw+qE7M
	7FW8Oij63MOzIGZvgnGsC56U6CKNWjJREMesgYH4srBDVMv40vzG08Snl8WDMww4w++xc8nJFhBcq
	cRfjOstUc/AwouLud0W9YA7SnSNWt1xupJ/JJjACNQJTa31dmz9ggK7trRXQL4wHzueLGPdlVMqy1
	MqzUblLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGJP-0000000AIjd-2WmM;
	Tue, 21 Jul 2026 19:39:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGJO-0000000AIjW-3uks
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 19:39:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 968C843F78;
	Tue, 21 Jul 2026 19:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13171F000E9;
	Tue, 21 Jul 2026 19:39:25 +0000 (UTC)
Message-ID: <30c072b3-120e-46c4-b959-dd72107a87ee@tuxon.dev>
Date: Tue, 21 Jul 2026 22:39:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] ARM: dts: microchip: sama7d65: add thermal zones
 node
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, marcelo.schmitt@analog.com,
 jorge.marques@analog.com, mazziesaccount@gmail.com,
 Jonathan.Santos@analog.com, jishnu.prakash@oss.qualcomm.com,
 antoniu.miclaus@analog.com, duje@dujemihanovic.xyz,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
 <20260630093603.38663-14-varshini.rajendran@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260630093603.38663-14-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 6/30/26 12:36, Varshini Rajendran wrote:
> Add thermal zones node with its associated trips and cooling-maps.
> It uses CPUFreq as cooling device for temperatures in the interval
> [90, 100) degrees Celsius and describe the temperature of 100 degrees
> Celsius as critical temperature. System will shut down when reaching
> critical temperature.
> 
> Signed-off-by: Varshini Rajendran<varshini.rajendran@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

