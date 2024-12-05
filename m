Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE09E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ja94G2qpSU+ghCXTfMwoMLkzeusJYCWJ7mdArQQw+rQ=; b=esnWUJWUyp2EZSEXad4K8HJ4iG
	accZmMN8UTxsbjMQOAz3UyeaRG5+9FBuBYfnTSKgrEj8lXj0Ti63htMVg/LIQvhMve0yWcE/giUI9
	cG/1izyGjhLLKh6aOASa+Qfgx00mjWm3NfFvnWT+a3kTqvcmvigU3ICT0qNtWTr0lX4YYE4dcEptE
	O9XH/3EBh5Dk9VrOmYyvWYU7waDMTdHr526g7EbUy6VQIMaBVfb6ny2/CMaM4yE7EWwAjppvDX7R6
	Y6MBLXskpwCw2foV23XMKOVDIISTaBuiOZ1UlYw7T2hnpsF9e18PX8pMB0oLJ4+/L5m63Q4yDOw7f
	4vNh7CVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFxC-0000000H0qJ-0MLz;
	Thu, 05 Dec 2024 17:47:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFvK-0000000H0St-1A1m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:45:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1EA17A43E7E;
	Thu,  5 Dec 2024 17:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B403C4CED1;
	Thu,  5 Dec 2024 17:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733420756;
	bh=nGiGDxSwpX5NzSRcfmeq622cRq3f8dYXZA6kZrnrbhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ratMgJlhiLrVN4gLH4jqRX6FLHacP6HUeCoyVzobNhZrk+Tmwu+W5TTshdmFwm2TC
	 ha1i/hpxidOgqtCCFgUJCgsUxF3+ZKqZTl8eyA8C4NbZO9+nStt4GJjYfTxJrmusUT
	 L3mb1vSqbFm4miSRUXGUhxyay4C6ig20Jn7kZAN7KGK6YqKifAXxMHn0j2mcjx7o8T
	 ljfmhcZ4oMiNP/BqChgJwp+t0xDB9uwPR+c90iT9dP2O9GsFWboZYWovb4dohMe6G7
	 T9/34pWNuRYQlEOFrlurSc1mgqbdmOQyVmIlZ/OnN8OtZF17YsXnpk+Ht+LEQ/8BYt
	 4vc3JBlPTfkqg==
Date: Thu, 5 Dec 2024 17:45:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH] dt-bindings: mmc: atmel,hsmci: Convert to json schema
Message-ID: <20241205-trickster-rebate-d5e64bc29992@spud>
References: <20241205-hsmci-v1-1-5a25e622dfed@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a1zPdUEOUiPmOEQF"
Content-Disposition: inline
In-Reply-To: <20241205-hsmci-v1-1-5a25e622dfed@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_094558_379194_E5F7DD6D 
X-CRM114-Status: GOOD (  13.40  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Aubin Constans <aubin.constans@microchip.com>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--a1zPdUEOUiPmOEQF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2024 at 03:27:02PM +0530, Dharma Balasubiramani wrote:

> +patternProperties:
> +  "^slot@[0-9]+$":
> +    type: object
> +    description: A slot node representing an MMC, SD, or SDIO slot.
> +
> +    allOf:
> +      - $ref: mmc-controller.yaml
> +
> +    properties:
> +      reg:
> +        description: Slot ID.
> +        minimum: 0
> +
> +      bus-width:
> +        description: Number of data lines connected to the controller.
> +        enum: [1, 4, 8]
> +
> +      cd-gpios:
> +        description: GPIO used for card detection.
> +
> +      cd-inverted:
> +        type: boolean

This type conflicts with mmc-controller.yaml, it's a flag there.

> +        description: Inverts the value of the card detection GPIO.
> +
> +      wp-gpios:
> +        description: GPIO used for write protection.
> +
> +    required:
> +      - reg
> +      - bus-width
> +
> +    unevaluatedProperties: false

Do you mean additionalProperties: false here? You listed properties
contained in mmc-controller.yaml which makes it seem like you're
restricting to this subset rather than allowing all properties - but you
need additionalProperties: false to do that.

--a1zPdUEOUiPmOEQF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1HmzwAKCRB4tDGHoIJi
0mIMAPwKQdE3NtmqK62QK0fY/gffw/1Vv38EcC2tMQW4KwioowD/SFG716kAPybn
xXpMRahY+A5Yq84OK3/ptAMO/gvGOg0=
=1UUd
-----END PGP SIGNATURE-----

--a1zPdUEOUiPmOEQF--

