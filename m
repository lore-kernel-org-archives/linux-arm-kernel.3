Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAC6C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 11:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rBTDJ/Pce3XGAqMFO/6ZU1Cr+dyYVpm8N2+a5ACXSQ=; b=uewybYhFnCjzJm7aLr5LEJAU2J
	s0LnNpi/xhHNPt/wVmYdIrE0bb7yEWxygCGfa5x/2JdSRb+Yg5seLaKfeHz+rvoC+vbGTMq37HDIg
	o0GM9TtH+1WE5Vtx2ryXRoI9IHM+9oy3MHfRS+KP0864hX9x+/j+wb/QQkJaw00sgh67Z6tGXyBpm
	LlK4cPTE+bXZPU8IVH4aIgUYqLtWq/sj+j1XnVPCNdsHMhs0c9tK/a6DE+SodkeEjmwSwwc/OP6Ih
	eFHzMaISC5Y0i51K5kUeU7JuUr+oTTNT9fPBGvaD5jBaEcW8/+6c5HpQv3MbGf9YsEDo/WtvGdsft
	EmxCBV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCrV-000000023ws-2emM;
	Mon, 30 Jun 2025 11:39:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCYV-000000020JM-3z91
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 11:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 251675C4D32;
	Mon, 30 Jun 2025 11:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11475C4CEE3;
	Mon, 30 Jun 2025 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751282410;
	bh=9rBTDJ/Pce3XGAqMFO/6ZU1Cr+dyYVpm8N2+a5ACXSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D13f7Ub4BN4yAwB3RBgvRG4yQNNeXJL5AVLZDS0XwfD2u+9YTM+M/gSw6/hHyOL+v
	 HN9NnVq06ERB/qjtlFmBvfcN5BqsZcZxEQfuffupcShL4D9iuO6VSB+xx+cqd/d0BY
	 FdrGIeWdz9E3J4nDBNb+lFK/bwn1g16v3v+xariZJJuVBFQ5wptVP8G4+uaUrVRAth
	 AXSKIw0IGxf/ffpaaEHxrMx+q4modao/UkAagb8HMogs4Paor4+v99PoqCdRuZG0sh
	 pQ17AzhygtAUzwdIhM7esrNy5H71AO93MipDLxyYjptFNLXYOyhuqVvHA85GHN2ckr
	 1xVTcfnkv2Mhg==
Date: Mon, 30 Jun 2025 12:20:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Antonio Quartulli <antonio@mandelbit.com>, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v2] spi: stm32: fix pointer-to-pointer variables usage
Message-ID: <192fb276-1e5a-4f69-8815-133f6bcd36b3@sirena.org.uk>
References: <20250630081253.17294-1-antonio@mandelbit.com>
 <5e61da51-cd02-41fd-9773-8bd776e1db62@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8ubtRjEq0eUrZSJ8"
Content-Disposition: inline
In-Reply-To: <5e61da51-cd02-41fd-9773-8bd776e1db62@foss.st.com>
X-Cookie: Say no, then negotiate.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_042012_028930_48A23A14 
X-CRM114-Status: UNSURE (   9.56  )
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


--8ubtRjEq0eUrZSJ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 30, 2025 at 10:28:50AM +0200, Clement LE GOFFIC wrote:

> Thank you, LGTM
> You can add my Reviewed-by

If you want to add a Reviewed-by you should actually write it out in the
mail, people rely on tooling like b4 to pick them up.

--8ubtRjEq0eUrZSJ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhicuUACgkQJNaLcl1U
h9Ab+Af/TLVz/Hq9TCf2YxneUgc7AN12JRozk2EqamXE2v+Yb6rTtIil8B8ebrzi
FfOaxYAzi5KJDeESYSTn3yPDx0Fx6BA0p2iJN81BglYrhweGnTRepTTxipockKR1
Rvdj2lJFlq1gG6wtmZWlVRxvLZgNMw9YedXUzDFBtpjZoWQiAeEw/zWioip11i+l
inR4ruch1/w48o7zh5Ays2lOQd3exzmLp1lAH/myowkR3v4qP6yzs7QLHmhAWOqy
BlNC5jVfocXWi7eWO+VC+etgczf5bINLcC8VYUM79z2WNJszOKx/1AMtCBqfVYyF
MFhM8P+Ykvqa6VXqRoBSlmT5PUYYpw==
=boE2
-----END PGP SIGNATURE-----

--8ubtRjEq0eUrZSJ8--

