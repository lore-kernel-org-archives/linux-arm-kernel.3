Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80BAC61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnwzr2QEPZbTsG5fmDxIEKuhR4IfwyHeop7Gc/UGR2g=; b=OF+o9mKoJr2Dz1ZtT7mZcNA2PL
	IlR/fBni1gtQBEc+3Mo2RlITDSz/uUw/KuN8f20aMwvEFpee9XuQWO0rGZ5vr4kv1EeMBgTKikRaD
	k1ycczZktutuFiTQsfP1aIS6ysP3UO2dSMxAIHsEpcaef8/Iw71Mo11cOg1PQRVML+fxv8E5Lmkf3
	+8cStnx8iolm+LLjqgrpsg9Mw6BHGSBfG7nwsNJ2BJ7A87ssv2RvPCkA4+OQAwFMZFDwDssnlMb0q
	3HHTMLNxyeGwVQ/ZX8VUzYSbprSLLdwy3+2QkUpJX1pHOl+LHnO5ZyBffxWiNZMWXVtJSxNgWFcly
	der5cmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyujY-00000001BB5-2Sdo;
	Tue, 25 Aug 2026 17:14:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyujV-00000001BAk-2xGr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 17:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787678085; x=1819214085;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lgQBRPrl/nvc5f3CC0Mq/mPd8cl7M4MjjXACHNFSUxo=;
  b=rONb4csV8PHUH28V4a4OVzlVVSipDlvoVFhdsrPNysB7pBaYWzLNIUOn
   x19600arySh5bOGsdxRKLUNsfKr8QtVWAC/GdPXdgm55rDIdOSIp44S68
   OTdwrq8K5jW6Xah+VLOJx34VL0f30tsS52X4mx6uTe7HfYgL67DLWaGYG
   Z5vb1DW48j7q2+3CKWEcUaCgZiJB0cQ45qi6YzZyMnEvVI5aVA+BRilSk
   MphjnB3VOZCXfUOUL5Dr6PKAP/cZM4y2+fXQcjvwpTo+By8d0Z/Y/8uih
   y24DDFB7DMkCuSK8xAm3PmkqTUwO3BLWzGVcZ8x/RGZxo1bbSiocO6Jl+
   w==;
X-CSE-ConnectionGUID: Fm4WJO+JQtCEf0ZpwAwKqA==
X-CSE-MsgGUID: 4+gyDQLjQUepiV5YM5XrCA==
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="61743666"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Aug 2026 10:14:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 25 Aug 2026 10:14:43 -0700
Received: from [10.159.227.160] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 25 Aug 2026 10:14:41 -0700
Message-ID: <0cc2d875-7aab-4091-816c-031f21f3cbac@microchip.com>
Date: Tue, 25 Aug 2026 19:14:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: microchip: lan969x: add SDMMC nodes
To: Robert Marko <robert.marko@sartura.hr>, <ulfh@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <luka.perkov@sartura.hr>
References: <20260824110432.1074136-1-robert.marko@sartura.hr>
 <20260824110432.1074136-2-robert.marko@sartura.hr>
Content-Language: en-US, fr
From: Aubin Constans <aubin.constans@microchip.com>
In-Reply-To: <20260824110432.1074136-2-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_101446_132307_C4B46058 
X-CRM114-Status: GOOD (  11.67  )
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

On 24/08/2026 12:56, Robert Marko wrote:
> Add nodes for both SDMMC controllers.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>   arch/arm64/boot/dts/microchip/lan9691.dtsi | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
> index a8541c6a098d..2d943ea75768 100644
> --- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
> +++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
> @@ -414,6 +414,30 @@ qspi0: spi@e0804000 {
>                          status = "disabled";
>                  };
> 
> +               sdmmc0: mmc@e0830000 {
> +                       compatible = "microchip,lan9691-sdhci",
> +                                    "microchip,sam9x60-sdhci";
> +                       reg = <0xe0830000 0x00000300>;
> +                       interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&clks GCK_ID_SDMMC0>, <&clks GCK_ID_SDMMC0>;
> +                       clock-names = "hclock", "multclk";
> +                       assigned-clocks = <&clks GCK_ID_SDMMC0>;
> +                       assigned-clock-rates = <100000000>;

If always targeting an e.MMC, capped at the High Speed DDR mode, one might consider
a multiple of 52 MHz here.

> +                       status = "disabled";
> +               };
> +
> +               sdmmc1: mmc@e0838000 {
> +                       compatible = "microchip,lan9691-sdhci",
> +                                    "microchip,sam9x60-sdhci";
> +                       reg = <0xe0838000 0x00000300>;
> +                       interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&clks GCK_ID_SDMMC1>, <&clks GCK_ID_SDMMC1>;
> +                       clock-names = "hclock", "multclk";
> +                       assigned-clocks = <&clks GCK_ID_SDMMC1>;
> +                       assigned-clock-rates = <45000000>;
> +                       status = "disabled";
> +               };
> +
>                  qspi2: spi@e0834000 {
>                          compatible = "microchip,lan9691-qspi";
>                          reg = <0xe0834000 0x00000100>,
> --
> 2.55.0
> 


