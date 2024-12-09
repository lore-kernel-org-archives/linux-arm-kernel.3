Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF224E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 18:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TyXkclr6AfUjgrhkfR21dlwapnKaf8HteFcdZf7Ui58=; b=vBCXAzILNQI8qog1vcwBN+kVae
	joZo19B/DSWzPgGJQc3UkzseSxM9huLW/atqdY5VWCpRVyvSyjmUVeY7AlCmVfQJEC5nHAGnKbfi8
	vKuXUJ6J5e1urabi+N6OUmzAse97y0ZJ/joKda8DST8A8xp+JYHJj7kh/unqnFSaPQ6rNFYtG5i73
	ot7THhtQEZ1ChaRTosrUBxhDqQcJdxx+b6JHOzstBRA9nl7URUsjL6aznnaMb5DjhSt0RiPeeT9yh
	TFyDTArJ4EWOEkxdyk97RtsHzelPdcbrN6XO0LyqLhPbAHjCNlS0hVmoHJqPBpR86ZsVFWo1CUXp8
	RRI8a2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKi5J-00000008pgR-3cZq;
	Mon, 09 Dec 2024 18:02:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKi04-00000008ofj-1bpe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:56:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF9531650;
	Mon,  9 Dec 2024 09:57:17 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 899D53F720;
	Mon,  9 Dec 2024 09:56:47 -0800 (PST)
Date: Mon, 9 Dec 2024 17:56:37 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "=?UTF-8?B?Q3PDs2vDoXMs?= Bence" <csokas.bence@prolan.hu>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Mesih Kilinc
 <mesihkilinc@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>
Subject: Re: [PATCH 1/3] ARM: dts: suniv: f1c100s: Add support for DMA
Message-ID: <20241209175637.283312fa@donnerap.manchester.arm.com>
In-Reply-To: <20241205000137.187450-2-csokas.bence@prolan.hu>
References: <20241205000137.187450-1-csokas.bence@prolan.hu>
	<20241205000137.187450-2-csokas.bence@prolan.hu>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_095652_461127_C4FAC231 
X-CRM114-Status: GOOD (  13.19  )
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

On Thu, 5 Dec 2024 01:01:36 +0100
"Cs=C3=B3k=C3=A1s, Bence" <csokas.bence@prolan.hu> wrote:

> From: Mesih Kilinc <mesihkilinc@gmail.com>
>=20
> Allwinner suniv F1C100s now has DMA support. Enable it under device
> tree.
>=20
> Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
> [ csokas.bence: Rebased on current master ]
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>

Compared against the manual:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi b/arch/arm/bo=
ot/dts/allwinner/suniv-f1c100s.dtsi
> index 3c61d59ab5f8..290efe026ceb 100644
> --- a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
> @@ -6,6 +6,7 @@
> =20
>  #include <dt-bindings/clock/suniv-ccu-f1c100s.h>
>  #include <dt-bindings/reset/suniv-ccu-f1c100s.h>
> +#include <dt-bindings/dma/sun4i-a10.h>
> =20
>  / {
>  	#address-cells =3D <1>;
> @@ -159,6 +160,15 @@ usbphy: phy@1c13400 {
>  			status =3D "disabled";
>  		};
> =20
> +		dma: dma-controller@1c02000 {
> +			compatible =3D "allwinner,suniv-f1c100s-dma";
> +			reg =3D <0x01c02000 0x1000>;
> +			interrupts =3D <18>;
> +			clocks =3D <&ccu CLK_BUS_DMA>;
> +			resets =3D <&ccu RST_BUS_DMA>;
> +			#dma-cells =3D <2>;
> +		};
> +
>  		ccu: clock@1c20000 {
>  			compatible =3D "allwinner,suniv-f1c100s-ccu";
>  			reg =3D <0x01c20000 0x400>;


