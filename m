Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AE1FEEF2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 11:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Roda9GPWr8H/c+MYCaVababUm+iQjKomECAKSLhmw80=; b=Dw9m1l7Bop4Vbh7uj1PU4nVMak
	ahcUIfQP//us4XzYwvaCzXlelThlPUnWZgC0C59D/3xARGYjjaugoPgZ8SUoXAiKOSTktxxq9P5Wz
	eSOCBnS360GXY10q84efndj5gEodU/pk51ZIf8QLbIUk0hFfcRdhjQUP8rEAk3ia9QmUwh/4FTPAV
	qgoAUsvzrYJK6gmZwRSmaCGQv8XwwQqGX6PRAauQKi8P9dw1AxwOzpW6xH2lqQk5IGt0BI/zzbRfg
	//MEO3hNxNzv4QNIqnWSREVQOGz3naSlV8eqC3psDFz10Um/LdJ+GnjUoP86bfATlovDfQyilJfsY
	E/V7Cuqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4yc-00000006P4S-06Ze;
	Tue, 07 Apr 2026 11:52:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4yZ-00000006P47-2uLZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 11:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0CE1408CC;
	Tue,  7 Apr 2026 11:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA56C116C6;
	Tue,  7 Apr 2026 11:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775562730;
	bh=zF75wGoEBx9cLBe18NoiTa6RhLmy9PY+hNZSJh9GW5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LY0sT5NeWvQME/oib3PqnJVBTKzgHV+jZLYMkVRAba7e5oxEh8qRd0MngNHQpMzrt
	 eKUPLhVCPSxDW0jCbIVPL3WPNFiCo9/eNn8d8Q37HpoFmHwxhyDex97J3NoGaODUDL
	 xJsgjR82wGsL+zc0h5/AwQUQhXFhI+r2sUfbMgcQJVconbQyVKv3cWaNrDYmKESR2M
	 +PcMrOmJZnVEblGBSPz2Zy+hqNlO4GATvnYUc0DgwHaNw7p4eyUjsFFqy4bbaLpBWa
	 Mb/jML3Ujefbatpcgk4ZGmSHybFzT2EohMxLPNaPuYLeG7TwiCfFRnW/WpJrbjF7MX
	 GdwGuU+Vnk9SA==
Date: Tue, 7 Apr 2026 12:52:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: michal.simek@amd.com, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2] spi: zynq-qspi: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <6c302906-6560-4f5d-a20e-3b35717d74ec@sirena.org.uk>
References: <24043625f89376da36feca2408f990a85be7ab36.1775555500.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8CfVjSKAxBmRz6UA"
Content-Disposition: inline
In-Reply-To: <24043625f89376da36feca2408f990a85be7ab36.1775555500.git.xiaopei01@kylinos.cn>
X-Cookie: Now, let's SEND OUT for QUICHE!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_045211_752451_19326509 
X-CRM114-Status: GOOD (  12.75  )
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


--8CfVjSKAxBmRz6UA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2026 at 05:55:08PM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for both "pclk" and "ref_clk". This removes
> the need for explicit clock enable and disable calls, as the managed
> API automatically disables the clocks on device removal or probe
> failure.
>=20
> Remove the now-unnecessary clk_disable_unprepare() calls from the
> probe error paths and the remove callback. Simplify error handling
> by jumping directly to the remove_ctlr label.

You've not mentioned the fact that the enables in _setup_op() were an
actual bug independently of the cleanup, causing us to leak the enables
since there were no corresponding disables.  No need to resend.

--8CfVjSKAxBmRz6UA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnU7+YACgkQJNaLcl1U
h9A1GwgAhbjR/DKzJvB3fHxdk2DeKDcTIuEIsXjbny5bPvdG6MjLh4f19vfCuFYV
udQJ+F+4K+uClzHW1wSpEj8QQ1mfovqlcqYljLRxvY0n+16c3hF9UC+CJ61rB9rj
+INzdwudBh0u0AWofzoWj3Ov6u33MjArZgzgIgZClkLp9Gp0CKBoSRQNyRjHT5Zh
1Jl/D+WS6PSndPL7kK6rM6XJ3mGqo7Nc3oOERM1x6X62fnZ84Dz86ZzqC84pl1WE
3feZ4YCwuWyFIrlMISTUBZWNRAxJhEGvr3oipTX0ZbRIxoFeQUZTfvylsxgprHiV
ffGw6ZrTbqy2PpRB9JUorWQ7mtRIdw==
=F6qO
-----END PGP SIGNATURE-----

--8CfVjSKAxBmRz6UA--

