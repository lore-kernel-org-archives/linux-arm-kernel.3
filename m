Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2A9C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 17:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbO4FN7CCabZt8UHD6/mZvwW1+J7zI2RVsnN2vpuxEo=; b=gror+GJU9fiBgfMx/z8+8pRVTd
	GlM51Rfd4xtR0I+m4EvkvOEahfpz2Nz/8uwjGlpkmxioIygzy/zsMBX4D8FiG+X59zG99XqE42qiI
	tbwKZcChRHy415ARWBAhWPFposSHqJdQ6fKjb4Wq8J1buRyTu6KRIQhXgnGsOYPDIqFXlmq++1XHs
	lNHa2tcMD3IQjAepRVD6TI1v5Xtud3ytHKx4medIyhh3f9Xl9APwc5HJfdqHUApAoLagSuM+gwlvQ
	Iprij0W6Ux3YmukoPVEspVOCxJENvX1jaqqgqWTQhvjcIpsy0rllD/C3eATe1g8ihjcaAibohqkLD
	kmNoVO5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x167F-0000000AEaQ-2i0I;
	Mon, 31 Aug 2026 17:48:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x167E-0000000AEaH-2ffP;
	Mon, 31 Aug 2026 17:48:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B610F601FB;
	Mon, 31 Aug 2026 17:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE2C1F000E9;
	Mon, 31 Aug 2026 17:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198495;
	bh=wbO4FN7CCabZt8UHD6/mZvwW1+J7zI2RVsnN2vpuxEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jRLrHlKorwgutcnZqJFX+QPI9HoW7kuLvK/RMtidHcZsuAVflL0TXDDTss1LQ7c0r
	 qLqEIi9Kn5RQYX6CwuwVA/ohQYbhHXCoVW91EGRMpUTV1RwyFoQ+G8jTLwTg3MM2ds
	 qcL5gK3rU9iW2VxfLKpigDMTdix58fBxkqx8IUIfacquOVoCQMhL39peSIcjWUkhQz
	 r6BKflOd2TPTAcKcJKdvXoRx7B110SJr2Bs/OIqHLkXIgr5WgKXrGEm5ldo2YyctBP
	 uJa7xYfP4UY54MsFuimp75TSdfFqXVad9A5IMQulQ5pyf1XaZnBJbRXfptbBuOoZAn
	 7UUMldRYJsnsA==
Date: Mon, 31 Aug 2026 18:48:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Jingcheng Ji <ot_jingcheng.ji@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	jarried.lin@mediatek.com, vince-wl.liu@mediatek.com,
	justin.yeh@mediatek.com
Subject: Re: [PATCH] spi: spi-mtk-nor: Get clocks from devicetree in bulk
Message-ID: <b03aa685-3632-4a8e-a292-4d0897ba2c3e@sirena.org.uk>
References: <20260821090046.2353986-1-ot_jingcheng.ji@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iiZjd5K58NJ/2Uds"
Content-Disposition: inline
In-Reply-To: <20260821090046.2353986-1-ot_jingcheng.ji@mediatek.com>
X-Cookie: snafu = Situation Normal All F%$*ed up
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


--iiZjd5K58NJ/2Uds
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 05:00:22PM +0800, Jingcheng Ji wrote:
> The driver currently gets a fixed set of clock inputs by name. This ties
> the driver to the clock names used by existing devicetrees and silently
> ignores any additional clocks declared by a future platform.

This doesn't apply against current code, please check and resend.

--iiZjd5K58NJ/2Uds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqVvlkACgkQJNaLcl1U
h9AcCAf+IF424GXDSYuGasJOVMsE660FZzM74ZGUdS2CC+p8NKO1Ldpn5dXhFPit
AZlouTOhqQ6yYMeILwK/2wO8rFathl0SNEENSZyNJ9Wg7ZuFq1GS45P9BCuLd0D3
giMwfnadXQW+0vWF6J5Yt1v7g9jsFq8+GzAxijTZ5Xm4GFO/93AwXPgG+KBRvkB1
P1Dw0LGLBc+yjwI5go3bS0kmtaDLvoze9xvHBT0ON7odTo0Xw49DoBEf8c97V0Bp
/CjQparCNFFYOwmeqbBqBwaVArHppA4lNNDqrwiy5HlNyq8EOYptWSDC+EQ/g3rq
INTsNBdB7/X4yF1rn5mA78dsOnyaQw==
=B1qX
-----END PGP SIGNATURE-----

--iiZjd5K58NJ/2Uds--

