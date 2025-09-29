Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2A6CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 03:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3o5g8tvyc3D5BhQU0C72eF73whM2PpU8XTbC1Wbal6k=; b=INTKfuBB+a49jPR884DtbbHKNh
	uBKCM/AEB5LkpduaHdX0HQsIO5/cyiI801LiDTfweYTAunRKclik4fuegyTrgZcIsnkaqoADQVsKX
	tbJB5l8tWx9nXMICQe5hFaEdTDDmkj18RifJwCm+YQydSrM7YisDrL9M0qjypXoP2stdHVMavWM/h
	V9r6VR6fS9PuCtaZuPesvZOo3agj36AdMQXrIHuiubr7wNH4OWojERzccjFp1z24FsuBp3U6cbk49
	fxSm6GU0RimDy9p/euHl6JmsW7gbmmrOSMbc2Vzsc6atGsCGwSb5xs+hJ1bpOoqnZyOZYgHRva+HU
	422ZDUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3487-00000001BCH-2zIR;
	Mon, 29 Sep 2025 03:00:47 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3484-00000001BBo-3djL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 03:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1759114842;
	bh=3o5g8tvyc3D5BhQU0C72eF73whM2PpU8XTbC1Wbal6k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HRLst9SKQFYHPBDXalgv2GH3AOBfYn5FtMoqylSFlM5xLd60OVnv2uYzoWw1eJWe1
	 3FC9W6TKr/wesqHqxt/JqmNJCgKAAzfXplAGDtStVKHvGn3KSe/mxQ13whXLUqAn+1
	 mBW7yxhnH9DkJxBmuEgjr3youMIAwnlpP4RbZh7BWmVfEEUvNKRawh5pqhebs1mP4m
	 qPUWq7H52YhYtewqIJzcTWDMC0C+dZcxglDyJ9EyOwgN9CSwudNN6CithFZ5FhK/lt
	 qn2DnrmVeyAiknzT873AhjSeWDyAlyvFfSCfaxCCXnfQeU4yobhhJWnU3h9SgfyfdO
	 SBOsRdItzNdbQ==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D51C964782;
	Mon, 29 Sep 2025 11:00:41 +0800 (AWST)
Message-ID: <deb2dda58b923f2ae362dc19164dc845c4757e12.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: clemente: Add HDD LED GPIO
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	george.kw.lee@fii-foxconn.com, bruce.jy.hung@fii-foxconn.com, 
	leo.jt.wang@fii-foxconn.com
Date: Mon, 29 Sep 2025 12:30:41 +0930
In-Reply-To: <20250926-leo-dts-add-shunt-resistor-v1-1-c871a68792f0@gmail.com>
References: <20250926-leo-dts-add-shunt-resistor-v1-1-c871a68792f0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_200045_105297_4D396AD8 
X-CRM114-Status: GOOD (  16.10  )
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

Hi Leo,

On Fri, 2025-09-26 at 17:37 +0800, Leo Wang wrote:
> Define a GPIO expander pin for the HDD LED and expose it via the
> LED subsystem. This allows the BMC to control the front panel
> HDD activity LED.
>=20
> Changes include:
> =C2=A0- Add `led-hdd` node under the LED definitions
> =C2=A0- Name the expander pin "HDD_LED_N" in io_expander13

Can you please drop this "Changes include" section? What you've written
here is plain to see from the diff below. The commit message should
explain motivations, concerns and trade-offs, and not be a wrote
description of the change. The documentation on submitting patches
explores what's required:

https://docs.kernel.org/process/submitting-patches.html#describe-your-chang=
es

Cheers,

Andrew

>=20
> Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 7 +++++=
+-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/=
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
> index a614f947dafc9a6628c3f3d45b62ff3ca9d2b618..450446913e36b1418fab901cd=
e44280468990c7a 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
> @@ -95,6 +95,11 @@ led-3 {
> =C2=A0			label =3D "bmc_ready_cpld_noled";
> =C2=A0			gpios =3D <&gpio0 ASPEED_GPIO(P, 5) (GPIO_ACTIVE_HIGH|GPIO_TRANS=
ITORY)>;
> =C2=A0		};
> +
> +		led-hdd {
> +			label =3D "hdd_led";
> +			gpios =3D <&io_expander13 1 GPIO_ACTIVE_LOW>;
> +		};
> =C2=A0	};
> =C2=A0
> =C2=A0	memory@80000000 {
> @@ -1199,7 +1204,7 @@ io_expander13: gpio@14 {
> =C2=A0		#gpio-cells =3D <2>;
> =C2=A0		gpio-line-names =3D
> =C2=A0			"rmc_en_dc_pwr_on",
> -			"",
> +			"HDD_LED_N",
> =C2=A0			"",
> =C2=A0			"",
> =C2=A0			"",
>=20
> ---
> base-commit: c65261717599d419e9c683d85f515d3ca2261549
> change-id: 20250926-leo-dts-add-shunt-resistor-0cba43f75bce
>=20
> Best regards,

