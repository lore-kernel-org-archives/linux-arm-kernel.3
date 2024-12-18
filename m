Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F18E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 16:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0o6YsCPhoR+Sa9h4tInrAJarF+q0Du6OnRImy1JmvmQ=; b=b/KxQnRORlPQHV736yirK8iqvC
	6FboQDg0XJuuQPliInUF80R/YklFTbKFtDkqDHlNYH/fJqX5jv/ea3FJDz3KR6ghHGeHxWqgO9QdC
	Zwl/HZwx1z2b64aUjFXfWK6gOiXb6hry++sbSg42nvxhd+VLzxWdLHGtNkU9MtPHlS7+Zh/kR9U3j
	GPyj1/NzbkPMmvbNfqmMPQ5tOxRmIuD9S4bkNa1PAY0nV6JJUur1xNHb+vIe0Wrr1vUXiv+kjvLkX
	3+SYWCD6xRH8Lf35Ufa1XCSSI/qAiHlZNoPRwJh39jyJNJmIL+2UbOPXAD+YwlfCzQ44SOU9JJEqs
	+VbeI7MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNxMF-0000000HF9L-17ew;
	Wed, 18 Dec 2024 16:57:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNxKG-0000000HEkk-33hi;
	Wed, 18 Dec 2024 16:55:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AA595C4D43;
	Wed, 18 Dec 2024 16:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F8FC4CECD;
	Wed, 18 Dec 2024 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734540907;
	bh=0o6YsCPhoR+Sa9h4tInrAJarF+q0Du6OnRImy1JmvmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ETuj7uIuB6eGGCOGJuPf2ESKnfDQu/dRe9fQo0z4552Gg5u913QqHQyhGaFWw2h8+
	 XQyOTzs9U157pAsvf6Z6zwoeOPckmNGbzr/gatH/rpgh0loc2KRboRECMPlsPdjxQs
	 2C8NbCc7U2UVNUBG9AAFVVIL5H1uhN3XN5gOSuQw/7kTVp5VTJaTZrFlgfXh+MP2bF
	 QhRcudzP57qlhGdQX4URy9g+upSVe3jxQA+DNU0A4iuhxMSqWff5VZPuobsn4O5+pt
	 lO/rv4VllUbq71t9kIa2cWog5aAyrNqGpTIFBg40MfR0/iahOh7phDXJ3WL25ROoQS
	 dbVw93/FoFkuQ==
Date: Wed, 18 Dec 2024 16:55:01 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mchehab@kernel.org,
	matthias.bgg@gmail.com, moudy.ho@mediatek.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, sebastian.fricke@collabora.com,
	macpaul.lin@mediatek.com
Subject: Re: [PATCH v1 2/3] dt-bindings: media: mediatek: mdp3: Add
 compatibles for MT8188 MDP3
Message-ID: <20241218-easiness-appraiser-4bbd32caa2cd@spud>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
 <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Askt30FtJgx6rtkn"
Content-Disposition: inline
In-Reply-To: <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_085508_857964_CF982B53 
X-CRM114-Status: UNSURE (   8.16  )
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


--Askt30FtJgx6rtkn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 11:53:19AM +0100, AngeloGioacchino Del Regno wrote:
> Add compatible strings for the FG, HDR, RSZ, STITCH, TCC, TDSHP
> and WROT hardware components found in MediaTek's MT8188 SoC.
>=20
> This hardware is compatible with MT8195.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Askt30FtJgx6rtkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2L+ZQAKCRB4tDGHoIJi
0vwxAQDrAZFkEkmMQ5Z2MU2rY35fE61lDYWUebQGDUKcgUN1kQEA5mSrpxLH3nkg
sit8kCz+rofS8aJwNcWgW3XNlnMmTAU=
=ZFd/
-----END PGP SIGNATURE-----

--Askt30FtJgx6rtkn--

