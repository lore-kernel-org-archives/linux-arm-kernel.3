Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF87CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGvboC32kQ5sDfNyiOSvUpr7w0SCrcyCe5yYdPwf6xc=; b=kS8wEK4duVkmxjAPbsGnD/HCrr
	eFECiNqn0jrNOz6CZuCYIyfKijGeWHo+bnPjOoKc2XOWvnCeMW96qRIWg+rHqc0LEtqK7Bm6hrpIk
	c4H5jpfIWWQA8gQlIKUyUvlVylouDqA7uTquTmACSS73f6/9YH1UnKHrsLtwGjh4TIXM3SeTb2rSw
	7keKPIszzh/x9G5sWfJPR01QboISnId9J/JV9UdML0gpltfvhqNyqIy5FUh18fq+XzvfMH5R5xDMv
	n1iJhFQ7N61mlKuqOihsV+ld46f9tI8i4GUNflQ8tt350VHfb+UHLn6Z65ad2edqFGCR0E3qVQXZt
	or3F1/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfA0-0000000Dtau-1wEq;
	Wed, 05 Nov 2025 15:10:56 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGf9x-0000000DtZq-3sit
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:10:55 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGf9j-0000l2-8Q; Wed, 05 Nov 2025 16:10:39 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGf9i-007DbY-21;
	Wed, 05 Nov 2025 16:10:38 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGf9i-00000000BT8-2G0G;
	Wed, 05 Nov 2025 16:10:38 +0100
Message-ID: <5535d4dbf94b01fe775b5f905afea8c860f9c03a.camel@pengutronix.de>
Subject: Re: [PATCH v4 4/8] reset: imx8mp-audiomix: Drop unneeded macros
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Abel Vesa	
 <abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio
 Estevam	 <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Shengjiu Wang	 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  Pengutronix Kernel Team	
 <kernel@pengutronix.de>
Date: Wed, 05 Nov 2025 16:10:38 +0100
In-Reply-To: <20251104120301.913-5-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
	 <20251104120301.913-5-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_071053_971724_E86F8DA6 
X-CRM114-Status: GOOD (  20.91  )
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

On Di, 2025-11-04 at 04:02 -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> The macros defining the mask values for the EARC, EARC PHY resets,
> and the DSP RUN_STALL signal can be dropped as they are not and will
> not be used anywhere else except to set the value of the "mask" field
> from "struct imx8mp_reset_map". In this particular case, based on the
> name of the "mask" field, you can already deduce what these values are
> for, which is why defining macros for them doesn't offer any new
> information, nor does it help with the code readability.
>=20
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index eceb37ff5dc5..e9643365a62c 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -14,11 +14,7 @@
>  #include <linux/reset-controller.h>
> =20
>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
> -#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
> -#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
> -
>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
> -#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
> =20
>  struct imx8mp_reset_map {
>  	unsigned int offset;
> @@ -29,17 +25,17 @@ struct imx8mp_reset_map {
>  static const struct imx8mp_reset_map reset_map[] =3D {
>  	[IMX8MP_AUDIOMIX_EARC_RESET] =3D {
>  		.offset	=3D IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
> -		.mask	=3D IMX8MP_AUDIOMIX_EARC_RESET_MASK,
> +		.mask =3D BIT(0),

Since the masks are all single-bit, and you make that mandatory in the
next patch, I suggest storing the bit offset in the reset map instead:

-		.mask	=3D IMX8MP_AUDIOMIX_EARC_RESET_MASK,
+		.bit =3D 0,

and so on. That way it's clear that no reset control ever manipulates
multiple bits at the same time.

Either way, either in this patch or the next, add an

  #include <linux/bits.h>

for BIT().

regards
Philipp

