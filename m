Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCC2CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzg89wI4WRGyBpC4fKo2pvNxEu1GN0EWvVjsQRCbtcs=; b=A2cf38VOeXDLj84umJFGjSrDJB
	MICvtJfTtNIP/Ivctf8v7hFetprywWGVsbWYhHm+PL9OLyBX8UIdfu91Als5Sq5sUmjczDRnjp5NN
	Xcoe9nmVoIGJzYdIBfbnIhTjFwPaTEOxAKZIGt0kUiSEhn6bQn7izEL6F9xstvje8/Q6YBNXPAZcl
	aa9cTGlihv4xZwgVdvjwZOqAQx3zd99JqhWf5sqIr/m6SLw1ukoD5tGPqNFI6It8iWyvLYH416FLQ
	UvMsvpIKeAXSw2MWj8QHloeZc8uEmbsPnhAAE8zhsKwvmvoZsvWVgOUTY19y6aRIAbxX9cFxH5I5Q
	OO/rALAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4cv-00000008Lc2-01Fh;
	Mon, 18 Aug 2025 18:30:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3yf-00000008Fb9-3ZnR;
	Mon, 18 Aug 2025 17:49:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C28C6111C;
	Mon, 18 Aug 2025 17:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF82CC4CEEB;
	Mon, 18 Aug 2025 17:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755539340;
	bh=yzg89wI4WRGyBpC4fKo2pvNxEu1GN0EWvVjsQRCbtcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j0/PUpVIsr0FxfF03cj7AiRvp2SZa1QBYuWG6Vd6oxCrqWOMGAutg91pLETYR3zzO
	 HRoKTY3lkhWGy9O/m9h1LvohwkN216kD9hhXdZWGdDi+ayC7thnLVWt+1bqH5S4s4D
	 Qf5LVxIb4FLTmE3OfSBp+QfEM9BbjwaICINlttAVBBYBYOtvjchqhe8HX+ctp04O5n
	 dHjVpw2vHUt4KFgNUkqTGbJTE0ucmPhFj30GcX6h8FjssBaMBcQD7gM94mq+J3bi4n
	 bzi9l5ehsUCItwSw4584+vtAvInOZubUl9ktrOqXYqnnKRp9bwZ46LjWxB+0JQOQWd
	 qhdD/RcR5gaJg==
Date: Mon, 18 Aug 2025 18:48:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 2/5] dt-bindings: net: cdns,macb: Add compatible for
 Raspberry Pi RP1
Message-ID: <20250818-quack-lid-59e71737f242@spud>
References: <20250815135911.1383385-1-svarbanov@suse.de>
 <20250815135911.1383385-3-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wajkoaFh9Mksd++G"
Content-Disposition: inline
In-Reply-To: <20250815135911.1383385-3-svarbanov@suse.de>
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


--wajkoaFh9Mksd++G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 04:59:08PM +0300, Stanimir Varbanov wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>=20
> The Raspberry Pi RP1 chip has the Cadence GEM ethernet
> controller, so add a compatible string for it.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--wajkoaFh9Mksd++G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNnhgAKCRB4tDGHoIJi
0mjsAP97kK0IfQ7Ov50V5elnbXgZcegx4hBcq+cQedRkxNgC6AEAth4I1+sps9OD
bT0La5XO5WyCakSYJpYh7050t8S+0gY=
=9lyu
-----END PGP SIGNATURE-----

--wajkoaFh9Mksd++G--

