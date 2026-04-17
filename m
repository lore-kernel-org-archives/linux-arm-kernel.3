Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B666F436B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 16:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFHe/JodABoKXerKi3atV7xZGaeASc16N8fsC8Nf3QY=; b=0TGZgbqbKQy5GwlUXIyXXFOxr0
	oZ4r9sYKYaUtu1QVdsmSza17B5Hc3TK3FHJ0GWqgTeGwKKLKBEdPel2V5xMFjH/59dxt+zEnZClGP
	shAVxdojHjbu1sd+uSiVGJYXuSoxyUm2Zm0zrfupeDQSEBwuJbIb5aYfL36TGSqEyE54VufXt37Up
	9oSW6qRSazWm1naboEPDb4vQa1CYnqoCgAhydSCjW7NVhrYFjLNKHyRKtHqk/Rjw/ItA3MBa/9v7A
	gJGlr1zcfaD5rgaqF23MmTwSJFj9+wQ359Hw2V2dHl6eCpsioM0ZyjOIWs5CzBPe8tz4KPkas3eK5
	A800GX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDlkx-00000004FE7-49Kv;
	Fri, 17 Apr 2026 16:09:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDlkw-00000004FDX-0PTs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 16:09:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDC8A40673;
	Fri, 17 Apr 2026 16:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0146C19425;
	Fri, 17 Apr 2026 16:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776442161;
	bh=MFHe/JodABoKXerKi3atV7xZGaeASc16N8fsC8Nf3QY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfGr/WSpV76MKFAJdAlX8fWJ6OXLwxRuUDkaAyDOY0S+TPFyyxaHPV+rUxyH+sWky
	 m/g/bk6uXffxV6m8fMvmPHxM6gkiDXOm+NazvVXMvyJOsc4ftX7/ofZy4qdGWTggA8
	 lYYpfhX7blhzkPeuHg9YeZwz+oCsEQIRFNHca1ZAdRzBbalMTlPGdHb6VATDRSeTIh
	 +zfZQO+FH23fRXbH+fuBT+n0rcTNIY96Apxpn7jUmqtdbN7/rb5czLli6oNqgJ6xgr
	 Jjhis9/jHYZlFECOg3L4unzPG7z4i5P/D0nTZXIOZ2uY+6/LBvGOhkM/oAR8rmGp9F
	 4iwPeGhPAW5ew==
Date: Fri, 17 Apr 2026 17:09:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: reserved-memory: Change maintainer
 for BPMP SHMEM
Message-ID: <20260417-molecule-pending-b6a181b49abd@spud>
References: <20260417131549.3154534-1-thierry.reding@kernel.org>
 <20260417131549.3154534-3-thierry.reding@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nuU7S7AzXyEfyP0v"
Content-Disposition: inline
In-Reply-To: <20260417131549.3154534-3-thierry.reding@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_090922_156081_A201D317 
X-CRM114-Status: UNSURE (   9.12  )
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


--nuU7S7AzXyEfyP0v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 03:15:48PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Peter sadly passed away a while ago, so change the maintainers for BPMP
> SHMEM to Jon and myself.
>=20
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--nuU7S7AzXyEfyP0v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeJbLQAKCRB4tDGHoIJi
0sjcAQDBUAS4q8bdLt4473Lh07kzn84oMHmG+AK7zOJ4U5NsFwD/aO7wDYB3REwc
/p7ATF7mluF/bwqsdq3R/8rZL/p42AU=
=1eL7
-----END PGP SIGNATURE-----

--nuU7S7AzXyEfyP0v--

