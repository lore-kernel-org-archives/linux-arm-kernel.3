Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662F5C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmbLkE3G+lImWSxYzI2cmejiT0+MhXgUb4SICK3ekoU=; b=Pmrx1Qfazehu60VKmfYScupwYf
	TesHy2cevSlxTKdHrQFe836KYpb5EdpiiplXm6MWPz7Tj7VayuffsP99DuDdHGyOEzodjDTZEULA/
	wPAPjl6MVWXDxto6MAKe8mS9Fe07IyxUbcbOyOHu5RI1V5KbJF8t8xpGgfm0WVC+v+Yepm4/ppKCt
	yvF+teQqpkuisirXIlejMxAUDT8stUEuxeJfZNqxcJZdka/5BUBsKEuWIH9FMbUuhtTPluDo3X3CC
	J8iV8uTpLOPY6EvYwgtla7tK90UgQ0KvBshc6atZmVJen/wHJj4s0wGgUGZI3Juuyq0qC+E425UdZ
	q19OlSXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tutZ8-0000000966N-3hVi;
	Wed, 19 Mar 2025 13:34:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tutXS-000000095sN-0s6i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 13:32:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E80FF6161B;
	Wed, 19 Mar 2025 13:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162F6C4CEE9;
	Wed, 19 Mar 2025 13:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742391173;
	bh=UmbLkE3G+lImWSxYzI2cmejiT0+MhXgUb4SICK3ekoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i7PLjoNxeXyFkfFCxWxuKAMNTkMr/JU4cjlgnUl2p2aguKdlqPxjfHItXppQNIUI3
	 duMcWd5cWAXRyaQXEARjGbGhnwSR0KLNoasHbonncomc1z4o+4T1sFuOYSxB5q5TL/
	 iW37NWP134MUaADIHdvPS4eK7+9yMtqw04sUHt9a6Ygu/ojfo0rL+fRJDBfPUNqoJh
	 THs27D1urlu6dx/g8WyQmBxBsDvpSEezWPRxnP9B3tKF/NF1UJkpl/rGM1mImruYXL
	 Ilob95CevsfCaO8pS0pDdVaheWEmVpYYjSxNTvNOQ3ul4u7rZHlSIas1HuOwsw4Wra
	 Jyel91WjgMh/g==
Date: Wed, 19 Mar 2025 13:32:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	yury.khrustalev@arm.com, kristina.martsenko@arm.com,
	liaochang1@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] uprobes: Allow the use of uprobe_warn() in arch code
Message-ID: <07499f3e-b730-444e-bd52-75bfaefef84f@sirena.org.uk>
References: <20250318204841.373116-1-jeremy.linton@arm.com>
 <20250318204841.373116-7-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K9lkjfOgLHeIEjyd"
Content-Disposition: inline
In-Reply-To: <20250318204841.373116-7-jeremy.linton@arm.com>
X-Cookie: Chairman of the Bored.
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


--K9lkjfOgLHeIEjyd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 03:48:40PM -0500, Jeremy Linton wrote:
> The uprobe_warn function is limited to the uprobe core,
> but the functionality is useful to report arch specific errors.
>=20
> Drop the static so it can be used in those code paths.

=2E..and also make use of it in the arm64 code.

--K9lkjfOgLHeIEjyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfax30ACgkQJNaLcl1U
h9AkFQf/Y1q2Feg+KwP4cXtEJ9+aNY2Xsphb3PTa2oMFU3s3huFK2zT+Tw0wXrpB
T6eywqTDqWTMi2JY07llFmpN77P3NCk/wKxM3P1wnrf4+u06SthNy8nbKyXGRL+q
fljp81T5af2/Flj/OBFBGthbD7Dw8zRZjfn9TO1jR28NjsxcuARf7x1cX0pzQpTm
GH9CJKjInhK3LpzmCHbMvj7l4bJ/P+bBATxHsvboTgnazmAlPN/KjEI4NlBzObhP
n9nPZrAMVyMf4qF6q+BCOWs2rGEZ21PQFVzVzZoP8BeSwqwyq0VLvlvr7P5qQktq
gJJDd73z2qAdKnm1HXmzg61mBGQifQ==
=ChsK
-----END PGP SIGNATURE-----

--K9lkjfOgLHeIEjyd--

