Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCD9D2F320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11KkMHuemFCnzhAKPYe2sK2gsBh9H4xVlAoGo6iy784=; b=FrxTffYp8kFD0/VpcqBvLaplKq
	E75+Fuk/KNsMOnIMIDOfRkr0bFBuz7WBhB5DAIC2eGb1yCb1SGDT33wF7xDpGRXXB8nZczTMyq6t9
	UlEFEcn6AG9NfkSul8F5fN3JSXokLA8d4Dnu6X0tdvNezCX2tuL5Q1tKLynlNhalHXXcSps5i0IxA
	6nYraIaqXOUps1k4A387Qc5clag5FxvvornzIb+lw6lxwLaYTx3kRaWfbvKAjiFHyOjFnEoSLq66r
	WLAgGremQJ1jmQU8DmBzwlKkz8BkvX90xYeWvsnQlmbBkoAXMSG4Bqd+RMczuMa0LnVomxkrI30GX
	TfJ45OYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg3W-00000007L1n-1ynL;
	Tue, 13 Jan 2026 15:11:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg3T-00000007L0a-2BCD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768317095; x=1799853095;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7XznA18BA70UboFGcQVIjFlVsDecJjM7njq32R22DrE=;
  b=XjfUI6hMLptuz4mTDBw3ElweDYUvYsuxuMln1fZhugY2M6oezogqeHlj
   jp/wOXNrK9nccRxkUqgpRtVndRo8oUKO/X7AzYxeCJD3oIvkqRccWHyr/
   iMx56Wr2jrtFfwFO4JgkriZDK1zpfzEjLwiuHqhGbsm+MrywaZzuYgErk
   94pVO+KaYZ2uMuL5pqWeIuTYcf5Dcs+NvLx9HIXQiT9JhJe5NXYBcpfSE
   tjA+agpiaJ6oNAU7yFDAeJlNtc3RU401nWe1bTovL6qx6BrAV1xJyXqHk
   E7n/HBph1rTIjPnodDQ1cIWtlK65ediWF3+lZ1RqbDSGQGm029dJlV6aL
   w==;
X-CSE-ConnectionGUID: elVzir9fTFac2yKBdCUdNg==
X-CSE-MsgGUID: PRgTA9VDTSiMPgwjr6n34Q==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; 
   d="scan'208";a="52247948"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 08:11:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 13 Jan 2026 08:11:12 -0700
Received: from [10.159.205.69] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 13 Jan 2026 08:11:09 -0700
Message-ID: <468e4624-355b-400f-8d03-4db5c37e3ec7@microchip.com>
Date: Tue, 13 Jan 2026 16:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260113-cpitchen-mainline_gfx2d-v5-0-9cdab8fa699b@microchip.com>
 <20260113-cpitchen-mainline_gfx2d-v5-3-9cdab8fa699b@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260113-cpitchen-mainline_gfx2d-v5-3-9cdab8fa699b@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_071135_685581_D67076F5 
X-CRM114-Status: GOOD (  13.55  )
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

On 13/01/2026 at 14:10, Cyrille Pitchen wrote:
> Add support for the GFX2D GPU.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
> ---
>   arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> index b075865e6a7688005d471665459b3f6f1f26f7a4..338a0f3b336ffa6f1e3f900a4b4a58e4e3f93bb8 100644
> --- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> @@ -353,6 +353,14 @@ AT91_XDMAC_DT_PERID(26))>,
>   				status = "disabled";
>   			};
>   
> +			gpu: gpu@f0018000 {
> +				compatible = "microchip,sam9x60-gfx2d";
> +				reg = <0xf0018000 0x4000>;

Same here, probably smaller size for register map is better.

Regards,
   Nicolas

> +				interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
> +				status = "disabled";
> +			};
> +
>   			i2s: i2s@f001c000 {
>   				compatible = "microchip,sam9x60-i2smcc";
>   				reg = <0xf001c000 0x100>;
> 


