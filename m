Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E81C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Drowwhz676AU4fo5WHa7IssF83cJ85LmVhU3lcAd78=; b=xYFFwM6twYWdIWtRMuwI+VbhvI
	44CEvIzEJTl2iplXUD843BqS3BVjXRcTD3httalWCfzKRuMvh9APEDyDBmeI8FZ+nRgd4vMUx5Sx0
	sKTfWycqA0/7C067ZhasORuB3jNLu4AyFVFXJ/EmHw4RSrYJeYF/kufiFcb6iGWkRrphFT2ZswAnv
	TftO3S6xUbnt7iJM4HDeeScfO9H2rFB26QPWCUYXmzxV0HfS8IEgAKwi5H91PQy/fiC5enkNntwSJ
	4PsUg/fkfB4GHdr1iXgDSMnvhfqXemlHe+iLg0hGwUUJWkt09flUzRM9e97YSFeGO8TikYaANLA/n
	cB3YjA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3Ad-000000018Ol-37eQ;
	Thu, 08 May 2025 15:28:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2YR-00000000zaj-3y6c;
	Thu, 08 May 2025 14:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3EA7BA4DED9;
	Thu,  8 May 2025 14:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA04BC4CEE7;
	Thu,  8 May 2025 14:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746715734;
	bh=0Drowwhz676AU4fo5WHa7IssF83cJ85LmVhU3lcAd78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHKA3SDnK2Nsa+9kO+2+ccSSrr83mCjYDv5m3fQw2npddWiC6YUJDZ1On1b79OGMo
	 nVZCWcwHNO88htlv7HDMlDuNudj/iQD9HZzSfFauEEc+ixQtE3jlKczr1+UfBDuAbi
	 ELzqbfkphJ73EfLc6AshZCJaEFee7JO9PItQGXeEuvhAi85+niAl0cGYUkYZni0AUH
	 AsplfopCzi+GkKhlf6JCrwrMTNZNseBTcDPwnKht6u5p6ivdOVJBm/aWGoFrIqPM6G
	 uBO8c0r3cNnpQ04G4adKFW+tzvd2VI8HF+uWL/JRaB/FMgUk9Vtmv7Aw0kjz2oGCVb
	 3ciLI0hsBjH8A==
Date: Thu, 8 May 2025 15:48:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Sirius Wang <sirius.wang@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org,
	xavier.chang@mediatek.com
Subject: Re: [PATCH v2 2/3] dt-bindings: serial: mediatek,uart: Add
 compatible for MT8189
Message-ID: <20250508-kisser-kiln-647bbdeb7e29@spud>
References: <20250508063546.289115-1-sirius.wang@mediatek.com>
 <20250508063546.289115-3-sirius.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WfsJMtbABQGTO6qR"
Content-Disposition: inline
In-Reply-To: <20250508063546.289115-3-sirius.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_074856_051265_A202BDE9 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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


--WfsJMtbABQGTO6qR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 02:35:41PM +0800, Sirius Wang wrote:
> Add compatible string for serial on MT8189 SoC.
>=20
> Signed-off-by: Sirius Wang <sirius.wang@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--WfsJMtbABQGTO6qR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzEUQAKCRB4tDGHoIJi
0nd7APkB6knx0CdiMImQ9VIt/mR5kLfe5LYFeudFrOjNwFttrgD9HNC9zC6M2rIX
AFFQ94oDHrxCJyRP5Yqjbq9t5zq6uwI=
=wdAJ
-----END PGP SIGNATURE-----

--WfsJMtbABQGTO6qR--

