Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D7D109C04A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 17:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lvhnuN/Jk7PbliFV6SwyT1szUstRwICACIXrSF3NtM=; b=41ZiEimKjYRTpVznIpyQUGHqTm
	SV1KjTJGQ/yGK110Z3z+8+/CnEP6fTjC8teNuYMk3fy8xmq6ToN8mY6VUMBz8nVzZSTscZQGS9dpX
	lyS5mzkZqfoKeFee/q/N9j1nmGGZy5PXcIccEG10fi7CDYXeWw+wYq2ry+0t5jCp446NIYyhQITjJ
	C1yy6RfruOMOcxvixhYt1FQcPwkaq1TYZKMRNs9ESOHMMd2MGDoV9Df1mbg0biILiEdYudnTlVVEA
	4FBXKFuOJCMkE5ujdZmHzBorbXQbjkcciV8LzC4XS+Y2qQJ26XxoCpJ6gcAOKHixtwRDvXN5svgXi
	As86p4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RyE-00000003zGy-3YiN;
	Wed, 25 Mar 2026 17:24:42 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RyB-00000003zGN-3uyN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 17:24:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w5Rxw-0006Z5-MU; Wed, 25 Mar 2026 18:24:24 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w5Rxw-0025yc-12;
	Wed, 25 Mar 2026 18:24:24 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w5Rxw-00000000Ekt-0vop;
	Wed, 25 Mar 2026 18:24:24 +0100
Message-ID: <3c33d7799fa96b99d4d2bd4f45fa928739346b23.camel@pengutronix.de>
Subject: Re: [PATCH v5 09/10] clk: realtek: Add RTD1625-CRT clock controller
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Date: Wed, 25 Mar 2026 18:24:24 +0100
In-Reply-To: <20260324025332.3416977-10-eleanor.lin@realtek.com>
References: <20260324025332.3416977-1-eleanor.lin@realtek.com>
	 <20260324025332.3416977-10-eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_102440_296049_F876667A 
X-CRM114-Status: GOOD (  18.46  )
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

On Di, 2026-03-24 at 10:53 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
>=20
> Add support for the CRT (Clock, Reset, and Test) controller on the Realte=
k
> RTD1625 SoC. This driver provides clock and reset management for the
> system, allowing peripheral clients to request necessary resources for
> operation.
>=20
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v5:
> - Added '#include <dt-bindings/reset/realtek,rtd1625.h>'.
> - Replaced rtk_reset_bank array with rtk_reset_desc descriptor.
> - Implemented complete a mapping table for all reset IDs.
> ---
>  drivers/clk/realtek/Kconfig           |  14 +
>  drivers/clk/realtek/Makefile          |   1 +
>  drivers/clk/realtek/clk-rtd1625-crt.c | 913 ++++++++++++++++++++++++++
>  3 files changed, 928 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-rtd1625-crt.c
>=20
[...]
> diff --git a/drivers/clk/realtek/clk-rtd1625-crt.c b/drivers/clk/realtek/=
clk-rtd1625-crt.c
> new file mode 100644
> index 000000000000..a56978aef83a
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-crt.c
> @@ -0,0 +1,913 @@
[...]
> +static struct rtk_reset_desc rtd1625_crt_reset_descs[] =3D {
> +	/* Bank 0: offset 0x0 */
> +	[RTD1625_CRT_RSTN_MISC]         =3D { .ofs =3D 0x0, .bit =3D 0,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DIP]          =3D { .ofs =3D 0x0, .bit =3D 2,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_GSPI]         =3D { .ofs =3D 0x0, .bit =3D 4,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SDS]          =3D { .ofs =3D 0x0, .bit =3D 6,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SDS_REG]      =3D { .ofs =3D 0x0, .bit =3D 8,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SDS_PHY]      =3D { .ofs =3D 0x0, .bit =3D 10, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_GPU2D]        =3D { .ofs =3D 0x0, .bit =3D 12, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DC_PHY]       =3D { .ofs =3D 0x0, .bit =3D 22, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DCPHY_CRT]    =3D { .ofs =3D 0x0, .bit =3D 24, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_LSADC]        =3D { .ofs =3D 0x0, .bit =3D 26, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SE]           =3D { .ofs =3D 0x0, .bit =3D 28, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DLA]          =3D { .ofs =3D 0x0, .bit =3D 30, .write=
_en =3D 1 },
> +	/* Bank 1: offset 0x4 */
> +	[RTD1625_CRT_RSTN_JPEG]         =3D { .ofs =3D 0x4, .bit =3D 0,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SD]           =3D { .ofs =3D 0x4, .bit =3D 2,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SDIO]         =3D { .ofs =3D 0x4, .bit =3D 6,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCR_CNT]      =3D { .ofs =3D 0x4, .bit =3D 8,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0_STITCH] =3D { .ofs =3D 0x4, .bit =3D 10, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0_PHY]    =3D { .ofs =3D 0x4, .bit =3D 12, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0]        =3D { .ofs =3D 0x4, .bit =3D 14, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0_CORE]   =3D { .ofs =3D 0x4, .bit =3D 16, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0_POWER]  =3D { .ofs =3D 0x4, .bit =3D 18, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0_NONSTICH] =3D { .ofs =3D 0x4, .bit =3D 20, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0_PHY_MDIO] =3D { .ofs =3D 0x4, .bit =3D 22, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE0_SGMII_MDIO] =3D { .ofs =3D 0x4, .bit =3D 24, .w=
rite_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VO2]          =3D { .ofs =3D 0x4, .bit =3D 28, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MISC_SC0]     =3D { .ofs =3D 0x4, .bit =3D 30, .write=
_en =3D 1 },
> +	/* Bank 2: offset 0x8 */
> +	[RTD1625_CRT_RSTN_MD]           =3D { .ofs =3D 0x8, .bit =3D 4,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_LVDS1]        =3D { .ofs =3D 0x8, .bit =3D 6,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_LVDS2]        =3D { .ofs =3D 0x8, .bit =3D 8,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MISC_SC1]     =3D { .ofs =3D 0x8, .bit =3D 10, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_I2C_3]        =3D { .ofs =3D 0x8, .bit =3D 12, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_FAN]          =3D { .ofs =3D 0x8, .bit =3D 14, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_TVE]          =3D { .ofs =3D 0x8, .bit =3D 16, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_AIO]          =3D { .ofs =3D 0x8, .bit =3D 18, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VO]           =3D { .ofs =3D 0x8, .bit =3D 20, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MIPI_CSI]     =3D { .ofs =3D 0x8, .bit =3D 22, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_HDMIRX]       =3D { .ofs =3D 0x8, .bit =3D 24, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_HDMIRX_WRAP]  =3D { .ofs =3D 0x8, .bit =3D 26, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_HDMI]         =3D { .ofs =3D 0x8, .bit =3D 28, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DISP]         =3D { .ofs =3D 0x8, .bit =3D 30, .write=
_en =3D 1 },
> +	/* Bank 3: offset 0xc */
> +	[RTD1625_CRT_RSTN_SATA_PHY_POW1] =3D { .ofs =3D 0xc, .bit =3D 0,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SATA_PHY_POW0] =3D { .ofs =3D 0xc, .bit =3D 2,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SATA_MDIO1]   =3D { .ofs =3D 0xc, .bit =3D 4,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SATA_MDIO0]   =3D { .ofs =3D 0xc, .bit =3D 6,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SATA_WRAP]    =3D { .ofs =3D 0xc, .bit =3D 8,  .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SATA_MAC_P1]  =3D { .ofs =3D 0xc, .bit =3D 10, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SATA_MAC_P0]  =3D { .ofs =3D 0xc, .bit =3D 12, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SATA_MAC_COM] =3D { .ofs =3D 0xc, .bit =3D 14, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE1_STITCH] =3D { .ofs =3D 0xc, .bit =3D 16, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE1_PHY]     =3D { .ofs =3D 0xc, .bit =3D 18, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE1]         =3D { .ofs =3D 0xc, .bit =3D 20, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE1_CORE]   =3D { .ofs =3D 0xc, .bit =3D 22, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE1_POWER]  =3D { .ofs =3D 0xc, .bit =3D 24, .write=
_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE1_NONSTICH] =3D { .ofs =3D 0xc, .bit =3D 26, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE1_PHY_MDIO] =3D { .ofs =3D 0xc, .bit =3D 28, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_HDMITOP]      =3D { .ofs =3D 0xc, .bit =3D 30, .write=
_en =3D 1 },
> +	/* Bank 4: offset 0x68 */
> +	[RTD1625_CRT_RSTN_I2C_4]        =3D { .ofs =3D 0x68, .bit =3D 2,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_I2C_5]        =3D { .ofs =3D 0x68, .bit =3D 4,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_TSIO]         =3D { .ofs =3D 0x68, .bit =3D 6,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VI]           =3D { .ofs =3D 0x68, .bit =3D 8,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_EDP]          =3D { .ofs =3D 0x68, .bit =3D 10, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VE1_MMU]      =3D { .ofs =3D 0x68, .bit =3D 12, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VE1_MMU_FUNC] =3D { .ofs =3D 0x68, .bit =3D 14, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_HSE_MMU]      =3D { .ofs =3D 0x68, .bit =3D 16, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_HSE_MMU_FUNC] =3D { .ofs =3D 0x68, .bit =3D 18, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MDLM2M]       =3D { .ofs =3D 0x68, .bit =3D 20, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_ISO_GSPI]     =3D { .ofs =3D 0x68, .bit =3D 22, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SOFT_NPU]     =3D { .ofs =3D 0x68, .bit =3D 24, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SPI2EMMC]     =3D { .ofs =3D 0x68, .bit =3D 26, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_EARC]         =3D { .ofs =3D 0x68, .bit =3D 28, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VE1]          =3D { .ofs =3D 0x68, .bit =3D 30, .writ=
e_en =3D 1 },
> +	/* Bank 5: offset 0x90 */
> +	[RTD1625_CRT_RSTN_PCIE2_STITCH]  =3D { .ofs =3D 0x90, .bit =3D 0,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE2_PHY]    =3D { .ofs =3D 0x90, .bit =3D 2,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE2]        =3D { .ofs =3D 0x90, .bit =3D 4,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE2_CORE]   =3D { .ofs =3D 0x90, .bit =3D 6,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE2_POWER]  =3D { .ofs =3D 0x90, .bit =3D 8,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE2_NONSTICH] =3D { .ofs =3D 0x90, .bit =3D 10, .wr=
ite_en =3D 1 },
> +	[RTD1625_CRT_RSTN_PCIE2_PHY_MDIO] =3D { .ofs =3D 0x90, .bit =3D 12, .wr=
ite_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DCPHY_UMCTL2] =3D { .ofs =3D 0x90, .bit =3D 14, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MIPI_DSI]     =3D { .ofs =3D 0x90, .bit =3D 16, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_HIFM]         =3D { .ofs =3D 0x90, .bit =3D 18, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_NSRAM]        =3D { .ofs =3D 0x90, .bit =3D 20, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_AUCPU0_REG]   =3D { .ofs =3D 0x90, .bit =3D 22, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MDL_GENPW]    =3D { .ofs =3D 0x90, .bit =3D 24, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MDL_CHIP]     =3D { .ofs =3D 0x90, .bit =3D 26, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MDL_IP]       =3D { .ofs =3D 0x90, .bit =3D 28, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_TEST_MUX]     =3D { .ofs =3D 0x90, .bit =3D 30, .writ=
e_en =3D 1 },
> +	/* Bank 6: offset 0xb8 */
> +	[RTD1625_CRT_RSTN_ISO_BIST]     =3D { .ofs =3D 0xb8, .bit =3D 0,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MAIN_BIST]    =3D { .ofs =3D 0xb8, .bit =3D 2,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_MAIN2_BIST]   =3D { .ofs =3D 0xb8, .bit =3D 4,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VE1_BIST]     =3D { .ofs =3D 0xb8, .bit =3D 6,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VE2_BIST]     =3D { .ofs =3D 0xb8, .bit =3D 8,  .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DCPHY_BIST]   =3D { .ofs =3D 0xb8, .bit =3D 10, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_GPU_BIST]     =3D { .ofs =3D 0xb8, .bit =3D 12, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DISP_BIST]    =3D { .ofs =3D 0xb8, .bit =3D 14, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_NPU_BIST]     =3D { .ofs =3D 0xb8, .bit =3D 16, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_CAS_BIST]     =3D { .ofs =3D 0xb8, .bit =3D 18, .writ=
e_en =3D 1 },
> +	[RTD1625_CRT_RSTN_VE4_BIST]     =3D { .ofs =3D 0xb8, .bit =3D 20, .writ=
e_en =3D 1 },
> +	/* Bank 7: offset 0x454 (DUMMY0, no write_en) */
> +	[RTD1625_CRT_RSTN_EMMC]         =3D { .ofs =3D 0x454, .bit =3D 0 },
> +	/* Bank 8: offset 0x458 (DUMMY1, no write_en) */
> +	[RTD1625_CRT_RSTN_GPU]          =3D { .ofs =3D 0x458, .bit =3D 0 },
> +	/* Bank 9: offset 0x464 (DUMMY4, no write_en) */
> +	[RTD1625_CRT_RSTN_VE2]          =3D { .ofs =3D 0x464, .bit =3D 0 },
> +	/* Bank 10: offset 0x880 */
> +	[RTD1625_CRT_RSTN_UR1]          =3D { .ofs =3D 0x880, .bit =3D 0,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR2]          =3D { .ofs =3D 0x880, .bit =3D 2,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR3]          =3D { .ofs =3D 0x880, .bit =3D 4,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR4]          =3D { .ofs =3D 0x880, .bit =3D 6,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR5]          =3D { .ofs =3D 0x880, .bit =3D 8,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR6]          =3D { .ofs =3D 0x880, .bit =3D 10, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR7]          =3D { .ofs =3D 0x880, .bit =3D 12, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR8]          =3D { .ofs =3D 0x880, .bit =3D 14, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR9]          =3D { .ofs =3D 0x880, .bit =3D 16, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_UR_TOP]       =3D { .ofs =3D 0x880, .bit =3D 18, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_I2C_7]        =3D { .ofs =3D 0x880, .bit =3D 28, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_I2C_6]        =3D { .ofs =3D 0x880, .bit =3D 30, .wri=
te_en =3D 1 },
> +	/* Bank 11: offset 0x890 */
> +	[RTD1625_CRT_RSTN_SPI0]         =3D { .ofs =3D 0x890, .bit =3D 0,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SPI1]         =3D { .ofs =3D 0x890, .bit =3D 2,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_SPI2]         =3D { .ofs =3D 0x890, .bit =3D 4,  .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_LSADC0]       =3D { .ofs =3D 0x890, .bit =3D 16, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_LSADC1]       =3D { .ofs =3D 0x890, .bit =3D 18, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_ISOMIS_DMA]   =3D { .ofs =3D 0x890, .bit =3D 20, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_AUDIO_ADC]    =3D { .ofs =3D 0x890, .bit =3D 22, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_DPTX]         =3D { .ofs =3D 0x890, .bit =3D 24, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_AUCPU1_REG]   =3D { .ofs =3D 0x890, .bit =3D 26, .wri=
te_en =3D 1 },
> +	[RTD1625_CRT_RSTN_EDPTX]        =3D { .ofs =3D 0x890, .bit =3D 28, .wri=
te_en =3D 1 },
> +};

These should be moved into the reset driver. Then rtk_reset_desc
doesn't have to be a public interface between the clk and reset drivers
anymore.

regards
Philipp

