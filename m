Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC13C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 19:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buVo/NH+nquZYcXjw67iclXQrqEbQ5Ozx9TiVR/x2Wo=; b=sPrGpFKW+ysLsnu023kCSANq5K
	SfQPp8k+PMgS2iyJfFndUCzyvnp/gdlkPM844rRhnd5xWGgRinICgXMIt1e3VO2OgAfftXOkra9XX
	X96fVab8LWcmaEQ8miePDYOmtZ9dWQZqy1pycrM7PpGVqBHgth89o7yBALdY+F2zHacaZe89iufdm
	kjC+xAkznrKrz8Th7coVZkIGBhqMxICNmfBmA0Qf9VH9kwYH/kRA1aepUzzi/QjOH3ldg8jSifEuN
	fvnTf0jzIy8ROVWektiGBBAgZujJbaZtHHs/Tef8J7bx8w+uLG3K9uoSMdj0/C771HCp8cjutQGHC
	abQKf4Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thw7x-0000000541T-0MO8;
	Tue, 11 Feb 2025 19:41:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuww-00000004pvv-3KnL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:25:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF5F05C4C90;
	Tue, 11 Feb 2025 18:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4FDC4CEDD;
	Tue, 11 Feb 2025 18:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739298334;
	bh=m2wqFcz+v1UAQgc1YqCV1MB5c8CjM8VI4vZEBEicwuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcZ6MW66T4mSGkn1IwJAlhhTn3L0yjP+6Z7DRxfw3s4YqIlseachoNLve9XqrtKST
	 O7kakKZ94Sd2Yu78QMBC3Dr/WdRoJ2so2S1L41JELSj/ACMf/mxOI+bHnylY1jVKcc
	 dMsuMXlnGRzwoWfJoZi1/TrpfhzmANqViCcdJIzbF6JggwgSSxJK+oEL00vmrdL5KS
	 RSieRcUqvmt7CZ1wVrCkKeRR63k36qyRQ1krBypUtiXLRZXTfTWGxHfDHARbLFjQgS
	 9heWZK/oLn9k+37SuiRtcCnmN6i6/DQvs1xS+yOr2Wvwj9Nc0R2FUl627260njtMvP
	 UzFpNQsC+PHyw==
Date: Tue, 11 Feb 2025 18:25:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: media: st,stmipid02: correct
 lane-polarities maxItems
Message-ID: <20250211-labrador-spotter-27df2d2bbe02@spud>
References: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
 <20250210-6-14-stm32-media-fixes-v1-2-c64ebe9af8bb@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hFoqtL9VL6EAg4Q/"
Content-Disposition: inline
In-Reply-To: <20250210-6-14-stm32-media-fixes-v1-2-c64ebe9af8bb@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_102534_877648_E731D599 
X-CRM114-Status: GOOD (  17.04  )
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


--hFoqtL9VL6EAg4Q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:04:31AM +0100, Alain Volmat wrote:
> The MIPID02 can use up to 2 data lanes which leads to having a maximum
> item number of 3 for the lane-polarities since this also contains the
> clock lane.
>=20
> CC: stable@vger.kernel.org
> Fixes: c2741cbe7f8a ("dt-bindings: media: st,stmipid02: Convert the text =
bindings to YAML")
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.ya=
ml b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> index b68141264c0e9fe0e530ce3b06fa3434fa712b38..4d40e75b4e1efff673647dff7=
bf984c89abca4cf 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> @@ -71,7 +71,7 @@ properties:
>                  description:
>                    Any lane can be inverted or not.
>                  minItems: 1
> -                maxItems: 2
> +                maxItems: 3
> =20
>              required:
>                - data-lanes
>=20
> --=20
> 2.34.1
>=20

--hFoqtL9VL6EAg4Q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uWGAAKCRB4tDGHoIJi
0vx+AP42lFkGgFbVvjv8uVhpy2pgbgrr0qVFB5kRBVK83SQAOQEA+V9bGwFArr3m
dzI4HLmfDst/Jxk9UYibYgg4vtsczA0=
=Rwgi
-----END PGP SIGNATURE-----

--hFoqtL9VL6EAg4Q/--

