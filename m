Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76563E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 22:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/27dAp9/1N4IG8npT8EHykv+M6ehXqPk8AeRjaOnCbA=; b=oMnXniFF/R+OSu0dF4C1t3ucej
	bdkEZufurF31lUYh3b4hhVu7mGpruKsJs2a58MevABPiuWKFqdV3lEi7xH7EQ6fIVcmWYqey/d5Sp
	4/hIdvX3GGmkAl6m9ei/CfCWrbaXMWQ7zT4zof0We7LNbPJG+Vy0xIObR86q2ba0NAJH7BdxsX4vH
	SHS9K11hz71hnMf7S5sKjB21nD3xdPAXYY0DyFlcbWggPVlA28I/TA2wXIRSxN1VNWbFEWStelWrD
	Rnb3SuK6WKjFFH9mNN3HrhGyghCt2Eojs10t9VyfqVtFJPaML/bIZrG0dSzizpKVwuftDKeWr9WDR
	tfw9JW/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJhED-00000002yVR-1zAu;
	Fri, 06 Dec 2024 22:55:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJhDB-00000002yLc-15XO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 22:54:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6EC411FB;
	Fri,  6 Dec 2024 14:54:37 -0800 (PST)
Received: from [192.168.0.54] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5F323F58B;
	Fri,  6 Dec 2024 14:54:08 -0800 (PST)
Message-ID: <8906c357-069e-454f-936e-f4a90124118c@arm.com>
Date: Fri, 6 Dec 2024 22:53:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: sun8i: r40/a40i: rm unneeded PH23 setup which resets
 Banana Pi M2 Ultra V1.1
To: Hermann.Lauer@uni-heidelberg.de, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20241206202005.GA24845@lemon.iwr.uni-heidelberg.de>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20241206202005.GA24845@lemon.iwr.uni-heidelberg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_145413_347539_10DE6278 
X-CRM114-Status: GOOD (  11.49  )
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

Hi Hermann,

thanks for sending the patch!

The subject line would need to be shortened, something like:
ARM: dts: sun8i-r40: remove unused GPIO regulator
(no need to sweat it with the A40i/R40/A40 names, they are all the same 
chip, essentially)

And please add the maintainers in "To:", and put the lists on Cc:, as 
shown by:
$ scripts/get_maintainer.pl 0001-*

On 06/12/2024 20:20, Hermann.Lauer@uni-heidelberg.de wrote:
> Banana Pi M2 Ultra V1.1 board resets immediately when the usb core tries
> to setup PH23 GPIO. It turned out that the V1.0 board USB-A ports are
> always power supplied and according to the board scheme PH23 is simply
> not connected.
> 
> So remove the PH23 setup: Doesn't harm V1.0 (with R40) and let V1.1
> (with A40i) start
> 
> Signed-off-by: Hermann Lauer <Hermann.Lauer@uni-heidelberg.de>
> ---
> 
> # HG changeset patch
> # Parent  236ffa4558b03bbc654515fae80a7a2387f06cd4

Please remove those two lines, if possible.

> diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
> --- a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
> +++ b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
> @@ -347,7 +347,5 @@
>   };
>   
>   &usbphy {
> -	usb1_vbus-supply = <&reg_vcc5v0>;
> -	usb2_vbus-supply = <&reg_vcc5v0>;

So while this fixes your immediate problem, the regulator with the 
deadly GPIO is still in. For once it's not needed anymore, but more 
importantly it still references the problematic GPIO, so please remove 
the whole reg_vcc5v0 regulator node altogether as well.

Cheers,
Andre



>   	status = "okay";
>   };
> 

