Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E0BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 18:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxqJmuI9wqbjexfmf6FwiViqLf687rpYQ2e3VvWXXi4=; b=LRhk5XGxYDIgEP3X/kM+FG9UbY
	p7nuLtmo67B82PKHeOBmJN0aJEPkCXKu+uIovzsUjKOJXuybwJPLh0lICkGOXobielyrI1KEFw49n
	QtZstK1lC5fvBffgFVhUU8mGHxoCSgN5J773wAnUcEw64z6RVIVKhMPSLQX2Uz76D8ohOX6RysX0b
	DN6CUTX5duVevHSmOcj6dXpkANLCM4vGROgFEers8SJQY111bMOHFEbC4L6wBJGZrThHBBEtb2eDt
	qRz3L+HJfHoqmORfQWwg+3YvnQ4a7Pn+xQ+yMaj3fGkhwhnIdwpmKnS9UOy5yGkITf878fyNGMZ5/
	DnDNX9ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0m0O-0000000CXyL-1FOz;
	Fri, 04 Apr 2025 18:43:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lyb-0000000CXpe-0djJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 18:41:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6ACB05C607B;
	Fri,  4 Apr 2025 18:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B327CC4CEDD;
	Fri,  4 Apr 2025 18:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743792072;
	bh=7muNJZMiED4ZrC3FdPL18FIRwbqlcHSa3g6rmhNfreY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VqMrjvXN7/H8EXJdb/5iMOYJKVZBzykYJpJSAviQAKQMESWyaAGJ94bPiOhEbfF1J
	 hQrb4vKbh5GPSpCZSrupCuYb/SAC3CYZHiB7v1OtWflUOv2EAw6mT6iNAAOnJH5EXU
	 LvxKwN2QRFu1rLQD+lEHT/SetaKnOeXy9OZ9gj+ke+Y2Tpw68xTG1VXbTq0uHsSWOs
	 XxBgxKtC24WYSywtY3uYCNo+UJQr2CmaWWDsYKyQN4m0SXr1BVUe864M18ppYe3lWm
	 vFWeyuZTb9uXGJTxP2A7KEMw+HLQnhUKFgCTHmoLhXQDTA7gr7/ZqVStGv/6r/mJxx
	 KVm6oGrJ5FPMw==
Date: Fri, 4 Apr 2025 19:41:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 05/14] arm64/fpsimd: Remove opportunistic freeing of SME
 state
Message-ID: <e2d6f08b-7b8f-428c-a3b5-472a9f56a0a2@sirena.org.uk>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
 <20250404174435.3288106-6-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ujVlonl8VTfbybc"
Content-Disposition: inline
In-Reply-To: <20250404174435.3288106-6-mark.rutland@arm.com>
X-Cookie: You will soon forget this.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_114113_244359_0130E887 
X-CRM114-Status: GOOD (  13.01  )
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


--5ujVlonl8VTfbybc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 04, 2025 at 06:44:26PM +0100, Mark Rutland wrote:
> When a task's SVE vector length (NSVL) is changed, and the task happens
> to have SVCR.{SM,ZA}=3D=3D{0,0}, vec_set_vector_length() opportunistically
> frees the task's sme_state and clears TIF_SME.
>=20
> The opportunistic freeing was added with no rationale in commit:
>=20
>   d4d5be94a8787242 ("arm64/fpsimd: Ensure SME storage is allocated after =
SVE VL changes")
>=20
> That commit fixed an unrelated problem where the task's sve_state was
> freed while it could be used to store streaming mode register state,
> where the fix was to re-allocate the task's sve_state.

IIRC the concern was ending up in a state where we have SME enabled but
do not have SVE storage allocated, that could lead to us trying to save
the streaming SVE registers to a buffer that isn't there.  However in
what ended up getting posted we always do a sve_alloc() (and we'd need
to have done more anyway) so that situation can't arise and this is as
you say just redundant.

> Remove the unnecessary opportunistic freeing of the task's sme_state.

=2E..and only do this when changing the SME vector length.

Reviewed-by: Mark Brown <broonie@kernel.org>

--5ujVlonl8VTfbybc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfwJ8MACgkQJNaLcl1U
h9AZLAf/dc20C0Pq/eiiKLp+k8KbUO2Ija8Iu9C8B6LGF9C4fznU77GudBwdD2rN
aPizrT+e3/+HUb3Hv671lx727zOLkwBHpzsgsr8nnvlzRex4nFslb4J1p3yOQy/C
70ri6JdPsFGa1tshhJfaSXA6BalCAtSsdeea3S6sdDYLifwwIaO99+/lY4ZeenpO
+7lBR9xuegeEJVcuJrvxX+rhDJBNXcMkeaYBoj19jQof/Sr/GHUZniau6sacFtnx
k40niGCKGFZQoWGtFqyVn8RoOu5D9XxmSk+PFlRSkggmurfnOrMoWH6FLaXYGwo4
mPV+Wub+RNZsg9q3jo2+tjeRRdxQFw==
=FxQS
-----END PGP SIGNATURE-----

--5ujVlonl8VTfbybc--

