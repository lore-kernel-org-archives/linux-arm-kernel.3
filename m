Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2B5D59D8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 21:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibpI/8IsPFwa4no7KFk+umJ2AO5xlqf2PVxIa7iLFU0=; b=mLyqT7eCWNeDgO0sSrq2ptFftQ
	SRr2SZRCxmukVTWRGtVHmdp7x6d+Q+B1LcGTes6iytJ9R9VqP15C/DpSxjrDyhHcYyF47v8dDEI9e
	+eaMAjrb2HBbjvG5P7MdrSoXbM28h4N5qxqplIx9BGFSmGPjSLQCbE5xZeROb1UcypowKXqY8W4Cu
	uJbEGowUkZtMyd4p0CIJ9IcCFdy3vLZz78m5WD7RbRtopxs8bwfY5WMLWrOS9QVh0OBUx+0ovlrVi
	ednYa7wpEgk1IeEqEVovioNvit0Bd0B+vYTPGPVQmUOjF8HtkyP+EWkgwWylzQ8bg9cOTWPC7kD/y
	Uzpma2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUAWv-000000016Wy-3drp;
	Fri, 12 Dec 2025 21:18:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUAWs-000000016WI-1pgf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 21:18:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DD0DD1A2145;
	Fri, 12 Dec 2025 21:18:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A5843606DF;
	Fri, 12 Dec 2025 21:18:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8B72103C8D89;
	Fri, 12 Dec 2025 22:18:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765574297; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ibpI/8IsPFwa4no7KFk+umJ2AO5xlqf2PVxIa7iLFU0=;
	b=HLM60RvQYesG36vE7JR/5+uLnWRQf4bdIdat8LNhhwn27mZDSoZ2SDj0eyP003231tegvj
	UG5YUjBH8eqeOXuidTBTl7qXnVk2PDVrOM7lwXYo2EWHDHtSkpw5pSN6VgmVs1Cdq9r8oT
	qZzjCAS1Hp3GRbh2BBtJ8S82Y6KOo3hfBw59NXxnpzDVTrfH2keYu4Are0AApWfc4h8X9P
	bFHApOaQx+lRJwgJBy2vU+ElfJrANokMEMwNUedWns8MrHPn0+dKNvDxU8A5bLOS15PSs7
	Yg+gSvPB42p4iufmtmIXanb6veaAfiTuLYRzZgsydV5nftcVOoSQY5Ph4vniMg==
Date: Fri, 12 Dec 2025 22:18:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi
Message-ID: <20251212211812768361f3@mail.local>
References: <20251212203226.458694-8-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212203226.458694-8-robh@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_131822_964354_72D5BA36 
X-CRM114-Status: GOOD (  15.37  )
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

On 12/12/2025 14:32:14-0600, Rob Herring (Arm) wrote:
> This .dtsi file is not included anywhere in the tree and can't be
> tested.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  .../boot/dts/microchip/usb_a9g20-dab-mmx.dtsi | 93 -------------------
>  1 file changed, 93 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
> 
> diff --git a/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi b/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
> deleted file mode 100644
> index 5b1d80c0ab26..000000000000
> --- a/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
> +++ /dev/null
> @@ -1,93 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * calao-dab-mmx.dtsi - Device Tree Include file for Calao DAB-MMX Daughter Board
> - *
> - * Copyright (C) 2011 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> - */
> -
> -/ {
> -	ahb {
> -		apb {
> -			usart1: serial@fffb4000 {
> -				status = "okay";
> -			};
> -
> -			usart3: serial@fffd0000 {
> -				status = "okay";
> -			};
> -		};
> -	};
> -
> -	i2c-gpio@0 {
> -		status = "okay";
> -	};
> -
> -	leds {
> -		compatible = "gpio-leds";
> -
> -		user_led1 {
> -			label = "user_led1";
> -			gpios = <&pioB 20 GPIO_ACTIVE_LOW>;
> -		};
> -
> -/*
> -* led already used by mother board but active as high
> -*		user_led2 {
> -*			label = "user_led2";
> -*			gpios = <&pioB 21 GPIO_ACTIVE_LOW>;
> -*		};
> -*/
> -		user_led3 {
> -			label = "user_led3";
> -			gpios = <&pioB 22 GPIO_ACTIVE_LOW>;
> -		};
> -
> -		user_led4 {
> -			label = "user_led4";
> -			gpios = <&pioB 23 GPIO_ACTIVE_LOW>;
> -		};
> -
> -		red {
> -			label = "red";
> -			gpios = <&pioB 24 GPIO_ACTIVE_LOW>;
> -		};
> -
> -		orange {
> -			label = "orange";
> -			gpios = <&pioB 30 GPIO_ACTIVE_LOW>;
> -		};
> -
> -		green {
> -			label = "green";
> -			gpios = <&pioB 31 GPIO_ACTIVE_LOW>;
> -		};
> -	};
> -
> -	gpio_keys {
> -		compatible = "gpio-keys";
> -
> -		button-user-pb1 {
> -			label = "user_pb1";
> -			gpios = <&pioB 25 GPIO_ACTIVE_LOW>;
> -			linux,code = <0x100>;
> -		};
> -
> -		button-user-pb2 {
> -			label = "user_pb2";
> -			gpios = <&pioB 13 GPIO_ACTIVE_LOW>;
> -			linux,code = <0x101>;
> -		};
> -
> -		button-user-pb3 {
> -			label = "user_pb3";
> -			gpios = <&pioA 26 GPIO_ACTIVE_LOW>;
> -			linux,code = <0x102>;
> -		};
> -
> -		button-user-pb4 {
> -			label = "user_pb4";
> -			gpios = <&pioC 9 GPIO_ACTIVE_LOW>;
> -			linux,code = <0x103>;
> -		};
> -	};
> -};
> -- 
> 2.51.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

