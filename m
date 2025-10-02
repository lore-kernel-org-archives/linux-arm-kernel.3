Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C20CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 11:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbNFbdJYlLnZG2wACTOj7jBkUXMZiUzzUteZi3K/WGk=; b=sVpT5uOr8TfZjXD+UJyEiShKT2
	4AzpwnnljPA5yOgttg/5+W+LPLJ8cVkOjke28jqc6M/JugeUqFQAl3fl7lP2a0tM5iTvJ9Wmjch3J
	EsG3iHaF1CtEWQ8bCSkWXvLwcBzg35/xNOwZOQN2cnJbCwQ09AIEzitGoiHk/uHkP/JcbSJPi6tYX
	hUTuVyaabi5sF41BrSB9nj2ye8SM+cy8NgKjE3gKqLCSGqJDoNeFQvYoqGSt1YWFc1CMf5kq/ufHS
	hWkYtFvb6xF0VZQmYBBEzNEQf3xG8Fc8VGgJZ/YBb6f4GBFU5xVoDNDtOTlcxVSKocxP2vy8Dj4si
	Q1Mh7mxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Hi2-0000000AO0h-3nhR;
	Thu, 02 Oct 2025 11:42:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Hi1-0000000AO0W-1rkS;
	Thu, 02 Oct 2025 11:42:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94A9263DD8;
	Thu,  2 Oct 2025 11:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B83C4CEFC;
	Thu,  2 Oct 2025 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759405372;
	bh=vbNFbdJYlLnZG2wACTOj7jBkUXMZiUzzUteZi3K/WGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dXf5HugE2M/1uw3eIrVJdnXIOaGbLjiyduT4zq89pe0c9hylUVCAqHD5fjitAzcuB
	 6mAnIDaRYASpySLAhtVXPfY6LszYliFh8id6SuSjfQzJec0JWX54dr3gIzF411Xtcm
	 JXe509xlNkL8dC57yFEm7OVd545/1NZ+fyWecn4o5hUUN6JydaVLnOBeoc7z0ZtKhq
	 ktIn261RjE6P5OEdqnQE/O51+K16n2xGHpVhhUnYjkFVks4zcWKXmV/T6ASLQkoZEN
	 3yuY15Q110BLgK0oHcXF0PBghnVUt0gQuz+0Sl59GOZYAKnhRJueAVThQl6J3IyEFx
	 BsJ2WcJ6QLqvQ==
Date: Thu, 2 Oct 2025 12:42:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
	krzk+dt@kernel.org, lgirdwood@gmail.com, matthias.bgg@gmail.com,
	robh@kernel.org, devicetree@vger.kernel.org, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: ASoC: Convert MediaTek RT5650 codecs
 bindings to DT schema
Message-ID: <83df4958-8cdc-4ec4-a77a-0f6132513664@sirena.org.uk>
References: <20251001183517.83278-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TE5evtEICq1wpIvP"
Content-Disposition: inline
In-Reply-To: <20251001183517.83278-1-ariel.dalessandro@collabora.com>
X-Cookie: idleness, n.:
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


--TE5evtEICq1wpIvP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 01, 2025 at 03:35:17PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Mediatek MT8173 RT5650
> codecs to a DT schema.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--TE5evtEICq1wpIvP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjeZTYACgkQJNaLcl1U
h9CNRQgAgB0/gZ+KlQcFzodFTVNysydvUs64RjVNx19lW3i4SQf/GsUktr4RAh9g
9fM6ZQz7A8jXbMTRxjR6N+/ePk0Fi0UA+l68gKCNAA05qsLW/8+BQ+reEVHQ9lIi
CeSYhmUTlX3qcE7AM/bhjSPJxyEqCQM+hDt3Hwj7FYICOD+S1djW7oKo+sHmVsYN
Lwrxb3cL5cLE2ySupwT6rACvXkA3N969/9FkJI33fPBPM5gSdrxRcmEzxU9qlhQg
Tm7qISufYk0OjvRcd3+Nm6l2YNrbfolcFyCKWeM2lbPVd17Ryb2E0ft4F71DhL/y
6n1IvdgVe8vNJ7NEGDu1SYQctIoenw==
=0b63
-----END PGP SIGNATURE-----

--TE5evtEICq1wpIvP--

