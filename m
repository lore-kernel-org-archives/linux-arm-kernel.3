Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F080D63923
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 10:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=708lF0/Jojraq9ZYjmgZqP6VuUiWjXWMVt2AJNYyt28=; b=qS9IBZGjsdfy1C3WvINa5u1LlT
	pPH+OsqZ9DWTKd+FRDtasErmXuEpZ38l7uJeUdIAqK3x28MHEz2lXxm18pNI/43gJd8yUfkbrKir9
	VgGdBjxII9B/c/YcSI009ts/RZaySLI/lfjauPv1PirxfxmLtvPV0sdbdWS6Iy+eXQt4tx+FzraAh
	pn2lQPs4US06v/UKzyEyoLFHJna0jfdRkpC292dG4NO/Vv2OGBi3I49Wl5ObG2n0tHNiyzYjl62Cf
	qxGG57niSCwctoj7foxrMMRZGzwwwqYO00IUdCZf+7ze6Mpgmbt3b/I8CmWEDVzED0q0nwFSiZsML
	KuSTIqmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDi97-0000000F4pQ-3PLo;
	Wed, 20 Nov 2024 10:41:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDi8B-0000000F4jD-2VhZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732099219; x=1763635219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fTRY04llbBVBWiEO+xunTY1d92zdPHAjRvFRVXTHeok=;
  b=X1CZSjvKLYwb5dOTgJ33ltv0+30lLHnaut1Rt3Kyk4Z4RT7dw0YhvscJ
   bM9xZCOJOb5/vZFuVXRmtGZaA8NzMRLbD+woG2YkiCdElGliEmY9Nw40v
   isgW961aHVQw8Mv110q6iQDjbnGVaLUzpzpxDyfQbmOYHF8bTtAAoQhOc
   vyMlWRqFWAIlaETB00mH3xAKDMHiKd+Ulv5IZ9cM50ddHn+3DQVJpd8ot
   JmcbYlyqfsPGhumC6A45+VRwJM/awbaqSYpZFm2hflFm8DIJhknAS/zwq
   g1Uki994ojeM7kqmbslTUPE9b3L+wYFCrWP2kmP/nB+dI4nHMFgpK0hf1
   w==;
X-CSE-ConnectionGUID: J7Gote/ISpu5A3XFNDgkXw==
X-CSE-MsgGUID: ab5CMNlNT0mpNAYCosVE3w==
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="38122779"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Nov 2024 03:40:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Nov 2024 03:40:11 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 20 Nov 2024 03:40:07 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <cristian.birsan@microchip.com>
Subject: Re: [PATCH 2/2] ARM: dts: microchip: sama5d27_wlsom1_ek: Add no-1-8-v property to sdmmc0 node
Date: Wed, 20 Nov 2024 12:39:47 +0200
Message-ID: <20241120103946.49779-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119160107.598411-3-cristian.birsan@microchip.com>
References: <20241119160107.598411-3-cristian.birsan@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_024019_638067_77E6B7D4 
X-CRM114-Status: GOOD (  17.21  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, mihai.sain@microchip.com, Andrei Simion <andrei.simion@microchip.com>, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> From: Cristian Birsan <cristian.birsan@microchip.com>
>
> Add no-1-8-v property to sdmmc0 node to keep VDDSDMMC power rail at 3.3V.
> This property will stop the LDO regulator from switching to 1.8V when the
> MMC core detects an UHS SD Card. VDDSDMMC power rail is used by all the
> SDMMC interface pins in GPIO mode (PA0 - PA13).
>
> On this board, PA10 is used as GPIO to enable the power switch controlling
> USB Vbus for the USB Host. The change is needed to fix the PA10 voltage
> level to 3.3V instead of 1.8V.
>
> Fixes: 5d4c3cfb63fe ("ARM: dts: at91: sama5d27_wlsom1: add SAMA5D27 wlsom1 and wlsom1-ek")
> Suggested-by: Mihai Sain <mihai.sain@microchip.com>
> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>

Hi,

Tested-by: Andrei Simion <andrei.simion@microchip.com>

> ---
>  arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
> index 15239834d886..35a933eec573 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
> @@ -197,6 +197,7 @@ qspi1_flash: flash@0 {
>
>  &sdmmc0 {
>  	bus-width = <4>;
> +	no-1-8-v;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_sdmmc0_default>;
>  	status = "okay";

Best Regards,
--
Andrei Simion

