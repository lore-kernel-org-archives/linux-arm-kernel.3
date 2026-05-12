Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FECECD4846
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 01:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rop7wg0WUO7fllJzwFIlyP/VpMvCl1KehABXYLnbIE0=; b=aD32Mp37dORFPXC/UCNMuA+Cne
	pmGk7GWZwOAAD9vkQQj4oxVrzZXd+toyWWhJ1e5v6+iKXXWUKEEs6UudGLIdMDKq0o9BVwOk3k229
	kS1xApBdqN3mbnOZ6wsi4VtmARC2BcPEvYVwDQXdvT/OfC4VYm8Q5fgUetOj+EeurgJd9S4ZfodFV
	bV+qQOU+NPvndaHnyElKZVZExeKIHA89r9MhP8JKJftaRwaFEdYsVSSLoScklNpbV7YZGdsjffyNN
	17Dp6ukKjiyXMupJmdt8zZgdInNvUeLkVDOEA5si1YaOhy6atNIxfjr/NVjtnXcft8ZMDdKT+wrNW
	EMeD7uEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMc5i-0000000FC4Z-12qe;
	Tue, 12 May 2026 01:39:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMc5f-0000000FC3x-1tie;
	Tue, 12 May 2026 01:39:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CBADE43BC4;
	Tue, 12 May 2026 01:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887C8C2BCB0;
	Tue, 12 May 2026 01:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778549958;
	bh=rop7wg0WUO7fllJzwFIlyP/VpMvCl1KehABXYLnbIE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NrSXPphYYl/S6Laq9pMm43YpmnpmtFNawF427KQ/jseGo8NyU6vzFb/KY3t2kL+ht
	 Nt7JBXMZV0fNQhVcOe+5o8HhiwUN4SP6HObnJeTz0TniAR3VBZTru6yTNdo+R2QSTK
	 SiKjJ06nlvHJ3YX8N0SDj4F4VWVt7FnuRmtm5mLQA2CYeobAOlQrjqgdvTPQOtAtAD
	 xS086KjhSL8UUuxFdLWTZ/kZOwucUdcp21MES++AtvjYk2O4cRN/lzUmWvNnoKBO5M
	 gJEoMfpSAgRPNGkW/BjaAB/F3znbI2gntce2lHUbTbxJxrIY0zvwRsCD/iQRPDC6aA
	 Myx7ub+Vkiu2w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2A88E1AC5843; Tue, 12 May 2026 02:39:16 +0100 (BST)
Date: Tue, 12 May 2026 10:39:16 +0900
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	lgirdwood@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org
Subject: Re: [PATCH v12 1/5] dt-bindings: regulator: Document MediaTek MT6373
 PMIC Regulators
Message-ID: <agKExG7C9TXUQJuP@sirena.co.uk>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
 <20260511101355.122478-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i54nV9tYspIyFftK"
Content-Disposition: inline
In-Reply-To: <20260511101355.122478-2-angelogioacchino.delregno@collabora.com>
X-Cookie: Truckers welcome.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_183919_515352_F610EF0A 
X-CRM114-Status: GOOD (  11.46  )
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


--i54nV9tYspIyFftK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2026 at 12:13:51PM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> MT6363 PMICs.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--i54nV9tYspIyFftK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoChMMACgkQJNaLcl1U
h9Avpwf+JI9TioLyaNkiPZlz7DgXDocJ2eHlPUKlrSTNkqM+zJE6QBbzhvOljtej
tiC1ACgMMVFBaM2hBDjN2HJnyhRulHcYanlgGN0sxe++7cdZgkohG0Q5IC8FQbEX
XZLDDhAGHVM2inoGfjgck/yTF11wdEUH8VWjxR3T5eRA/C5rWpkBgnCAEafjEpkO
SnnUhCHSC0P4/8loNAA7MzYbwVGagSW277aTgorcWHnP5W1N9FIkS+jYpS0e7XIB
da+RzvSh9Tvi2CZ8ZmtLD6AgOSpsK70Tc9Gt142lMY6vE8Qh92J9beaRGE/i40+u
FiHT2h/DpcrvgDlk6NusB3TVdDN+Tw==
=nzPt
-----END PGP SIGNATURE-----

--i54nV9tYspIyFftK--

