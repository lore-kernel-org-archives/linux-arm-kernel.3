Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F60E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 18:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3nSGYcIyJ3pprl8A2uOu/gQequB0xPJcYIy9yf1WzQ=; b=T4yrM6ImOAh9Gp+6/HulMiImzN
	h3+rOfSJU+qoEJCg7+kga7K+Jc9INCZkoZOTcnXaMqCKaR/MrsR3ng7xHGN3JVNM/I/p6Ifqdx6yz
	dcl2/a3Ha1L/lWSszQu7pvwnK41zA+Jq8KVtmachnwx/pvfMieo8F9uhwrqwUKsKS/LNid0rFChwu
	YW8xw/t3TBSILwI5VPnbkobqV/ZLnIrHHgEVhzlIVtkS1nIn5ViHF4O/T8EEChVIhzEvHmX5oSEsZ
	Ky15GheN81XcYZoOjBH7olGY8uRsw/Ehk8xRRjdGEAVlrqE5dIAndrMxQ2hiG/BzkfGiq/2L4oCH4
	UD7JOvbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKi6K-00000008pph-1u6Z;
	Mon, 09 Dec 2024 18:03:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKi0C-00000008oha-27vS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:57:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC4551650;
	Mon,  9 Dec 2024 09:57:27 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB7173F720;
	Mon,  9 Dec 2024 09:56:57 -0800 (PST)
Date: Mon, 9 Dec 2024 17:56:54 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "=?UTF-8?B?Q3PDs2vDoXMs?= Bence" <csokas.bence@prolan.hu>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Mesih Kilinc
 <mesihkilinc@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>
Subject: Re: [PATCH 2/3] ARM: dts: suniv: f1c100s: Add support for Audio
 Codec
Message-ID: <20241209175654.673cf172@donnerap.manchester.arm.com>
In-Reply-To: <20241205000137.187450-3-csokas.bence@prolan.hu>
References: <20241205000137.187450-1-csokas.bence@prolan.hu>
	<20241205000137.187450-3-csokas.bence@prolan.hu>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_095700_586276_2946A36E 
X-CRM114-Status: GOOD (  11.87  )
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

On Thu, 5 Dec 2024 01:01:37 +0100
"Cs=C3=B3k=C3=A1s, Bence" <csokas.bence@prolan.hu> wrote:

> From: Mesih Kilinc <mesihkilinc@gmail.com>
>=20
> Allwinner suniv F1C100s now has basic audio codec support. Enable it
> under device tree.
>=20
> Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
> [ csokas.bence: Rebased on current master ]
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>

Compared against the F1C200s user manual:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi b/arch/arm/bo=
ot/dts/allwinner/suniv-f1c100s.dtsi
> index 290efe026ceb..e4b41bc93852 100644
> --- a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
> @@ -336,5 +336,19 @@ uart2: serial@1c25800 {
>  			resets =3D <&ccu RST_BUS_UART2>;
>  			status =3D "disabled";
>  		};
> +
> +		codec: codec@1c23c00 {
> +			#sound-dai-cells =3D <0>;
> +			compatible =3D "allwinner,suniv-f1c100s-codec";
> +			reg =3D <0x01c23c00 0x400>;
> +			interrupts =3D <21>;
> +			clocks =3D <&ccu CLK_BUS_CODEC>, <&ccu CLK_CODEC>;
> +			clock-names =3D "apb", "codec";
> +			dmas =3D <&dma SUN4I_DMA_NORMAL 12>,
> +			       <&dma SUN4I_DMA_NORMAL 12>;
> +			dma-names =3D "rx", "tx";
> +			resets =3D <&ccu RST_BUS_CODEC>;
> +			status =3D "disabled";
> +		};
>  	};
>  };


