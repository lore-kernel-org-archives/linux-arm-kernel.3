Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B7ACA5FEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 07:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJ/ZrGYE0VStKIMF0lxpsDXfJ/m31aMLwQ/JSXrwc44=; b=IoUn9oVeFOm9NHQeRYgAYoOxA5
	mUFcvPGUfZWd62IGZGB75hy28myhFKtbJW1V71LzVHBPX+FUqsdsYQZqGBJb0LvbxUE1J6bVicStz
	TXyqAWGqvSoaK8tPVtjGwtDJnhZ2DQ51DeLbCOrWhlvlk1bNDKuAQRclCScLNcXFwU4UWLyzMDlMD
	LMkfSTX41hV43pNqsUQTH9cDPZ2siu2x2//bif6e8E10xGKmJ6Y/Xl9NQh5H4aGZOvv90MfS7VpSN
	qieZVL8AD3s7wiwIkm9or80FRow8GKXlEOLPyroFH1xKYbcWffaquIrV5v6+r9PcZuWuHj9fc/Cgb
	YW8q/M2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpM1U-0000000Exu4-3n2V;
	Mon, 09 Feb 2026 07:49:32 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpM1S-0000000Extf-0Dxm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 07:49:31 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 13A981A231C;
	Mon,  9 Feb 2026 08:49:26 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CF7021A0442;
	Mon,  9 Feb 2026 08:49:25 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A46F71800095;
	Mon,  9 Feb 2026 15:49:23 +0800 (+08)
Date: Mon, 9 Feb 2026 16:49:22 +0900
From: Yanan Yang <yanan.yang@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com,
	justin.jiang@nxp.com, Lei Xu <lei.xu@nxp.com>,
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <aYmRgsEoARQG8OQC@lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com>
References: <20260123-imx91s-frdm-v4-0-1bab038faee9@nxp.com>
 <20260123-imx91s-frdm-v4-2-1bab038faee9@nxp.com>
 <aXOTzHaLn6hFdMtR@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXOTzHaLn6hFdMtR@lizhi-Precision-Tower-5810>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_234930_391078_08296507 
X-CRM114-Status: GOOD (  15.02  )
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

On Fri, Jan 23, 2026 at 10:29:16AM -0500, Frank Li wrote:
> On Fri, Jan 23, 2026 at 03:42:00PM +0900, Yanan Yang wrote:
> > Add DeviceTree support for the NXP FRDM-IMX91S development board based
> > on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> > and differs in memory, storage, Ethernet, and PMIC configuration:
> >
> > - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> > - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> > - Single GbE port (FRDM-IMX91 has dual GbE)
> > - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> >
> > This DT enables:
> > - ADC1
> > - UART1 and UART5
> > - I2C bus and children nodes
> > - USB and related nodes
> > - uSDHC1 and uSDHC2
> > - FlexSPI NAND flash
> > - Watchdog3
> > - Ethernet (eqos)
> > - FlexCAN
> > - MQS
> >
> > Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91S
> > (FRDM-IMX91S board page)
> > Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91
> > (FRDM-IMX91 board page)
> >
> > Co-developed-by: Lei Xu <lei.xu@nxp.com>
> > Signed-off-by: Lei Xu <lei.xu@nxp.com>
> > Co-developed-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> > Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> > Signed-off-by: Yanan Yang <yanan.yang@nxp.com>
> >
> > ---
> ...
> > +
> > +&iomuxc {
> > +	bootph-pre-ram;
> > +	bootph-some-ram;
> > +
> > +	pinctrl_eqos: eqosgrp {
> > +		fsl,pins = <
> > +			MX91_PAD_ENET1_MDC__ENET1_MDC                           0x57e
> > +			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO                      0x57e
> > +			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0                  0x57e
> > +			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1                  0x57e
> > +			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2                  0x57e
> > +			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3                  0x57e
> > +			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC                  0x5fe
> > +			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL            0x57e
> > +			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0                  0x57e
> > +			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1                     0x57e
> > +			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2                  0x57e
> > +			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3                  0x57e
> > +			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK  0x5fe
> > +			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL            0x57e
> > +		>;
> > +	};
> 
> Plese usb tab before number.
> 
> Frank

Will fix it in v5, thanks

> > +
> ...
> > +&wdog3 {
> > +	pinctrl-0 = <&pinctrl_wdog>;
> > +	pinctrl-names = "default";
> > +	fsl,ext-reset-output;
> > +	status = "okay";
> > +};
> >
> > --
> > 2.43.0
> >

