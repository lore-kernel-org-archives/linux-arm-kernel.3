Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BB9D2ECE6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 21:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkOgK5omqgGH3PbCwDvYdOE90TZXMN9dLZeviE4bqnM=; b=A1U17JX0jCnMF0dKMcVahbU/N4
	1sRNacACx/NAz3MOsJCC0DYemjj83/8DjsS5NXq2YdlMa0vSTmWO4uvN2BcUuvTAWuUoVPcB5Qpks
	N9gGh+ozOqvYqdgRjie/503XL2b3vSjY8Sb2vt8HIV6YCprnBCA+G4/dFgOztWrnDwOrCOR+4hT+l
	Oz/ubK9ZJnL72uf/Uwn2ozWA+GJyszM4OUn342gUtgq8KhcywNt+i3yPwd5WBIJUKOYR+vQlrIFLc
	8qADAvy0/cj4xMWqGIWPZaapxOEaJmiI1c5eo4VnfzHr92uY7pKOzCGmpEHYofV/P4sc+0may7Jc0
	3uwGTaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhweS-00000002saw-37jE;
	Mon, 19 Jan 2026 21:19:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhweQ-00000002saQ-1ESy;
	Mon, 19 Jan 2026 21:19:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EE81438D1;
	Mon, 19 Jan 2026 21:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2778C116C6;
	Mon, 19 Jan 2026 21:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768857545;
	bh=RiZix3ZWSDDX0kVsKNY2/NK7ibKFt0yaP7yosjnxrbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDdIJn00Jog/P1TGthnFCcvdmd9MZ4Kv5OupR2BYOgkjTDGlXiGgFQDD+KwHnqN76
	 +7brQbDWyD5rhRm6Hi3d5kLeGWnGNloNIfs5CR0CIcATh2i2Q9dH0PU/sTwUv8JMmo
	 Yk3tpQMglfC+aKfLLXzcM12JCW6qEi/vW6ELxs3Fdx7I+lu3ahOcwelFZXsDqbG9EG
	 Kl/u1DOdo8KwFZXHToF5NJQqH7QwiHd9qAnqRJ/Vmi9XLJUVy1Dlw403Sj6fiqEmfG
	 BCPWcjx79UYwISheRm9PM9wm1f0TwPf7JRvI55voidsN1qJZ3Q7tYIAmW1Bq9LzNIe
	 Opgg9R0/fAzYg==
Date: Mon, 19 Jan 2026 22:19:02 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 2/2] net: airoha: npu: Add the capability to
 read firmware names from dts
Message-ID: <aW6fxogvp0sQFFsp@lore-desk>
References: <20260119-airoha-npu-firmware-name-v3-0-cba88eed96cc@kernel.org>
 <20260119-airoha-npu-firmware-name-v3-2-cba88eed96cc@kernel.org>
 <2b716edf-23c6-427d-beb5-16127b8bf429@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cLZYzOR0huwzNIPg"
Content-Disposition: inline
In-Reply-To: <2b716edf-23c6-427d-beb5-16127b8bf429@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_131906_491346_752FCB68 
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


--cLZYzOR0huwzNIPg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 19, Andrew Lunn wrote:
> On Mon, Jan 19, 2026 at 04:32:41PM +0100, Lorenzo Bianconi wrote:
> > Introduce the capability to read the firmware binary names from device-=
tree
> > using the firmware-name property if available.
> > This patch is needed because NPU firmware binaries are board specific s=
ince
> > they depend on the MediaTek WiFi chip used on the board (e.g. MT7996 or
> > MT7992) and the WiFi chip version info is not available in the NPU driv=
er.
> > This is a preliminary patch to enable MT76 NPU offloading if the Airoha=
 SoC
> > is equipped with MT7996 (Eagle) WiFi chipset.
>=20
> I _think_ you need to add the firmware file names to the end of the
> file using MODULE_FIRMWARE(). That gives dracul, or whatever is
> building in initramfs, the information it needs to include them.

ack, right. I will fix it in v4.

Regards,
Lorenzo

>=20
> 	 Andrew

--cLZYzOR0huwzNIPg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaW6fxgAKCRA6cBh0uS2t
rGkoAP9P+eNo3FzutaIAdBTw8UVL8in96lthLkhY5MyMzdgYTAD/RUF4ix1+Jwej
w9JdQnMTU5CLmNOkfaPDRBTR36lVYg4=
=a56P
-----END PGP SIGNATURE-----

--cLZYzOR0huwzNIPg--

