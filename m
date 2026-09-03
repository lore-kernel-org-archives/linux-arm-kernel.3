Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D141C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 23:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ioqc8RkDjsakiqCBHbEteKP1YeAkhAYQ5O17Lga+EwI=; b=J/SNCoA/IfYoa2M3c4xEfE60Xp
	8rtPZn4Oihcm/hlRiGDpT6OgGnqzQpKZ+Ma2kcLUgFyr1ojGSkLrxCbyJu5VNS647d8s2sjC4EDhw
	6ZWpPKTkn+yYGSDYZSKDsS+ZHjxQJ1oBL3tKoFIVI5uXO+PqsG+oOxU+J8sR0IMljyZ8Hvl/DRDvZ
	94a3brUNkABoG1hZ/wDFTILQkUebZkTArvZ734WkGfZ7x9vN/NA0U/+a0uRbQ6Qd5vaI0WMUfi6zN
	+/WHK26MGiLc9PU4K9k5pJZqoLkD/9Dz+g97im51ABbCgC8SjQksoNR+3erWPkF9p/7kJxlvdxY1y
	fyXDqV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GWb-00000000kg3-0oXV;
	Thu, 03 Sep 2026 23:07:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2GWZ-00000000kfs-1CCy;
	Thu, 03 Sep 2026 23:07:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F36060234;
	Thu,  3 Sep 2026 23:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64ADA1F000E9;
	Thu,  3 Sep 2026 23:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788476834;
	bh=Ioqc8RkDjsakiqCBHbEteKP1YeAkhAYQ5O17Lga+EwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EaZmvW9aL9zZvVxfd0I3mG8p/GhX7B+++geaN1ceyuSZHwhjnsS+0RACzx8ikPbt9
	 9G0y3BRU88LIGJVs5e/W5QM5ZDdP5ig0SJ4Hj0JCv2Y5ES7QOMKF1QKP046u6t1cs1
	 iOc0/3OhjKUNTSBFOH5ve6nHDtaOxbLfvcab54APrnI+oFbP56DqwROlYInPgsLwfg
	 NP0+mGP3vSlIPcrn9sP907NYV2TX9T36FvUAKyCePZD0zUS+hIyLml/Bd7/qyJA2nE
	 spaH3ic7gjLXHSM2gOCBQA5pIuGjt9MbiAIU1R+YhGHvM6s+3HHe3dNV70Kcc3DF0U
	 Wt2OVbXHTSHvw==
Date: Fri, 4 Sep 2026 00:07:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] regulator: core: Export helpers used by regulator
 couplers
Message-ID: <5f440717-d60e-4c6a-b186-7684700ff47c@sirena.org.uk>
References: <20260903062056.1024263-1-justin.yeh@mediatek.com>
 <20260903062056.1024263-2-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PM+9XR2EbSztP8fL"
Content-Disposition: inline
In-Reply-To: <20260903062056.1024263-2-justin.yeh@mediatek.com>
X-Cookie: One picture is worth 128K words.
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


--PM+9XR2EbSztP8fL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2026 at 02:20:46PM +0800, Justin Yeh wrote:
> regulator_check_voltage(), regulator_check_consumers(),
> regulator_do_balance_voltage() and regulator_coupler_register() are
> already declared in include/linux/regulator/coupler.h for regulator
> coupler implementations to use, but none of them is exported. That
> limits couplers to being built into the kernel.

Acked-by: Mark Brown <broonie@kernel.org>

--PM+9XR2EbSztP8fL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZ/Z0ACgkQJNaLcl1U
h9BokQf/SBNN4qkSup9Zx7/91V4CaMKzlLUJr7RIPR2bjDHlIghIIv3inDHwLWfd
k0Gw5OggesugAonFDvpW8/xTUreFyEk0VyC/zd+FArzIvDp6Aje2v8gBJrSkpWWx
PNT9RtmXm9ZVUS8pmDY2y9IOV15VGJCoB+cNT4PA7JTA67CPc9hOKHzsdq+bmNJm
t+DzRGQnL1t+Y71LciyoAZhQWqhIE3Yi0F9V+NraGgCBODsCxiQu0l3iWiuuOAqQ
u0sLge5VRmSmhfidF+UrJv5cGyBhkBl75GZFlXagNxcbeLvp9/oqzfgs9vLMNUdY
/TjfjCys5cCAs8FrrzU4OxFLqe4Szg==
=P0Wr
-----END PGP SIGNATURE-----

--PM+9XR2EbSztP8fL--

