Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83DAC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 19:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWKYabBDijMqFzTatz360fmCmnZJ/55dJPIMdot580Y=; b=a6BLEjQ3f/7+V8O5KLyY0yN1rv
	LTD5CzKNv95Er6n8mt+2kz0SrWEeGfGb9tbMQ4bb6QYWBiYrszAzRlPXo+40iHy4Sijoy3wy4MPq4
	WIbnKFTMaucVL5Wp6qcI/fh6mZ5kWaEHPL1g05lkSzrrVG3ysBDHlrFCa+VBgGgQfmrSTd1C7RTBu
	doKA0SozyLOLKz6FYGBlF4/vWkD00TQUBPuqT+0pCSdrW7to8ats7GvE8lCxSsSTPQZ5pAcd6FYai
	X8kctPcvRkBe9MSpmJPfABpjskF11TTUNsnH790V/7zm7K2GrN0yJu3LgQaqGd5g3BBwvnZTHpZmP
	OF8odS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGJz-0000000AIqA-383d;
	Tue, 21 Jul 2026 19:40:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGJy-0000000AIpZ-2tFm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 19:40:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54732404E1;
	Tue, 21 Jul 2026 19:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506241F00A3A;
	Tue, 21 Jul 2026 19:40:01 +0000 (UTC)
Message-ID: <076d0c6d-f995-4423-b5a4-5ecd3b684b50@tuxon.dev>
Date: Tue, 21 Jul 2026 22:39:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] ARM: dts: microchip: sama7d65: add cells for
 temperature calibration
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
 <20260630093603.38663-12-varshini.rajendran@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260630093603.38663-12-varshini.rajendran@microchip.com>
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
> Add NVMEM cell to ADC for temperature calibration data.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

