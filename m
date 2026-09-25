Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E769C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 22:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcRvlK/HbBz+SKxl1aYcXjvCHhEqzNV399j3CsElZuU=; b=f/Iw+pAghthAMXIYlcRO72u6XT
	KtEJ+l2aKEQejqmPEoMOzdJ41GSxqWE6XbqJGmDxphp/5ML6q7MNPim3gems9vm6JeLWnMm4aYiEY
	zX69nDWKVnYZvxQcg5UhLzoQAX/kjsWWfTe9VhAPHigmDMkOOooD7CbG0IaQCssNzDwU3LchB6bJM
	AB0rvlN0GYcCYQRltF7GQ4PVrbl9nVtIaZD9+XHcHyS0nOvz+DzHuTelIlTyK+ukrqzvZisUCEKfn
	T9/IPaSZlM9VeETM7ZSuJd2KzaHwwfsM1zpJyCAb9oP7KHyZ1OJCr+U2DgWbn2Z4HW9x547TIkJK1
	RpHoQ8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAECg-0000000EYSI-2axY;
	Fri, 25 Sep 2026 22:15:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAECf-0000000EYS7-28RT;
	Fri, 25 Sep 2026 22:15:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E661A43849;
	Fri, 25 Sep 2026 22:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF0E1F000FF;
	Fri, 25 Sep 2026 22:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790374536;
	bh=LcRvlK/HbBz+SKxl1aYcXjvCHhEqzNV399j3CsElZuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YBPH2cCWgOGSA1GSHE866Vn7npvRMvUVrV/v2GPvMWuFhUe7XwuP6O8EO8/UoZkFw
	 KkGabzc6Aw7qljtmMXO4QLhjbCq5hY9sB1vavWLufrr5wPn4r+ohz5aZ9/T97hX0Zo
	 ov4YSQvlhaoBKjvs9J5L5zxAlyDVdJNZudoVWvexoMGWbjXDFA42EjMGHVacijWEWh
	 Iu9Ul3+Pkty+CJixsnAEnWD9UN4pCzKLNpNFtdUBtbxrOByVA4jy9EjNanpB/2InZb
	 qhjJ363lvr/cbHnlMg+nC544f5NtJwtD2Z0bdrNic/lu5zRe3G2CwK8sIWiV2HzfXT
	 5QEFEUe0mPydA==
Date: Fri, 25 Sep 2026 23:15:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] Allow mtk-regulator-coupler to be built as a module
Message-ID: <ff062c05-4da2-4f55-b81b-0fdfed56bb92@sirena.org.uk>
References: <20260903062056.1024263-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P0MhuSJkYqHcPp+v"
Content-Disposition: inline
In-Reply-To: <20260903062056.1024263-1-justin.yeh@mediatek.com>
X-Cookie: Love America -- or give it back.
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


--P0MhuSJkYqHcPp+v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2026 at 02:20:45PM +0800, Justin Yeh wrote:
> MTK_REGULATOR_COUPLER can currently only be built into the kernel: it is
> a bool, and its prompt is hidden unless COMPILE_TEST is set, so on real
> MediaTek configurations the symbol has no prompt and is forced to its
> "default ARCH_MEDIATEK" value.

The following changes since commit 940de590b839f71d6dc846160534bf202401b8b7:

  Merge tag 'hardening-v7.3-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux (2026-09-02 16:02:02 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-export-coupling-api

for you to fetch changes up to 59951bd9c6b63d4d98539db96becef729ad60b4a:

  regulator: core: Export helpers used by regulator couplers (2026-09-25 18:44:46 +0100)

----------------------------------------------------------------
regulator: core: Export helpers used by regulator couplers

regulator_check_voltage(), regulator_check_consumers(),
regulator_do_balance_voltage() and regulator_coupler_register() are
already declared in include/linux/regulator/coupler.h for regulator
coupler implementations to use, but none of them is exported. That
limits couplers to being built into the kernel.

Export them so that coupler drivers can be built as loadable modules.

----------------------------------------------------------------
Justin Yeh (1):
      regulator: core: Export helpers used by regulator couplers

 drivers/regulator/core.c | 4 ++++
 1 file changed, 4 insertions(+)

--P0MhuSJkYqHcPp+v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq28oMACgkQJNaLcl1U
h9B36wf+LhguYCEcSacCFn9QT75ux5lJ4HRaD9vAYEGQ2IXsQhIEDJNpJHFIbjvO
3aIo6XR7eoDRaar6InusXYtBAWRLjR+tEZbLedAn+0E03tRo5bLrRKt1eze394ix
d6hRvvea5gh+3O0jd2KPIzhWb9FhKbMs0RztZo7cAuq4zLCzbK/V1vyLRIoVFIB6
DnCAlafjgTMUwh7x/fXTq6x0U+d70AHey3SVpxK/ntNGd6krhL6SdzPc7EhKYgi8
pES/JvJLKOu9FuZEE+TRYHagdGwy8WWOpwYcsA0H53o2Nba3YVdPJ6y8RjQ2bHpI
J9V2P9qRXpVXWP8bGV/9Sh4ThQEnZA==
=nDY7
-----END PGP SIGNATURE-----

--P0MhuSJkYqHcPp+v--

