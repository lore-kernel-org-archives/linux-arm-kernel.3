Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A19BD6C2B5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 10:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3lHwcQxl/X2Y3QIUEL7IGsJB2U1lqmFEOkOKvUN1Cg=; b=MvW+QkgdaxqL/tjRpJbSVCfPJG
	baQSaYB/4ZipFVAjRNLWBtVM5GxlomLrU0GJ9S3oCKCkULPnA1b2QBeepyl31jgu1WX9SR4vt754d
	l9yBVRn4qZV+60vOgcKizEzxuDajbfYQq6A0QBmu6LhMFoUFm2UK/bipuZFV5mCsdzOACUyl+iKly
	7lmQwcA8/Vu7HxcUvIf2CgE1R6SMEGbIrS00wyFL0vmxdvSd+uqMt+JHilnAOrx+C8a7vNlly0ycM
	LjCwxo09Q++8/CVn5gHSD9AfPqbU1RS57RsUZx2mcN8JySK6C4M4AzsiLOJ41jbM97CZPLu0aTcSE
	cke2sDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhg6-0000000F1SS-2EG7;
	Wed, 20 Nov 2024 10:11:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhf9-0000000F1M7-3aGF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732097419; x=1763633419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2qaQ1SiUb+00EcaULYRvl95OFYYN7B8TVPyMTw8h0xc=;
  b=XDH+EFjnbWnmr6yUyrqvCSA7+kkmmSFSuqaFtn9WWOGY4Ol77MVkdWF/
   npUT+vO1h3uIBSmw5+mdyRE1omLBcfWiPkMPGX7aqN3jkYO4DSXD1ml1S
   M3nd0y0ImaduczI5NCIgvfXeRWmTUKMgmmRc7vEL/slSVDnNICsAwnz3n
   oVwjs5ukvKrGCBEI9O+CHjbb3ZEEK02Jx4dRJGjUIePUACwsB4CFtT4Pn
   lVjeC+BP2LZU5nRWQ21G1UXVOdsIY1S83LJAfZ1chVbpvzCH31OHqxtUs
   C2YGab6xjTtGx7Hb4UcmqRQFAs/7wXlOhmIqKgREHOwaPayavVKopT+p8
   g==;
X-CSE-ConnectionGUID: SiPX8Z95Sh2II+yWq8OwYw==
X-CSE-MsgGUID: Y5GxdXWVSHejNCzyBoDztQ==
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="35056919"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Nov 2024 03:10:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Nov 2024 03:09:37 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 20 Nov 2024 03:09:33 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <cristian.birsan@microchip.com>
Subject: Re: [PATCH 1/2] ARM: dts: microchip: sama5d29_curiosity: Add no-1-8-v property to sdmmc0 node
Date: Wed, 20 Nov 2024 12:09:19 +0200
Message-ID: <20241120100918.46190-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119160107.598411-2-cristian.birsan@microchip.com>
References: <20241119160107.598411-2-cristian.birsan@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_021020_060873_190E67E8 
X-CRM114-Status: GOOD (  17.72  )
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
> On this board, PA6 is used as GPIO to enable the power switch controlling
> USB Vbus for the USB Host. The change is needed to fix the PA6 voltage
> level to 3.3V instead of 1.8V.
>
> Fixes: d85c4229e925 ("ARM: dts: at91: sama5d29_curiosity: Add device tree for sama5d29_curiosity board")
> Suggested-by: Mihai Sain <mihai.sain@microchip.com>
> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>

Hi,

Tested-by: Andrei Simion <andrei.simion@microchip.com>

> ---
>  arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> index 951a0c97d3c6..5933840bb8f7 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> @@ -514,6 +514,7 @@ kernel@200000 {
>
>  &sdmmc0 {
>  	bus-width = <4>;
> +	no-1-8-v;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_sdmmc0_default>;
>  	disable-wp;

Best Regards,
--
Andrei Simion

