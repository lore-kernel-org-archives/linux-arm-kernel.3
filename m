Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90233C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9LKuooXrzGHQU5apnOQ8oee7U4B4rgxUBwxG8Elpsc=; b=oR7PUTMSVsP/qWerpKQZKgnxxC
	uNb5fAttYir7NZeBcrNE0icGKylsgvLE3u1WBQmnYv1xRk1wGslknPDa+09dN3FLOoMU11tTyEkSb
	e3GiuVZCM2yoyex/OCQP6vdPZvwUnJ9ipqzHAnfQcHKhQ9EVvd3w5AL7lXkXTU8ppmvjKYtG8KXpd
	w80s08L8wtcpQFiFws/kFLW34CH6v0MA3XDuudRRuzPzEfwd3CIJvhgM/cPBpbO+4UPZ5aoMqDRaf
	dwyFz7gC/1aLwpzGnz9bdpWVERFqZWCXkAeotixApUaF783RCnUp9nJNPJ+hA1N4XCJAe6q+3gw5c
	7JYuRt9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH32F-00000009k2U-2CYT;
	Mon, 19 May 2025 16:08:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2Bd-00000009ZbT-29bg;
	Mon, 19 May 2025 15:13:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CBCACA4E062;
	Mon, 19 May 2025 15:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D20CC4CEE9;
	Mon, 19 May 2025 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747667632;
	bh=Q9LKuooXrzGHQU5apnOQ8oee7U4B4rgxUBwxG8Elpsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EK2PeuCCXN4Qdn0HbjIA7O/P1dkPFcR1Y7vHXymEBT3i9FmVF9FW3ZIBd5Y7FMWiC
	 nTv1vl7VjFJSKkv/Rf6HdVfDR5i/tjM/Tn2kxLkpefymn9mhz08Xn6riygcRsv2lxh
	 EXJmtBQQZhyY8xvdL+aD2kwFGwxN70g2fU92DScXGvhUuoOAoVfZ6EcuU9yh5LFBYH
	 vvd5lODD7L0FSVyG+7lq6saVXLdeA5FXPEoyBbWG/1wFdkg6ZsGTjHRdGIldv47Iiq
	 6r9h2fthwjA/bRjzTsYzCdcWilZFasK/sI8Pux0R6IaiOCYNcnnJe07jsj4a9h9pPS
	 v7DsGsW+HIKqg==
Date: Mon, 19 May 2025 16:13:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Garmin Chang <garmin.chang@mediatek.com>,
	Friday Yang <friday.yang@mediatek.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
Message-ID: <20250519-amaze-sloped-9e7d9a63a1db@spud>
References: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com>
 <20250516-dtb-check-mt8188-v2-1-fb60bef1b8e1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="080sWU4ve0SVO/mR"
Content-Disposition: inline
In-Reply-To: <20250516-dtb-check-mt8188-v2-1-fb60bef1b8e1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_081353_618085_945390A4 
X-CRM114-Status: GOOD (  11.27  )
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


--080sWU4ve0SVO/mR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 04:12:13PM +0200, Julien Massot wrote:
> The '#reset-cells' property is permitted for some of the MT8188
> clock controllers, but not listed as a valid property.
>=20
> Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset f=
or MT8188")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--080sWU4ve0SVO/mR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCtKqwAKCRB4tDGHoIJi
0qBfAQD5AkEyB+46Q6g6BR2qh2MvFv0Vgj3nU9m2wiWm30jWFwD/U53P7fut2kFs
/C+1oDJOzggWHzy1BqdNCgr7XWppCgg=
=1n0W
-----END PGP SIGNATURE-----

--080sWU4ve0SVO/mR--

