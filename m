Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2420C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 12:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAlwXj6kfP7UY5hHsuyt2FmGgbAGE/8hs7di0Xjh+zQ=; b=EWYTwUU5XUag3lVHh+iE+TvBK4
	+06F1zGjFvrIqfgzfVdwxXnIPVt8xQc4EjZdZlUHyW5Zj+IyG3PUf6bSxUr0FBss1FBWWPeRb2HvH
	XqbGCeVBvDeEKiwXz5k5AP0bXOuZ1x6Xp0VuTdKlOQ5L319mU3CDvEfgSEU2BEuFZ8mRgcifaWd4A
	cEcBiiHjsNe3WykpULzMggDwkDcrXgPovoewHX6jMBdFzwJlotNooTN0O7XvMEz4YFATJdFarCtNE
	2Z3yZmaw/5q62XcYIfQoY1LbERgpNQy0fyacjVlDAioxldbj3E4tHBm2drtN2UOqeIjmWsODRYQZd
	jlgh6cWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh63I-00000001U1T-0WJA;
	Wed, 30 Jul 2025 12:37:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5aI-00000001Pj2-24BD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 12:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A53906112C;
	Wed, 30 Jul 2025 12:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DEBC4CEE7;
	Wed, 30 Jul 2025 12:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753877221;
	bh=UAlwXj6kfP7UY5hHsuyt2FmGgbAGE/8hs7di0Xjh+zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbYB3XeZ63LjIa4mIK/kIzB3ietbIkR4+XYzyU+sS/HFLQXYElYWvckFG3DUeRYtH
	 3MlLUgzmxwzof/5G66HMGeHtdZ/eXTw6WbsTRHD0iN/qkBADmQqC7RVhKga5Yx1n/E
	 HUGcrkp2k64TOcW06cXNKCE45UAO6rGs1VOIZXdOxrguD98Fe6HJBcMym+n6wA5VYU
	 y8lfIuaBSfDzCjwEcleVKkU0+1sLLa2KgA8AVfOOTCcxM+Dm93rTXS8jaW/jXHdHcZ
	 7nMfege2qXduEqqNch3NvcPz27Oqkejrn/ovt6lgMMgnt4CxAa6OlbFhyZmVJXY3uI
	 pO5TuZShtruBQ==
Date: Wed, 30 Jul 2025 13:06:55 +0100
From: Mark Brown <broonie@kernel.org>
To: ew kim <ew.kim@samsung.com>
Cc: s.nawrocki@samsung.com, robh@kernel.org, krzk+dt@kernel.org,
	lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] ASoC: samsung: abox: Add IPC generic support for
 message forwarding
Message-ID: <b2b4c9fa-b9e5-4141-88f1-7115a792e84f@sirena.org.uk>
References: <20250721023052.3586000-1-ew.kim@samsung.com>
 <CGME20250721024611epcas2p4baca500b3b1f185dcdc35552b2abe8d9@epcas2p4.samsung.com>
 <20250721023052.3586000-5-ew.kim@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+nQYwSBVzcCsd7GK"
Content-Disposition: inline
In-Reply-To: <20250721023052.3586000-5-ew.kim@samsung.com>
X-Cookie: Linux is obsolete
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


--+nQYwSBVzcCsd7GK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 21, 2025 at 11:30:47AM +0900, ew kim wrote:

> +EXPORT_SYMBOL(abox_ipc_generic_get_pcm_dev_handler_callback);

ASoC is all EXPORT_SYMBOL_GPL() so if you're providing access to ASoC
things you should also use that.

--+nQYwSBVzcCsd7GK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiKCt8ACgkQJNaLcl1U
h9DJCAf+Mq/QYtzKhfpxOJCQ7iWo/LoBaZ12wufsoTLRtyXuvr4NekImjp47z/us
QQQwzPuVVr/K9TDBEZu2QXb/M/uOwY0do7sWlDzOx2keRi6ciWvUSMQwDlZDy82K
7Fz5epoFoQTFggvr2zPNeui85mx7TK9a6rpVTOITiT39crckqhTkxFTFdP6pytCN
FtWv+ZhsLYY3vbTy+1uHPdIkUDTjqQVzMdtKlb60n+neG5dfTUj21nUSVZa9uhoS
F+eRaPnG6+AR/jmAKxoqStiVruaE04fXplN4DiaJ7fn1RQNT39TbsEL3i04/dw6n
+oIvRdy+m9qg8NEy2hBzS8W4G0c4MQ==
=Vhdj
-----END PGP SIGNATURE-----

--+nQYwSBVzcCsd7GK--

