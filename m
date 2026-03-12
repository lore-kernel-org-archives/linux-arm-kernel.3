Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C315105A593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LStWSPNrAVu2+taudNy9vX/kBtznm/umzUbJyEYkdk=; b=sb84jIj6SOxaoYn7ql9YhEZpwz
	nr7oAb+rEXI+jdJ/letiD0Ja+GBvgjXGfUekgM9jCf00M9y8LXzexfHoy6dCYT42Vi8dK6XLlsy75
	5jO+xBOwNHgH4uLZGtuvu18yIttVOtqaDqifx7oq+4G5vZlAtw2Vq3lk2tPI5pfZ6Szc9v+sIkVZP
	TEb8de3LueWPbdlwfU/d4J6PwLYkCpVaQ4pGEdTOd3EV5QlzCudBU0pNW9tdpQ565vgu9hgC3bV+c
	GX5EDGUsoHkHP6+AdXTCSc3In33JcI1Zk/GqrC4m7888Acm1ecaeRjg80Xj2D2lrQP8UJvEupMPaJ
	bZ8rithg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fgK-0000000E67Z-2ED6;
	Thu, 12 Mar 2026 13:02:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fgI-0000000E67I-317t;
	Thu, 12 Mar 2026 13:02:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB13160131;
	Thu, 12 Mar 2026 13:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75297C19424;
	Thu, 12 Mar 2026 13:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773320545;
	bh=6JGSpqVxm5Xk2m9ccSi9/f5mq6saFDm1oVr7MCpFyr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ijzuRMZaAG0cxBMl7gDHrSzew3fvUz+nBqTiXPU+NIp69zqt1wfJfesyFC/fVZS3+
	 fpJQfT7RAlMy6CdCes95jyDBXqJ9b0oy2+/mIhMf1FRNGI13AM1NqmAm86j3/A/552
	 5kQ9+UXYzpoZsbEKqCumRSSwg+UQG2vj14Bds3PbgErv5h43Bs/xRG8wi00G2nRngr
	 EIIwDGkg6bJW4vTpgIQrRiJEabuw4Tb1FNbFO22KU/UjrislDHxxzWqcPdnp2DTFq5
	 sey6Gzv43mUHHEgvpwlNQvy8QnAR90ilRc2oUbTs2Xh0giY+jhiCjSVqkQ2SFWQMPl
	 im56x+2su4L1w==
Date: Thu, 12 Mar 2026 13:02:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 13/17] spi: stm32: Use helper function
 devm_clk_get_enabled()
Message-ID: <8fe16029-2830-44c3-bf32-5aea31f72c62@sirena.org.uk>
References: <cover.1773306858.git.xiaopei01@kylinos.cn>
 <d239cda51bb3dcc84da4a7194a30f3be82422f70.1773306858.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9knHiRnV8mpI+WJ7"
Content-Disposition: inline
In-Reply-To: <d239cda51bb3dcc84da4a7194a30f3be82422f70.1773306858.git.xiaopei01@kylinos.cn>
X-Cookie: I feel better about world problems now!
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


--9knHiRnV8mpI+WJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 05:29:05PM +0800, Pei Xiao wrote:

> +	if (!cfg->has_device_mode && device_mode)
> +		return dev_err_probe(&pdev->dev, -EPERM, "spi-slave not
> +				     supported\n");

Similar thing in this driver here.

--9knHiRnV8mpI+WJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyuVsACgkQJNaLcl1U
h9CkwggAg24YBsU71i5Djghu/lHhxeErxA+7HBjAV3TstCzfospFBacxZTrIypgS
mWtgo+SwmXbDn6WiyjDlwpIMTI6PFDzzMn6x6sxwj5/OD1osR2cJ2SYzYSbwFxbQ
uoJphNgSht3FEaDioOtHfdrgiLIkMm+/TYlf1u7+ZzrgI4ueyhtCfs0dN8EfdB+q
pAJUva6gft4S6N3uS4kagfQP8e+IwxXr5fekxL3p7Y9XYpa30rHE56Oc7sbGWGma
+WP0OfGjImbuvKtGxAPKoGBte/kLIrsSHoAFhTLSytjUxs4uuftK3Y5g3d7zq1fh
+TRESnlE15ixsifgA+1umZAfcpBjfA==
=ouCy
-----END PGP SIGNATURE-----

--9knHiRnV8mpI+WJ7--

