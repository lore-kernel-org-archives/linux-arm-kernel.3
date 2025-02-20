Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845CDC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2dgO0/WumT0UHpa9g/06CqR8KBq3+iPEhbdAQlISMM=; b=svRXd1kTc7rvA2S1hAUOM+20Ec
	QVmAHgsiW3alPMpcmrbZ4cvLaK6vc4cy1XsuWd2jJxmbjFRSqcyyMeAitAzJ3r8claLI2CcFJ4g1n
	VA8JNrZxYgfKZfzlo5L8gGYXR+JaCrXA+GYlyO/zXmz+zZMIdWNyRE+tI0JBstvnKpp9KX3yIftwa
	rgqR5MwZC88cFDF1Q/BCtRlWpECJvjFhsJTZM7niW7Wp35BKygFjhxuZaSaskgdVPjOIAD95X9qBA
	NJ779ihEO6+wkioC30gU5NlZ1T7WbrjTFcVgu36koO3UGLCqkfG26RJPmEs7QfpGAleydFPNlBOEi
	QYCR/47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAEW-000000026aM-21dc;
	Thu, 20 Feb 2025 17:21:08 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlABc-000000025bM-46b5;
	Thu, 20 Feb 2025 17:18:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ECCC6615D1;
	Thu, 20 Feb 2025 17:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B913DC4CEE2;
	Thu, 20 Feb 2025 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740071887;
	bh=Z2dgO0/WumT0UHpa9g/06CqR8KBq3+iPEhbdAQlISMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcmOzMvW4JIwJparBiYVKIryFuiTlW2Pqv3d/5vZ9aqOGbSzX2myip7poZdKwQxF/
	 kco7+x0wcGepCahG6fG0kJ+OX+2q6DDFFYRksccaPpTzcUSASKXlGr+6DGjPx3ti0L
	 47IhkEtO1nGrTNLup+6HGfXnihDHyi+0n72UbxHTcyrDs6sg1PTdp2IzIzDZkG3Dur
	 MUbJx9n0ZcRIGxSKiCheGaeoXS5Z+cSQhdrWXy2+XHij3t67Xc12I50Od96cKnkh1S
	 wbXDmzuOmXXcv0PQiFkWqau/auRrUmJClFqqUkE3ogOx6lKLKIx46SiljExgCDS1aa
	 NAZTXhuW/V3Vw==
Date: Thu, 20 Feb 2025 17:18:02 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: mediatek,mtk-xhci: Add port for
 SuperSpeed EP
Message-ID: <20250220-travel-undercoat-339822407907@spud>
References: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com>
 <20250220105514.43107-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZISaQ+/FlBvHadWX"
Content-Disposition: inline
In-Reply-To: <20250220105514.43107-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_091809_076610_9466C3EF 
X-CRM114-Status: GOOD (  10.72  )
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


--ZISaQ+/FlBvHadWX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 11:55:12AM +0100, AngeloGioacchino Del Regno wrote:
> Add a port used to connect the SuperSpeed output endpoint to a
> Type-C connector.
>=20
> Note that the MediaTek XHCI controllers are always in front of a
> different controller handling the USB HS (usually, MTU3), so the
> only port that this controller provides is SuperSpeed, while the
> HighSpeed one comes from elsewhere.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ZISaQ+/FlBvHadWX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7djygAKCRB4tDGHoIJi
0pwNAP9LSza0fN2VrkokGvJROiNTsBtv8u28z6YZ0tVasE/wSQD9GZqsn3abIJ14
wNsSo8xwfhXVj8RsgcZpEbcLFtCN+Ag=
=OB/N
-----END PGP SIGNATURE-----

--ZISaQ+/FlBvHadWX--

