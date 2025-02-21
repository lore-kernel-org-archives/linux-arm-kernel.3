Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0C9C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkMm6RkLxj0MLvOjXO6Zq/qKdEhQUSinbouhRvXjrME=; b=IkuwoeFn+yAwk7DpY4QSZlKv3n
	Y4NzU4jdKZOoY0iJV+665cvCp0rNWqwwAD0pjm4RMhgGD8YhvXM0XakSmAh7RAPenDXG69Bb0DCzo
	zaF64pIZDySbC5lhUYYb2F2lRjuisrrpLcShHfXnVLprgsS9IHRrSMt1MyBHfnF5s7hAxDExSZvkE
	WzahM/Aw/ICR49LbKcNvejj0bLZXKUKjU04RENEXt/XdqU2ExKo/hMhFU6vww3YhtfLBlXsgiLCqc
	2ADsgCtdlUvg+iStUEg5y20AEG1dm6n7Nq7eWN7ExSA6R71BA3P5URhf00XYmWwJfslMjRQM8C7km
	kefdTnbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlX8V-00000006QJN-1DIi;
	Fri, 21 Feb 2025 17:48:27 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlX72-00000006Q4Q-1bZq;
	Fri, 21 Feb 2025 17:46:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F4AB613C2;
	Fri, 21 Feb 2025 17:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF7AC4CED6;
	Fri, 21 Feb 2025 17:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740160015;
	bh=pkMm6RkLxj0MLvOjXO6Zq/qKdEhQUSinbouhRvXjrME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T2M1eUcu8YEAN59gO+QTHvsz8Moc4Z/JlLwFqm+v/GWd1vBBTNc2rH24rR6ZVcXwL
	 dzZJm7j3LZoRHOURuEfI/MDagEjV+GlTv+Eb67Am2ydeTZq7BxXc7lchUWMQjDohVW
	 22UXQr6iX7OYOL84YR3P8NFyPiDcF9DjhJTTSWNPptqAUH3B9Fuj8Ef87jObOvwgnh
	 Zy4Z/MtHsvC7wWf3SN4pl5hMfn4f2iQpsIjLRHzf0zVb+UZoHHMq7YF6QOIXSbvOYa
	 HOOH324RwhLUXaRVOoqfs1oEYc/BvNbwy0ziBrR9Sa3NJwlm/V91QWfbALwNK7oSkp
	 hwnMT3PYOfYaQ==
Date: Fri, 21 Feb 2025 17:46:49 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Chris-qj chen <chris-qj.chen@mediatek.com>
Subject: Re: [PATCH] dt-bindings: usb: mtu3: Add ports property
Message-ID: <20250221-reenter-sassy-5b27b03f8b06@spud>
References: <20250220142230.2530583-1-macpaul.lin@mediatek.com>
 <ae34efcd-4fe1-4e45-a1e1-0744138a84b9@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="szY3iyQERCl/suc/"
Content-Disposition: inline
In-Reply-To: <ae34efcd-4fe1-4e45-a1e1-0744138a84b9@collabora.com>
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


--szY3iyQERCl/suc/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 04:56:00PM +0100, AngeloGioacchino Del Regno wrote:
> Il 20/02/25 15:22, Macpaul Lin ha scritto:
> > Define the ports property in the mediatek,mtu3 device tree binding sche=
ma.
> > Include definitions for port@0 and port@1, specifying their roles as
> > High Speed (HS) and Super Speed (SS) data buses, respectively.
> >=20
> > Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@col=
labora.com>
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>=20
> Some SoCs do have SuperSpeed peripheral mode, so for this commit
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--szY3iyQERCl/suc/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7i8CQAKCRB4tDGHoIJi
0nPqAP0fP5poDJRA3Z3q8SHg6Q/EHMEj/DnqgJGRMdIOzsP9RAD7Bc10OD+TWsBu
8fXcBQQfSDrvW31wIXdCY/T7A+BXmwE=
=4Nd+
-----END PGP SIGNATURE-----

--szY3iyQERCl/suc/--

