Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A4DC02196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 13:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaCHY71N/adjv/VJyMT11jKVW4kWgqpWYxfjNR4eMUw=; b=ANzOp6DvxYa1Vj8cVTz0hM++Ac
	dWxBwfHJr4EKbb6P08ovxeHLSWUrsQium/KBER/mFlwfRNX+gWlk61jsI3fBdiLI0bTqB1YETo2UP
	iQtH0Oi6Z3l6F4SzaA/WmYsIwvZGo1dSeiQASQo9HBWPAN/HNTZuGnNgzdKz32Z/PwlqGtriaPgt7
	BKM6szhR65qs0cm0YCorTsnhoPSDcDtv/InANvli2V4bf1EF8PjjoOZ4tY27wGIKJjurwc1p5TuWX
	nH6KUZBXIo7Zp3nNzw59daeRPoSbHLeAO26jlaLWApoCq9+YAtLyL9moFMG/5rm4InaE3uc/A0uX+
	55g6KQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tewDd-0000000FTkz-3apU;
	Mon, 03 Feb 2025 13:10:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tewCJ-0000000FTWx-0MWl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 13:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738588147; x=1770124147;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GDCSiGKumchsCLvW4RTp/AlX8Fvnpt+Z/TW2GqZF3NU=;
  b=ZIzSEIpTCzcoZa4dOM6Lkmi4W7A9Czhl2ckQZ1kzNL4dL0zjz8dPChqC
   xD/Y54B7dqzd8JiW17aupXidkcQzWWPj1Ed5ukjZ6hMy9yeacTiaUyqrl
   9l66c2wN/g0XkQEkfOkXd4oUoM5pen31mGbLPyPf51d5L7xVbZB3i4DK0
   qgimSseP65bXskCPT3X6xL7Uve1+dkEOt7QvHy7hvMe10VYmwvJpMMcIF
   Hu8qHKx6+Cvrj1p9pG9L2jZ/3CkvHrLIx9H72F8E/+Y1mSOJYnEiWGDfT
   oe6QPJ07o2UVKXZt+jGl2ejjinB8L3uNZkvhYJu9URep7fdKhFzcXY9LM
   A==;
X-CSE-ConnectionGUID: PZia51+RR3iwDczuUzl0MA==
X-CSE-MsgGUID: fHD8+wFCR+OSDR2TKoB+yg==
X-IronPort-AV: E=Sophos;i="6.13,255,1732604400"; 
   d="scan'208";a="37204349"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Feb 2025 06:09:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 3 Feb 2025 06:08:37 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Feb 2025 06:08:35 -0700
Message-ID: <f4fc0326-dc2a-40cc-822c-61530aa2a267@microchip.com>
Date: Mon, 3 Feb 2025 14:08:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ARM: dts: at91: calao_usb: fix various naming
 problems
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob
 Herring <robh@kernel.org>
References: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_050907_141663_9E060ED6 
X-CRM114-Status: GOOD (  10.40  )
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

On 31/01/2025 at 22:02, Wolfram Sang wrote:
> Two patches deal with the either missed or mistyped vendor 'Calao'. The
> other two patches deal with improper node names as reported by
> dtbs_check.
> 
> Wolfram Sang (4):
>    ARM: dts: at91: usb_a9263: fix wrong vendor
>    ARM: dts: at91: use correct vendor name for Calao boards
>    ARM: dts: at91: calao_usb: fix button nodes
>    ARM: dts: at91: usb_a9g20_lpw: use proper mmc node name

Series looks good to me:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Wolfram. Regards,
   Nicolas

>   arch/arm/boot/dts/microchip/tny_a9260.dts          |  2 +-
>   arch/arm/boot/dts/microchip/tny_a9260_common.dtsi  |  2 +-
>   arch/arm/boot/dts/microchip/tny_a9263.dts          |  2 +-
>   arch/arm/boot/dts/microchip/tny_a9g20.dts          |  2 +-
>   arch/arm/boot/dts/microchip/usb_a9260.dts          |  2 +-
>   arch/arm/boot/dts/microchip/usb_a9260_common.dtsi  |  6 ++----
>   arch/arm/boot/dts/microchip/usb_a9263.dts          |  8 +++-----
>   arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi | 10 ++++------
>   arch/arm/boot/dts/microchip/usb_a9g20.dts          |  2 +-
>   arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi  |  2 +-
>   arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts      |  4 ++--
>   11 files changed, 18 insertions(+), 24 deletions(-)
> 
> --
> 2.45.2
> 


