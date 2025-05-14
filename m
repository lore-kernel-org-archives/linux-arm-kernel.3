Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3352AC54756
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3woz04Pv9OqB7s5d5XN3SM8aX7++vAPSKJ2i0HXWMg=; b=s10ukKaD9njZxEJTIa1U7ffhN4
	8w3066CWjdj+/w/FZxhUOzqXKNqjfMM0gzAY/GZaNi4YOSRvUaugWy2Co3HosgVtnd6teSJkYkvwI
	9GxZdgy2by4+aot75KO0JxN062BAVgax4Qt4TooIycxv5wN7KmvfwG0uq4JqNxiSxEfZZ568EqWkd
	LtKaVX6oB27JCXTGa9z92RMCa4tqIdm0GgUwuu8/lw3B2XK743Ok3sZh/ykSzx/DhoXHLZvnMohy7
	srX5XZl1sX+Z29UfRG1UaMfKAsmIqvqMYn4UlHgKVlJHh+/jWccKZWfZixJo3YZuNxqCKjTRJCRyT
	/Gogfs9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBU-0000000FtoP-0VND;
	Wed, 14 May 2025 17:46:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFENY-0000000Fe7a-0PSf;
	Wed, 14 May 2025 15:50:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E229A4DEC7;
	Wed, 14 May 2025 15:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05264C4CEED;
	Wed, 14 May 2025 15:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237842;
	bh=M3woz04Pv9OqB7s5d5XN3SM8aX7++vAPSKJ2i0HXWMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yw6lBK8wkLDW8v1I/JLiN8afunRJZg5PZW9nhqlzybGETE51+sgaGZ7d+tcW7cMhI
	 nBTtxybN9FYVZowX+ODaqGqHiOrst8TO03GFRjiQk4nzyC6TonnBVgF5egMU11XGtP
	 9YsDB3MeNHgg/5LJ0Ex4/cUtzS2/OBSboIB9gh/Qp6Q8okW8W6GgnlZG/kEDxmwOR2
	 m2Jvh3omi5R2w0y4+WNRNytT+TZvZ3P+4f1oXVfi+UFg1TJv49bVNdw+r1zHmSVCxl
	 1VZ+yfF4ymBVTewvnNpfX+2Zj3ONBRtMiNpMq65+xRmQxDyeA/NF8A7UsHkVRyxlW1
	 YUxHqc7A/EPww==
Date: Wed, 14 May 2025 16:50:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: Simplify
 mediatek,clk-provider
Message-ID: <20250514-stir-porridge-b52d88b50ae1@spud>
References: <20250514105702.28622-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5CRYNW3obN/3u7l6"
Content-Disposition: inline
In-Reply-To: <20250514105702.28622-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_085044_238221_0963DFEC 
X-CRM114-Status: GOOD (  10.73  )
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


--5CRYNW3obN/3u7l6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 12:57:03PM +0200, Krzysztof Kozlowski wrote:
> "mediatek,clk-provider" property is a string, not an string array, thus
> "items" is not really correct.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--5CRYNW3obN/3u7l6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCS7zQAKCRB4tDGHoIJi
0vucAP0ZLj98/0xHcsnZq3ruzOd9P3Y0Z5wyirXAYCFjg+5G2QEA92rfx6Wpafbl
JUg58i+SRsWf56f7tK0VKcHUSIbJPAk=
=KTct
-----END PGP SIGNATURE-----

--5CRYNW3obN/3u7l6--

