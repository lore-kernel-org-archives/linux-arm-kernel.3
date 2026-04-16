Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D24F8A172
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 12:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGPuk9a59tRf8OTghKqxF0qWSI51NsaFyrep/Es3nxA=; b=uCKijl6MQWhIAlhARKtMyyZw/y
	lSlUzJWAz0CH1zNdq1LPf7ABlcWhWaoK9oKRucv9MVj5SP1Zao+T6kMaMgreppw/SHYjmQelacwpl
	N7Zmfb7lhvtcn84RRu8AC5hldcS8hfx/p0RUuyPtxh40eHCFpZZXzH4IqR47WQzhd0sv+odFyXpmz
	9vd+eIxeMoJnMcAAyebU9EPLhxQBc0fL6Y8mXvpGZXiDz6ysdxAlU1or1oHY/v23ySFvrQBGZN66J
	5fLgT4StagoKUJg2ialzt/DaOGWOfOwT2lKhaB/WmQAYOAfv9ZuBGFS2D7X+7YaeLEftpBXlk8EfY
	0AJyi55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMBm-00000002SJ5-2xrE;
	Thu, 16 Apr 2026 12:51:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMBk-00000002SIT-2UG4;
	Thu, 16 Apr 2026 12:51:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98BA660127;
	Thu, 16 Apr 2026 12:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A110AC2BCAF;
	Thu, 16 Apr 2026 12:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776343879;
	bh=+PQXemKirOGMa0lPYrpvKX5hMnVKp06lE1LcH+8MnsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DUlFIcVMBEcPip1jBLtVpq5MNgsLObBFw0L2PBZpDgex0XFmQniRbeaQOXsV6QXBf
	 DqOCIt5eiGA3W7UEjkQdwEYGnx0w0fipRM/EAbpDjaBNFtWBSnGpK4wT91++s+GV+S
	 H2l3MNCqyc3O2DtgH9A4SRTXQT+KT2AWI41aZMWttFyksxsP68piO5gqO2e6NUA6rp
	 q1pbmD0O7FbVd66F2UlN0nveUpm+KrFhcT/oRUaaYROn/xqU3A/3yAx1ajVEgao63W
	 k3tVBsXyrEkSIYSJ8fb+8xpHsqrV3X69fSOTbbR5EuCHtB/Xp+ZmcFjMphwT0wIPeH
	 +CwUUhVfikFaA==
Date: Thu, 16 Apr 2026 13:51:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] spi: mtk-snfi: fix memory leak in probe
Message-ID: <8e90522a-dc3e-4c1c-8e99-a5ded42f41c3@sirena.org.uk>
References: <20260416-mtk-snfi-v1-1-fafccfd288f9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oHlHqheTW9sO6E7d"
Content-Disposition: inline
In-Reply-To: <20260416-mtk-snfi-v1-1-fafccfd288f9@gmail.com>
X-Cookie: Process promptly.
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


--oHlHqheTW9sO6E7d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 07:46:20PM +0800, Felix Gu wrote:

> ms->buf is allocated in mtk_snand_setup_pagefmt() but was not freed on
> the following error paths.

>  	ret =3D nand_ecc_register_on_host_hw_engine(&ms->ecc_eng);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to register ecc engine.\n");
> -		goto release_ecc;
> +		goto free_buf;
>  	}
> =20
>  	ret =3D devm_add_action_or_reset(&pdev->dev, mtk_unregister_ecc_engine,
>  				       &ms->ecc_eng);
>  	if (ret) {
>  		dev_err_probe(&pdev->dev, ret, "failed to add ECC unregister action\n"=
);
> -		goto release_ecc;
> +		goto free_buf;
>  	}
> =20
>  	ctlr->num_chipselect =3D 1;

What about spi_register_controller() failures?

--oHlHqheTW9sO6E7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmng20IACgkQJNaLcl1U
h9DdSQf+MAq3yQ4oGs1FxoZSdE9aTKp9LHy2khH1lJV5TmNUGQ6K4/0ntXhV5tZS
dGbToS0cKNPPoxbeN+jqzjtWBlGq8Mau/InEjvmUaxS58GP2AwOqYJNY/WKVQ5m3
qDRcyjJm83Q9wjrs08i0JCAjiJ+eYe9K8gqPadTSjzlxlRILTpRegRKE/KnRz6n+
UVQ/sbw4YY56U+4Wtmh2sO2k66kJYagYckuuCdqJiZJSIwlA2/gcCdxQNfZpQWsS
N2h+EYSi8hmz6k8xP7S7R1kQoRqqRxMNslce2AsMJjT35PrO2y0PnrygKQSQRLoy
al1tHb4c3K/diJMDhCP5V/VsYneMMA==
=dxcD
-----END PGP SIGNATURE-----

--oHlHqheTW9sO6E7d--

