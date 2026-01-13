Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4CFCF45DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVoQ2rJJh0I3tOwtjgTkIyhBf2ZNhK9tbI+9DcxfJ68=; b=AzfYo25OyjEyEeZEHt5NuYRtSx
	rfjBxbv5vO6BRGNNvdsVQhNwjGHLYDErBntqhBuzAxCRVyMO/0bweOvCkMTUpc1bauwFxzx0k0ny7
	HiqF+bOTOrStOu8SfpLiSsQQELGcne/AxOL8/KtEGq70U+40WIBeOxhgf+covHKpnmcs3uACszxm8
	qmkpGQbFM+HDdhh9eanyGJfXvGJhUdk4/4NehF/f610jb2hIw4UsDnQF/iWuD6nm1DWetTddrZ5Pr
	57JVMIKbklfnLRrxXGL8CFrWEzrv0rdMUxZjbon1hUQ2CaPloV8pTsijdYj+MmDbB/8bTknkxXQ0e
	NkbbM6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffsF-00000007JCX-3gPU;
	Tue, 13 Jan 2026 15:00:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffsD-00000007JC6-0ReU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768316396; x=1799852396;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jC2AsUFaWKrDJEStofCk0XWXz8JM2i3DMt8adlwoSOo=;
  b=fvMtNYmSI9kk8hNk9mavQIyTKV68wlB2Kbl3CZa+BLACHosOMNJ55Fhr
   1HyRonOlRWev/0mVRcDMNU6F+2QYQD8H0lTfQQ6h0KyOL5Ua44m8YHUd1
   9+TvvpDkhKGWPIA8NMz4+QpZL0lJvehgnRXTAIAMKb6sbr+kegPuACJx+
   TdduGUsVvRbbSqvEaDBwT16+5p+Lji0W1LlxZZlotNrNq6lf0JILbB59T
   CZepwmNm50NuZwnmPQq3cZCsiiUJw+g9yPrZa7QSP7qMDA0ET8NSTyOZp
   WYfvmvBe6a8d8leQJ0yyxE6sTKEUKGHWL+Ytq3b4NGeBnM8ut1wQZ5WtV
   A==;
X-CSE-ConnectionGUID: sRFtzLONRu6S+I4SjuArAw==
X-CSE-MsgGUID: VUqyUxX7Sb2mCTacvPGjBA==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; 
   d="scan'208";a="283174523"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 07:59:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 13 Jan 2026 07:59:51 -0700
Received: from [10.159.205.69] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 13 Jan 2026 07:59:47 -0700
Message-ID: <d4d76895-9029-4913-8873-e9a41852f677@microchip.com>
Date: Tue, 13 Jan 2026 15:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
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
 <20260113-cpitchen-mainline_gfx2d-v5-4-9cdab8fa699b@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260113-cpitchen-mainline_gfx2d-v5-4-9cdab8fa699b@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_065957_393146_061527FE 
X-CRM114-Status: GOOD (  14.63  )
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

Hi,

On 13/01/2026 at 14:10, Cyrille Pitchen wrote:
> Add support for the GFX2D GPU.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
> ---
>   arch/arm/boot/dts/microchip/sam9x7.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
> index 46dacbbd201ddb68a7456d6fe1afafa59db90ec8..79a82962264f51c4c243530b9dad9010f8cf1347 100644
> --- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
> @@ -292,6 +292,14 @@ AT91_XDMAC_DT_PERID(26))>,
>   			status = "disabled";
>   		};
>   
> +		gpu: gpu@f0018000 {
> +			compatible = "microchip,sam9x7-gfx2d";
> +			reg = <0xf0018000 0x4000>;

I see that the register map is much smaller that this 0x4000 size required.

> +			interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
> +			status = "disabled";
> +		};
> +
>   		i2s: i2s@f001c000 {
>   			compatible = "microchip,sam9x7-i2smcc", "microchip,sam9x60-i2smcc";
>   			reg = <0xf001c000 0x100>;
> 

Best regards,
   Nicolas

