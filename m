Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF330CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEUp3ZqBgh9KoGkws0BcDw7gBCtxq/9KFh0GdsYff+c=; b=JruELgtrlLk055KJfaoi3RPfR+
	YPddMLyvRMEdn0xCjXN9i2v1emirlSDUZOpAOM/C+EXSJWjtgOyBFhrH1kljqOutADGW2ESiucIwj
	pd7AiNDV1c/K9zqzI91V3ZPrZmbZ3t4aIVORiOrc7Ko/o5w+fdOhw94ClX4ttFb2WBmO14RoTQJBK
	F6N6qanBWSYo8/9hIxJPZarJBwY11+fPxo1ifz5yvbGCaKYROg+zyqjGhF+Wykfap99pwccvMPjkh
	E0cw9vGG9ur894Aai+ikQgr2ZszEy6UC6QuOueR4592fiQzj2o5dmFsyNofoJ3dZ4R/FAVWThc3Pz
	+qqYtOsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMTI-0000000HOla-2oR9;
	Fri, 07 Nov 2025 13:25:44 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMTG-0000000HOkk-2j9Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 13:25:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHMSs-0003sU-BP; Fri, 07 Nov 2025 14:25:18 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHMSr-007XJd-1f;
	Fri, 07 Nov 2025 14:25:17 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHMSr-000000007Qg-1ovb;
	Fri, 07 Nov 2025 14:25:17 +0100
Message-ID: <266f305c257e1735ff27524f11f11c1e3a55e3a2.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] Reset: cix: add support for cix sky1 resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Gary Yang <gary.yang@cixtech.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, cix-kernel-upstream@cixtech.com
Date: Fri, 07 Nov 2025 14:25:17 +0100
In-Reply-To: <20251107033819.587712-3-gary.yang@cixtech.com>
References: <20251107033819.587712-1-gary.yang@cixtech.com>
	 <20251107033819.587712-3-gary.yang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_052542_993135_E31943E8 
X-CRM114-Status: GOOD (  19.58  )
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

On Fr, 2025-11-07 at 11:38 +0800, Gary Yang wrote:
> There are two reset controllers on Cix Sky1 Soc.
> One is located in S0 domain, and the other is located
> in S5 domain.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  drivers/reset/Kconfig      |   7 +
>  drivers/reset/Makefile     |   1 +
>  drivers/reset/reset-sky1.c | 403 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 411 insertions(+)
>  create mode 100644 drivers/reset/reset-sky1.c
>=20
[...]
> diff --git a/drivers/reset/reset-sky1.c b/drivers/reset/reset-sky1.c
> new file mode 100644
> index 000000000000..14aa7292c0d5
> --- /dev/null
> +++ b/drivers/reset/reset-sky1.c
> @@ -0,0 +1,403 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *
> + * CIX System Reset Controller (SRC) driver
> + *
> + * Author: Jerry Zhu <jerry.zhu@cixtech.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/mfd/syscon.h>

This appears to be unused.

Is this a left-over or did you intend to register the regmap with
syscon?

> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/reset/cix,sky1-rst.h>
> +#include <dt-bindings/reset/cix,sky1-rst-fch.h>
> +
> +#define SKY1_RESET_SLEEP_MIN_US		10000
> +#define SKY1_RESET_SLEEP_MAX_US		20000
> +
> +struct sky1_src_signal {
> +	unsigned int offset, mask;

Since all masks only contain a single BIT(), consider storing the bit
index instead.

> +};
> +
> +struct sky1_src_variant {
> +	const struct sky1_src_signal *signals;
> +	unsigned int signals_num;
> +};
> +
> +struct sky1_src {
> +	struct reset_controller_dev rcdev;
> +	struct regmap *regmap;
> +	const struct sky1_src_signal *signals;
> +};
> +
> +enum {
> +	CSU_PM_RESET				=3D 0x304,
> +	SENSORHUB_RESET				=3D 0x308,
> +	SENSORHUB_NOC_RESET			=3D 0x30c,
> +
> +	RESET_GROUP0_S0_DOMAIN_0		=3D 0x400,
> +	RESET_GROUP0_S0_DOMAIN_1		=3D 0x404,
> +	RESET_GROUP1_USB_PHYS			=3D 0x408,
> +	RESET_GROUP1_USB_CONTROLLERS		=3D 0x40c,
> +
> +	RESET_GROUP0_RCSU			=3D 0x800,
> +	RESET_GROUP1_RCSU			=3D 0x804,
> +
> +};
> +
> +static const struct sky1_src_signal sky1_src_signals[SKY1_RESET_NUM] =3D=
 {

Just drop SKY1_RESET_NUM.

> +	/* reset group1 for s0 domain modules */
> +	[SKY1_CSU_PM_RESET_N]		=3D { CSU_PM_RESET, BIT(0) },
> +	[SKY1_SENSORHUB_RESET_N]	=3D { SENSORHUB_RESET, BIT(0) },
> +	[SKY1_SENSORHUB_NOC_RESET_N]	=3D { SENSORHUB_NOC_RESET, BIT(0) },
> +	[SKY1_DDRC_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(0) },
> +	[SKY1_GIC_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(1) },
> +	[SKY1_CI700_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(2) },
> +	[SKY1_SYS_NI700_RESET_N]	=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(3) },
> +	[SKY1_MM_NI700_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(4) },
> +	[SKY1_PCIE_NI700_RESET_N]	=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(5) },
> +	[SKY1_GPU_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(6) },
> +	[SKY1_NPUTOP_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(7) },
> +	[SKY1_NPUCORE0_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(8) },
> +	[SKY1_NPUCORE1_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(9) },
> +	[SKY1_NPUCORE2_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(10) },
> +	[SKY1_VPU_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(11) },
> +	[SKY1_ISP_SRESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(12) },
> +	[SKY1_ISP_ARESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(13) },
> +	[SKY1_ISP_HRESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(14) },
> +	[SKY1_ISP_GDCRESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(15) },
> +	[SKY1_DPU_RESET0_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(16) },
> +	[SKY1_DPU_RESET1_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(17) },
> +	[SKY1_DPU_RESET2_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(18) },
> +	[SKY1_DPU_RESET3_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(19) },
> +	[SKY1_DPU_RESET4_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(20) },
> +	[SKY1_DP_RESET0_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(21) },
> +	[SKY1_DP_RESET1_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(22) },
> +	[SKY1_DP_RESET2_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(23) },
> +	[SKY1_DP_RESET3_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(24) },
> +	[SKY1_DP_RESET4_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(25) },
> +	[SKY1_DP_PHY_RST_N]		=3D { RESET_GROUP0_S0_DOMAIN_0, BIT(26) },
> +
> +	/* reset group1 for s0 domain modules */
> +	[SKY1_AUDIO_HIFI5_RESET_N]	=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(0) },
> +	[SKY1_AUDIO_HIFI5_NOC_RESET_N]	=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(1) }=
,
> +	[SKY1_CSIDPHY_PRST0_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(2) },
> +	[SKY1_CSIDPHY_CMNRST0_N]	=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(3) },
> +	[SKY1_CSI0_RST_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(4) },
> +	[SKY1_CSIDPHY_PRST1_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(5) },
> +	[SKY1_CSIDPHY_CMNRST1_N]	=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(6) },
> +	[SKY1_CSI1_RST_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(7) },
> +	[SKY1_CSI2_RST_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(8) },
> +	[SKY1_CSI3_RST_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(9) },
> +	[SKY1_CSIBRDGE0_RST_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(10) },
> +	[SKY1_CSIBRDGE1_RST_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(11) },
> +	[SKY1_CSIBRDGE2_RST_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(12) },
> +	[SKY1_CSIBRDGE3_RST_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(13) },
> +	[SKY1_GMAC0_RST_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(14) },
> +	[SKY1_GMAC1_RST_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(15) },
> +	[SKY1_PCIE0_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(16) },
> +	[SKY1_PCIE1_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(17) },
> +	[SKY1_PCIE2_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(18) },
> +	[SKY1_PCIE3_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(19) },
> +	[SKY1_PCIE4_RESET_N]		=3D { RESET_GROUP0_S0_DOMAIN_1, BIT(20) },
> +
> +	/* reset group1 for usb phys */
> +	[SKY1_USB_DP_PHY0_PRST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(0) },
> +	[SKY1_USB_DP_PHY1_PRST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(1) },
> +	[SKY1_USB_DP_PHY2_PRST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(2) },
> +	[SKY1_USB_DP_PHY3_PRST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(3) },
> +	[SKY1_USB_DP_PHY0_RST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(4) },
> +	[SKY1_USB_DP_PHY1_RST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(5) },
> +	[SKY1_USB_DP_PHY2_RST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(6) },
> +	[SKY1_USB_DP_PHY3_RST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(7) },
> +	[SKY1_USBPHY_SS_PST_N]			=3D { RESET_GROUP1_USB_PHYS, BIT(8) },
> +	[SKY1_USBPHY_SS_RST_N]			=3D { RESET_GROUP1_USB_PHYS, BIT(9) },
> +	[SKY1_USBPHY_HS0_PRST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(10) },
> +	[SKY1_USBPHY_HS1_PRST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(11) },
> +	[SKY1_USBPHY_HS2_PRST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(12) },
> +	[SKY1_USBPHY_HS3_PRST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(13) },
> +	[SKY1_USBPHY_HS4_PRST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(14) },
> +	[SKY1_USBPHY_HS5_PRST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(15) },
> +	[SKY1_USBPHY_HS6_PRST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(16) },
> +	[SKY1_USBPHY_HS7_PRST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(17) },
> +	[SKY1_USBPHY_HS8_PRST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(18) },
> +	[SKY1_USBPHY_HS9_PRST_N]		=3D { RESET_GROUP1_USB_PHYS, BIT(19) },
> +
> +	/* reset group1 for usb controllers */
> +	[SKY1_USBC_SS0_PRST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(0) },
> +	[SKY1_USBC_SS1_PRST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(1) },
> +	[SKY1_USBC_SS2_PRST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(2) },
> +	[SKY1_USBC_SS3_PRST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(3) },
> +	[SKY1_USBC_SS4_PRST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(4) },
> +	[SKY1_USBC_SS5_PRST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(5) },
> +	[SKY1_USBC_SS0_RST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(6) },
> +	[SKY1_USBC_SS1_RST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(7) },
> +	[SKY1_USBC_SS2_RST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(8) },
> +	[SKY1_USBC_SS3_RST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(9) },
> +	[SKY1_USBC_SS4_RST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(10) },
> +	[SKY1_USBC_SS5_RST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(11) },
> +	[SKY1_USBC_HS0_PRST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(12) },
> +	[SKY1_USBC_HS1_PRST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(13) },
> +	[SKY1_USBC_HS2_PRST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(14) },
> +	[SKY1_USBC_HS3_PRST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(15) },
> +	[SKY1_USBC_HS0_RST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(16) },
> +	[SKY1_USBC_HS1_RST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(17) },
> +	[SKY1_USBC_HS2_RST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(18) },
> +	[SKY1_USBC_HS3_RST_N]		=3D { RESET_GROUP1_USB_CONTROLLERS, BIT(19) },
> +
> +	/* reset group0 for rcsu */
> +	[SKY1_AUDIO_RCSU_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(0) },
> +	[SKY1_CI700_RCSU_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(1) },
> +	[SKY1_CSI_RCSU0_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(2) },
> +	[SKY1_CSI_RCSU1_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(3) },
> +	[SKY1_CSU_PM_RCSU_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(4) },
> +	[SKY1_DDR_BROADCAST_RCSU_RESET_N]	=3D { RESET_GROUP0_RCSU, BIT(5) },
> +	[SKY1_DDR_CTRL_RCSU_0_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(6) },
> +	[SKY1_DDR_CTRL_RCSU_1_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(7) },
> +	[SKY1_DDR_CTRL_RCSU_2_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(8) },
> +	[SKY1_DDR_CTRL_RCSU_3_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(9) },
> +	[SKY1_DDR_TZC400_RCSU_0_RESET_N]	=3D { RESET_GROUP0_RCSU, BIT(10) },
> +	[SKY1_DDR_TZC400_RCSU_1_RESET_N]	=3D { RESET_GROUP0_RCSU, BIT(11) },
> +	[SKY1_DDR_TZC400_RCSU_2_RESET_N]	=3D { RESET_GROUP0_RCSU, BIT(12) },
> +	[SKY1_DDR_TZC400_RCSU_3_RESET_N]	=3D { RESET_GROUP0_RCSU, BIT(13) },
> +	[SKY1_DP0_RCSU_RESET_N]			=3D { RESET_GROUP0_RCSU, BIT(14) },
> +	[SKY1_DP1_RCSU_RESET_N]			=3D { RESET_GROUP0_RCSU, BIT(15) },
> +	[SKY1_DP2_RCSU_RESET_N]			=3D { RESET_GROUP0_RCSU, BIT(16) },
> +	[SKY1_DP3_RCSU_RESET_N]			=3D { RESET_GROUP0_RCSU, BIT(17) },
> +	[SKY1_DP4_RCSU_RESET_N]			=3D { RESET_GROUP0_RCSU, BIT(18) },
> +	[SKY1_DPU0_RCSU_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(19) },
> +	[SKY1_DPU1_RCSU_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(20) },
> +	[SKY1_DPU2_RCSU_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(21) },
> +	[SKY1_DPU3_RCSU_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(22) },
> +	[SKY1_DPU4_RCSU_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(23) },
> +	[SKY1_DSU_RCSU_RESET_N]			=3D { RESET_GROUP0_RCSU, BIT(24) },
> +	[SKY1_FCH_RCSU_RESET_N]			=3D { RESET_GROUP0_RCSU, BIT(25) },
> +	[SKY1_GICD_RCSU_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(26) },
> +	[SKY1_GMAC_RCSU_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(27) },
> +	[SKY1_GPU_RCSU_RESET_N]			=3D { RESET_GROUP0_RCSU, BIT(28) },
> +	[SKY1_ISP_RCSU0_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(29) },
> +	[SKY1_ISP_RCSU1_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(30) },
> +	[SKY1_NI700_MMHUB_RCSU_RESET_N]		=3D { RESET_GROUP0_RCSU, BIT(31) },
> +
> +	/* reset group1 for rcsu */
> +	[SKY1_NPU_RCSU_RESET_N]			=3D { RESET_GROUP1_RCSU, BIT(0) },
> +	[SKY1_NI700_PCIE_RCSU_RESET_N]		=3D { RESET_GROUP1_RCSU, BIT(1) },
> +	[SKY1_PCIE_X421_RCSU_RESET_N]		=3D { RESET_GROUP1_RCSU, BIT(2) },
> +	[SKY1_PCIE_X8_RCSU_RESET_N]		=3D { RESET_GROUP1_RCSU, BIT(3) },
> +	[SKY1_SF_RCSU_RESET_N]			=3D { RESET_GROUP1_RCSU, BIT(4) },
> +	[SKY1_RCSU_SMMU_MMHUB_RESET_N]		=3D { RESET_GROUP1_RCSU, BIT(5) },
> +	[SKY1_RCSU_SMMU_PCIEHUB_RESET_N]	=3D { RESET_GROUP1_RCSU, BIT(6) },
> +	[SKY1_RCSU_SYSHUB_RESET_N]		=3D { RESET_GROUP1_RCSU, BIT(7) },
> +	[SKY1_NI700_SMN_RCSU_RESET_N]		=3D { RESET_GROUP1_RCSU, BIT(8) },
> +	[SKY1_NI700_SYSHUB_RCSU_RESET_N]	=3D { RESET_GROUP1_RCSU, BIT(9) },
> +	[SKY1_RCSU_USB2_HOST0_RESET_N]		=3D { RESET_GROUP1_RCSU, BIT(10) },
> +	[SKY1_RCSU_USB2_HOST1_RESET_N]		=3D { RESET_GROUP1_RCSU, BIT(11) },
> +	[SKY1_RCSU_USB2_HOST2_RESET_N]		=3D { RESET_GROUP1_RCSU, BIT(12) },
> +	[SKY1_RCSU_USB2_HOST3_RESET_N]		=3D { RESET_GROUP1_RCSU, BIT(13) },
> +	[SKY1_RCSU_USB3_TYPEA_DRD_RESET_N]	=3D { RESET_GROUP1_RCSU, BIT(14) },
> +	[SKY1_RCSU_USB3_TYPEC_DRD_RESET_N]	=3D { RESET_GROUP1_RCSU, BIT(15) },
> +	[SKY1_RCSU_USB3_TYPEC_HOST0_RESET_N]	=3D { RESET_GROUP1_RCSU, BIT(16) }=
,
> +	[SKY1_RCSU_USB3_TYPEC_HOST1_RESET_N]	=3D { RESET_GROUP1_RCSU, BIT(17) }=
,
> +	[SKY1_RCSU_USB3_TYPEC_HOST2_RESET_N]	=3D { RESET_GROUP1_RCSU, BIT(18) }=
,
> +	[SKY1_VPU_RCSU_RESET_N]			=3D { RESET_GROUP1_RCSU, BIT(19) },
> +
> +};
> +
> +enum {
> +	FCH_SW_RST_FUNC			=3D 0x008,
> +	FCH_SW_RST_BUS			=3D 0x00c,
> +	FCH_SW_XSPI			=3D 0x010,
> +};
> +
> +static const struct sky1_src_signal sky1_src_fch_signals[SKY1_FCH_RESET_=
NUM] =3D {

Same, drop SKY1_FCH_RESET_NUM.

> +	/* resets for fch_sw_rst_func */
> +	[SW_I3C0_RST_FUNC_G_N]	=3D { FCH_SW_RST_FUNC, BIT(0) },
> +	[SW_I3C0_RST_FUNC_I_N]	=3D { FCH_SW_RST_FUNC, BIT(1) },
> +	[SW_I3C1_RST_FUNC_G_N]	=3D { FCH_SW_RST_FUNC, BIT(2) },
> +	[SW_I3C1_RST_FUNC_I_N]	=3D { FCH_SW_RST_FUNC, BIT(3) },
> +	[SW_UART0_RST_FUNC_N]	=3D { FCH_SW_RST_FUNC, BIT(4) },
> +	[SW_UART1_RST_FUNC_N]	=3D { FCH_SW_RST_FUNC, BIT(5) },
> +	[SW_UART2_RST_FUNC_N]	=3D { FCH_SW_RST_FUNC, BIT(6) },
> +	[SW_UART3_RST_FUNC_N]	=3D { FCH_SW_RST_FUNC, BIT(7) },
> +	[SW_TIMER_RST_FUNC_N]	=3D { FCH_SW_RST_FUNC, BIT(20) },
> +
> +	/* resets for fch_sw_rst_bus */
> +	[SW_I3C0_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(0) },
> +	[SW_I3C1_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(1) },
> +	[SW_DMA_RST_AXI_N]	=3D { FCH_SW_RST_BUS, BIT(2) },
> +	[SW_UART0_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(4) },
> +	[SW_UART1_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(5) },
> +	[SW_UART2_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(6) },
> +	[SW_UART3_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(7) },
> +	[SW_SPI0_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(8) },
> +	[SW_SPI1_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(9) },
> +	[SW_I2C0_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(12) },
> +	[SW_I2C1_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(13) },
> +	[SW_I2C2_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(14) },
> +	[SW_I2C3_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(15) },
> +	[SW_I2C4_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(16) },
> +	[SW_I2C5_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(17) },
> +	[SW_I2C6_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(18) },
> +	[SW_I2C7_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(19) },
> +	[SW_GPIO_RST_APB_N]	=3D { FCH_SW_RST_BUS, BIT(21) },
> +
> +	/* resets for fch_sw_xspi */
> +	[SW_XSPI_REG_RST_N]	=3D { FCH_SW_XSPI, BIT(0) },
> +	[SW_XSPI_SYS_RST_N]	=3D { FCH_SW_XSPI, BIT(1) },
> +};
> +
> +static struct sky1_src *to_sky1_src(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct sky1_src, rcdev);
> +}
> +
> +static int sky1_reset_update(struct sky1_src *sky1src,
> +			     unsigned long id, unsigned int value)
> +{
> +	const struct sky1_src_signal *signal =3D &sky1src->signals[id];
> +
> +	return regmap_update_bits(sky1src->regmap,
> +				  signal->offset, signal->mask, value);
> +}
> +
> +static int sky1_reset_set(struct reset_controller_dev *rcdev,
> +			  unsigned long id, bool assert)
> +{
> +	struct sky1_src *sky1src =3D to_sky1_src(rcdev);
> +	unsigned int value =3D assert ? 0 : sky1src->signals[id].mask;
> +
> +	return sky1_reset_update(sky1src, id, value);
> +}

Merge sky1_reset_update() and sky1_reset_set() into a single function.

> +
> +static int sky1_reset(struct reset_controller_dev *rcdev,
> +			     unsigned long id)
> +{
> +	sky1_reset_set(rcdev, id, true);
> +	usleep_range(SKY1_RESET_SLEEP_MIN_US,
> +		     SKY1_RESET_SLEEP_MAX_US);
> +
> +	sky1_reset_set(rcdev, id, false);
> +
> +	/*
> +	 * Ensure component is taken out reset state by sleeping also after
> +	 * deasserting the reset, Otherwise, the component may not be ready
> +	 * for operation.
> +	 */
> +	usleep_range(SKY1_RESET_SLEEP_MIN_US,
> +		     SKY1_RESET_SLEEP_MAX_US);

Why is the delay needed here but not in sky1_reset_deassert()?

> +	return 0;
> +}
> +
> +static int sky1_reset_assert(struct reset_controller_dev *rcdev,
> +			     unsigned long id)
> +{
> +	return sky1_reset_set(rcdev, id, true);
> +}
> +
> +static int sky1_reset_deassert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	return sky1_reset_set(rcdev, id, false);
> +}
> +
> +static int sky1_reset_status(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	unsigned int value =3D 0;
> +	struct sky1_src *sky1_src =3D to_sky1_src(rcdev);
> +	const struct sky1_src_signal *signal =3D &sky1_src->signals[id];
> +
> +	regmap_read(sky1_src->regmap, signal->offset, &value);
> +	return !(value & signal->mask);
> +}
> +
> +static const struct reset_control_ops sky1_src_ops =3D {
> +	.reset    =3D sky1_reset,
> +	.assert   =3D sky1_reset_assert,
> +	.deassert =3D sky1_reset_deassert,
> +	.status   =3D sky1_reset_status
> +};
> +
> +static const struct sky1_src_variant variant_sky1 =3D {
> +	.signals =3D sky1_src_signals,
> +	.signals_num =3D ARRAY_SIZE(sky1_src_signals),
> +};
> +
> +static const struct sky1_src_variant variant_sky1_fch =3D {
> +	.signals =3D sky1_src_fch_signals,
> +	.signals_num =3D ARRAY_SIZE(sky1_src_fch_signals),
> +};
> +
> +static const struct regmap_config sky1_src_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.name =3D "src",
> +};
> +
> +static int sky1_reset_probe(struct platform_device *pdev)
> +{
> +	struct sky1_src *sky1src;
> +	struct device *dev =3D &pdev->dev;
> +	void __iomem *base;
> +	const struct sky1_src_variant *variant =3D device_get_match_data(dev);
> +
> +	sky1src =3D devm_kzalloc(dev, sizeof(*sky1src), GFP_KERNEL);
> +	if (!sky1src)
> +		return -ENOMEM;
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	sky1src->regmap =3D devm_regmap_init_mmio(dev, base, &sky1_src_config);
> +	if (IS_ERR(sky1src->regmap)) {
> +		dev_err(dev, "Unable to get sky1-src regmap");

I'd use dev_err_probe() to also print the error value.

regards
Philipp

