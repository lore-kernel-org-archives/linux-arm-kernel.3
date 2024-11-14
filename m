Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BB7D6A221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 20:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/UQK8s1cbYWBIAsxKIicMzoMkGhyA/MnTATZ79yzHo=; b=nxOKjlOI0jmFm9dhpdBnyjyaIE
	lJTczJOju1V1mKJXACVsO5yzkpD5XPhbVbEw9dnWfRVFLhNIPrJ8Fnwz+LsQPEhGn79dnKpii5HXB
	tgQnGIyCKgjzE9moh2lfDC6zkb82vT+m94mkspOTqrz5smW45h+DfRvoaEyZzab4NM79ItH1ARkIX
	gFj2p5prLNcm9n+7o6wV10n/Fu9M/tZA2zEO5NT//Dcdzd5IBiAldNA7rks8fmeY8HzgJVX7SSqAh
	0cEEOhop+xy8Sfm3avE2NQblboHsnbVSJLcVTDyMIBD3Dp7nKRg0Bef5dbo6wTfO5jFqoKJl0S+Tt
	Nl2W6RzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBg7c-00000000hj2-0vv8;
	Thu, 14 Nov 2024 20:07:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBg6g-00000000hbu-0nDD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 20:06:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51DBD5C5ED9;
	Thu, 14 Nov 2024 20:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6ACBC4CECD;
	Thu, 14 Nov 2024 20:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731614781;
	bh=+qErtJSAtXbxwYe6icG0dLk6au77bP2XR4LohEja7Ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDxJHMbhx68G8JfrXELVLvUwb2oPsOD5P423u74SIvbwZ4LnpJNiBD2f6Eio70YTc
	 4gJ4+KHh5ZhwmMvCnPIr00MukmusQKmx3XIplqN3GaW6/Zgj0iADc59D/VJt6E2Fpa
	 rwqwow/QLOjr627VYQSSmoo70MEYaTnaiLngpls5ZMA7ZtohH/YROhEmrpLbgBYIBX
	 M2Bm7UHx+onpc4PwnON55gjKsIAL4JMC+fOAshMBVWttr881a+QVz/LkSflY7lrZwO
	 wTiv3mL+rV4+/sctWfWA+EueB8SgWd4x+Q8rVlq+Qc+oBBkoP0sONT04qf0PpvmIBf
	 v31dNt2XqA9WQ==
Date: Thu, 14 Nov 2024 20:06:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Russell King <linux@armlinux.org.uk>, jacob.e.keller@intel.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 8/8] dt-bindings: net: sparx5: document RGMII
 MAC delays
Message-ID: <20241114-liquefy-chasing-a85e284f14b9@spud>
References: <20241113-sparx5-lan969x-switch-driver-4-v2-0-0db98ac096d1@microchip.com>
 <20241113-sparx5-lan969x-switch-driver-4-v2-8-0db98ac096d1@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eNDowPgtkxFgCrJx"
Content-Disposition: inline
In-Reply-To: <20241113-sparx5-lan969x-switch-driver-4-v2-8-0db98ac096d1@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_120622_313814_A8850970 
X-CRM114-Status: GOOD (  17.97  )
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


--eNDowPgtkxFgCrJx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 10:11:16PM +0100, Daniel Machon wrote:
> The lan969x switch device supports two RGMII port interfaces that can be
> configured for MAC level rx and tx delays.
>=20
> Document two new properties {rx,tx}-internal-delay-ps. Make them
> required properties, if the phy-mode is one of: rgmii, rgmii_id,
> rgmii-rxid or rgmii-txid. Also specify accepted values.
>=20
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> ---
>  .../bindings/net/microchip,sparx5-switch.yaml        | 20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switc=
h.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> index dedfad526666..a3f2b70c5c77 100644
> --- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> +++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> @@ -129,6 +129,26 @@ properties:
>              minimum: 0
>              maximum: 383
> =20
> +        allOf:
> +          - if:
> +              properties:
> +                phy-mode:
> +                  contains:
> +                    enum:
> +                      - rgmii
> +                      - rgmii-rxid
> +                      - rgmii-txid
> +                      - rgmii-id
> +            then:
> +              properties:
> +                rx-internal-delay-ps:
> +                  enum: [0, 1000, 1700, 2000, 2500, 3000, 3300]
> +                tx-internal-delay-ps:
> +                  enum: [0, 1000, 1700, 2000, 2500, 3000, 3300]

Properties should be define at the top level and constrained in the
if/then parts. Please move the property definitions out, and just leave
the required: bit here.

> +              required:
> +                - rx-internal-delay-ps
> +                - tx-internal-delay-ps

You've got no else, so these properties are valid even for !rgmii?

> +
>          required:
>            - reg
>            - phys

Additionally, please move the conditional bits below the required
property list.

Cheers,
Conor.

--eNDowPgtkxFgCrJx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzZYNwAKCRB4tDGHoIJi
0tseAQDj+4EzZBz0Olii65irqWB4dSvXcjEhBM44bZwOPV01VQD/VdnzMjewFP1O
G21peKsEaCjo/s/xbOGZESYTlDp/mw0=
=RG0u
-----END PGP SIGNATURE-----

--eNDowPgtkxFgCrJx--

