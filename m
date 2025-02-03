Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0178C02194
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 13:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuVR6HYrzUWIcoU95Kdl19BGMZVD2SSN73McVqS2KH4=; b=nuyjzrzJdyn56CYMYNBpDLDGiY
	QvbH1H8bjq+J8WvYgqlWOALVTru/ZnXmGwiMZ9vt+blihLKDCs86/3Eov4NISqpe3boAK+CemEDUm
	Vqi+yHmJW+Zd8dyCWJXINoygTOnMtywGITMvFxOEursWUVjVfVhCjSYjj6nHkVXfLeCQdsqfcxHB6
	sRkUJVHbnRUsx98wS8LUtLOrOPEaJT9g5AueZssoPSwYmiksdeqfMrfzQm9NZlyYnUW8p1d8U2c8c
	FK8xa5hUSNQC76vYes2L+igGXkOJWVMnZ4cDZjuPdHw+hyvQS7IOa6Uyrs72sXyhsdO3lBaqEQc4M
	cgYUmkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tewAd-0000000FTCR-1ktY;
	Mon, 03 Feb 2025 13:07:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tew6E-0000000FSi0-3SJ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 13:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738587770; x=1770123770;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5PBBsKFJeyBGF3ppK9avnkVglYIUvcu81Wzgn1jmcMI=;
  b=BZtgPp9ynqni3Sck6/AZ7GBVoira9avLPJZYbixGhlQjBE7CMG3PqOdy
   AdYDzO8V4PfdyVEb6RtxOXf9TIlcy1WHOcovz5fMjm6LfEbNJIibOf4+o
   pv//DstGP3kqmuj8a6Ge8VeGzYwXGQVUXj3Aw8CZnUik+6fNk/w25fE7x
   CuTnjutP4USF4v94pWGFHx70C4P1zWPA1cPQ4lmP+9pnkrkOlC5qiLQl/
   Wdh8fsoX452HjMUVfmfZe3YdWP1fRi4pVGjC1XpoAZokHC22IxyYN7t02
   Ygn/R1gHFNswgrkckbvrsVF4BNu3QZFpjQpooAFHuHOLv8LoCmjf/9JlC
   Q==;
X-CSE-ConnectionGUID: c/KuCnkaQC2iDOXWgZ4zOg==
X-CSE-MsgGUID: 0Sh8J6srSEO86SsF0ePaFA==
X-IronPort-AV: E=Sophos;i="6.13,255,1732604400"; 
   d="scan'208";a="36818623"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Feb 2025 06:02:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 3 Feb 2025 06:02:16 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Feb 2025 06:02:14 -0700
Message-ID: <75da15f6-f0f6-4404-a473-fde480c63e3c@microchip.com>
Date: Mon, 3 Feb 2025 14:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: at91: calao_usb: remove heartbeat for User
 LEDs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>
References: <20250131162611.33338-4-wsa+renesas@sang-engineering.com>
 <20250131162611.33338-6-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20250131162611.33338-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_050250_925787_6D72ECA9 
X-CRM114-Status: GOOD (  13.53  )
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

On 31/01/2025 at 17:26, Wolfram Sang wrote:
> Default DTs should be minimal. It is cumbersome carrying a custom patch
> disabling the heartbeat just to use the LED for own cases.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Makes sense on this minimal platform:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks and best regards,
   Nicolas

> ---
>   arch/arm/boot/dts/microchip/usb_a9260_common.dtsi | 1 -
>   arch/arm/boot/dts/microchip/usb_a9263.dts         | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
> index 5eb844f2df9d..9672a5626cae 100644
> --- a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
> +++ b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
> @@ -123,7 +123,6 @@ leds {
>                  user_led {
>                          label = "user_led";
>                          gpios = <&pioB 21 GPIO_ACTIVE_HIGH>;
> -                       linux,default-trigger = "heartbeat";
>                  };
>          };
> 
> diff --git a/arch/arm/boot/dts/microchip/usb_a9263.dts b/arch/arm/boot/dts/microchip/usb_a9263.dts
> index 45745915b2e1..ef529ec5dd6f 100644
> --- a/arch/arm/boot/dts/microchip/usb_a9263.dts
> +++ b/arch/arm/boot/dts/microchip/usb_a9263.dts
> @@ -151,7 +151,6 @@ leds {
>                  user_led {
>                          label = "user_led";
>                          gpios = <&pioB 21 GPIO_ACTIVE_HIGH>;
> -                       linux,default-trigger = "heartbeat";
>                  };
>          };
> 
> --
> 2.45.2
> 


