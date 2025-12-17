Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76E7D64076
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 05:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yCOpJg6X0Um66Kme35mqxsOl+PZm8sb2E061AMQWa4=; b=IX5EToJqAXIAZQ/iTTufufEZ3m
	KC3uoIA4PmzK71i/OYAGqKm1WspEic9yVjvUlaNQTPEj9pd5vr6hn53rrAaqQFLphItFaRZbT4iP6
	rqAY4o0pLdDBY0bjDvwuUQTC1v7lo1dbcBwYTwptzF0gHPwpgPOLNDiAUpm5JhyPSggxUJnn2XU3D
	EFkiLbrtSFmgmGZvZn5zNumfapZJl1v9DNjZ5brOn1Uw+D+LsntidXee+pYUSmYwaAhsRvJfIecBA
	qwDynHwDf7nrH7kIDkvcMbtJwcxbQ74a5RpUtPxQJBLJk2hg5/CDJv+tM6uDcHaO727Ce50Z2BuZI
	4rbGeo7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVkST-00000006CiQ-3SDP;
	Wed, 17 Dec 2025 05:52:21 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVkSQ-00000006Cht-2tmc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 05:52:20 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9F12F1A1AB7;
	Wed, 17 Dec 2025 06:52:14 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 689271A0B5C;
	Wed, 17 Dec 2025 06:52:14 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 3AE411800089;
	Wed, 17 Dec 2025 13:52:12 +0800 (+08)
Date: Wed, 17 Dec 2025 14:52:11 +0900
From: Joseph Guo <qijian.guo@nxp.com>
To: Yanan Yang <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com,
	Lei Xu <lei.xu@nxp.com>, Xiaofeng Wei <xiaofeng.wei@nxp.com>,
	qijian.guo@oss.nxp.com
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <aUJFC4ll033PzX7L@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
References: <20251215-imx91s-frdm-v2-0-87996bdaa59c@nxp.com>
 <20251215-imx91s-frdm-v2-2-87996bdaa59c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-imx91s-frdm-v2-2-87996bdaa59c@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_215218_864730_AFF3ECD4 
X-CRM114-Status: GOOD (  16.50  )
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

On Mon, Dec 15, 2025 at 05:42:52PM +0900, Yanan Yang wrote:
> Add DeviceTree support for the NXP FRDM-IMX91S development board based
> on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> and differs in memory, storage, Ethernet, and PMIC configuration:
> 
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> 
> This DT enables:
> - ADC1
> - UART1 and UART5
> - I2C bus and children nodes
> - USB and related nodes
> - uSDHC1 and uSDHC2
> - FlexSPI NAND flash
> - Watchdog3
> - Ethernet (eqos)
> - FlexCAN
> - MQS
> 
> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91S
> (FRDM-IMX91S board page)
> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91
> (FRDM-IMX91 board page)
> 
> Co-developed-by: Lei Xu <lei.xu@nxp.com>
> Signed-off-by: Lei Xu <lei.xu@nxp.com>
> Co-developed-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Signed-off-by: Yanan Yang <yanan.yang@nxp.com>
> 
> ---
> Changes in v2:
> - Correct author name: removed extra period in "Yanan.Yang"
> - Removed aliases pointing to disabled nodes from DTS
> - Add "rtc0 = &pcf2131;" in aliases to make external RTC the primary device
> - Fix DT node name: change
>   "usdhc1_pwrseq: usdhc1_pwrseq" to "usdhc1_pwrseq: usdhc1-pwrseq"
> - Renamed LED node from 'status' to 'led-0' to comply with gpio-leds binding
> - Replace regulator-based transceiver (reg_can_stby) with CAN PHY (nxp,tja1051)
> - Replaced 'xceiver-supply' property with 'phys' in flexcan1 node
> - Adjusted alignment in fsl,pins property: used spaces between pin names and values for proper DTS style.
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  .../boot/dts/freescale/imx91-11x11-frdm-s.dts      | 677 +++++++++++++++++++++
>  2 files changed, 678 insertions(+)
>

Hi Yanan,

According to u-boot requirement. We should ensure the minimum difference to the U-boot dts and kernel DTS.
So I suggesst to add bootph- properties to the nodes should be initialized at u-boot stage.

Regards,
Joseph

