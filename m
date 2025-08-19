Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D6ACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:CC:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEFmdMR/Fxe/s6zG1hSbhpQD2pBSMUUAp3xRIOAC9uY=; b=mQ2EnfzCO+5FOom+MpUwjuxlUL
	v0YS3xJOMl0F2wVGCm1yf9hxakSeUjtudxwwpkay/yg8l4ors5TLKdY68eCQtK0/qM7eQHzDYt+EE
	GEZn7mU9d5Q35bstEOPDiXMq+K4DMZXJ9VtkbC8gMxucj4XD3CKxe5DTCn3GhcxjgL/lNcK0vBxcj
	Y2fg9Uar4O8EmhL81FPjDJXVWgNkIgtc8HNAjLSJ1RbbmmYiJjcIJJDqrMIp9NYXwzX9XP38rVQJ0
	HS6/E749fsPJl3vWWQGzNKO4iLRBJ058U6hnueav91BjY/sPC/j2/vpmiTuY21xJoF/fRXcTanKk/
	HH8zsUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQrU-0000000BEmR-3a94;
	Tue, 19 Aug 2025 18:15:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMtt-0000000Agkp-1JyA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 14:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755612082; x=1787148082;
  h=message-id:date:mime-version:subject:to:references:from:
   cc:in-reply-to:content-transfer-encoding;
  bh=a2gMG2z4n/QilfiYn1/Anv7UTDKG8xPbDa/nrlRE1lY=;
  b=u5aY44YmZrpMt/Uve4KhAKZUS//ff2lItrk/bICDAx1GSLlbqRTcjWB/
   Wh5eONGjBP5XqK1Fcgh1qodJdr25HOzHV7SQelDjJHsaGa/nRBUUcZke8
   3BZ7HlZmnKM4L55zRFIOrolHIS/wmExbLcr+lBnFrpvr5PbaIq/pgdYBz
   7zZa6pi6+Knnv+zcmYb2vkXHCvGiomJIWuvx1LwJABaR5lDKPHRaVpjAT
   JALeOmNUzmVBAcxdPC3lEbb0em9AXp72vXSNlB7k42X0T2mRCQ57+Ncvu
   sgL7rUy7+VnpB1fy6NsmWbqAqpNwsAQLd9E2W5pysoLPhp09fV4uFqt07
   g==;
X-CSE-ConnectionGUID: yimjwyM6Qne79SKApcb1tQ==
X-CSE-MsgGUID: qKPcykCuTreaKzASC2aKHA==
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="45371639"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Aug 2025 07:01:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 19 Aug 2025 07:00:59 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 19 Aug 2025 07:00:57 -0700
Message-ID: <4a284c63-062c-4d2f-a2ff-c0fc7e5504c0@microchip.com>
Date: Tue, 19 Aug 2025 16:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: Minor whitespace cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250819131736.86862-2-krzysztof.kozlowski@linaro.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
CC: Ryan Wanner <Ryan.Wanner@microchip.com>, Mihai Sain
	<Mihai.Sain@microchip.com>
Organization: microchip
In-Reply-To: <20250819131736.86862-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_070121_532009_72B42C64 
X-CRM114-Status: GOOD (  13.68  )
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

On 19/08/2025 at 15:17, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '=' or '{'
> characters.

Thanks Krzysztof, and sorry about that.

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts | 2 +-
>   arch/arm/boot/dts/microchip/sama7d65.dtsi               | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> index 7eaf6ca233ec..c14c52936ecc 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -346,7 +346,7 @@ pinctrl_gmac0_txck_default: gmac0-txck-default {
>                  bias-pull-up;
>          };
> 
> -       pinctrl_i2c10_default: i2c10-default{
> +       pinctrl_i2c10_default: i2c10-default {
>                  pinmux = <PIN_PB19__FLEXCOM10_IO1>,
>                           <PIN_PB20__FLEXCOM10_IO0>;
>                  bias-pull-up;
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index c191acc2c89f..84bac1d29421 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -91,7 +91,7 @@ secumod: security-module@e0004000 {
>                  };
> 
>                  sfrbu: sfr@e0008000 {
> -                       compatible ="microchip,sama7d65-sfrbu", "atmel,sama5d2-sfrbu", "syscon";
> +                       compatible = "microchip,sama7d65-sfrbu", "atmel,sama5d2-sfrbu", "syscon";
>                          reg = <0xe0008000 0x20>;
>                  };
> 
> --
> 2.48.1
> 


