Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DC1C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqqqMryxyHAo8rpP/Llw2y6VlRrXhn34aEmM51YloUc=; b=c9bOzEpdUYF5aNZ3ITKop3/dvL
	yIIToyFwhJOnH5DK6UuhCyxZatPbPfntWUQaOy6lHHK0d8yTiXT3l/vQ3x31xIobxvrW39/fO1l63
	oR1VaCO14hlYO2Wz2NxBy1n52oUvgbLN74gL3HW8NpKJvf/Lvwbbx2eFPW9Sgb0XAONsWl1pZ2z1z
	9Pfo/wZs1PCL/1j6hJg0JMjQnmpiDuSQAOkG4NwGxy82tSQpiUgYW7aRv6HU8cX5bMTZGeon4JNed
	yh/Ed4M8ylYG9SuP5iJgs8Ng930rgvUL3Xoifp+DrE5WoVy/xWW0B6ELjq39xpcjxm4bc6k5abLee
	LO822fbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIfQ-0000000FY1Y-2KJf;
	Fri, 11 Jul 2025 18:40:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIZP-0000000FWQv-2BT6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:34:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C48616F8;
	Fri, 11 Jul 2025 11:33:50 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7F7D3F694;
	Fri, 11 Jul 2025 11:33:58 -0700 (PDT)
Date: Fri, 11 Jul 2025 19:32:10 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: iuncuim <iuncuim@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.or>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] arm64: dts: allwinner: a523: add Mali GPU node
Message-ID: <20250711193210.6b7f2875@minigeek.lan>
In-Reply-To: <20250711035730.17507-3-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
	<20250711035730.17507-3-iuncuim@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113403_600056_3E87ECDD 
X-CRM114-Status: GOOD (  14.27  )
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

On Fri, 11 Jul 2025 11:57:28 +0800
iuncuim <iuncuim@gmail.com> wrote:

Hi,

> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>=20
> The Allwinner A523 SoC features the Mali-G57 MC1 GPU, which belongs
> to the Mali Valhall (v9) family. There is a power domain specifically
> for this GPU that needs to be enabled to utilize it.
>=20
> To enable in a specific device, we need to enable the gpu node and specify
> the =E2=80=9Cmali-supply=E2=80=9D regulator additionally in the device tr=
ee.

Checked the resources against the manual:=20

> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index dd6fa22f9..d3528d498 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -108,6 +108,21 @@ soc {
>  		#size-cells =3D <1>;
>  		ranges =3D <0x0 0x0 0x0 0x40000000>;
> =20
> +		gpu: gpu@1800000 {
> +			compatible =3D "allwinner,sun55i-a523-mali",
> +				     "arm,mali-valhall-jm";
> +			reg =3D <0x1800000 0x10000>;
> +			interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "job", "mmu", "gpu";
> +			clocks =3D <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
> +			clock-names =3D "core", "bus";
> +			power-domains =3D <&pck600 PD_GPU>;
> +			resets =3D <&ccu RST_BUS_GPU>;
> +			status =3D "disabled";
> +		};
> +
>  		pio: pinctrl@2000000 {
>  			compatible =3D "allwinner,sun55i-a523-pinctrl";
>  			reg =3D <0x2000000 0x800>;


