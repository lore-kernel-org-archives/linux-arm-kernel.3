Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC59D3514A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICvoVCRHMIyKZPWatorRc2YdWoTDd421WMgvZUug3mk=; b=x+UCbtS/biYGcVdua7bPEEVl2A
	7oHKUM5wNiWv5QqVW8DV9KW7PnQ97SGKgJUna6BS4YiSsNDIR/Jm9gtMhVmxvC8/f6MnqGre6UxX0
	hFelof7wSWNnRY8yHMGN6lFEo9j5v/ZKep9AjXe6IGjHdSNMJoWjs7uZDQFBZOjZXPsdRukdihHci
	bXcvX3VYMn+CTFETwfmWVpS/SiYFF0/ph2KODE+SeQmRJ9hYX1CHWg878XkmXNGVNQynvmO6xLVyH
	/yv4Rct6ApKuaLnTarnTgRmYoZ/FcPv5wXgLewriu0pgG5OA3sB5XkSYzws6mAHQ+5apronqho+FK
	wZMz8ElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7peS-0000000EAai-1H5K;
	Wed, 01 Apr 2026 07:06:08 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7peP-0000000EAaA-15dU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ICvoVCRHMIyKZPWatorRc2YdWoTDd421WMgvZUug3mk=; b=NGh+18LtKKrST7UgqOTIqoO8JO
	sFSWoy5Ww0/flE/HfXNntAFf9SmnQHjj0qD3AwlPPqZyb4KLg+bQNd+O/bcH1zLuU56a0bNdPVkJq
	8ukPn+Gs0jH3BZjWWU9KApbSLrvnJNwiaYjyJf4lrEBTz9jFXA1xfotzWktgTuY5SGAKVecrjLjyk
	K0bWatCW4fgRappkcuTcj54MH28kg7IAOHPrYITKTtK++Kh68ukq4h5IY+IYOnSQexCpjYQzP/95T
	ZBhBsC7OtOsqobRKvcsdZ8SQOWWHEGQtnEh1rs/JCiCryevuV1Lk7/aZIGdkJC5c5aVnzNrzVlJNG
	IR44r0aw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7peK-000Gx9-2y;
	Wed, 01 Apr 2026 09:06:00 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7peK-000IiZ-0M;
	Wed, 01 Apr 2026 09:06:00 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
 linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8x-colibri: Correct SODIMM PAD settings
Date: Wed, 01 Apr 2026 09:05:59 +0200
Message-ID: <4727738.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260401-imx8-fix-v1-1-cb27398a6aaf@nxp.com>
References: <20260401-imx8-fix-v1-1-cb27398a6aaf@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27957/Tue Mar 31 08:24:30 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_000605_413667_0F2C94C5 
X-CRM114-Status: GOOD (  13.47  )
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

Am Mittwoch, 1. April 2026, 08:40:56 CEST schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> SION is BIT(30), not BIT(26). Correct it.
>=20
> Fixes: 7ece3cbc8b1ef ("arm64: dts: colibri-imx8x: Add atmel pinctrl group=
s")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm6=
4/boot/dts/freescale/imx8x-colibri.dtsi
> index 47895ff8cb244e9bbebe228eb554c2b3f0dded1d..2415487d3a5dea92f9084cd1b=
312a07f6a09f3cf 100644
> --- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
> @@ -631,12 +631,12 @@ pinctrl_adc0: adc0grp {
>  	 */
>  	pinctrl_atmel_adap: atmeladaptergrp {
>  		fsl,pins =3D <IMX8QXP_UART1_RX_LSIO_GPIO0_IO22			0x21>,		/* SODIMM  30=
 */
> -			   <IMX8QXP_UART1_TX_LSIO_GPIO0_IO21			0x4000021>;	/* SODIMM  28 */
> +			   <IMX8QXP_UART1_TX_LSIO_GPIO0_IO21			0x40000021>;	/* SODIMM  28 */
>  	};
> =20
>  	/* Atmel MXT touchsceen + boards with built-in Capacitive Touch Connect=
or */
>  	pinctrl_atmel_conn: atmelconnectorgrp {
> -		fsl,pins =3D <IMX8QXP_QSPI0B_DATA2_LSIO_GPIO3_IO20		0x4000021>,	/* SOD=
IMM 107 */
> +		fsl,pins =3D <IMX8QXP_QSPI0B_DATA2_LSIO_GPIO3_IO20		0x40000021>,	/* SO=
DIMM 107 */
>  			   <IMX8QXP_QSPI0B_SS1_B_LSIO_GPIO3_IO24		0x21>;		/* SODIMM 106 */
>  	};
> =20
>=20
> ---
> base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
> change-id: 20260401-imx8-fix-10369e895b8a
>=20
> Best regards,
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



