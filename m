Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC9FCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWm/fQay75hiRdKiEgvnZPknUhkxSY80k7N9/VbrXRs=; b=07ZTcvzpWmgb0b4pdxZc3QRpnj
	B9CwpZRlDDMwQwX38oQvq//Li1EsJuqzz+87MXOwphM3cxFV8KhM1Up9tTyldKFM5RiV6QmFMfN/F
	7zrMOl1+6UwFtXVXRCLWdKuqAzsbPIsbpb+MS5ESToFqTkONcDwhcZC6exViL/LETcB8ANInFoyWf
	OPkeZo+E7nBIJkl3EaiJC7ScRbOXsqxY0jPCVUqly85bBnULXNcasjCfGBeXFf3IHXwvq60dfP6Ke
	AA5o8DceHHCpSPmrF1INFI14mOrKdm4zi+eXT+T5jIEVHy9iP44NU/x2hIUTdIA7Q6+8lvBJj6EE7
	F60213Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURAa-0000000DLfi-3Jcw;
	Tue, 02 Jun 2026 15:36:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURAY-0000000DLfN-07VD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:36:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D83842DC3;
	Tue,  2 Jun 2026 15:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEA01F00893;
	Tue,  2 Jun 2026 15:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780414601;
	bh=cWm/fQay75hiRdKiEgvnZPknUhkxSY80k7N9/VbrXRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HhvdFS6vKZ5SKHZrB9dNLILIS2exZr7Ws39LLas1R6pcHaKSLfQ+VhKaE9nZZLt++
	 HXJCgIIiuFiaWvRHidoL8S1QRy6bWQuvFCvJPs7D+VCcfgawyiMOrrEQqPRpDllOhE
	 vhNrHWd/zXvgqOjJMpKoScak5MEHkQ4p9TRsjpRdSG1rTaBSFvRZwM/Ae10v46kbsW
	 vQ1GRuywBIBQBcPteKNNlZrxuL7pxq2yMlGYXxeiNpk53jFQr0c4Ec/RS+udu9iIE6
	 oKP2KDZnH2bXCOSt4OgYbyLd4n1w2bEKxcqW10ToNO2oJZVBPKvKBaqzgQlfPpcYD9
	 81jLerY4yPbPQ==
Date: Tue, 2 Jun 2026 16:36:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, vladimir.murzin@arm.com,
	will@kernel.org
Subject: Re: [PATCH v3 02/18] KVM: arm64: Don't override FFR save/restore
 argument
Message-ID: <09e2c46f-476e-41b7-8af5-cf0a49e1368c@sirena.org.uk>
References: <20260602151150.925126-1-mark.rutland@arm.com>
 <20260602151150.925126-3-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QbqOPhHa1rLTcf+s"
Content-Disposition: inline
In-Reply-To: <20260602151150.925126-3-mark.rutland@arm.com>
X-Cookie: The wages of sin are unreported.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_083642_090207_1511FBBE 
X-CRM114-Status: GOOD (  11.06  )
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


--QbqOPhHa1rLTcf+s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2026 at 04:11:34PM +0100, Mark Rutland wrote:
> The __sve_save_state() and __sve_restore_state() functions take a
> parameter describing whether to save/restore the FFR, but both functions
> silently override this with '1'. This has always been benign (and
> callers have all passed 'true' since the parameter was introduced), but
> clearly this is not intentional.

Reviewed-by: Mark Brown <broonie@kernel.org>

--QbqOPhHa1rLTcf+s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoe+IMACgkQJNaLcl1U
h9Azlwf+IinEPaGZ9AD9+V7H1w4KdgTEtn9nENeY/1wsbrlkX085rqIrygpmBpM8
k+yTHSjTF8fkdD9nqqanQE0aqRnO2pyyyz3jM8r66HM2SLGsSRoW5cndRr9Oyvo/
BW1H2XPh1qaXn39y96nLDs6WoBiDFLk/kShhz9QXRcOsO30ShBmDadfErQqWv22K
61zkh3QfDlCVx2KoAMolkoG1l7Vf6r+g7LvodAJ2J2jExDKW4gD9ur1KTAM69B2/
jHWBXKygjqEdIaeXyNpxZk7nivay5iTSe4mO9rWoJCFoPOpNB87LU1spOAzeOq4W
pGuFGn9K1nTmB5EXiFgZEz1VVFz/4A==
=BW2b
-----END PGP SIGNATURE-----

--QbqOPhHa1rLTcf+s--

