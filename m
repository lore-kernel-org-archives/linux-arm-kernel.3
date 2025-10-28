Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5B0CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 08:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDXhTRVe2x23tPuaEkQmJ+KZed5CS4Y7/Sq0vsM+Krs=; b=2OacMVlvQ/3Hmc/ksCLt8RxGp1
	/LLat4IcWlF7bCi7LdlvReupTm4qJXxqYTrWWejI9/topIHlLeNCDDlkurOi5PniMe6wPCqI79+8D
	oFApZI6f4+A2Aj6HnJWp50XwsCZfpkbnNyfXs9v0/U3a86MM/Hnizz+RbJpLzZgNyYM8h0P16et/x
	pFrwGrOpiyEU6OsaGGOuwJbsT6VniJ6KARtprf9iTAoNBjid3aAfk7Mv8NOTb/B6tbXk1zPf+BQgB
	Lh1IJ+byZcm613jWHtMbxtkNsjQn0P2uEmoguTFZpx3/ltK/wx24uIUMcqvPP7p1ZDprVC373WMC4
	3RfynGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfPK-0000000FZlr-2Fr8;
	Tue, 28 Oct 2025 08:50:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfPJ-0000000FZlU-3f4N;
	Tue, 28 Oct 2025 08:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B7717611BE;
	Tue, 28 Oct 2025 08:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEECFC4CEE7;
	Tue, 28 Oct 2025 08:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761641420;
	bh=KDXhTRVe2x23tPuaEkQmJ+KZed5CS4Y7/Sq0vsM+Krs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qmHhx90LAeqKDo9OJhautzZdQwPxugsU/j5NRn1XafNc5m5Y1xk8DSY5IKucSYkm2
	 6qDYFj8WKohnoZu3c9y2BRE3K8rqeW4eM1GWmpfy+us8eHq6wrWV9RoMB1fkhBo74a
	 HagmcY1PvDNb3NGu0+25ssCRdCGrue2GwJ2n1+yZx/VbImaxnE3d3SDrswub9Adcpl
	 hP07sZSlIlDscognFZ9tY5TdngpT31at74u3hfGl721sTxle7R8f0wk2JD51pKuFCR
	 mAw+IXEqbYJ33NxTmlxqYXPYYBlVFHXCvfhbgoaR2Y/GAkboX3f5o95a05XJkaSFdK
	 p8BvoQe2AvQ7g==
Date: Tue, 28 Oct 2025 08:50:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>,
	William Breathitt Gray <wbg@kernel.org>, kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>, Alexey Charkov <alchark@gmail.com>,
	linux-rockchip@lists.infradead.org, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: pwm: Add a new binding for
 rockchip,rk3576-pwm
Message-ID: <20251028-favored-dynamite-fa626b96ecba@spud>
References: <20251027-rk3576-pwm-v3-0-654a5cb1e3f8@collabora.com>
 <20251027-rk3576-pwm-v3-1-654a5cb1e3f8@collabora.com>
 <ff9631f5-8fff-4be8-8b6f-807c29943ef6@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O1U2C28gYoD3m1pn"
Content-Disposition: inline
In-Reply-To: <ff9631f5-8fff-4be8-8b6f-807c29943ef6@rock-chips.com>
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


--O1U2C28gYoD3m1pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 11:06:15AM +0800, Damon Ding wrote:
> On 10/28/2025 1:11 AM, Nicolas Frattaroli wrote:
=20
> The RK3506 and RV1126B platforms that are about to be upstream also use t=
his
> PWM IP. Would it be better to name the yaml file "pwm-rockchip-v4.yaml"?

No. Files should be named to match a compatibles.

> Then subsequent platforms only need to expand the compatible property.

That's all subsequent platforms need to do anyway!

--O1U2C28gYoD3m1pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQCDxgAKCRB4tDGHoIJi
0oP/AQCtGkPkLjIuhG6acisp6J+BGBKZt/zk42Iegz+EmIq1xQEAvpU0wnBrYIGQ
DQ8NJI1UvPDWp+Rn13RW0wjmDY/oaAg=
=NwWc
-----END PGP SIGNATURE-----

--O1U2C28gYoD3m1pn--

