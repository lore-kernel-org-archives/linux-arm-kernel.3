Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FCDC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 18:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flcnxcBpukyLTWvpXQ1R1xA9lD9eOzTpLwxNV8qHq+U=; b=31BljLEthzOb5Tn1aa2JUXHgQt
	GaU+mL0bAYcqLbe7LdItAhdK6dvzb54KFPvT0JX8oJ8twiyI6M8D4j7bb/8+zbh+vFRTf6ypCakoJ
	g0fevLjrpcaptBbCdEC5Hy2mnrge10vY1Ugod1oNf3wLKF0DTINY6Y0JgTjT97wjLxAx39CCKEGU2
	1EbA6OH25OtMbAY/p2ad7P0HPIo6zNWLoSViVyhKYytJaTanac0nLk46IkdtWq6Pg1skWoSVIcnOR
	KtUWx7nBSNTXdVbuqelyb1+xZeHdybQBTbx6X5iIEuTSqjxkHyIKw/BiadEMTnPa7GuCH17a1PmRF
	6pC1grbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txV3D-00000009IJZ-2b6G;
	Wed, 26 Mar 2025 18:00:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txV17-00000009Hq0-46Ec;
	Wed, 26 Mar 2025 17:58:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD0E95C6899;
	Wed, 26 Mar 2025 17:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A90C4CEE2;
	Wed, 26 Mar 2025 17:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743011896;
	bh=qD/cQ41RTo+8BDYdoRt9s5SKovqsdZGdDznd1NSpQ6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CnS2FyLz/sd/a9zJ6hmgsKESQg/fH8iDeWVq2tPaA4JXR14WInCiekYIY9X8GYBxv
	 v+2S2s5YrK+EMlc62REZ7YCao5x9cUjTH6z6a0dLif7BvHSQvYq4JMHSxwwTM1aXuS
	 1EtwJmvhlHKjnereQixhR2d5dcJOhjBr3Jn4xpGWAjM3BqKD0FbvbiAQThaoGFlkDd
	 DLZKN7T0R+XMRSD1ZwgxVHqlc54xkVBIdunljgm39zqs7ZJwjDS7xZcGmOITVYfLee
	 zEI19BS2enPqpLIrDi+7FNL2jSpOalh01klMNugAgsXT0+cE407KhXs1hZwu0pUaNS
	 D2VDFkTjl2AGg==
Date: Wed, 26 Mar 2025 17:58:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Cc: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Klaus Goger <klaus.goger@theobroma-systems.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: usb: cypress,hx3: Add support for all
 variants
Message-ID: <20250326-fanatic-onion-5f6bf8ec97e3@spud>
References: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
 <20250326-onboard_usb_dev-v1-2-a4b0a5d1b32c@thaumatec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9k9ZnTZP7lApPE38"
Content-Disposition: inline
In-Reply-To: <20250326-onboard_usb_dev-v1-2-a4b0a5d1b32c@thaumatec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_105818_057198_A75C6A1C 
X-CRM114-Status: GOOD (  17.01  )
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


--9k9ZnTZP7lApPE38
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 05:22:57PM +0100, Lukasz Czechowski wrote:
> The Cypress HX3 hubs use different default PID value depending
> on the variant. Update compatibles list.
>=20
> Fixes: 1eca51f58a10 ("dt-bindings: usb: Add binding for Cypress HX3 USB 3=
=2E0 family")
> Cc: stable@vger.kernel.org # 6.6
> Cc: stable@vger.kernel.org # Backport of the patch in this series fixing =
product ID in onboard_dev_id_table and onboard_dev_match in drivers/usb/mis=
c/onboard_usb_dev.{c,h} driver
> Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> ---
>  Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Doc=
umentation/devicetree/bindings/usb/cypress,hx3.yaml
> index 1033b7a4b8f9..f0b93002bd02 100644
> --- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> @@ -15,8 +15,14 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - usb4b4,6500
> +      - usb4b4,6502
> +      - usb4b4,6503
>        - usb4b4,6504
>        - usb4b4,6506
> +      - usb4b4,6507
> +      - usb4b4,6508
> +      - usb4b4,650a

All these devices seem to have the same match data, why is a fallback
not suitable?

> =20
>    reg: true
> =20
>=20
> --=20
> 2.43.0
>=20

--9k9ZnTZP7lApPE38
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+RAMwAKCRB4tDGHoIJi
0tRpAQDNS6dW2CGP9zLlr+W7yJhcE2bWiGiO3BKrgWFrmthJsAEAs22eY1Eg/Hrt
9vPFW4oviBxxip0Da3nn9lOjzkpFSQM=
=9XYv
-----END PGP SIGNATURE-----

--9k9ZnTZP7lApPE38--

