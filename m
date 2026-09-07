Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFA9C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlFI+KG6rCwOKBCK7BhlrFUcUtOTVW+kbEP5VC0hh1s=; b=RKcgG5DfnCpZznP9OjHVXoLvf2
	YX+g8aYQv4kBfKL5Wqcz3JJuJctPT8VnaZG7IHBpPuh68UFPosWo+31YM9x4hdg6T3Fiwk4rYGGFV
	kDopFN6IEsqfSt3WvTkUVFJYissgfpiLHUX9i9d1h3hwBOlGIbn4OZTVubZOpMtQDyuvUx0cZl0AM
	UUYz8IbocVp2lZuDbgPC9FEkkFGG8kr/JOd8Pqv6l/ed6hAi0ehSWDnvF26LjvqQtIn3liWZrY8/t
	LfEsO5JXn/QYoedS+OkdLMfIrTC+4BPoC72Fn+kPmwT4nRtXXoa3Tg/xnsV6dRRQJ51V4lYFT7jHh
	dipT8RlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aBM-0000000725P-2bh9;
	Mon, 07 Sep 2026 14:18:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aBJ-00000007255-2LEB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1788790725; x=1820326725;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+yTc0TN0axwr4N0poPrQVeuMRS9TLZb+RsMgDYZ0muc=;
  b=YmRJDj3lsf+5WMW9XKjeDBaDJq4Q1cAylmCwGjmwL2wksd1xJQ90FIso
   qzxCRwkJAZAvu5ft3pQEQkSuKi4egMh6DB5rTtAdEUYk5UDX0R/twBhdv
   t3ojCJqjAXvkFtwBNggjpzICHzQcVT4kc4fdr2upbVbEy5gEOzhOfCaYD
   fq6CgNuPx7T7AS3l//zVmzFpZ6IaY1KY/mNcMAy2qiaxusTfuDn0DXTHH
   bPJDbbdQ6ht06SGQhZ8hFV8dwrw0WNucpfI7iyLu4jL6KqfwbFNbSAfKn
   OlPcyR6QcudzRXswhgg0Uzln6HyVc2UqLZSE4KjmKfbFk9aS4qx/yOvYl
   g==;
X-CSE-ConnectionGUID: dbz7uW7GS2CjyRTC8ExmBg==
X-CSE-MsgGUID: XaA/IM8TTbSM4Z+6hnZyaw==
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="62340739"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 07:18:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Mon, 7 Sep 2026 07:18:44 -0700
Received: from [10.159.227.160] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 7 Sep 2026 07:18:41 -0700
Message-ID: <e228ce18-3939-426b-8029-e53cafb1a8a1@microchip.com>
Date: Mon, 7 Sep 2026 16:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: microchip: ev23x71a: enable eMMC
To: Robert Marko <robert.marko@sartura.hr>, <ulfh@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <adrian.hunter@intel.com>, <ehristev@kernel.org>,
	<linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <luka.perkov@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-7-robert.marko@sartura.hr>
Content-Language: en-US, fr
From: Aubin Constans <aubin.constans@microchip.com>
In-Reply-To: <20260907132617.1198548-7-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_071845_658634_E0CECB46 
X-CRM114-Status: GOOD (  12.90  )
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

On 07/09/2026 15:25, Robert Marko wrote:
> Enable the non-removable eMMC connected to SDMMC0. Configure its 8-bit bus
> for 1.8 V DDR operation.

Adding the no-sd and no-sdio properties may be considered to speed
initialization up a bit.

> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Reviewed-by: Aubin Constans <aubin.constans@microchip.com>

> ---
> Changes in v2:
> * Remove the unnecessary maximum-frequency property.
> * Expand the commit description.
> 
>   arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> index 985ca31e74e7..89a161b87d6f 100644
> --- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> +++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> @@ -478,6 +478,16 @@ flash@0 {
>          };
>   };
> 
> +&sdmmc0 {
> +       pinctrl-0 = <&emmc_sd_pins>;
> +       pinctrl-names = "default";
> +       bus-width = <8>;
> +       mmc-ddr-1_8v;
> +       non-removable;
> +       disable-wp;
> +       status = "okay";
> +};
> +
>   &serdes {
>          status = "okay";
>   };
> --
> 2.55.0


