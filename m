Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBD1CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4IF51GdbnS/AbW4GBneN2UV/oYwSAiI9JfLmhOXBoDE=; b=op+4MNevZkKXKsttZI0RcPRFyS
	bnKbnYeL01wCbf/RPWqh9OKBfNIR1qp2QPwZyzHC1KdUfkWsad7PAxCkU4b+yKmyfPC+H8+6flI+p
	/u3W/gQ2KRRHf8kJFYo5oHdvoEEg+hBMNSbS+GxV5l2IeqimFXPHecsqawlnnQbQWdv3aYn4GTCLo
	Srx7bWFOwsoZuWjB9wZWvFqOi5QnwBrMQefOJSWBUVJUsRNRxsO6M56UWUmJpKnpZvx+hL0+s0QON
	N2BkTEJIMXw96u5RaF7OU1Dq+mybceQodB+ORe11ISkzIRZ/V8sPBgeJlvr77+2lMF8OFTcOmoTBM
	/j5ylhtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxKx-0000000FgWl-3gbR;
	Mon, 18 May 2026 12:44:47 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxKv-0000000FgVS-0QMN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779108282;
	bh=4IF51GdbnS/AbW4GBneN2UV/oYwSAiI9JfLmhOXBoDE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BDt8C0OkBSQcnW7/1xvJxhotX3+2n13X9/gHnD8iePUW5e8BDgq81Zdm6eMVPKCzx
	 2VP2XstaaU9gPDQjOGSoYRaVkiBdKqvM2sCiTja6tpkG2pxgFfe723f08OKT77mr5o
	 SPZZo2Unl4aF1PF3y/ZrgpmeFxeTEh3Q8/yEmY58IUYTtp9DrM6oXbnmkUOmH3yucC
	 FO03HryBi27TwBpJAMmfEytSz5Cc92qtC/+wpPaqiCiG+If1uK0rkfHaCrPqU1bv81
	 crWRZ9S6uf61g6pGVlNcYh6Tm8OqgBZDXI8M1nC9arzCQC6EubuffZFuOKmjLFIc7/
	 /Uc53lejPZH5A==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 638D36025D;
	Mon, 18 May 2026 20:44:42 +0800 (AWST)
Message-ID: <64ab943e8874bd5ef22c0f1a19b7d89daea83a9e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: yosemite5: Add MP5998 power monitor
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Daniel Hsu <d486250@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joel@jms.id.au, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Daniel Hsu	 <Daniel-Hsu@quantatw.com>
Date: Mon, 18 May 2026 22:14:42 +0930
In-Reply-To: <20260331120734.39260-1-Daniel-Hsu@quantatw.com>
References: <20260331120734.39260-1-Daniel-Hsu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_054445_336914_004900CE 
X-CRM114-Status: GOOD (  15.40  )
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

Hi Daniel,

On Tue, 2026-03-31 at 20:07 +0800, Daniel Hsu wrote:
> Add an MP5998 power monitor used to monitor the power consumption
> of the Paddle_P12V_HSC rail on the Yosemite5 paddle board.
>=20
> [v2]
> - Describe the purpose of the power monitor
> - Remove software/driver related description
>=20
> Signed-off-by: Daniel Hsu <Daniel-Hsu@quantatw.com>

I've applied this to the BMC tree. However, in the future, the
changelog for the series should go underneath '---' below, so it's not
included in the commit message when the patch is applied.

Andrew

> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 5 ++++=
+
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> index 2486981f3d6b..6287f80d70d9 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> @@ -422,6 +422,11 @@ power-sensor@45 {
> =C2=A0		shunt-resistor =3D <1000>;
> =C2=A0	};
> =C2=A0
> +	power-monitor@46 {
> +		compatible =3D "mps,mp5998";
> +		reg =3D <0x46>;
> +	};
> +
> =C2=A0	power-monitor@47 {
> =C2=A0		compatible =3D "ti,tps25990";
> =C2=A0		reg =3D <0x47>;

