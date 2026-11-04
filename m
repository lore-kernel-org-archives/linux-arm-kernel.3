Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A35606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v1yhl2OL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MaiF7fXW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xWW+RZ1i7Gz5sUX0u5imDbgLhpH14BPmgHxPKJ8Q1HE=; b=v1yhl2OLiWFQjG22wQ+v+1crjH
	z2uAAh/gsyaGOAq1PzY887KMWf2AqREKH+21qLlJcrAMxIObDMBeNo5YzRFdVKr0fzMzrMVGliuut
	grvg7YZlhQG3xANeOkgqzv9hDnKAVhwSCSDMB3KUsJ6FYgaGaU6aF6EEvHSUDBMAu82R8jcILUbuP
	ls6zinXyeMd/1In0zxFivTTpQt6LT+ncF1bSCFZu+LuOP48FomWN9sZ+0n/uXvLDitmWdHUuIfUb+
	rZcRlPJh+3khaXlKevgojdbZDGaUOHlPj7/7hHDl5acBw3Uzvj/H7v9gm3far5atIwMWYbLBztvbk
	ArKrfO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaKR-00000005MFV-2cfh;
	Wed, 04 Nov 2026 12:42:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaKQ-00000005MFJ-0D0d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:42:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73E2D410A0;
	Wed,  4 Nov 2026 12:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70B91F000C1;
	Wed,  4 Nov 2026 12:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793796177;
	bh=xWW+RZ1i7Gz5sUX0u5imDbgLhpH14BPmgHxPKJ8Q1HE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MaiF7fXWObA/6xAqdQsJoV9E3vM2plOLlCs30bg5Qh3mmdsCjEAhAvMJdIsvMwTCI
	 Y3KwH2S/3zExIBE2nn3VJ1O/9y3QQuRs20zaVC7RTNdwmbosV9Mda1wclTq8wQs9wp
	 uFSaF6NJnFO/QAexZbkixfaAohby0mfbtqIoALa9Nme82Ky+3SgR4nx8w0i5VXnDWd
	 hv9YqblL0cO9I0raZi8T4XPBzbyUGGCElTU4bN3S0acTrAC1OsjV/t2eQvD7D6OeMW
	 sNZDz8VBcNzA6oNpdtgjyHvBxC7TcxiVcBtigy75piT/k2d05FG6eZ4Y8X+om0oVfc
	 y2n0bLc/kpJEA==
Date: Wed, 4 Nov 2026 13:42:54 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Message-ID: <auslF5pwDHtcNoCy@orome>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
 <20261003095924.1370238-4-thierry.reding@kernel.org>
 <928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ywpbcavosvrfo2jf"
Content-Disposition: inline
In-Reply-To: <928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--ywpbcavosvrfo2jf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
MIME-Version: 1.0

On Tue, Oct 13, 2026 at 07:22:23PM +0200, Arnd Bergmann wrote:
> On Sat, Oct 3, 2026, at 11:59, Thierry Reding wrote:
> > ----------------------------------------------------------------
> > firmware/tegra: Changes for v7.4-rc1
> >
> > The bulk of this adds ACPI support to BPMP as well as a mechanism to
> > throttle bandwidth for various high speed interconnects. Some smaller
> > cleanup and typofixes are also included.
> >
> > ----------------------------------------------------------------
> > Aniruddha Rao (6):
> >       firmware: tegra: bpmp: Move channel initialization to helper
> >       firmware: tegra: bpmp: Add ACPI support
>=20
> [adding ACPI maintainers to Cc]
>=20
> I'd like some clarification about the process here, as I see that the
> ACPI support patch ee98ea41ee3f ("firmware: tegra: bpmp: Add ACPI support=
")
> only has a signoff from both of you and no other review tag.
>=20
> Where is the ACPI binding documentation for this driver, and who is
> responsible for reviewing it?

Hi Arnd, Rafael, Len,

Sorry for the late reply, this fell through the cracks.

Admittedly there's not much of a formal process here at all. Anything
I've received up to now seemed to be fairly straightforward support
extensions like this where the ACPI tables basically provide the same
information as the DT via standard resources like register ranges.

I suppose for anything beyond this, we'll want better documentation and
broader review.

Is there anything in particular that you're looking for? Should I guide
people internally to always Cc linux-acpi for anything that concerns
ACPI?

I'm not very familiar with ACPI, so I'm probably not the best reviewer,
but I'm sure I'll get the hang of it over time. Generally I think the
same principles that we use elsewhere apply: use ACPI standards where we
can (standard interfaces, resources, etc.) and if device-specific
configuration is needed, use _DSD key-value pairs to mirror what we've
done for DT (and also mirror back any new properties needed by ACPI to
DT schemas). For anything that isn't (and can't be) documented as part
of DT schemas and still custom descriptions are needed, we probably
should have some documentation in Documentation/firmware-guide/acpi.

One problem that I see with ACPI, and which we successfully side-stepped
with DT, is that we usually get "baked-in" ACPI tables, meaning we don't
have much of a choice but to accept whatever is provided. In a way that
is a step back for Linux, so hopefully we can get better practices in
place and avoid this turning into a big mess down the road.

Thierry

--ywpbcavosvrfo2jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrrKEwACgkQ3SOs138+
s6EoNw//Z3JCD7PMPM4eOff6qluInd2zKkI9P8RjeiaKDIibyyqXuAisI9KtRwE2
Gh2a4xgIOSubE+Tyr1CYZIsqwYrkUE9h1vd8jw3R4olClae24j6lsFv0x8ntHVFO
mcFUKjcK2tQVYzhRwWvxZgUGkb+cFyjrRpqHiMpBEBG8AoGZsUqtMOVoRVq2PZIj
Ukh9EHtqS45JNSxEm5fRXHGc/vVo/YlrPrfog4c+7E6ud5nqEEC0cDy0RY4MHDW3
C2uKn5w7yFc9E24Hqa/yMrBtX4Xed7H3yZXaTgPGpA7Z9gEcomsoeH4Nrq84o0Rr
pXf+Jro9akKt1NCm+i3YFc5zqz//jUv4n8HTZNKf1r6Sk2h6jc1MFqqErtQcqy7E
0qzza1cSowDeS0f8kpI95Ys9+/6F/KqmFz0kNEIVmMyUw0iW2VyxPdpcaFe/f/q1
U7F0rdyd0iuQuVL0I+MtDsqySsudcTjqnGR+ME9QGiGsiFRiKzmXNiVyx0NQ0yLH
ukde186iAF2io+USU3EnLsL3ZYGmu4a2aqsECuFjC0jYmV026t5eXuLdinLtjBw+
6azyDVGoU55Ms4rIE36nLwkmoorAQZaeTKU0o9fXoieu0rqhDRB99xAEda9GBJ/w
wM5SAQJw7ZuscndxnHYahJanAjnBNyLA+Ae47HghI/KOg/DcuBw=
=7HM/
-----END PGP SIGNATURE-----

--ywpbcavosvrfo2jf--

