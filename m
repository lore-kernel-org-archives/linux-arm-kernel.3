Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C13BF99C70
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 01:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zER3n2a1sDLiU2F5oNZ1x4GxyZ+TAbqRUaHTlIQjWc=; b=L7n7oT3rEOUmne/tEuLubXDVa8
	UfLZjYRam3vYLEq12Za8NeonGTEvyLW2hmlTf/6lXl6AZWQ/IygGNNh6oGkb4ZQvQgCfB6k3zJ4Dz
	80x6DRzz0RCfq0VFA0GhQtOPjjSOQAPHrWZ8jJc+enfxRzObiGf6IHMVAmdqXyLYuKxo8BygaWDw3
	CEXwNJfnmgKzeMujZuvdEpVNcFAZ2IVnC2R4IR58rTOAU49L8+nMCPu0UaYorgN6D617SLHx4SdKT
	198QyU2T82zuArirJ0HzMNx/3WtWl/oSFs02aQdnzC6N4fuZlgwueukc6eHmcm2AbDMowEQvTFALz
	a8pJDqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDuEo-00000004e3M-0baI;
	Sat, 18 Apr 2026 01:12:46 +0000
Received: from ms.puri.sm ([135.181.196.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDuEl-00000004e2c-2jRH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 01:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1776474758; bh=mmChPfcRDpqiw0FLemsBzoTj3ox+7KRwoQk45RTuLAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cPt86atWNRPzuNj+y5LfZz8WmilWhGgWUR2EJYuvlZAR2elMPkEqYMjzPbyDPjzlk
	 aBflYeZ4W9nrSVjQub4atcShp2gSlSfn0VtKK27QgRZKDjpFrJnpM8lNix+j5AigAo
	 01W8dNMhhFuKJaD2+pFJkHYKJliNPPYeR1QUjP4YEjTVjKbrXcHHcaW7RdloGe78xR
	 NN6OH5SELxuFpp8q0DeiVswsUmB/cAra0YRGXsVaz7tHwPt7FSmmMFQDm83+UnrgWa
	 sHHhdf2BT8jwSRPtpjAOO9ydOXBTIrhODXY7p8GDobwPH+0pHUFFReiO5ly/I+t/y+
	 deY2opENBN3uQ==
Received: from pliszka.localnet (79.184.67.253.ipv4.supernova.orange.pl [79.184.67.253])
	by ms.puri.sm (Postfix) with ESMTPSA id E0C341F6CB;
	Fri, 17 Apr 2026 18:12:37 -0700 (PDT)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, martin.kepplinger@puri.sm, Robby Cai <robby.cai@nxp.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mq: Correct MIPI CSI clocks
Date: Sat, 18 Apr 2026 03:12:24 +0200
Message-ID: <5956186.LvFx2qVVIh@pliszka>
In-Reply-To: <20260417110200.753678-2-robby.cai@nxp.com>
References: <20260417110200.753678-1-robby.cai@nxp.com>
 <20260417110200.753678-2-robby.cai@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_181243_867741_606EEFEE 
X-CRM114-Status: GOOD (  14.71  )
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

On pi=C4=85tek, 17 kwietnia 2026 13:01:59 czas =C5=9Brodkowoeuropejski letn=
i Robby Cai=20
wrote:
> CSI capture may intermittently fail due to mismatched clock rates. The
> previous configuration violated the timing requirement stated in the
> i.MX8MQ Reference Manual:
>=20
>   "The frequency of clk must be exactly equal to or greater than the RX
>    byte clock coming from the RX DPHY."
>=20
> Update the clock configuration to ensure that the CSI core clock rate is
> equal to or greater than the incoming DPHY byte clock. The updated clock
> ratios are consistent with those used in NXP's downstream BSP.

I believe this is a misreading of the docs.

IMX8MQ_CLK_CSIX_PHY_REF refers to the UI pixel clock (clk_ui), not the RX D=
PHY=20
byte clock. All this change would do is to break streaming with more than 1=
00=20
Mpixels per second / 1064 Mbps per MIPI lane.

As mentioned in the reference manual:

"The frequency of clk_ui must be such that the data received on the data_ou=
t=20
output is greater than or equal to the total bandwidth of the physical MIPI=
=20
interface. Clk_ui has no relationship requirement with regards to =E2=80=98=
clk=E2=80=99 other=20
than the bandwidth requirement mentioned previously."

> Fixes: bcadd5f66c2a ("arm64: dts: imx8mq: add mipi csi phy and csi bridge
> descriptions") Cc: stable@vger.kernel.org
> Signed-off-by: Robby Cai <robby.cai@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mq.dtsi index
> 6a25e219832c..165716d08e64 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -1377,7 +1377,7 @@ mipi_csi1: csi@30a70000 {
>  				assigned-clocks =3D <&clk=20
IMX8MQ_CLK_CSI1_CORE>,
>  				    <&clk=20
IMX8MQ_CLK_CSI1_PHY_REF>,
>  				    <&clk IMX8MQ_CLK_CSI1_ESC>;
> -				assigned-clock-rates =3D=20
<266000000>, <333000000>, <66000000>;
> +				assigned-clock-rates =3D=20
<133000000>, <100000000>, <66000000>;
>  				assigned-clock-parents =3D <&clk=20
IMX8MQ_SYS1_PLL_266M>,
>  					<&clk=20
IMX8MQ_SYS2_PLL_1000M>,
>  					<&clk=20
IMX8MQ_SYS1_PLL_800M>;
> @@ -1429,7 +1429,7 @@ mipi_csi2: csi@30b60000 {
>  				assigned-clocks =3D <&clk=20
IMX8MQ_CLK_CSI2_CORE>,
>  				    <&clk=20
IMX8MQ_CLK_CSI2_PHY_REF>,
>  				    <&clk IMX8MQ_CLK_CSI2_ESC>;
> -				assigned-clock-rates =3D=20
<266000000>, <333000000>, <66000000>;
> +				assigned-clock-rates =3D=20
<133000000>, <100000000>, <66000000>;
>  				assigned-clock-parents =3D <&clk=20
IMX8MQ_SYS1_PLL_266M>,
>  					<&clk=20
IMX8MQ_SYS2_PLL_1000M>,
>  					<&clk=20
IMX8MQ_SYS1_PLL_800M>;





