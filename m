Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237BFD5C0C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rC5GOjuqfzzxGATbb0PubKH25wm81zW5FKAAClKNqKE=; b=R5j3NBy75SlmxEJT6NHhTsAQ8J
	OLVsXqADeWxyu99IjTiCqNPYtZ8j6NzFqkHsCXW8FWh12Ma80w/48LYPY2z2QrmhFcrJkfLSsAqF2
	DAxPttRgNIWTGqXOZyj9G92fSJWXQFcZuwOBwOWKoM1zSKKbfshekrOTr5iNJfnDGj1mizI0geWhw
	d07+v3uFuFe/ryMp8w9sg+wHBc61UH5GvlGMwmfbpaCZkd3/D4sQse4V9cwhIzJFpk5Jp2lCrLXZm
	xvSYjmpZhMoOsnQhoLpzegE5hCZHgCfgNKXVd4big+aMKWoaubudcDQ1uqyiqY+Wac+Hnchj5rHb5
	W80RYLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9OwT-0000000Af7s-1LNV;
	Fri, 08 Nov 2024 13:22:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Oui-0000000AeuI-0iAx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731072036; x=1762608036;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=q+UMqKv74gpz3voF8S2P7kWDpsQDIqMFOF8q2PGUw10=;
  b=HH8mls9z3BGpI6wsyJ19JdheQfM6K7SyhvjWZaSPkm73rVZmrPgfIFoz
   yxrsFL44QuvCpdIz3TdwQDPSaFDGBaOh9lw7Q6fZy+bUQ7hmLu12Pfyd/
   Fosl8ZWgp/q/RWj0fD3baj/MFEtXFARnEwGPNPAJQRWtlrp5Ex3+BgapW
   DJ/X5gbVyMeWKQBAwSR6DIxoBbmRECqvC0D2WDDEcB9w+MwbihI4BcIEA
   6KGyFfV4yDIJgjixwpAzzXcjt52mDi2Am+4UmFpPehqBOzdgw8QooCGVm
   L6wIGfbCGqyEHikhpzsLQCgkU+Ihz7JScs31ojeFqvhaiM5nby8Mt3i9r
   A==;
X-CSE-ConnectionGUID: PvurtoTEQ2WlLblVte8kjQ==
X-CSE-MsgGUID: 2BBk/xFWRYWcMYKhM1xQig==
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="34056474"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Nov 2024 06:20:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Nov 2024 06:20:21 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 8 Nov 2024 06:20:19 -0700
Message-ID: <743af86d-e7ad-4698-b7a4-d75cf46f00d7@microchip.com>
Date: Fri, 8 Nov 2024 14:20:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mfd: at91-usart: make it selectable for ARCH_LAN969X
Content-Language: en-US, fr-FR
To: Robert Marko <robert.marko@sartura.hr>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <lee@kernel.org>, <gregkh@linuxfoundation.org>,
	<jirislaby@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <luka.perkov@sartura.hr>
References: <20241108112355.20251-1-robert.marko@sartura.hr>
 <20241108112355.20251-2-robert.marko@sartura.hr>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20241108112355.20251-2-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_052036_364508_4AE0F7B5 
X-CRM114-Status: GOOD (  13.97  )
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

On 08/11/2024 at 12:22, Robert Marko wrote:
> LAN969x uses the AT91 USART IP so make it selectable for ARCH_LAN969X.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   drivers/mfd/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ae23b317a64e..f280ba28d618 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
>   config MFD_AT91_USART
>          tristate "AT91 USART Driver"
>          select MFD_CORE
> -       depends on ARCH_AT91 || COMPILE_TEST
> +       depends on ARCH_AT91 || ARCH_LAN969X ||COMPILE_TEST
>          help
>            Select this to get support for AT91 USART IP. This is a wrapper
>            over at91-usart-serial driver and usart-spi-driver. Only one function
> --
> 2.47.0
> 
> 


