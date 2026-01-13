Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECCECF45DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kk4DjiNL4y469fEqg5LJR8emW6eWTYRCG39RXjZxQM8=; b=I4uimUMXIv8hE0cqBIZZ9E7foA
	OItqE5uAM9+PUWuaCrVn+9z7lNVHdhLsP8o4r1g1pZJmiFtSoNl/8UVTwGG1BKox7MHmun2dPSURv
	wpc4WQpxrNWoBVE1+bYraGVA0qQufwMXZIcbe6+WmQzgA20aUTvGz4E6pkiDbOMS9C30VEgwzN9r2
	QIvzfWt1S2KALrW3Ij8RoyE7UA6Lkapfp2wc+K49mO/I7/P+pNRMrnXEhJx3cSFJ2WZyXHDns8S0J
	Wuq4oqLAHShz8piBOTPwPDdmfcLysUR5bLxCND0Y5MOenZhe3L884wZlnaFFr91IzWpUm/XhkdTI0
	I8WNhhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfft7-00000007JVe-3Gwi;
	Tue, 13 Jan 2026 15:00:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffsw-00000007JQA-1Nsm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768316442; x=1799852442;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FU3rckpTxcsZFc0dx5Y1O3dsUCp8S743x3ibSTos+Pw=;
  b=eg0xxih+m4kI7GM2r6CuIpertL85gIAv42eVQANGWqW+IO4hBTgfjGsf
   we8SX40ogVq0nnrxm/G1afdm8nvBWXF7y+tIT4L3SqfYsZrY1qXz47msY
   wKPJk62aVYk1zAzjmKmgkPHirTARjerduXDbI2QJ9VZvR32wUlJFhNZ+e
   byy4idBL++K1NlqmRu0fVV0myL7K49rTGtDBrPdzFP3e97SQ9Ob+Y48kD
   Qn7ma8p4NAH/5S6wy9cDynos31uc5+EMIS4ktstauheR1wF+PeR8yUPw3
   EO1gfDGzpj+qp65bQ3ZjhlENPeiVb7dapR3Ke+dZFrOEA/Bsnf06dFUw4
   g==;
X-CSE-ConnectionGUID: acGYMMOWTDmL0c/RchskRw==
X-CSE-MsgGUID: kFfUb+MNRSekhOmMFmS7sg==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; 
   d="scan'208";a="52246893"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 08:00:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 13 Jan 2026 08:00:14 -0700
Received: from [10.159.205.69] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 13 Jan 2026 08:00:10 -0700
Message-ID: <708ef82c-1833-4817-88e0-c11f43b3ad4f@microchip.com>
Date: Tue, 13 Jan 2026 16:00:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D
 driver
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
 <20260113-cpitchen-mainline_gfx2d-v5-5-9cdab8fa699b@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260113-cpitchen-mainline_gfx2d-v5-5-9cdab8fa699b@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_070043_023210_746CDE2B 
X-CRM114-Status: GOOD (  13.80  )
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
> The GFX2D GPU is embedded in both SAM9X60 and SAM9X75; enable the
> driver to use it.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   arch/arm/configs/at91_dt_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
> index 4f1153098b16f4a93ff21f05ec73cc569f4ebe64..b38fb185670c05e74e09f6341128be5908c86451 100644
> --- a/arch/arm/configs/at91_dt_defconfig
> +++ b/arch/arm/configs/at91_dt_defconfig
> @@ -144,6 +144,7 @@ CONFIG_VIDEO_OV2640=m
>   CONFIG_VIDEO_OV7740=m
>   CONFIG_DRM=y
>   CONFIG_DRM_ATMEL_HLCDC=y
> +CONFIG_DRM_MICROCHIP_GFX2D=y
>   CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
>   CONFIG_DRM_PANEL_SIMPLE=y
>   CONFIG_DRM_PANEL_EDP=y
> 


