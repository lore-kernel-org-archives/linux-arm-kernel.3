Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FFACD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 09:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIqWNvuaCFfyXb7RpNiIEodF4oOXvycYLVDdIB/K0tE=; b=s7bacq70u1axcjdjrdgXybnxHp
	eFQytAnJtvoAlYLBDluB+lAQ3s00rzPc0CwZOwdONtshDYiTgu7c5bTKW+9PogxJbTandRp2QN65V
	MarNUUB7Lpu+HRv77LnTvYZ0mbETjta5wIaCriBe1XYjRFbz2p7GMtut0zPlCKbwG0HVs0F3R/6BZ
	kPxZ5x0cfI8GnrohnUSuOqwSQUJFlq0VQP6e3reInefVFy/QL25u6dGibfb88aCGPaejlztLldZsU
	eawScDXGr5DJG8cUw7Vh0mPTfwtfrMAM5pTNf7GbpBu6cGkUtcwvGPpPRX9PjzBSdoTfofm6a+cYj
	iDDapqUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhWi-0000000EfLi-2XDw;
	Wed, 03 Jun 2026 09:04:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhWh-0000000EfLX-0Ufm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 09:04:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4095D6008A;
	Wed,  3 Jun 2026 09:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA4E1F00893;
	Wed,  3 Jun 2026 09:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780477478;
	bh=IIqWNvuaCFfyXb7RpNiIEodF4oOXvycYLVDdIB/K0tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aJyQ/xW/+yUWGJUaRhUBL3xWCEZwCGL+JkBZ0ppz/i4NNTt05nVcSjqOZaSJwAO0V
	 Od5mmEoIdaP4GQ4BCnSY52sd6ofV+w7y+P4tJAIRxQT2jt19jFgF75XfaxRkXyZi1H
	 pJzunLoIOBSQxSj9uFN7jemWHJg7mSP9QPUc20LKYn/K9i2OMx01Zx4PkdUQ5+fMyo
	 eYrLrNAGU5EzXwAdLnLVKhd1SNaTZuW9xEbWdKBr+cX3EKiwC4a+0V7ysPx9lleEnJ
	 7As0RsY0gjKTY0UGtmnE+w0v8YwbS6LEQyuJz8CU+El9uf9kYpSvsdpe4KKbJmV4jF
	 Ky9Fz4P896thg==
Date: Wed, 3 Jun 2026 10:04:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com
Subject: Re: [PATCH 1/2] dt-bindings: spi: Add for Nuvoton MA35D1 SoC QSPI
 Controller
Message-ID: <bc0f42c0-b85c-4239-93a4-429193338f99@sirena.org.uk>
References: <20260603043551.1062112-1-cwweng.linux@gmail.com>
 <20260603043551.1062112-2-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sb6ZY9Vyc+0GIO+z"
Content-Disposition: inline
In-Reply-To: <20260603043551.1062112-2-cwweng.linux@gmail.com>
X-Cookie: micro:
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


--Sb6ZY9Vyc+0GIO+z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 03, 2026 at 12:35:50PM +0800, Chi-Wen Weng wrote:
> Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Sb6ZY9Vyc+0GIO+z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmof7iAACgkQJNaLcl1U
h9DynQf/bCLcSynH3iL4U78NkMHh291CZ97AEcRUiIFy65RAzaofPIvhPKHslR9b
EBr4EebxnhZ5GCPwCK1ZnoMt5Dne0Y0zEXixdN3DzuNwLtY3PpxDj2yQhBKG1crw
VhElpG/aZilMjg4GWHWHo04BUc3eSG2FssD/xWuSSoFjoCMb8B+BLiJJrb2jNEpN
GmBPNCoS9cygrJLHkWvbJ5ixmgFjDqgpKtEo1zyhp82W1KfwUPwxShk3YDxR1Nqt
rZRUC6NKYsHYTeNoYlaCapLc60hQwAWyIP81/oTUMVLm+j7q5IrgaCf6TGYha48G
xnhrOQfPiQpMmTg85oNO12HN5+0iCw==
=M+zJ
-----END PGP SIGNATURE-----

--Sb6ZY9Vyc+0GIO+z--

