Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2F0C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCaIdPFEVXXAQMVdDhO7/GgoSWyQhoZusrAuz5gCpv8=; b=kfImF2dasPQHtGxl/iGV9IHcBw
	Z3GnScUziihzi8FfPg1VVDBP8S3wCrhn8gxpN8PvYYIr2wGmen/C7TxRlHtKUrSdlNMnhw/88JzGz
	eMGhg/rGNtlHpDOhM2/MY1MWSfIe6/4XeB/tlJ4fAJmR9xZ/IzmihwBI/8ciOXO9x5ZUDTjOUTgRA
	hQ0dvO8tIQDGllZSFEgTMvhuKRCwyJJ1NbIb2QhpiJzC8I24ZUazXD0Vv956+VjwCyiFcPFd9kok7
	jyM/dk3HCEiwIoCHA3kGpOLCTlwz1dKiU3GyyvHmWb+iv0LYLvazRaqH8JyWQx47vPUldii+sFEZb
	ii2VIOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Zrl-00000006zfP-1pwM;
	Mon, 07 Sep 2026 13:58:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Zrh-00000006zel-30Df
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1788789509; x=1820325509;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+C1CDyK8+eil0VmXqu9ynj6BAwyOsJ/ZwQyq/Z+ba5Y=;
  b=QsxQKQwxQe4YqM+9zpu0Lnz6y0LoEBkl9TtpBhKZWjLeifdWlN7yizmD
   XS8yWc/vu7yxZVOrhHmtPUL5WH7YpuhjcCeTjhrOVD/Qp0f0Nwjs+Uo+U
   IgDpGzIw2DD/bTFWUsJFieYuoZ4Jh2Wz5BW8MObPiO+ng/OIAdsk7VqEe
   StWV6gfWQnM66xvkIh+FtWAnYY1N9Lbe+Uv+/bn+1cwl8+WLhMl0s7023
   10LBTmnsq4IEIwzuZzxR5S+ocacKmPNzA4tUoIR887IVOls9p1FeyHN88
   AOpNx2e6SfwZGpdi1+sZdnauh2dbglsjzvs3YGNSejKKdk5Q3Of0e/9Bt
   Q==;
X-CSE-ConnectionGUID: AHnXF5fBTmiIixkQbp6eiA==
X-CSE-MsgGUID: GmtJI3NCSAqck9Dy/IW4VA==
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="230362313"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 06:58:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Mon, 7 Sep 2026 06:58:27 -0700
Received: from [10.159.227.160] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 7 Sep 2026 06:58:24 -0700
Message-ID: <ccd8c141-96f8-47d1-99f9-ed684c569815@microchip.com>
Date: Mon, 7 Sep 2026 15:58:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: microchip: lan969x: add SDMMC nodes
To: Robert Marko <robert.marko@sartura.hr>, <ulfh@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <adrian.hunter@intel.com>, <ehristev@kernel.org>,
	<linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <luka.perkov@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-5-robert.marko@sartura.hr>
Content-Language: en-US, fr
From: Aubin Constans <aubin.constans@microchip.com>
In-Reply-To: <20260907132617.1198548-5-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_065829_998706_4EE0F891 
X-CRM114-Status: GOOD (  14.31  )
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
> Add nodes for both SDMMC controllers. Connect their bus interface clock to
> the fabric clock and their core clock to the corresponding generated clock.
> 
> Configure SDMMC0 with a 100 MHz generated clock for 50 MHz eMMC DDR
> operation. Configure SDMMC1 with an exact 50 MHz generated clock so the
> integer base clock encoded in the SDHCI capabilities remains accurate and
> the identification clock does not exceed 400 kHz.
> 
> Keep both nodes ordered by unit address.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Reviewed-by: Aubin Constans <aubin.constans@microchip.com>

> ---
> Changes in v2:
> * Use the fabric clock for the SDMMC bus interface clock.
> * Configure SDMMC1 with an exact 50 MHz generated clock.
> * Move the SDMMC1 node to preserve unit-address ordering.
> * Explain the selected clock rates in the commit description.
> 
>   arch/arm64/boot/dts/microchip/lan9691.dtsi | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
> index a8541c6a098d..5e330d5fab50 100644
> --- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
> +++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
> @@ -414,6 +414,18 @@ qspi0: spi@e0804000 {
>                          status = "disabled";
>                  };
> 
> +               sdmmc0: mmc@e0830000 {
> +                       compatible = "microchip,lan9691-sdhci",
> +                                    "microchip,sam9x60-sdhci";
> +                       reg = <0xe0830000 0x00000300>;
> +                       interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&fabric_clk>, <&clks GCK_ID_SDMMC0>;
> +                       clock-names = "hclock", "multclk";
> +                       assigned-clocks = <&clks GCK_ID_SDMMC0>;
> +                       assigned-clock-rates = <100000000>;
> +                       status = "disabled";
> +               };
> +
>                  qspi2: spi@e0834000 {
>                          compatible = "microchip,lan9691-qspi";
>                          reg = <0xe0834000 0x00000100>,
> @@ -429,6 +441,18 @@ qspi2: spi@e0834000 {
>                          status = "disabled";
>                  };
> 
> +               sdmmc1: mmc@e0838000 {
> +                       compatible = "microchip,lan9691-sdhci",
> +                                    "microchip,sam9x60-sdhci";
> +                       reg = <0xe0838000 0x00000300>;
> +                       interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&fabric_clk>, <&clks GCK_ID_SDMMC1>;
> +                       clock-names = "hclock", "multclk";
> +                       assigned-clocks = <&clks GCK_ID_SDMMC1>;
> +                       assigned-clock-rates = <50000000>;
> +                       status = "disabled";
> +               };
> +
>                  reset: reset-controller@e201000c {
>                          compatible = "microchip,lan9691-switch-reset",
>                                       "microchip,lan966x-switch-reset";
> --
> 2.55.0


