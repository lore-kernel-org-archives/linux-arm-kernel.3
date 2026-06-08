Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71291CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 17:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkbOr+L2EKFIeeQ9c+CcgCnxLz8JXGwjXbsGP2srD9Y=; b=lJJfXCkqB/1XpnjG7jcAA8iMd4
	ykfzeriBB1T+q4ihTL02f5jJmpndOqcGT2FtZyFbvbKiYQxNlZ/EO5i/eWmLemH1UXs0pAOLFs9XE
	LK23sfjc0by0hXBZ5/PFi5cezE4VRuZKuSUx/HeSbEfiVcdyatw54NhDaq0v6ZFRZDQW1oibSIHQX
	n3n9L2dkLhRWZTveyXcHTC+zrB+N6IS+0AJ6A8r3m+N6eYeH1i31pJtKL69AqNkWI2VlQ3FRS7vJq
	RJ3DkWd2WF0jpO9HtAmpTSAH5Kxc9Orp4no/hPsnuwhXLwmUqrhQICYxSKxQUYPEUuXsWmJMiqKkU
	53FGzh/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdUN-000000049na-1jko;
	Mon, 08 Jun 2026 17:10:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdUL-000000049nM-3nRk;
	Mon, 08 Jun 2026 17:10:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7311544404;
	Mon,  8 Jun 2026 17:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359951F00893;
	Mon,  8 Jun 2026 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780938613;
	bh=xkbOr+L2EKFIeeQ9c+CcgCnxLz8JXGwjXbsGP2srD9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MpnOhm/lnBbJGtDm6SQAN5oep0c8dq0M5wYUd/XzI/3zvquJ7ci5i1p9Q0bKAoi+v
	 ajjZOJasvDlpkDgNg8OQmT8CxoMy0iVV0gawrNSxRO+jh9/uJHKGuM4pp9K1U3uzwc
	 VqFY/ccv+BPIeh8dmrVfadJFfsGr4oONV9MtJwOACwKOuFGW4ha0FKxeHY7ssKKKBi
	 ayDY6I4QVQKaeBhgVlI2o3RRUcP+ZmrUx5F78NYl/0NskdCZoBb+c1G7Zg86Ly2VsF
	 D7zr22lDxuM4PGI3wQfk8iY1TQ5wib1QZOFqC6Bd/gfe/JR22kDvkazI7V+cBRyMEd
	 +peC9ie/OpumQ==
Date: Mon, 8 Jun 2026 18:10:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: sunxi: Add NetCube Systems
 OpenNMC (dobermann)
Message-ID: <20260608-efficient-unmasked-055a2b553525@spud>
References: <20260605191322.1920944-1-lukas.schmid@netcube.li>
 <20260605191322.1920944-2-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iWTtt+IfRs7SuezO"
Content-Disposition: inline
In-Reply-To: <20260605191322.1920944-2-lukas.schmid@netcube.li>
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


--iWTtt+IfRs7SuezO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--iWTtt+IfRs7SuezO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaib3cAAKCRB4tDGHoIJi
0rjdAQCo/gI3s8btXoM2IzEm8f1ptKxAEXzZm4h/xNixYwNW4QD+OrPsYbgQSu56
41hKCVOySwILHR50LVcbsTe1YZNEvAg=
=iwjK
-----END PGP SIGNATURE-----

--iWTtt+IfRs7SuezO--

