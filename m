Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802EFC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtQ1RX1XHakV4BJm9VJ9jncw9PkEX8uZ1NRRr/+hnO8=; b=yMWLVjfK3YUolq5SO+QzMesSf4
	LfPjeXLdTfCxLWDTtLVs4M2dR1OksQQWWvotSwTYa1pfBzaNRs7HTXoZ9AKSCrJEdC3mcJcy7vIvz
	x7XyZVD3BQMmLxfxmzzCOlDmqdSSvth7KrgfE43/OzmLAmGQSmhMxTSdosnPU8NrdlkL+Sa6iYFLv
	73hBeA9fUyMjIWqCQowa6FcNwkVbiVveAjO9FRNzPSl5X3M54bHst4NelqhcVJ7k/aQXKuE8Ux3i/
	We9F+OFUoZLW1mS6OXTJLSwz4dpuz2GQorGmJYka7lzOdwI7l2Qn19s+JRZM00dF32t21F6MP8MNZ
	IPUd2X/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2A2l-00000004PDd-1AvM;
	Tue, 08 Apr 2025 14:35:15 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2A0l-00000004OpX-3Q0b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:33:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 450C643210;
	Tue,  8 Apr 2025 14:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744122787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MtQ1RX1XHakV4BJm9VJ9jncw9PkEX8uZ1NRRr/+hnO8=;
	b=OT4Vg+INpqb39sAAx0HMNcZIzeUBSZpIkjtBucWdRUBC/8E8xAWI1SJLJFoXyis7sfjYmT
	0BNyxiMnxH2m+VzKn0beEhCiW/KIGXd2joOcNr/9oNSvr2+Yufl3eNQJOXZ1jkZHIXY1UL
	jsra+WWxYMkd3PUFdKMK+Dx4FOD+jJGCK26tVyeKZeZY8XAyiMmBwkPp9gqoXZB++868ea
	LnX5jdRx1+zbtebupBszf9bIHq2kKbQL7SjGxtp5Zwuka0hYHu7mNjow446tLoYzQC3Jsl
	SkVxwIiK+cLdpdxu2mjfxutuZzaXm2bXU+mT83XgoD4gH2bFaOslt124KxyKsw==
Date: Tue, 8 Apr 2025 16:33:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/4] ARM: dts: at91: calao_usb: clean up and remove
 usb_a9g20_common.dtsi
Message-ID: <20250408143306fd090d99@mail.local>
References: <20250402204856.5197-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402204856.5197-1-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeffeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhts
 hdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_073311_981338_8013B2F4 
X-CRM114-Status: GOOD (  11.31  )
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

On 02/04/2025 22:48:50+0200, Wolfram Sang wrote:
> My USB-A9G20 definitely has no external RTC, unlike the LPW version.
> While fixing that, I noticed that this renders the whole a9g20 include
> obsolete. Here is a complete series doing that.
> 
> 
> Wolfram Sang (4):
>   ARM: dts: at91: calao_usb: simplify memory node
>   ARM: dts: at91: usb_a9260: use 'stdout-path'
>   ARM: dts: at91: calao_usb: simplify chosen node
>   ARM: dts: at91: usb_a9g20: move wrong RTC node
> 

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

>  arch/arm/boot/dts/microchip/usb_a9260.dts     |  8 ------
>  .../boot/dts/microchip/usb_a9260_common.dtsi  |  9 +++++++
>  arch/arm/boot/dts/microchip/usb_a9g20.dts     |  3 ++-
>  .../boot/dts/microchip/usb_a9g20_common.dtsi  | 27 -------------------
>  arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts | 10 ++++++-
>  5 files changed, 20 insertions(+), 37 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi
> 
> -- 
> 2.47.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

