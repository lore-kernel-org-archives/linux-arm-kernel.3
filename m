Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0930CD5C0EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6s2DosjfqDuLSyaiFlqd5KG4tRwfskrDs06O3YBify4=; b=tJi8r72v60OKkUWmaYJ3Hgbkkv
	YgPlfOD0RLNlWvgUEAMkleN6D6L5elJYYE53Exd864GABgZzqjhhG5THOFwincZ+pXV5zu+SFFqUL
	69DW1EVGgZKPnUr50H9G+ATySqB+xzHInbhYI8XbxcQ6X49YIKEJn3I6/woqjayGm0KAtnpXWpvGN
	IABTZIpG6UsMvgHJKWSILwuK+r9HuZQMaAZgRWJjKAPnrEXmTc1tkvowObYuuMKgjYUpd56YXrE3c
	U3mylo/h0JWaDGZKxSAOp9fM/plZxkb8jVZZE1iSJavx/BvgkEB5YLeXEFrS4eXAlYvhkDNqkyaIT
	JQU1s62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9RD1-0000000B5la-3WUC;
	Fri, 08 Nov 2024 15:47:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QWy-0000000AxBi-1JRB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:04:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C45D5C5BFD;
	Fri,  8 Nov 2024 15:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318A4C4CECD;
	Fri,  8 Nov 2024 15:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731078251;
	bh=6s2DosjfqDuLSyaiFlqd5KG4tRwfskrDs06O3YBify4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dzBg3XVLJlLlqsW9r8hsJws/1aFY98ZXIr/OoF4Y1D05/tciEKo1xX1wMKwAZcp5q
	 OxmSmO5SBlyAmnTDGDwaO0zb9Ta0ooqfHgC+2Bb+Owh0QjggDBKMyqrjgI/TdwFRln
	 NFSbNEvRG5qfTXqireg3+geq9cU+NS8xok9e5iGQtQJtOMABm+qox0VHnSw2VO0KpC
	 Fix38bXZpBrbJ71qCpvS8ZXMO+23HSRDkJ1ueOb+WBXWgwvl5N4eZvRBTMeH1HwLfC
	 Y4wLPLFNI83TKHQfs3IkCC0QHEIYDNorYFMnyt6m90XYBEr5WZYrt2Sh37hVfk8hkn
	 IIACVmzcg4fSw==
Date: Fri, 8 Nov 2024 15:04:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/4] kselftest/arm64: Fix printf() compiler warnings in
 the arm64 syscall-abi.c tests
Message-ID: <0935d03a-d29b-4e66-a5f8-367b8274f375@sirena.org.uk>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
 <20241108134920.1233992-4-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xo69RfIwy0Aa7qeS"
Content-Disposition: inline
In-Reply-To: <20241108134920.1233992-4-catalin.marinas@arm.com>
X-Cookie: Fremen add life to spice!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_070412_419407_0688F58B 
X-CRM114-Status: UNSURE (   8.46  )
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


--xo69RfIwy0Aa7qeS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 08, 2024 at 01:49:19PM +0000, Catalin Marinas wrote:
> Fix the incorrect length modifiers in arm64/abi/syscall-abi.c.

Reviewed-by: Mark Brown <broonie@kernel.org>

--xo69RfIwy0Aa7qeS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcuKGYACgkQJNaLcl1U
h9D3fwf9FYkmX3JoIbjpbzljb2FSS8q+dlnkPkTVrCqtHFFu4mUWTeS4Hf2PBGEp
mug7ManyT3rH4dk/pRmsc+7AmXVjIhuothTUjXCanMn1/sNUMcA3OnY/Bg+7RE/4
QQfb5G3JLH8KZa2QFiCQtauV6lYmGEHDm6qGL8XnxQTr5WQxykF1IugOqHFEpTft
XeRZ9Ic6aSdpcTViU1n4gzT5xsICz8ZMIdyoyEfCJwpSDYWmQzUVRx323A6DgNyy
Jg8FZUC2xBXXPE4TgZyZACY0URKFD6Iy8egeysDecOv9NMFF7mARgEEdIwlJcatw
bry31dcAmMl2iD78yq25YvHRuh9anw==
=eTgI
-----END PGP SIGNATURE-----

--xo69RfIwy0Aa7qeS--

