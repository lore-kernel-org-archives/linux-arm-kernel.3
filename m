Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5DEC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KvwpnK3mCuZgQ0AFnfzZhO+OwVQRaf/A5R/qb1NPIk=; b=vbArv1DEF1y1jn2uJYoEOO/iy3
	+Mu7AKSISRK5er+9II7UBLkgl86NPW6ecpwtnapk6Q8PLZzTCyFi3OVGGaGPO6pSXuyeAM8oQZRZK
	bY+F9CjR/DNUT7Eah236vUdfTighkcNeoQcher5tKVApeU3wif/zha5cgQ+oJOg1S2Iq0BVV566Tk
	Dm4FZX5zIlOG6Yqy4LNpucwIz7QJrdot/UKA2NE5XLqW0TaMA4VmP6QSU+oa7oSQgpfQLqjcfEdoV
	L5f/s3m0fZ/gNERRBFDMhP50cOt0Iu0NCyFKY0G6M3peRyqndQld/shJZtQwYsnuAThXl38WXFRLt
	Yj/fQJEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHWn-0000000DLAE-3rUs;
	Wed, 28 May 2025 14:13:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKH6g-0000000DHMg-2Hvo;
	Wed, 28 May 2025 13:46:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E63735C0680;
	Wed, 28 May 2025 13:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F8DC4CEE7;
	Wed, 28 May 2025 13:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748439969;
	bh=oq6Fac4wS0SHANH2J2t3p21BoUKhwTFerUYFaLqweXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fz/vjLJBco5Nolft1Ameracr5zQZuWlEjDpRrZfwHbbD1CdFkvvu7lcYeOq8Dm1iN
	 jIRW6PW2JF6IRXEBZU5XemKRYa+DIh+K9Xen+vwLg14fNQpziBW3M3gKUNKlWdc2Pp
	 vIGsAXGkw4opFX2GH41OOq8IWSrAttIbQbyD6cS1Clirj4qJ0EDFgzBoQuDcA8a+Cp
	 s0LpDAOSuYh8g0XACgKgFEhHAwyICnrve8/hboDl5wKMyTJLZs4jZ6IB3RBeg+VM3Q
	 eeit6KsvBpRXCw9DHZ7jFkfJ+I/5S+Yhh/Eq8jApLuptSeFLuUWUe9l1qQHGj8pmxz
	 FTvC+hUjrxyDg==
Date: Wed, 28 May 2025 14:46:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 0/2] Add MT8189 jpeg encoder and decoder compatible
Message-ID: <20250528-energetic-voltage-b02704c14df8@spud>
References: <20250528095748.17485-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vv8zY9ORmuVZuCZ/"
Content-Disposition: inline
In-Reply-To: <20250528095748.17485-1-jianhua.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_064610_626966_AA92D11C 
X-CRM114-Status: UNSURE (   8.99  )
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


--vv8zY9ORmuVZuCZ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 05:57:46PM +0800, Jianhua Lin wrote:
> This series is based on tag: next-20250528, linux-next/master
>=20
> jianhua.lin (2):
>   dt-bindings: media: mediatek-jpeg-encoder: Add MT8189 compatible
>     string
>   dt-bindings: media: mediatek-jpeg-decoder: Add MT8189 compatible
>     string

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--vv8zY9ORmuVZuCZ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDcTmwAKCRB4tDGHoIJi
0sGYAQC2bzGNx7UyUv973y6yM7B6lHc6xUzFs1DLjDP/D/+C4wEA4pyq+WoirUwj
3RkNS7UtPhUxDGsw7kjuGUrdy7EvEQs=
=pFRV
-----END PGP SIGNATURE-----

--vv8zY9ORmuVZuCZ/--

