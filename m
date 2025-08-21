Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286E5CA0FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 02:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4dgLe0e+g1+7qzwnvd+yQdaEQ27/aOE13+KAzDXIn4=; b=G2ooQMh9OtTcQMZgmtnxU9XFnJ
	i8YryszSExAXYhFSta85VxOM36OwVC0bdbQW3FozMrzEpf9nm1a7YOfZT83+y2Z4xisK/Gxk7sDMy
	GHCOypRDRsoDPCFh6r+pddVLBznByj2N7/Tx9I75Lg7bHaQAhBj2vaoFd7iJN782wMv2Gi9ly+P0I
	60Q60vj4eV+cx4SwtfDfcmfbmUnIyOO32S09VtsbtfnQ/EwvctSYgqVD4zZUJgGGslGvUrQCd/wBm
	pAGvifUMd8pVJ2bg6EaXxw4gha5qglvbQNztJN2Qo9+gr8EAak8/g6q2+MK8JsFuNn5Xnc1BLhKvI
	L1m27ISg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHI5-00000001FE2-33Pv;
	Fri, 22 Aug 2025 02:14:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upC96-00000000Whg-0EYe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:44:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3EE01A58698;
	Thu, 21 Aug 2025 20:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CFDC113D0;
	Thu, 21 Aug 2025 20:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755809066;
	bh=QGyQHv1jYZF3uVA7onjUxkDQan9RTUY4fxnZL00rGXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pN65S0Hm98/7eBQk2cyfAEh3nYjRLHVZAjZmP8LJZJoELf3EbpS+l1LIqzljo8U4m
	 HjWxJpslql+PBGVkeqxPE9n11kL4MRvMiggg7zCiHMdp78jo6VRLAjkVxe/dw6BkFU
	 G+UnH0makA9mu+VZU+SOu+Opf44USbiuhiXodj9hdWvl+RPvxynWgI64NuSf8qkiNJ
	 wbQtxTMswBVP200c+ukNe+EQA5zTOKHo4/SA+O9d9HAchukQt/pZTrSwZr3n5dndDB
	 OjPSC8CM+JBMOsfGNpVi7azWP8BWK4YbsVtytLl5AAk+ErosVxPo1mv62bmKx7VAi0
	 BjXbN96zvqrXw==
Date: Thu, 21 Aug 2025 21:44:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 4/6] KVM: arm64: Set PSTATE.EXLOCK when entering an
 exception
Message-ID: <ac3b2d52-5b24-441b-bcdc-463ae9c78b3d@sirena.org.uk>
References: <20250820-arm64-gcs-v15-0-5e334da18b84@kernel.org>
 <20250820-arm64-gcs-v15-4-5e334da18b84@kernel.org>
 <87ms7tk5y4.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+NFBeoT7qeYVduLe"
Content-Disposition: inline
In-Reply-To: <87ms7tk5y4.wl-maz@kernel.org>
X-Cookie: Warp 7 -- It's a law we can live with.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_134428_160796_45A3A940 
X-CRM114-Status: GOOD (  19.64  )
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


--+NFBeoT7qeYVduLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 11:02:11PM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > As per DDI 0487 RWTXBY we need to manage PSTATE.EXLOCK when entering an

> Nit: please use an underscore between the type of a statement and its
> "name", as it makes it a bit more readable (R_WTXBY).

Updated as you request.  I have seen both usages - the non _ version
plays nicer with searching the PDF to find the rules since you can just
copy it directly into a PDF viewer.

> > +	// EL, or to GCSCR_ELx.EXLOCKEN for an exception to the same
> > +	// exception level.  See ARM DDI 0487 RWTXBY, D.1.3.2 in K.a.
> > +	new |=3D enter_exception64_gcs(vcpu, mode, target_mode);
> > +
> >  	new |=3D PSR_D_BIT;
> >  	new |=3D PSR_A_BIT;
> >  	new |=3D PSR_I_BIT;

> But that's not the only case where we have to deal with EXLOCK, is it?
> What of ERET and its PAuth variants? R_TYTWB says:

> <quote>
> If in AArch64 state, any of the following situations can cause an
> illegal exception return:
>=20
> [...]
>=20
> - If the Effective value of GCSCR_ELx.EXLOCKEN is 1 and PSTATE.EXLOCK
>   is 0, the execution of an exception return instruction to return to
>   the current Exception level ELx.
> </quote>

> My reading of the spec is that this needs handling.

Am I right in thinking that this handling is needed for the NV case
only?

--+NFBeoT7qeYVduLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAminhSQACgkQJNaLcl1U
h9Ao0gf+I31dMh9CHMVH6wKHnBom98nMGxIPuirlnN5zM3f5tofXHJRgTQvJd6oS
LqRiqCSrp8MjmOFPti9rUMk6WRRzGGG4gHbTO1ANmaGrlY1frYhW91SH6i+03XH8
i79wMm5+COz/jk9DXmVFJzuk2PQTTs7xUy9+UW3ZXKpvauyeaU0QH0IBUdSHG+ks
QY8kAt7lp4hklpFTlrYnCjNMui2AU2+Pu+Wu+IF6Y12i6dJ7dk2RtvH/PkFLw4oG
8NCyFQuC4WX5tOIaGNpbzdmgPT5gRHs48CgNzRrI/BPWiWQ/Pbakceh5DN+pYPNl
donq5HcvHZXywx/jXKdRbBgUHgPFIw==
=xfXz
-----END PGP SIGNATURE-----

--+NFBeoT7qeYVduLe--

