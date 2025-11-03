Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5430CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4to7m/Sx1zueVAy5xn1bqF8xq5H9VEoYXKUNQhPUEY=; b=pZI3TXCC+gmtThJupu5BVCu4+a
	sqdMlQ5xWQOiD0YGZJXJhaRtdCo2rjlBCpJRM1+02+Q2tAW/nn89RkvrBHAnMAwe7EImrTjjKovSj
	8PBnOgJwyRXKdX8lrbx7uQ9dbfgqTDSTHx00IMCyElly4oVB+JazG+YVqDBnG0V60wfxgaQ7X4f4z
	aNP+3Jx7uR/jBzBR09A7kTg8m0CeVm4q3d/GS2OIzin4EfSfCiriT92k4oQIvStW/5wXncepo4qS/
	+6G8lEKA1CxN8EffmGdoxiii8PzwWbSN/wB/+HQT3cjZhCmFwqJEs1k1Oz+87idT+5Q62iCAOUlEI
	V2DrTsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFseQ-00000009jNO-0sX0;
	Mon, 03 Nov 2025 11:23:06 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFseM-00000009jLi-3Sbu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 11:23:05 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 3 Nov
 2025 12:22:55 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.061; Mon, 3 Nov 2025 12:22:55 +0100
From: John Ernberg <john.ernberg@actia.se>
To: Frank Li <Frank.Li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/12] arm64: dts: imx8qxp: add readonly for ocotp
Thread-Topic: [PATCH 02/12] arm64: dts: imx8qxp: add readonly for ocotp
Thread-Index: AQHcTLQz74YmS54d7E+9okQ8t4TKIA==
Date: Mon, 3 Nov 2025 11:22:55 +0000
Message-ID: <aQiQiIaVH3TTVLHV@w447anl.localdomain>
References: <20251029-8qxp_dts-v1-0-cf61b7e5fc78@nxp.com>
 <20251029-8qxp_dts-v1-2-cf61b7e5fc78@nxp.com>
In-Reply-To: <20251029-8qxp_dts-v1-2-cf61b7e5fc78@nxp.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.67]
x-esetresult: clean, is OK
x-esetid: 37303A2955B14451667462
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BAFE1A0430C1E4479033CF0A8528C49B@actia.se>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_032302_863915_C2C79DEE 
X-CRM114-Status: GOOD (  12.96  )
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

Hi Frank,

On Wed, Oct 29, 2025 at 03:54:38PM -0400, Frank Li wrote:
> Add readonly for ocotp because i.MX8QXP only support program fuse by scu.

This is not true? The driver supports writing the fuses via the SCFW API,
and we are using this way to populate the MAC fuses.

Best regards // John Ernberg
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8qxp.dtsi
> index def6de8d579d40919e4bf7f88e119611ae4cb69a..cc82cc319159c2558400fa641=
570cddd3ad3083d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -234,6 +234,7 @@ ocotp: ocotp {
>  			compatible =3D "fsl,imx8qxp-scu-ocotp";
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> +			read-only;
> =20
>  			fec_mac0: mac@2c4 {
>  				reg =3D <0x2c4 6>;
>=20
> --=20
> 2.34.1
>=20

