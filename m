Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4958105A594
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTi1xP4aomP8BeXovObceeMwKoKp0YKGcoGhby5AhPQ=; b=1EzVtzhnmxqcZadOBzHGouEQI3
	gZoaq86X30usAvdPhpaa9Pbu0WvqjVQ/NKeIKM+2rO3/cgc4Zfw/jYLL1s4PSaxHlbCL6H5JBQA1Z
	2jiz9wenux4Ubs8F3wygS/Z6sePfrHoUfulGWJ82qwn6s+9E/pTOA0ciaxZkrDUOAvkBMOByvy4Cm
	okUbZab/C6cLhsEoPlQzDM7DBCaRBmkI2fOkeIB0swH4B2bWw3rFwmaLjny7VjMMunV73kWVDLpBa
	8ebqEflHERCRRfI8ez1TR/fAIAjcZueLQboeOtxXkljZ1LsHtFlssaCDK4lIRWQxVv0a+S7NY0e78
	iRYa4N6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ew7-0000000E0yL-0hIA;
	Thu, 12 Mar 2026 12:14:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ew2-0000000E0xD-2wlQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 12:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GTi1xP4aomP8BeXovObceeMwKoKp0YKGcoGhby5AhPQ=; b=N0OIlrU+LPqdBf8ETN/P7gO895
	beQvF49G4VekclJoRlalwCS++5KT1v9ng+Dqsud7TVedjJmBmqExTq8L61nMIrru110SK0RZlhbYz
	lrd12cgoqNbHcy1y2nH5yZQ/Wz0GCnbfllRWsTpDU2XIFAnwH7SNmdv6qt7CeZZE+BNvj55UdSpDU
	h0IwxCj0DaStl7NlIFwGIGHSJL+hXUV7N0cIYcMxuAj2hcifzKzACn1o+UsyvsACH0Z1LSBMel3Qd
	puNgHE6NRwIdu7Xg+E9QqipMTXaEjo2BzHbFYyIxAAgrxoL3I3KeOTxiPfz1xB2hq7U3loHPl6ynq
	Pp/Q8FAw==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0evz-000000015rB-1Htg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GTi1xP4aomP8BeXovObceeMwKoKp0YKGcoGhby5AhPQ=; b=f9h1sl3kHcsVDvq9FQhT51lRtO
	IIPQZZiZhjTj0BUtgtXQq7N/hDJKrXCVmfcFdgT0Q/Tq/R1Ra0cddzun2EXyF/vz6iMMMVe70kgjd
	NmxeJ6ilMR5SWefMfObzEZyXmI9aIQff26/vAXPWo1aBtwiCeAQzuaFXZV5t6TQ/MJEng+SsX5Tdt
	Nxpyg7FiLiNGYEoQc04PQah/BXyFgAdnDZOIlc6+h5UEfbCB/S5LaNAOSwzrcPX8vOyC7rfIbs4jF
	jR79LEZjehVCCJZNNpygIPqWwsl/h9p7pL63/b8kbwWHw6TBf0EmJLnKCfWSEPFkdHQoRs36Dnh5/
	1ke+vYLQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0evu-0009e5-2h;
	Thu, 12 Mar 2026 13:14:30 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0evu-000DFd-0p;
	Thu, 12 Mar 2026 13:14:30 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, linux@ew.tq-group.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 06/12] ARM: dts: imx7d: Use undeprecated reset-gpios
Date: Thu, 12 Mar 2026 13:14:29 +0100
Message-ID: <15482175.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-6-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
 <20260311-dts-snps-reset-gpios-v1-6-ea1cc09fba84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_121435_516248_F7D7A9AE 
X-CRM114-Status: GOOD (  13.96  )
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

Am Mittwoch, 11. M=E4rz 2026, 17:08:02 CET schrieb Krzysztof Kozlowski:
> Freescale i.MX6 PCIe host controller bindings through referenced
> snps,dw-pcie-common.yaml schema already document "reset-gpios", just
> like Linux kernel did for a long time.  Use the preferred form over
> "reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
> add snps,dw-pcie.yaml") in 2021.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts b/arch/arm/boot/dts=
/nxp/imx/imx7d-mba7.dts
> index e3ee16f1aaa9..a5fc7f80f651 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
> @@ -122,7 +122,7 @@ &pcie {
>  	/* 1.5V logically from 3.3V */
>  	/* probe deferral not supported */
>  	/* pcie-bus-supply =3D <&reg_mpcie_1v5>; */
> -	reset-gpio =3D <&gpio5 12 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio5 12 GPIO_ACTIVE_LOW>;
>  	status =3D "disabled";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts b/arch/arm/boot/dts/=
nxp/imx/imx7d-sdb.dts
> index a370e868cafe..ab7cabe5552d 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
> @@ -456,7 +456,7 @@ display_out: endpoint {
>  };
> =20
>  &pcie {
> -	reset-gpio =3D <&extended_io 1 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&extended_io 1 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



