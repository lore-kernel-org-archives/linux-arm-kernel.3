Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99560FDEE39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pN1bHXTr1LlOb/G1azX3CC1+rwLeWTb7QNVStx+Ul2g=; b=SByMpGw3+8tv6mvPzG9ZdwGwE5
	tyzWBBxZgGFr0Y31rufiS5j3DmuEE3nqg92q/HAS3XqoUsmKzMhLJQbpisDAF+jptBJpXbFWzj8Bp
	tRibCaIE0U0+tn78k2QK3zhOHaANWjozCNW2jjxHG8fYcVMgDqg6htgWlPEZYSnb7ev3f40zH/Ict
	AZG3KZRTyC27x96nrz4RSBD4L9Ru8yOo4nEFlGyCtQldMUSiUWyxALB81meSJ1eqSjRF8ZZDVg4aX
	fpw7GMkxd60MV08gGkRc8HhT+O8OTLZj795othr6W6rGO93uPV3ykT/khReGi95T4Bw6de6BPVodM
	mOHWkWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFy6I-0000000C4ei-2Q93;
	Thu, 23 Apr 2026 17:44:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFy6H-0000000C4eY-05CL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:44:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5119760139;
	Thu, 23 Apr 2026 17:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B558DC2BCAF;
	Thu, 23 Apr 2026 17:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776966268;
	bh=Ca6918fcOAXDM3mevQIr9UFJydEQNXb86m/+edpbIC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aBu8iRtFL+Ml28WAMlWVSTzNQysPYMICkXs8iHwEl66fo33PA83dxwmevXPQQ+8r+
	 03oNzphPXfEn2JbEdywqHe7tIQBtSWk2smDoiP5qJEz4T9SIQJTUmfhl4b9SQHt5je
	 ZOwt4sdI6EeBvPuh2YSRd1/7Nzc0ld+fSTlcJlo/M6Q/KKZVTJ9Yb0rkFLeCpYg3vq
	 RUXInthqnG+cSRYc7ZytRSXcRZSrWI99++7ZWujhmzXACHfFkIte2jw04JlDIc58OZ
	 +EYO0HeTnSkElit8Iw3fYHtGMH0IddZ9VlxfAChsS1CaEM59XvTguRxlE6Em7hXYYF
	 Onb3Y/C9LQ6gA==
Date: Thu, 23 Apr 2026 18:44:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v7 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Message-ID: <20260423-clever-swooned-a06907e9101e@spud>
References: <20260416-upstream_pinctrl-v7-0-d72762253163@aspeedtech.com>
 <20260416-upstream_pinctrl-v7-1-d72762253163@aspeedtech.com>
 <20260416-brutishly-saga-ba7168a4cd14@spud>
 <OSQPR06MB7252EB0C2A1A3313DE49406B8B202@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260417-anemia-borrower-fb90ac02b417@spud>
 <OSQPR06MB7252BD7967D2567AD6DA7A1D8B2F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JAt2RGrDeiha8/Di"
Content-Disposition: inline
In-Reply-To: <OSQPR06MB7252BD7967D2567AD6DA7A1D8B2F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
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


--JAt2RGrDeiha8/Di
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 07:22:57AM +0000, Billy Tsai wrote:
> In particular, I'll split the constraints as follows:
>=20
> - For pinmux, the presence of `function` will require `groups`, and
>   `pins` will not be allowed. This reflects the hardware design, where
>   the groups are defined by the pins affected by a given mux expression
>=20
> - For pin configuration, exactly one of `groups` or `pins` will be
>   required (using oneOf), so that configuration is applied either at
>   group level or per-pin, but not both.
>=20
>=20
> - if:
>     required:
>       - function
>   then:
>     required:
>       - groups
>     not:
>       required:
>         - pins

>   else:

I think this is a separate section under an allOf, rather than an else.
You can also simplify the condition above to just be
- if:
    required:
      - function
  then:
    required:
      - groups
since the node will then always be tested against what you have below

>     oneOf:
>       - required:
>           - groups
>         not:
>           required:
>             - pins
>       - required:
>           - pins
>         not:
>           required:
>             - groups

I think this here simplifies to
oneOf:
  - required:
     - groups
  - required:
     - pins

You'd also need to note that pin level config settings should take
precedence over group level ones.

--JAt2RGrDeiha8/Di
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaepadgAKCRB4tDGHoIJi
0iGUAQCSvZRjl2it7AaROKHK0Bp704DuQXDbJXJ0D6NcO6IYSQD/TPXLQsCR9Y10
jtbhzr6qfBOMLqlIhuZTFyJ2Xq5jBAw=
=i4l7
-----END PGP SIGNATURE-----

--JAt2RGrDeiha8/Di--

