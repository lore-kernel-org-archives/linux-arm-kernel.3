Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B56C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVkkjoNKar1bKEFl70ZGs5fxx8dbVm/2T5bxUQx0tUw=; b=c7bgtxMJy/inep6VXqQK5T8unC
	ZLbhS5olWYlkPV+9NmpEXRLz6Es0XkS+xO/sJXLY1PVBZr7cbPYVGvnL3D1cYa1rUn3XzABc3mnPq
	KN7kU+W6w3QIGXfm+G/0ZKGp/7hw6fJdbAjo2+7AqmqdXALXJSKs+u/ljbEaUm23yb1LH9A1sVNKF
	mAe41lRhAJXzzNtx+lYifamnn2mNGM5HSQEqSVDYRbtHaezUb17t62LXPmDkvhsK4hQq66+4SCRAr
	Ngte1vE7T+0IfOQO9P0e8Gjz7azGzfs7zNC2WgUhYOp+XxQHahOvui2qjvGaqrg3+J+FaZHy8OMpv
	gNLD4fPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs9P-000000035jv-0diV;
	Thu, 09 Jul 2026 17:03:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs9N-000000035jp-3uOg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:03:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 418BD41650;
	Thu,  9 Jul 2026 17:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D43F1F000E9;
	Thu,  9 Jul 2026 17:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783616581;
	bh=UVkkjoNKar1bKEFl70ZGs5fxx8dbVm/2T5bxUQx0tUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cj1cxUz5oG/M7XEUM9vVfenhMHKPRWC/atZiSuQeeXhO87JofRGHiC+TaO10WJOwM
	 qRHDyveSsC4sJFa0Ls1QNgWDo+LIqtbCYouJIaRV7J+cA0HtGpi3DgMfgsyawVSarU
	 6C5G6HbW0Ds/FUI5os7TA3xqU/QlXmEXh/ciTDWCikY7t2uv3uErabsdoO6GP8Ydxb
	 +Jqh7PuDMt4jcYuD+Aw+2sWRCQ3m2//tPVRBsAv7a5rRZ0ymFX0/GP/qIO7Ncu3pcK
	 M6ZB+q87UeiV+ElPK4b5JuA40s6KBpDpz28VA31/H4t9KujLw4Vy/tPyNNL69XguUV
	 9x+3NRM7+G2XQ==
Date: Thu, 9 Jul 2026 18:02:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v2 1/5] dt-bindings: spi: Document LAN969x QSPI
Message-ID: <20260709-headache-cycle-45c2225c0790@spud>
References: <20260709112006.390742-1-robert.marko@sartura.hr>
 <20260709112006.390742-2-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z43iSHOCmPRnJrDS"
Content-Disposition: inline
In-Reply-To: <20260709112006.390742-2-robert.marko@sartura.hr>
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

--Z43iSHOCmPRnJrDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026 at 01:19:07PM +0200, Robert Marko wrote:
> LAN969x has 2 QSPI instances, so document their compatible.

Please include a note about why a fallback cannot be used.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested

>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  Documentation/devicetree/bindings/spi/atmel,quadspi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml b/D=
ocumentation/devicetree/bindings/spi/atmel,quadspi.yaml
> index 30ab42c95c08..36c698ced99b 100644
> --- a/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
> @@ -22,6 +22,7 @@ properties:
>        - microchip,sama7d65-ospi
>        - microchip,sama7g5-qspi
>        - microchip,sama7g5-ospi
> +      - microchip,lan9691-qspi
> =20
>    reg:
>      items:
> --=20
> 2.55.0
>=20

--Z43iSHOCmPRnJrDS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/UQAAKCRB4tDGHoIJi
0q12AQCqOC1foKPOE/gQ7/s2w+zCzF2E4w8cNWR39G1o0ExYQQD/akv4nw11e6Bq
SKavyJN5B57wZJXLCGgyg3+mgptIJg0=
=VKZu
-----END PGP SIGNATURE-----

--Z43iSHOCmPRnJrDS--

