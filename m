Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B13C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8Rd0rXzJrWo+QQ/sP9szuyhGRqKs6teZDAOB54kmt8=; b=i916JAjQSQWGycQD8w1DepZaGL
	raktjG8MuG5bdHasKqT31LKen8y48T9HhlFePPUjHuRNSoR2o1eN+XUmkX+6gRA7k7QAtoJWmPVsV
	UNpZ8xON3G9QRP5XawXtmxa5xlUPEHAZn5s4vTmv5uSj8eZAmNYqF/BHG18ewEr1M8OKKQ4Wc0VWd
	WFtNcX9mSSJhxSb9yUU1vSpuzEhUiPMAEsewKvCJt4oAvm8h+rmslg9v1DPhuqDecTrB8hwAXTLty
	w9nHg3HyPaasKmmBHzaFJS5l2OzBTikndCLgW8CZexVi2oGdkP0YUExSAlqqpWzg6CYzt3zMXu4Gi
	flSJgO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2A6Q-00000004QJc-2CVE;
	Tue, 08 Apr 2025 14:39:02 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2A3i-00000004PXL-1pzP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:36:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07F4B4433A;
	Tue,  8 Apr 2025 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744122971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B8Rd0rXzJrWo+QQ/sP9szuyhGRqKs6teZDAOB54kmt8=;
	b=RRuVrWveS1JZDhDd5nekL61o56jA4cJhu7ROTceFMvflaRMM6/y5jCDlDrp9ynQ2WCQluq
	qBIqNMr/m75LYKdMIxatGao8budDjeBgQ04GIC7rhXhhXr/Y9yZgcO55BzSqJksS/3q3Tv
	wcWRgpdrw2Cx1S4QKoVRXstQJSmcL2m+IFpeQuYGzOffcXrQe5gq3Z1nV/csAc31guQrgi
	wIhAPWWc184CL/EHL03LtbyDDQnBrkebJLbCyCcVuSFYdZ3UUTZKRCTslXVi/6xxK8LVLP
	z1p2DPwQc2qKpSPBOqILjIkUV1TTbZMBf04dAqL1Dm7jc9apqDSubnnwdIrASA==
Date: Tue, 8 Apr 2025 16:36:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Boris Brezillon <bbrezillon@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: at91: at91sam9263: fix NAND chip selects
Message-ID: <20250408143610b360aba2@mail.local>
References: <20250402210446.5972-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402210446.5972-2-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeffeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhts
 hdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghvpdhrtghpthhtohepsggsrhgviihilhhlohhnsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_073614_728872_AA2E2C0E 
X-CRM114-Status: GOOD (  16.81  )
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

On 02/04/2025 23:04:46+0200, Wolfram Sang wrote:
> NAND did not work on my USB-A9263. I discovered that the offending
> commit converted the PIO bank for chip selects wrongly, so all A9263
> boards need to be fixed.
> 
> Fixes: 1004a2977bdc ("ARM: dts: at91: Switch to the new NAND bindings")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/arm/boot/dts/microchip/at91sam9263ek.dts | 2 +-
>  arch/arm/boot/dts/microchip/tny_a9263.dts     | 2 +-
>  arch/arm/boot/dts/microchip/usb_a9263.dts     | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91sam9263ek.dts b/arch/arm/boot/dts/microchip/at91sam9263ek.dts
> index 471ea25296aa..93c5268a0845 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9263ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91sam9263ek.dts
> @@ -152,7 +152,7 @@ nand_controller: nand-controller {
>  				nand@3 {
>  					reg = <0x3 0x0 0x800000>;
>  					rb-gpios = <&pioA 22 GPIO_ACTIVE_HIGH>;
> -					cs-gpios = <&pioA 15 GPIO_ACTIVE_HIGH>;
> +					cs-gpios = <&pioD 15 GPIO_ACTIVE_HIGH>;
>  					nand-bus-width = <8>;
>  					nand-ecc-mode = "soft";
>  					nand-on-flash-bbt;
> diff --git a/arch/arm/boot/dts/microchip/tny_a9263.dts b/arch/arm/boot/dts/microchip/tny_a9263.dts
> index 3dd48b3e06da..fd8244b56e05 100644
> --- a/arch/arm/boot/dts/microchip/tny_a9263.dts
> +++ b/arch/arm/boot/dts/microchip/tny_a9263.dts
> @@ -64,7 +64,7 @@ nand_controller: nand-controller {
>  				nand@3 {
>  					reg = <0x3 0x0 0x800000>;
>  					rb-gpios = <&pioA 22 GPIO_ACTIVE_HIGH>;
> -					cs-gpios = <&pioA 15 GPIO_ACTIVE_HIGH>;
> +					cs-gpios = <&pioD 15 GPIO_ACTIVE_HIGH>;
>  					nand-bus-width = <8>;
>  					nand-ecc-mode = "soft";
>  					nand-on-flash-bbt;
> diff --git a/arch/arm/boot/dts/microchip/usb_a9263.dts b/arch/arm/boot/dts/microchip/usb_a9263.dts
> index 60d7936dc562..ebaf198e1bc4 100644
> --- a/arch/arm/boot/dts/microchip/usb_a9263.dts
> +++ b/arch/arm/boot/dts/microchip/usb_a9263.dts
> @@ -84,7 +84,7 @@ nand_controller: nand-controller {
>  				nand@3 {
>  					reg = <0x3 0x0 0x800000>;
>  					rb-gpios = <&pioA 22 GPIO_ACTIVE_HIGH>;
> -					cs-gpios = <&pioA 15 GPIO_ACTIVE_HIGH>;
> +					cs-gpios = <&pioD 15 GPIO_ACTIVE_HIGH>;
>  					nand-bus-width = <8>;
>  					nand-ecc-mode = "soft";
>  					nand-on-flash-bbt;
> -- 
> 2.47.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

