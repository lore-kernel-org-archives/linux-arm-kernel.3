Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF93E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 01:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWRF7RfMnn05h4sg+MxJaKSQFuBruNoGMe9edv4pt/U=; b=GW4Xca+lBiypsJ1URkyOFZg5kG
	qDcu5Il2D4zt0hWooclFw8r/AI83DKRtXmkS+y9+PK6nB4PpbnmxCb9OSY18eR75iMSxX40XGvOKz
	YbsUrCxttLGpqBMYwg7OlyuP/F2r186D7N2t9Fsa3Jx1scgXV4I8PSc/k3FXVhe0vYL+lUf2+C7k+
	OjKLDH3N2BS0UpkMLmto8/bZfJU4PouqbyyepHP7iiqHyJ32Bx6mzle6vHQugXkwoqiq39aLL0jPV
	MFEjFkA9Za/wOchDh9yyxvBwJX4c36Q9hR8LzzAKh9xHruv+qigUL/t2AlIQ6O4svS8JXOiDkkLQA
	7bPcnvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGnJ-00000005UMU-1RPN;
	Sat, 14 Dec 2024 01:18:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMGmD-00000005UF1-2KdW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 01:17:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7EDE11FB;
	Fri, 13 Dec 2024 17:17:23 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20AD63F5A1;
	Fri, 13 Dec 2024 17:16:54 -0800 (PST)
Date: Sat, 14 Dec 2024 01:16:12 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Hermann.Lauer@uni-heidelberg.de
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Icenowy Zheng
 <uwu@icenowy.me>
Subject: Re: [PATCH v2] ARM: dts: sun8i-r40: remove unused GPIO regulator
Message-ID: <20241214011612.4fd9e4bf@minigeek.lan>
In-Reply-To: <20241213195433.GA1568@lemon.iwr.uni-heidelberg.de>
References: <20241213195433.GA1568@lemon.iwr.uni-heidelberg.de>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_171701_639856_B0283074 
X-CRM114-Status: GOOD (  16.71  )
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

On Fri, 13 Dec 2024 20:54:33 +0100
Hermann.Lauer@uni-heidelberg.de wrote:

Hi,

CC:ing Icenowy, who added the regulator originally, with commit
0ca12c1ee43c ("ARM: sun8i: r40: add 5V regulator for Banana Pi M2
Ultra").

Icenowy: can you clarify what "newer" version this was referring to in
that commit message? That commit in itself doesn't seem to do anything,
as the regulator isn't referenced, and it's not always-on. It's only
later when the USB nodes were added that it got used?
So was PH23 really necessary? As Hermann reports, setting PH23 on a v1.1
makes it reboot.

> Subject: [PATCH v2] ARM: dts: sun8i-r40: remove unused GPIO regulator

Hermann, this looks like an extra subject line here?

> Banana Pi M2 Ultra V1.1 board resets immediately when the usb core tries
> to setup PH23 GPIO. It turned out that the V1.0 board USB-A ports are
> always power supplied and according to the board scheme PH23 is simply
> not connected.
> 
> So remove the PH23 setup: Doesn't harm V1.0 (with R40) and let V1.1
> (with A40i) start.
> 
> Signed-off-by: Hermann Lauer <Hermann.Lauer@uni-heidelberg.de>

The patch itself looks good to me, but it would be good to clarify the
situation with the "older newer" version.

Just in case:
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre
 
> ---
> V2: shorten subject, rm dangerous PH23 regulator completely
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
> --- a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
> +++ b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
> @@ -91,15 +91,6 @@
>  		};
>  	};
>  
> -	reg_vcc5v0: vcc5v0 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "vcc5v0";
> -		regulator-min-microvolt = <5000000>;
> -		regulator-max-microvolt = <5000000>;
> -		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
> -		enable-active-high;
> -	};
> -
>  	wifi_pwrseq: pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&pio 6 10 GPIO_ACTIVE_LOW>; /* PG10 WIFI_EN */
> @@ -347,7 +338,5 @@
>  };
>  
>  &usbphy {
> -	usb1_vbus-supply = <&reg_vcc5v0>;
> -	usb2_vbus-supply = <&reg_vcc5v0>;
>  	status = "okay";
>  };
> 


