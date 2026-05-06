Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C94CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8M2bXliVGas1NiAWj7FC4vpwycJ4CgOnVwdzmOmdkQ=; b=ONmZ2v48zpPj0tgwB6j5vIXNm/
	AtnJLO1Q0t8B1ZuyrGu1a7A+uYprCS6aSBeH2rcGQGkb/aIj0b+HbbqDgZbyyBAQktaxs7vZt4vyU
	/wpRl8GRnSx1qP4qlf83GAM3tXNw+d6EXLUsVk28Tnb5AtvhRc6b+zJsGDmpp+WqCXXcWGRGIvrQD
	jQDFEyqElxf1Ev6aJbmtgHjH97CyG44wxd9c4/mxOnXen40bc7EGBBE6lkuqlFlLEPR4f7K6SxL1g
	cor03yJOEgVBdukAU890vGYayt+MyyiggWQ9TuxMOCpQeYzZKmvEybnC5pQUDNQ7YIBEeMVR/9eIt
	oYxiODOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfSV-00000001YiZ-1pht;
	Wed, 06 May 2026 16:50:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfST-00000001Yhw-2AiJ;
	Wed, 06 May 2026 16:50:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AE89435E4;
	Wed,  6 May 2026 16:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24968C2BCB0;
	Wed,  6 May 2026 16:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778086248;
	bh=pOJDXd9BTWPHOrjma3w01gKJ9yQD8JR6DABPprD4juo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VYTUWoW3H5vCjUCgmrfCcJ/xz6rEsCUmILwoWgjoP2FHvtApH+1w3Vy/jxbLBst6R
	 akCmqailADl4hfXoVntaPUvLrq7AnApapbbgNOurAdHmoucg1zZ9uQDZz9PJBnzm7y
	 8imo50Li3WywN/NhjMuvwp3HxdNCc8p8GMmsNZosl7f/TyINq0pBcERAHSCKt1KnCc
	 Hepe+KOWvYHScz+5mq8pVtMJgjB+IsL0pQyRULt3atNtks0TVmegYWRMT9gQQBeY4T
	 IHerAaQxJVTV/TIiORWAe3XwExBQD+j7W9NL5s+BKeQOH7qLSv0G0GwOBnWEN7q1cl
	 P6mIWE3jq8Qkw==
Date: Wed, 6 May 2026 17:50:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>,
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: raspberrypi,bcm2835-firmware: Add
 bcm2712-firmware compatible
Message-ID: <20260506-unguided-duty-892b11b7c618@spud>
References: <20260506-rpi-otp-driver-v3-0-294602663695@linutronix.de>
 <20260506-rpi-otp-driver-v3-1-294602663695@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UAK+6adw4mTfXo2d"
Content-Disposition: inline
In-Reply-To: <20260506-rpi-otp-driver-v3-1-294602663695@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_095049_599077_4B2EDFBD 
X-CRM114-Status: GOOD (  16.05  )
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


--UAK+6adw4mTfXo2d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026 at 02:28:15PM +0200, Gregor Herburger wrote:
> Add a compatible string for the bcm2712 firmware.
>=20
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml      | 13 +++++++=
+++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm283=
5-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm=
2835-firmware.yaml
> index 983ea80eaec9..fbcfa2bc168a 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> @@ -21,9 +21,16 @@ select:
> =20
>  properties:
>    compatible:
> -    items:
> -      - const: raspberrypi,bcm2835-firmware
> -      - const: simple-mfd
> +    oneOf:
> +      - items:
> +          - enum:
> +              - raspberrypi,bcm2712-firmware
> +              - raspberrypi,bcm2835-firmware
> +          - const: simple-mfd
> +      - items:
> +          - const: raspberrypi,bcm2712-firmware
> +          - const: raspberrypi,bcm2835-firmware
> +          - const: simple-mfd

This diff doesn't make sense, either the new firmware is compatible with
the old one or it is not. It shouldn't appear twice.

pw-bot: changes-requested

Cheers,
Conor.

> =20
>    mboxes:
>      maxItems: 1
>=20
> --=20
> 2.47.3
>=20

--UAK+6adw4mTfXo2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaftxYgAKCRB4tDGHoIJi
0sjZAP4qTF2TnlozstYloQhMzmmjOpygViy+wQxmE1B/ZrNgHwEAxV3cIWEz1ig7
ohLMbJt8aoOkyiAMSEZJajxAUxfmfwg=
=bVxd
-----END PGP SIGNATURE-----

--UAK+6adw4mTfXo2d--

