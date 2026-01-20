Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D3DD2ED15
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqXVhZ2ooM04sfsONBP/g4Xaonqxn1HoOaxmk54/D1w=; b=I0/Tax3djfqpp4daCgENGkyKzL
	7hqvYji25X/tCngl4o8n1HlRrUoNzmVe2fQ0cQmQY+KmC6YhJsuFp1gXpJtdTMmxpOYG/7Dp2UQeT
	uA+jfzWu686rg5bLLUb5N8Hp/08mFOaS+mLjb/Shj1kJY99euyznqSqf6Ik+PEc8dicMI6b6O122q
	pJTGvP7vOr6TtIlJWb9C0xy48KxEfc/ygH1dZ81ljVgZdbyvW1wvL4VIKzmNGsimLVEUpPBF6ltT/
	Uo+9PhDHvDVf9Tv6xItst9NoONDngU1VRhBKsNh1H5v4ij26M09eH2lPPHlDPvLQzKV4ieBqgkcnP
	qIb9IV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDWu-000000044X3-0mDU;
	Tue, 20 Jan 2026 15:20:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDWs-000000044Wu-0aBt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:20:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F7FB60010;
	Tue, 20 Jan 2026 15:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89FAC19423;
	Tue, 20 Jan 2026 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768922425;
	bh=JqXVhZ2ooM04sfsONBP/g4Xaonqxn1HoOaxmk54/D1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=saOpaG5ouunjSoFPVVr3LzMc7KoOJ2R6zmJHgaRvf3bG9uBci7aStlUCVMldguMJ7
	 75l+KZedQ5iOfplj3LA9hv9+BtoRBfy9lNKzOoeAcOEZ/uXBuBv4m9C4r2SqBYG/Mn
	 ocRwOjkhWWK7KCNshqexDmCu5ys/Og/HEN/7JiB8udLwYzrBOgcmb1XNby7/FX/+a2
	 tKFRNHPGOJ/H3lPJ/kr6zYnlTFxYkR/UMUe70jxDONEEn70hLC26CcxFx9XWz+CBGS
	 OpvEl9j/xCADlkqYtgnzzexKGTlXagNxqn2lmnY1DdInoNTA7Hy4GPi5MqyvUgA6Uo
	 /R2YckEdGZV9w==
Date: Tue, 20 Jan 2026 15:20:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	syzbot+d4ab35af21e99d07ce67@syzkaller.appspotmail.com,
	will@kernel.org
Subject: Re: [PATCH 2/3] arm64/fpsimd: signal: Allocate SSVE storage when
 restoring ZA
Message-ID: <84889813-d769-4761-825e-2e70595307fb@sirena.org.uk>
References: <20260120145107.1278972-1-mark.rutland@arm.com>
 <20260120145107.1278972-3-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4HONcBWwVfyV+sic"
Content-Disposition: inline
In-Reply-To: <20260120145107.1278972-3-mark.rutland@arm.com>
X-Cookie: Slippery when wet.
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


--4HONcBWwVfyV+sic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 20, 2026 at 02:51:06PM +0000, Mark Rutland wrote:
> The code to restore a ZA context doesn't attempt to allocate the task's
> sve_state before setting TIF_SME. Consequently, restoring a ZA context
> can place a task into an invalid state where TIF_SME is set but the
> task's sve_state is NULL.

...

> Fix this by having restore_za_context() ensure that the task's sve_state
> is allocated, matching what we do when taking an SME trap. Any live
> SVE/SSVE state (which is restored earlier from a separate signal
> context) must be preserved, and hence this is not zeroed.

Reviewed-by: Mark Brown <broonie@kernel.org>

--4HONcBWwVfyV+sic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvnTQACgkQJNaLcl1U
h9DCsgf+O3+/PpgpjcFcgh/xxaFFRP6H5TcA7THx5hkHriQDLIMYFJaTpXsIRZqL
WFTFDDaoSIWmIWXVw6rs9KSmYYwsdKpstKewdcIJfhLeF+CqSCPILXOkfB0hcJTO
Shg5TQw+FIwM8LCuJVsWV8xfB98YlZjeBMUdMTmhm1PX2NUFTqDIjRSa3/E8Gk3F
Nh1+WSw5wTqP0SaW2dT/BrXBgH410vnIKspCEdoBjpjcav8Ap+1DKYbcYdi0178I
TGTav7hyNZhzl1pXVQ0WkSUVTAMyBz/CGL3XbDvR2Q0VtkbzNCo0tgofCkVCQrdR
vZuOQ5jeBkoOddqpu5ZX51ZQ0ynzMQ==
=3ttW
-----END PGP SIGNATURE-----

--4HONcBWwVfyV+sic--

