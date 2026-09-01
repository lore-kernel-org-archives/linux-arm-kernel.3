Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A27C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkP1vNEKI6uUWzzivLoL8Kvrvp5iSP9jmOdS7vY4RF4=; b=uZHZefwT9xRAVjHss/wBMTnYuS
	0ckm4zLwcVHzEevF2Xwad4dGPiEovbaUgkeYy2QeJArM8mnuivr/m1YMl39WygcH3ENeQyXAV2TEx
	9+TckAQ47gvXOIGq/h5LH4W2SEcpUAEQTgnV/yTVCvilGI5QhWSpxkUb+qd22VJrk6kpS2dWD8ZQo
	i+ERmmZ0qR2+F39haDOPwPMcJBDRm+QzvEeIRC8hYwDzxuMfOSJ/u/VGMMPFFXtRh6hFXNFEeGB4+
	gussjNjuwuiy2VWkr3MfI2Ao5nTXRGiFzyjkCPMd38vvA0qTTHJXtmdQtJm9G65AZgeOn2rv6nqxX
	/cbGqYoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Sh9-0000000Ctnq-3SFP;
	Tue, 01 Sep 2026 17:54:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Sh9-0000000Ctni-0zMw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:54:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FFCD6025F;
	Tue,  1 Sep 2026 17:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA621F000E9;
	Tue,  1 Sep 2026 17:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788285290;
	bh=VkP1vNEKI6uUWzzivLoL8Kvrvp5iSP9jmOdS7vY4RF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XE7mpnwRst/vuAgkcv1zY7mH3V4esg+Zr6i3BfCFjHy9Whqjv7iBXWHtCkF2yeRIF
	 vTBdT9BO+ZH2oMQR6KQ1bqT9Tzbt9dXu5/8PATv0hCVtie20vxsiXF3RurV7mDs58s
	 970ue5ZeV1rgt7g6dFZ+8oIpf8QAIo3F6Tjh5cSYlydy0BpYx5alCTNNdtzcLcaodN
	 og9dOyUdAchXj7eSUxN9wizGrmoYXsDSV1nCQcTMmW4k9sLjtcFFVwTOka0kSJHG9u
	 RJpA1utgKrUPd7BGeOArJLDahZg4QF0t/T5bvwFtbf3bYRDfYeRRkjmFq+6wnj0ZF6
	 g4SXpG+horvyQ==
Date: Tue, 1 Sep 2026 18:54:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 2/4] dt-bindings: usb: generic-ehci: Document ST
 STM32MP2 SoC compatibles
Message-ID: <20260901-buzz-mousiness-96fa5be618eb@spud>
References: <20260831231814.137120-1-marex@nabladev.com>
 <20260831231814.137120-3-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M8TW/Do5h1gH3Rsl"
Content-Disposition: inline
In-Reply-To: <20260831231814.137120-3-marex@nabladev.com>
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

--M8TW/Do5h1gH3Rsl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 01:17:33AM +0200, Marek Vasut wrote:
> Document SoC compatibles for ST STM32MP23xx and STM32MP25xx series of
> SoC, so they can be used as more accurate compatible in SoC DTSI. The
> SoC uses access controllers, therefore document access-controllers DT
> property. For details, see access-controllers/access-controllers.yaml.
>=20
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
> V4: New patch
> V5: - Fix typo, clocs -> clocks
>     - List clocks entries as list of description:
> ---
>  .../devicetree/bindings/usb/generic-ehci.yaml | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-ehci.yaml
> index 5d9dfea8e2160..908b02d9175e0 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -57,6 +57,8 @@ properties:
>                - socionext,uniphier-ehci
>                - st,stm32mp13-ehci
>                - st,stm32mp15-ehci
> +              - st,stm32mp23-ehci
> +              - st,stm32mp25-ehci
>            - const: generic-ehci
>        - items:
>            - enum:
> @@ -82,6 +84,9 @@ properties:
>      minItems: 1
>      maxItems: 2
> =20
> +  access-controllers:
> +    maxItems: 1
> +
>    dma-coherent: true
> =20
>    interrupts:
> @@ -195,6 +200,23 @@ allOf:
>      else:
>        properties:
>          clock-names: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp23-ehci
> +              - st,stm32mp25-ehci
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: PHY clock
> +            - description: Bus clock
> +
> +      required:
> +        - access-controllers
> +        - clocks

Since the property is new, I think you should add

else: properties: access-controllers: false

even though it may mean a bit more of a restructure if another platform
wants access controllers.

pw-bot: changes-requested

Cheers,
Conor.

> =20
>  unevaluatedProperties: false
> =20
> --=20
> 2.53.0
>=20

--M8TW/Do5h1gH3Rsl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapcRZQAKCRB4tDGHoIJi
0lp4AP9cO9zhPwXHXdTZ0IDfuCD/7PlDxqvGX0qqGN7BC14/qwD9HpJvU/g8afzg
cbfHzBkuvbcExEn4EkIIee5Xqz/7LQI=
=xSDU
-----END PGP SIGNATURE-----

--M8TW/Do5h1gH3Rsl--

