Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFB0EF06FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 06:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poCMUc6ncGDkSxtBbaNgSNy0CoVls03/5wrD6+V4Erw=; b=18OOpSLJmMtn5ioEtvZIIiKEdZ
	NfY0fdsWJKnFvl6hS85+BvbVrv++AMvZvMvsnV3GUXq04gzhcL1xWLBvXw0alSM14LgWUSpLGB+P8
	b1OPEeANnSS/y/8H0q10ZJqY6jL7dn8e5ZboDll5iSlLfzmfCk1SsfFEGwQBoLhSSUDLP14/0NIvq
	OD+o/mqMeyMr5kuoCxthCYXSK/U3sLdIax4PBHu/DDszFD6evtbHHdMQyeCNr0BQOqvKufv1mka0/
	zAQo2xv93TFSo8XbEFTsuGXkdv+W+eEVxfIqskWEDAPbA+7JHxM0GXq2ta/MoMsbVB1/W8nZRDPcy
	4mxMKWmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpL6l-0000000EvSM-3Kbn;
	Mon, 09 Feb 2026 06:50:55 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpL6j-0000000EvRw-2wR2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 06:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770619851;
	bh=poCMUc6ncGDkSxtBbaNgSNy0CoVls03/5wrD6+V4Erw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=O54HLMzRquZ8qKT0tjg0p5jbTItro6bjE/LGtpFHgxUinpjAojCiHCcFlJfOnyG3s
	 96MRyX51rypqhITZbn0jgNmKHsLCvEIyKEGAwLyMiG3IpqtP2pMQhrAeOa/VDSfaTe
	 Zsc8rlnnKE1Vl2Ua9AdSr1P0BOrltYHCisHca1BldzxM+KMVVqa6ZVjnzMTaBFNcos
	 2aJ6AKRUSVMa6m3gjvQr2tUQTI1e4TrURYzrkiTe+2r820MwXSN64YQ26+JHp8TjcQ
	 08tWfAg7FnZYmLoxTWiyKsVtTzXTxfMNyMGC8J3e30OuL8T1y7cxJSfsLCZi+ja1Cc
	 r4gkrU3gdHeag==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5E95B602DE;
	Mon,  9 Feb 2026 14:50:51 +0800 (AWST)
Message-ID: <324adcf0cbf87ef1186c70f09ab0e0ee2e29017c.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: Add retimer EEPROMs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: dirkchen@amd.com, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 09 Feb 2026 17:20:51 +1030
In-Reply-To: <20260202-b4-anacapa-dts-fix-v1-1-20d4b0114854@amd.com>
References: <20260202-b4-anacapa-dts-fix-v1-1-20d4b0114854@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_225053_935538_3D357040 
X-CRM114-Status: GOOD (  12.77  )
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

On Mon, 2026-02-02 at 10:29 +0800, Dirk Chen via B4 Relay wrote:
> From: Dirk Chen <dirkchen@amd.com>
>=20
> Add Atmel 24C2048 EEPROMs on i2c0 and i2c1 to support retimer
> configuration. Follow the same compatible string usage as the
> Facebook Harma platform to maintain consistency across Meta boards.

This description seems surprising.

Does the change reflect the hardware or not? What's the significance of
the consistency comment if so?

Andrew

>=20
> Signed-off-by: Dirk Chen <dirkchen@amd.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 12
> ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> index 221af858cb6b..b8d248d99d7c 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> @@ -328,6 +328,12 @@ i2c0mux0ch3: i2c@3 {
> =C2=A0			#size-cells =3D <0>;
> =C2=A0		};
> =C2=A0	};
> +
> +	eeprom@50 {
> +		compatible =3D "atmel,24c2048";
> +		reg =3D <0x50>;
> +		pagesize =3D <128>;
> +	};
> =C2=A0};
> =C2=A0
> =C2=A0// R Bridge Board
> @@ -362,6 +368,12 @@ i2c1mux0ch3: i2c@3 {
> =C2=A0			#size-cells =3D <0>;
> =C2=A0		};
> =C2=A0	};
> +
> +	eeprom@50 {
> +		compatible =3D "atmel,24c2048";
> +		reg =3D <0x50>;
> +		pagesize =3D <128>;
> +	};
> =C2=A0};
> =C2=A0
> =C2=A0// MB - E1.S
>=20
> ---
> base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
> change-id: 20260202-b4-anacapa-dts-fix-207ffe9a3b0c
>=20
> Best regards,

