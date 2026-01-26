Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508D3D1950F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 20:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Is3I+8ssoS9D+BYoCg1mTA9PvtKWkCtdZPek/z/LAa0=; b=V5ymxOf1SZQ+X/3blH4NplExp+
	cilrvltOdbj1Nh6ZBawEM+kNn4fMwoKU2BNpu8PbYMedL3jCo9O8yKBrVcAeUbX21AcU/0wXHrHnS
	tjlx273yI/nzxVhPAG8VTCXfJIkQvFUdrFmh7oK5zWHbd0t4kYlhMfcwWLcvMdWlx9Bv2b4OAmln6
	2XyfMXitmHOTiJJpo8ePbhUxxCFHml8u9EZvP2L7fgoBID4aU1e6+9v8eYaOGAEqGvXFRNz/fgWgY
	IM2PbpFctLRQkfb8ip0z4msUvNItqr7lMCCMy1zh0XyfJa3dNtwt9q4WjSn7gN0+oXprNL8wONI/D
	+SIY0TtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkSv9-0000000DBAe-300E;
	Mon, 26 Jan 2026 20:10:47 +0000
Received: from ms.puri.sm ([135.181.196.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkSv7-0000000DBAC-1Lm8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 20:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1769458239; bh=RdybJ+RhItlzNNAOTr267+9hICGF7MXvJl8utG+MmF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KpLjCTddhsijq2oEtM+wJOTd6g9VSp70CIHBiklKsuY/lV5vPz4nxyzcz1wsI+NoI
	 1dIM+2hyjS2yUM+URsz9rXOwoY+wIQ6VhqezQwh+rN8Vuq1oZhAVEMRLTI9GEC6PZl
	 2QPW8GAyKxLqc44ar3zZW5W0o7xqHS3NOoOKKF5lvyogEi+X+EhKGWqd/DHWyo7Yxt
	 UYxnL1ciWY7KO9X3L4Yofht+AgwEGXzt/XIK+dze8WRUgqT8yH51gwvsFLLxtAmwjj
	 ZfN7hjhSJgfMgfskQT9Nxso/KmkVQQlf9JXmzN9JKtlHr9POMAnIEXISXbTIYmQ5DW
	 XULQEnq2sdcWQ==
Received: from pliszka.localnet (79.184.64.12.ipv4.supernova.orange.pl [79.184.64.12])
	by ms.puri.sm (Postfix) with ESMTPSA id 10A8C1FA2D;
	Mon, 26 Jan 2026 12:10:39 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH] arm64: dts: imx8mq: Set the correct gpu_ahb clock frequency
Date: Mon, 26 Jan 2026 21:10:37 +0100
Message-ID: <8657865.DvuYhMxLoT@pliszka>
In-Reply-To: <aXevH8e+9qLhWO7D@lizhi-Precision-Tower-5810>
References: <20260124-imx8mq-gpu-ahb-clock-v1-1-11c2e7c857b7@puri.sm>
 <aXevH8e+9qLhWO7D@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_121045_524118_59FC8556 
X-CRM114-Status: GOOD (  18.30  )
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

On poniedzia=C5=82ek, 26 stycznia 2026 19:14:55 czas =C5=9Brodkowoeuropejsk=
i standardowy=20
=46rank Li wrote:
> On Sat, Jan 24, 2026 at 02:55:48PM +0100, Sebastian Krzyszkowiak wrote:
> > According to i.MX 8M Quad Reference Manual, GPU_AHB_CLK_ROOT's maximum
> > frequency is 400MHz.
>=20
> I checked datasheet
>=20
> Nominal mode=E2=80=94the maximum
> GPU frequency supported in
> this mode is 800 MHz.
>=20
> Does difference grade (industry vs consumer) impact max frequency?

No. That sentence relates to GPU_SHADER_CLK_ROOT, which can go up to 1000 M=
Hz,=20
but requires "overdrive mode" (higher voltage) when above 800 MHz. It's set=
 to=20
800 MHz in the device tree at the moment.

This patch changes GPU_AHB_CLK_ROOT, which has absolute maximum of 400 MHz=
=20
(see section 5.1.2 Table 5-1).

> Frank
>=20
> > Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> > ---
> >=20
> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mq.dtsi index
> > 607962f807be..6a25e219832c 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > @@ -1632,7 +1632,7 @@ gpu: gpu@38000000 {
> >=20
> >  			                         <&clk=20
IMX8MQ_GPU_PLL_OUT>,
> >  			                         <&clk=20
IMX8MQ_GPU_PLL>;
> >  		=09
> >  			assigned-clock-rates =3D <800000000>,=20
<800000000>,
> >=20
> > -			                       <800000000>,=20
<800000000>, <0>;
> > +			                       <800000000>,=20
<400000000>, <0>;
> >=20
> >  			power-domains =3D <&pgc_gpu>;
> >  	=09
> >  		};
> >=20
> > ---
> > base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> > change-id: 20260105-imx8mq-gpu-ahb-clock-139ba9ca9a6c
> >=20
> > Best regards,
> > --
> > Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>





