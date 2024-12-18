Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A224BE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 16:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpz1RC0YdApEL81pmlFNSLtKgYNlIwFcU0QwO8gvT/s=; b=Qq/O7jKnEQAp3CXrtZfjzVPqu7
	jBYlJkZ1NXv7thlbq9veSt7zcej8QFjKvEppjmigNJGS6wztKC19oUikQ5ixM7kVWobRMznpYUuCE
	xHlSKcs6aKGbcJxL3WaT45Y41IjPBpxEHN4Qd6qgG24aNBB5K8LD/B2KZy/TY4VChrxWrfaWFomay
	w8JjSw9dCDqhjuHn3cLDaFXtzKmUAl3CRqU3FHefXLyKpN1jz3Hxurhduy93ivQACHwon32n8Yw9F
	0Me3WdqW5qZS9qZoDJccx0pELa9o+/anCx17Qb/nu8mFR/tRyuRDfx+YhG8SOqRzkZ3BTT6bjuFXf
	5KsMDWRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNxAv-0000000HDpD-0zCo;
	Wed, 18 Dec 2024 16:45:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNx9g-0000000HDc9-2M29;
	Wed, 18 Dec 2024 16:44:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C095D5C63A7;
	Wed, 18 Dec 2024 16:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8813EC4CECD;
	Wed, 18 Dec 2024 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734540251;
	bh=pB0kgdn2bOfLkrxZ9uo+wGEPrm/eb16hrnNYiA6bbiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRQ1EkPT3omHuxktYvRSWPyTjMxF1HLVF0DMDwMO4sfWc25d1v0amUkufVVNME9rp
	 ohWR6o97Bsye7LrwHlAHbiLbvlXrmeWX8fHvgX91MpyD3BI2OgeEJc8bPAHWaOUgXG
	 m9W4yeW6Nm89519yX8Q16C6V5T3LxRe6WNyzbX7gqHt3ldY5II4z25bf2YO07dhL8a
	 J/2OHP1B/eWUnzN7xfrQ2VeyC129sKxSoPUll6CAYOtC+U6jbx3CG3ZZjlJe21AWR5
	 2v7kI/E0I8O2Kjd6feIWaHomxKZUEY6BjARFV5lbUQdSC8sIC2u5LGCHA0ylZyWcCO
	 uW37sCv9s5pmA==
Date: Wed, 18 Dec 2024 16:44:06 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, u.kleine-koenig@baylibre.com,
	amergnat@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	kernel@collabora.com, macpaul.lin@mediatek.com
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: mediatek,mt8188: Add
 VDO1_DPI1_HDMI clock
Message-ID: <20241218-twelve-requisite-c63827edfbad@spud>
References: <20241218105415.39206-1-angelogioacchino.delregno@collabora.com>
 <20241218105415.39206-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qo/gdjEA9Ojw6e4h"
Content-Disposition: inline
In-Reply-To: <20241218105415.39206-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_084412_639885_F1D1E7B1 
X-CRM114-Status: GOOD (  13.88  )
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


--Qo/gdjEA9Ojw6e4h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 11:54:14AM +0100, AngeloGioacchino Del Regno wrote:
> Add binding for the HDMI TX clock found in the VDO1 controller
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  include/dt-bindings/clock/mediatek,mt8188-clk.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/clock/mediatek,mt8188-clk.h b/include/dt=
-bindings/clock/mediatek,mt8188-clk.h
> index bd5cd100b796..8af44560a74c 100644
> --- a/include/dt-bindings/clock/mediatek,mt8188-clk.h
> +++ b/include/dt-bindings/clock/mediatek,mt8188-clk.h
> @@ -721,6 +721,7 @@
>  #define CLK_VDO1_DPINTF				58
>  #define CLK_VDO1_DISP_MONITOR_DPINTF		59
>  #define CLK_VDO1_26M_SLOW			60
> +#define CLK_VDO1_DPI1_HDMI			61

> -#define CLK_VDO1_NR_CLK				61
> +#define CLK_VDO1_NR_CLK				62

If you can change this, you can delete it ;)
Please do.

--Qo/gdjEA9Ojw6e4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2L71gAKCRB4tDGHoIJi
0j/KAQDmCSeccCtIXH3YnVuThBDWjOequnU2D37KNlgCO7NVwAEA+NUFAAulVwrn
akvszzqa/q8wOU9JjKM7NDq0fHbFhAY=
=5V+2
-----END PGP SIGNATURE-----

--Qo/gdjEA9Ojw6e4h--

