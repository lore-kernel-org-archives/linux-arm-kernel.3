Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A4ECD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXmuqkMM0keTDgXDcH/szFN+Q8zrk48JBXukkDuFbok=; b=lU4aN/lX80urCkTZtR7L98Jj+r
	tFJ7Cj17ENmvgevXi83ejeBoKwNa3Qjw2RkjOb65HPLochc9CWkDt6Edcy8/T0nY0H5I15U7f61a7
	+R74UZRxnKXOfs3wArMK84lOkmNguav/UPEz7553AcPX5ecEbp7kfH/62rEZI3qDy7M/ZivkKxeFJ
	pChiG36r5VJPgRJjBayGSnFfxXjc4MrbfF2AlC5TiRNWZqFxDlGJgRQ+t9+86Vh9yryIeQA/7eK6n
	Cd9huHNgejlL5zLriII59xXLrswYKPJG70mEeKN43JuQtAn8o8Nt51wCP0XkfPYqqUIB/grGhrhAm
	jHMkC25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUR7t-0000000DLOM-1Txa;
	Tue, 02 Jun 2026 15:33:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUR7r-0000000DLNv-1OCe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:33:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57C57601D6;
	Tue,  2 Jun 2026 15:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096B31F00893;
	Tue,  2 Jun 2026 15:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780414434;
	bh=hXmuqkMM0keTDgXDcH/szFN+Q8zrk48JBXukkDuFbok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mOK3YglsN97RzjXV66yS/2QZMXGICxWHJgQxIR/Ffsl1+Wuud6L07TSectumhIVVl
	 kjpN7lDxQVm9Op5GkrD85YRdXev3doKJyQdFWOw9ao2EU1VIn4VO4gxVFxUxym8ONj
	 rB6T+iiSG/gXq2x4j0pefygY/QZpaiSy8+wTLlWdPZqAQrotp+PPPLpShqiFOMDATY
	 sk/o9dXIltdx6gbdPpEJ9T9vKBjnltMQuVAqRVeFJsf7qmTs8mY/4fzPmG5GWQDryM
	 vjFTLtS+iz0N3pRipiILAWhh8Mdlf5XTAZDv0hpO8hzbMTzU8LYXVuZVb4/xDHjFvb
	 t930OXi2B16SA==
Date: Tue, 2 Jun 2026 16:33:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, vladimir.murzin@arm.com,
	will@kernel.org
Subject: Re: [PATCH v3 18/18] arm64: fpsimd: Remove <asm/fpsimdmacros.h>
Message-ID: <cfcb0399-c6e3-4dec-a274-b29a81dcafb5@sirena.org.uk>
References: <20260602151150.925126-1-mark.rutland@arm.com>
 <20260602151150.925126-19-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ueTDfOkr/ueaW1pT"
Content-Disposition: inline
In-Reply-To: <20260602151150.925126-19-mark.rutland@arm.com>
X-Cookie: The wages of sin are unreported.
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


--ueTDfOkr/ueaW1pT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 04:11:50PM +0100, Mark Rutland wrote:
> We no longer need any of the remaining macros in <asm/fpsimdmacros.h>.
>=20
> Remove all of it.

Reviewed-by: Mark Brown <broonie@kernel.org>

--ueTDfOkr/ueaW1pT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoe99wACgkQJNaLcl1U
h9BF/wf/WM5AU2Uogw1Ovhdnt2THWHJFR6c5KgvcrXCOpkL8geF15+HrpsTM5hZk
vB7stAjuS+e8GnJuJwDILN8J3z9uPLMJOuhfIUNCpxoDgUDUBLisjPnRkWpTngma
IqmrRBwRTqhORulrdKdHnPkbzwtbq41mtHbOQaS1gKw2kw4LfpEf2qeGHkOqq5Uw
QbGZNVq4sBugeO8/4opZz3LXg6nqXKtTlVmyxaXbPis0nKbd/KKPrQ6cO/k3WZw8
YvIrElhMP0iD8Qn4+yR+VrF+W5HgBcKV67ZOQyNy8aILXaB03y4Tuq+dNzqwYedg
37DUHg+h8sXDZZGWlJrBxZtesivHaA==
=yGu6
-----END PGP SIGNATURE-----

--ueTDfOkr/ueaW1pT--

