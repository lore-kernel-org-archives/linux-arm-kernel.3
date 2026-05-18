Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F56CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jGoaYLrIdfY8fxCt8RE2gFSjMDiP51+IVix3OYHhPU=; b=ddODfI1CO3rJB0biUZJE3sqtli
	GPja9jAF2qIT53as5U7LYYHv5gJ6588X3iN91cuuTWjeaZBztGbLKyXUnsMNPsPeB0YNbUsvyw6Zm
	n29g5BTa/to6l2IbUC7A/AiCuV2ya0+4WyIlgWapZDojfIUBf1wgXAJSXpnVXnwiQ1YPnPyGm4KKn
	DE2fn8pM2QE43EYY59ZY5wIcz3Izu2rU1MBWXsuNdBbOAITtLsRRaGO7kLeNVR3ZLUqmGiPWr2wik
	S9hvyrklOC7Gt62C3Q05xUrYt3Zz3345REAkx0Ju/dKEtCaG/2pyPvS681jzO1maohzk9S3DzIwqq
	a56QrkLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0pC-0000000GIYV-0EL1;
	Mon, 18 May 2026 16:28:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0p9-0000000GIY2-0GAL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 16:28:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 800B54343D;
	Mon, 18 May 2026 16:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FF6C2BCB7;
	Mon, 18 May 2026 16:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779121690;
	bh=3jGoaYLrIdfY8fxCt8RE2gFSjMDiP51+IVix3OYHhPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7ExYI8TItuqZz95XMRoZ60wsT3UBHH2czPLr5/hOQB77QY5jQITBge2xlNIE8AU5
	 Cd0yMJccZO37BZlp4CSoOlnL6pKqrLS9AB00DVqJEdwEElj1djSAdXCcCbPfLBYDIc
	 y0wr49RKJ5QoWDhKZCXz9PsOGJtOkdPnpO67XXfslPcJrojB6I2crWCJuJVyshJ5mp
	 /JAVg1+isUTuinLFcZ2Ttug/pj3bhbuIL2qERaPCyvdFsE7ur2Ak8laaFj31/A6+Dq
	 wBfAvnmllN92N02lhiySqatuyuNrOXtfqogL0yUJKMjI1Ji+FdUhSa7OSp76aK+0fQ
	 XOLggQ0TPB4OQ==
Date: Mon, 18 May 2026 17:28:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Cheng <neilcheng0417@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add Meta Rainiera6 board
Message-ID: <20260518-contented-untimed-85b12903469f@spud>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
 <4f7aee0a2dfc44770347ccc82e54820e7b35317c.1779088499.git.neilcheng0417@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D4Ni9Iy8zbLh/XVa"
Content-Disposition: inline
In-Reply-To: <4f7aee0a2dfc44770347ccc82e54820e7b35317c.1779088499.git.neilcheng0417@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_092811_152630_41B74C1A 
X-CRM114-Status: UNSURE (   6.64  )
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


--D4Ni9Iy8zbLh/XVa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--D4Ni9Iy8zbLh/XVa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCags+FQAKCRB4tDGHoIJi
0h/xAQD/GO09ESffxZeEWy0y0qDA2FYxyklacN0+YEI/W2UZ3wD9EAzOZtufjk4m
QRtp9ItGZJ9m+ezm/FyqrNQTH/CIlg4=
=dcZV
-----END PGP SIGNATURE-----

--D4Ni9Iy8zbLh/XVa--

