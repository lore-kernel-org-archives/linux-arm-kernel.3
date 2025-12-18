Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294E5D6ACFE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWMcyaheYqIM6z+xZHf2Vr6SY8h1s2RBptf/pYqTYjE=; b=xl6m2qHtu58uUU9ikvHMubGlpX
	MPax3hkAny1miyY1a76X5BebKzaYinOT1Jlx5GHiMZGl31g/tWcHTpjaVhi+1cBWO9On2DjnE1Gbc
	RnfomP08MDId7aZ2uBkO0chDygU4/+B7savt/BhX7e0a6s3AcmLTI2tagnW5F3M+SXUi4JNdXqcSX
	4NrMtIMC9iNHt+BYF0xYvBAPR6a5HbcZ2M6hPzVWNKfv6nm4qpLvM5qPykF96tQOsdlTjMt8qNJUi
	8rwRr5t9OKbkTwQxkcCMNcftAsgfKv9a4Or/rf4e21dq8FcEsQ/2QtD7DdakAgCRZe8GLsgMRsO45
	EqWT7umg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDV4-00000008ROS-0etP;
	Thu, 18 Dec 2025 12:52:58 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDV2-00000008RO5-1M31
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 12:52:57 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vWDUl-0001ct-92; Thu, 18 Dec 2025 13:52:39 +0100
Message-ID: <9a96f664-00ba-4589-b3b8-a04355c0ad0b@pengutronix.de>
Date: Thu, 18 Dec 2025 13:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add devicetree for NXP i.MX93 FRDM board
To: Fabian Pflug <f.pflug@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, Lei Xu <lei.xu@nxp.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Haidong Zheng <haidong.zheng@nxp.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Danwei Luo <danwei.luo@nxp.com>,
 linux-arm-kernel@lists.infradead.org
References: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_045256_392093_C9D5C4AA 
X-CRM114-Status: GOOD (  23.36  )
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

Hello Fabian,

On 12/18/25 12:39 PM, Fabian Pflug wrote:
> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> ---
> Changes in v4:
> - remove it6263 block in i2c1, since it is not finished
> - remove usdhc3 pwrsequence, since WLAN is not tested on my board
> - remove eee-broken-1000t on phy2, since it is not broken
> - update min/max-microvlt on buck converters

I know you changed this due to reviewer feedback, but it was wrong
advice. The Linux driver already has information about the minimum and
maximum range support for the PMIC, what you need to write here is the
actual board-level constraints.

I don't think the board will like VDD_3V3 at 1.62V or VDD_1V8 at 3.4V.
For the fixed voltage rails just set min = max = fixed voltage.

Thanks,
Ahmad

> - Link to v3: https://lore.kernel.org/r/20251022-fpg-nxp-imx93-frdm-v3-0-03ec40a1ccc0@pengutronix.de
> 
> Changes in v3:
> - Add Signed-off for original NXP contributors.
> - Fixed whitespace errors (Thanks Francesco Valla)
> - Added mu1 with status okay (Thanks Francesco Valla)
> - Removed address cells from lpi2c3 (Thanks Frank Li)
> - Configure pin for watchdog (Thanks Peng Fan)
> - Updated regulator config
> - Configure i2c0
> - Link to v2: https://lore.kernel.org/r/20250526-fpg-nxp-imx93-frdm-v2-0-e5ad0efaec33@pengutronix.de
> 
> Changes in v2:
> - 1/2: remove CAN node, as it has not been tested.
> - 1/2: ran dt-format (Thanks Frank Li)
> 	But also reordered some nodes afterwards again to have
> 	regulator-min before regulator-max, have the pinmux at the end
> 	of the file, and have the regulator-name as the first node
> 	inside the regulators.
> 	Re-added comments, that were deleted.
> - 1/2: changes subjet to ar64:dts (Thanks Fabio Estevan)
> - 1/2: removed reg_vdd_12v (Tanks Fabio Estevan)
> - 1/2: added aliases for rtc, emmc, serial (Thanks Fabio Estevan)
> - reordered the series to have documentation before dts. (Thanks
>   Krzystof Kozlowski)
> - Link to v1: https://lore.kernel.org/r/20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de
> 
> ---
> Fabian Pflug (2):
>       dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
>       arm64: dts: freescale: add support for NXP i.MX93 FRDM
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 620 +++++++++++++++++++++
>  3 files changed, 622 insertions(+)
> ---
> base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
> change-id: 20250523-fpg-nxp-imx93-frdm-5cc180a1fda9
> 
> Best regards,

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


