Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BE3CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfaDA7CQXN60ukH6yOKdYLgsngH3+y1yYWx6DIqTKjE=; b=L9Bui48Zs38jHImqR7sBnaMp2M
	nrYAaBuMwxxPG4bgub2b+uSpl+iNnJcL5BHxX0z+gL9wzMlwwANM2wPTFAbw1ObFV1S+p2VOEUC/m
	zJH6JTzNzGQgbSV9Lrc4WQoIVjCpOHqdbFtxGh10wvhbxZU9EZDNnWdFY8HeiJt7cMv5C2TIpWiFR
	e4fqlVpiHS3hOkjf0MnQcRscroJx3dzg8OBTf72D1o+UI7v4KNDartScgQayDBxXWDuSdff/cP079
	6VvZadZ2/uMDeRwYK+75ZOeUc2MSvWvbsxmU/UG7nJZLQ6Xv4hKNkZwUeULrDgDlqQSuf/e7wZdYo
	ujNXvK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyw6k-0000000DeT0-2zkm;
	Wed, 17 Sep 2025 17:38:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyw6k-0000000DeSV-0sMu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:38:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EAE26023C;
	Wed, 17 Sep 2025 17:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66919C4CEE7;
	Wed, 17 Sep 2025 17:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758130697;
	bh=98MNGnnkrUwGuRnrY4NUPpQAkwT8q3WuQcOsJRda4aQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TvqfBWTPGLdZeVCIgXIle3ePtwYbq6UowyG2ynmEUXEKrd5Y1YiEHfUTAfvPQLy4Y
	 7S+Ocx49woz1T+7Herl71V/2KKRbjtYLgXu43Q1cNAa68rPIqAv6OwCEJGw1YSZ5g/
	 dlKBnjYcTl0wpl+cC9iGfUIQdAWRpmJM08zC1/xEAEz7IDE2WLOP5JjgHdCZ4NZk7L
	 24oR2MF9Uk1zEoUAvnOh1D9tWfsTi5EYoylUP66UXteeXE3zEFmbMk1pnfzI6VbNmD
	 u3pekvuK9xzT+hG7lgIe83Z/7lUruCdBBxFZY4lnF7lc97BgQDULDEuDXJvYFXI+vs
	 yyoV/pybI17Pw==
Date: Wed, 17 Sep 2025 18:38:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	lars.povlsen@microchip.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	luka.perkov@sartura.hr, benjamin.ryzman@canonical.com
Subject: Re: [PATCH 1/2] dt-bindings: reset: microchip: Add LAN969x support
Message-ID: <20250917-paparazzi-hermit-3a4aa686add3@spud>
References: <20250917111323.60781-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZZrNlcphxvFNijN6"
Content-Disposition: inline
In-Reply-To: <20250917111323.60781-1-robert.marko@sartura.hr>
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


--ZZrNlcphxvFNijN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 01:12:35PM +0200, Robert Marko wrote:
> LAN969x also uses the Microchip reset driver, so document its compatible.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  Documentation/devicetree/bindings/reset/microchip,rst.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/reset/microchip,rst.yaml b=
/Documentation/devicetree/bindings/reset/microchip,rst.yaml
> index f2da0693b05a..4d4dd47f830e 100644
> --- a/Documentation/devicetree/bindings/reset/microchip,rst.yaml
> +++ b/Documentation/devicetree/bindings/reset/microchip,rst.yaml
> @@ -23,6 +23,7 @@ properties:
>      enum:
>        - microchip,sparx5-switch-reset
>        - microchip,lan966x-switch-reset
> +      - microchip,lan969x-switch-reset

Driver patch makes a fallback compatible seem usable.

> =20
>    reg:
>      items:
> --=20
> 2.51.0
>=20

--ZZrNlcphxvFNijN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMryBAAKCRB4tDGHoIJi
0lF5APoCO2fpGBZ4T11tcyR1V+3vQvsaWXwe74qYjRS39jBoWwD/RTYl78Os46zO
LOgCifCO7gUxjX+ibE/q2+B/LW3dLgE=
=9R5e
-----END PGP SIGNATURE-----

--ZZrNlcphxvFNijN6--

