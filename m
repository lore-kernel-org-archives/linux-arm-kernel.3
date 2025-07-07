Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770B1C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 07:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xpUGzx5XUIwKijtj4c4klwtUVo3WA6y0pnfYttrK40=; b=AXjk9cdVnqFC+cmXTKAocIsG4R
	n7xMzkmCb4eDny8TMx8Loz16fLIuqNCL2eJed9kOgtnJJz81ICdryvd/cV/yf1fRdRiqxtetj9p8M
	MpUNmx1OoQEicFydBxy8bQeSKoNIgUsib7+rZj1rU79mIcqGRs0WdfR+7zP8FAtHMV508e3eXbaJ5
	5w9r6druV/xWV2S9zRziH6m0K9HbfFfGsRxsZTHlpSUk39zkVRs1/IaTr4WtszwwpNh22nFwyFa1z
	rWTtiJaPuzaOv9xqwACN8XD5zpPlWLy1a7icWy9he6C9vQ4kQT4NAuzOh9qi2TDct1UU4P0dV8fF5
	8FDtfkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgLl-00000001hWj-1VFH;
	Mon, 07 Jul 2025 07:33:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgDo-00000001g24-1Xp6;
	Mon, 07 Jul 2025 07:25:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E14055C59BA;
	Mon,  7 Jul 2025 07:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1942CC4CEF1;
	Mon,  7 Jul 2025 07:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751873103;
	bh=46eFcGLsdRruwrd7qIW78WbO3QHQaWoFdR8SB3+A13o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sMaIBRWJbuqMJ2yNreEoBAkKva2OZkbYt+vqWO+gBU8hSsgbbEBiqLk9MaSzkT1/W
	 7b73V3gs3y2WBe1aiKHXL2FQt9xxZfUmRZhbfMzzm6nh+gmOgF4CaznOX8z2m+lMLc
	 VxsRBrChaLj3NjhhTwIGfUMYuZW1Eu6Tjb2YgwlQyrrHMeW28UsEU0NV2vW29mnauS
	 3uKpUiqDMEoPPg/LwkdrPBwIVZYuWRVNgK77bGbLbEMzHDpME+wF+OwUuTJeLgQ7E4
	 SOSZUFYhgrRGzeWRHtFCh3p7XwsLCYtvypsf9ASmrBPAt97YJPcYP4WumMV3+OHaNN
	 txFYPf2VItdvQ==
Date: Mon, 7 Jul 2025 09:25:00 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/7] dt-bindings: net: airoha: npu: Add
 memory regions used for wlan offload
Message-ID: <aGt2TFyD5-NPUoY4@lore-desk>
References: <20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org>
 <20250705-airoha-en7581-wlan-offlaod-v2-1-3cf32785e381@kernel.org>
 <20250707-topaz-pillbug-of-fame-859822@krzk-bin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e3pQYbwqGNuliQMT"
Content-Disposition: inline
In-Reply-To: <20250707-topaz-pillbug-of-fame-859822@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_002504_488622_5F7D9162 
X-CRM114-Status: GOOD (  15.95  )
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


--e3pQYbwqGNuliQMT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 07, Krzysztof Kozlowski wrote:
> On Sat, Jul 05, 2025 at 11:09:45PM +0200, Lorenzo Bianconi wrote:
> > Document memory regions used by Airoha EN7581 NPU for wlan traffic
> > offloading.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../devicetree/bindings/net/airoha,en7581-npu.yaml   | 20 ++++++++++++=
++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.ya=
ml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > index 76dd97c3fb4004674dc30a54c039c1cc19afedb3..db9269d1801bafa9be3b6c1=
99a9e30cd23f4aea9 100644
> > --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > @@ -41,15 +41,25 @@ properties:
> >        - description: wlan irq line5
> > =20
> >    memory-region:
> > -    maxItems: 1
> > -    description:
> > -      Memory used to store NPU firmware binary.
> > +    items:
> > +      - description: NPU firmware binary region
> > +      - description: NPU wlan offload RX buffers region
> > +      - description: NPU wlan offload TX buffers region
> > +      - description: NPU wlan offload TX packet identifiers region
> > +
> > +  memory-region-names:
> > +    items:
> > +      - const: binary
>=20
> Rather: firmware

ack, I will fix it.

>=20
> > +      - const: pkt
> > +      - const: tx-pkt
> > +      - const: tx-bufid
> > =20
> >  required:
> >    - compatible
> >    - reg
> >    - interrupts
> >    - memory-region
> > +  - memory-region-names
>=20
> That's ABI break.
>=20

ack, I will fix it.

Regards,
Lorenzo

> Best regards,
> Krzysztof
>=20

--e3pQYbwqGNuliQMT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaGt2TAAKCRA6cBh0uS2t
rL0dAQDG1PVfQDAI41H6UAq/YG3w4NGMDvYKFYsgeoSPL2kTYQD/WDbDbBpyfLSw
rZNTUbVkPrTPxy19YEn1NsgkFGkCBgg=
=Hdxr
-----END PGP SIGNATURE-----

--e3pQYbwqGNuliQMT--

