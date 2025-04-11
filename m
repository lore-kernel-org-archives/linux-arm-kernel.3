Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588A4C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBHaRK1ZSaePqPWfOxpeh758N6t00RqzZqnAqRGNd1E=; b=aZ4hfZe0VXeOcFio9Az80YpefV
	YFuGKR8u8CvJ0pmYUqMkZxWy0HkZNCsu6GXRHjUXU5YCia/YIuYfv5iEju+yyTxxOGc0OfFOpuISJ
	O3oWqgDPMwBMMf2QBacRo1IVEKK8daXVQ3n2xLy5YkEir6XFoK6JkAa7DrMyuyAse9su0WlJe6yxP
	VYFDAOAOYMPNzL7O4KwwnNNakKBravX0fk8WX3jKqK7j+ESa0XxSHWe92qtwJy3Q6DK5Zg7gJVBLY
	VUM0iKZC7or3fTKKH5E91fxnEVqEE7V26XPerW6/9ujvCsXp0MfraU6Vj8u+bke3hotXzFKrW1quJ
	tZc9Ha7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CoK-0000000DcR7-1Xcp;
	Fri, 11 Apr 2025 11:44:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Cci-0000000DZv8-2JLl;
	Fri, 11 Apr 2025 11:32:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60E0543C0F;
	Fri, 11 Apr 2025 11:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAA1C4CEE8;
	Fri, 11 Apr 2025 11:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744371160;
	bh=sBHaRK1ZSaePqPWfOxpeh758N6t00RqzZqnAqRGNd1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhK7cIJZ/W0PSsedfPxgtdl2bq2qi+Wq/k7Lnf2dFuVCBcr3IfUXbuslOOiawVNOX
	 5Oa37ery2tgVkVyBlzbr930+4d3NwrFytyoloZmCzfBceuP1Kec6Ir/lhaZ0kk/X4X
	 rbOsD5cbx1LcbYwvj+WPwCdU020ZCqfPpBKg5qaoxP0IkDVZFWMHC8fL6+P2c3kMnT
	 5bUWtRyDXEnpQ2iyalL/jzpNjA8j9HNRfnCVG5WRsdjp65U7ZmEZy5qLh6i7I2TOiC
	 5L6NNIrzaBILfPAJoE9hLnxKX1bujgtzw+L1c2mJaFyGODxu6NFZKKmZgcQ5U/GtOF
	 S4T46qTf/A+Yw==
Date: Fri, 11 Apr 2025 12:32:34 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lgirdwood@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 3/5] regulator: mtk-dvfsrc: Add support for Dimensity
 1200 MT6893
Message-ID: <109a821d-b788-4bce-96af-caa69083ff40@sirena.org.uk>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
 <20250410144019.475930-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C9TEpmot+cqsq/pX"
Content-Disposition: inline
In-Reply-To: <20250410144019.475930-4-angelogioacchino.delregno@collabora.com>
X-Cookie: You will be awarded some great honor.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_043240_609029_5F98EC48 
X-CRM114-Status: GOOD (  11.91  )
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


--C9TEpmot+cqsq/pX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 10, 2025 at 04:40:17PM +0200, AngeloGioacchino Del Regno wrote:
> The MediaTek Dimensity 1200 (MT6893) features the same DVFSRC
> regulators as the other currently supported SoCs, but with a
> different select value: add an array describing the possible
> voltages for the VCORE and VSCP regulators, and assign it to
> a new compatible for this SoC.

Acked-by: Mark Brown <broonie@kernel.org>

Though it looks like there's no build time dependency here so I could
just go ahead and apply, it's just needed as part of this for testing?

--C9TEpmot+cqsq/pX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf4/dEACgkQJNaLcl1U
h9DQDAf/TFk3iR7DcvM01gNImhlPDyqjWf+/6e6un52shNdNlgJticu6IC7vJ16o
B0fwLTVg5P2rc5wAhCiCR8IK3EHhpZD5yPCCYNiLDK32bM7QdG2vptB1gWNt81JU
/RpBP4Q1WJZn4iT3cylo2Ek+YIbs6AW8yTBaT7yASAtmRkLqnf+LOzKaovJSXIiM
WzZY5N7CoYbl8kWyDHd1fFhBWMT+L0yiX0vBAJ78hSJ1M9ol+hs/5RyfML7pA4y6
Yu8M245swOHt373I3SAsKZMC9DTXciiI+WPlrc+UpIziqtp+iB/vK0pWKHxajYAR
eOxm0c561+Zs8Pt7RS+azFZq6JYHOA==
=dnlk
-----END PGP SIGNATURE-----

--C9TEpmot+cqsq/pX--

