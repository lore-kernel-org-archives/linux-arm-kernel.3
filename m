Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5918BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 01:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ava61Vivu7w/mcZfCfpTOpBif8IfUW5XaEI9F1IJOB4=; b=IjM/zzFCUHIswkqZyg/Yt4eQ25
	1cGSEwCCWxa6O+is8ZkIYFc90NFJw4YpxIJt+kyWpmcVNrg5OIxUTvhoVZVSl6wO/CIpKzPGcRSIZ
	g+cBk9I2bNQbUvyC+5LkREhA94qgIlC5g4U29AMLnHiGVgPbgL9vEqLZIJlMoKvTAfWkut4yDHQqA
	o2fSB0lGsEJxSaDdLKO0NviNggmbQFuCqA0/vhaI5hz+EI7MUHyxDZlT5ECOfN0fIwiqepPenfbzS
	pan0TLVliiBsPWOpfYY3Z+pHNtxRlIiaSOzmQAl1HvLit9/Nw/eHn8NoSBTs9QuW2dRN9YeEoixjj
	/BjhX/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udf9R-0000000Fuyp-1xce;
	Mon, 21 Jul 2025 01:17:09 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udf6Q-0000000Fune-0nOP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 01:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753060440;
	bh=Ava61Vivu7w/mcZfCfpTOpBif8IfUW5XaEI9F1IJOB4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=csbDTtQ2jgTPppbMqU8+YPTQ1SgrQ9HL3Lbe0Dhffbn3xftWGJ66X4mI6t9ZdKgxH
	 cesOBugB8X1kPhlHniy8n4njJnYdtELyIWEeQaQ+QB1ySQDFedAFu3RxUDdlyTGNpl
	 hrtKLAp8anZzDl+T1H0zq2KMxEeUR6QLf+pINuDPOMjvmO65nTvCjUtanpyOz4hQDz
	 ytAHYh/NAVuso/BsJMy85oZEmMco4h/VE2q4I+CnyeED8mVpVwoZkJbZKdD7pLQRJp
	 y0sxTBLcUaTo2zMB8xDHqBJdqG9FPUQ1PVRFEg5Qp/azDvSBCCgDJQ7SKBOQvh+YFk
	 S/n6bWfYWu6Yw==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E86056443C;
	Mon, 21 Jul 2025 09:13:59 +0800 (AWST)
Message-ID: <f61d9b4f25e18c37e88c56e3222a387b9ece6c0d.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 6/9] ARM: dts: aspeed: Move flash layout out of
 Facebook netbmc-common.dtsi
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: rentao.bupt@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Tao Ren
 <taoren@meta.com>
Date: Mon, 21 Jul 2025 10:43:59 +0930
In-Reply-To: <20250706042404.138128-7-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
	 <20250706042404.138128-7-rentao.bupt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_181402_421180_2AD0B571 
X-CRM114-Status: GOOD (  15.11  )
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

On Sat, 2025-07-05 at 21:23 -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
>=20
> Move BMC flash layout from ast2600-facebook-netbmc-common.dtsi to each
> BMC platform so it's easier to apply different layout settings.
>=20
> The fuji data0 partition was already extended to 64MB in Meta
> environment. Elbert flash layout is not changed.
>=20
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
> Changes in v2:
> =C2=A0 - None (the patch is introduced in v2).
>=20
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts=C2=A0=C2=A0=
=C2=A0=C2=A0 | 6 ++++++
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 6 ++++++
> =C2=A0.../arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi | 2 --
> =C2=A03 files changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts b/ar=
ch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
> index 74f3c67e0eff..673cabbec92e 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
> @@ -50,6 +50,12 @@ spi_gpio: spi {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> =C2=A0};
> =C2=A0
> +&fmc {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0flash@0 {
> +#include "facebook-bmc-flash-layout-128.dtsi"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> +};
> +
> =C2=A0&lpc_ctrl {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> =C2=A0};
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts b/arch=
/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
> index 840d19d6b1d4..71f58ad1ff06 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
> @@ -223,6 +223,12 @@ eeprom@2 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> =C2=A0};
> =C2=A0
> +&fmc {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0flash@0 {
> +#include "facebook-bmc-flash-layout-128-data64.dtsi"

Please don't bury the change of flash layout in a patch that only
claims to push the layout choice down to the platform dts.

Also see my reply on patch 5/9 regarding maintenance for the Wedge400
flash layout.

Andrew

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> +};
> +
> =C2=A0&i2c0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0multi-master;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bus-frequency =3D <100000=
0>;
> diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi=
 b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
> index 208cf6567ed4..4f819bf8c909 100644
> --- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
> +++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
> @@ -54,8 +54,6 @@ flash@0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0m25p,fast-read;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0label =3D "spi0.0";
> -
> -#include "facebook-bmc-flash-layout-128.dtsi"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0flash@1 {


