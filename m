Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E78C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeJSRLFk7KzsTUlyQirGAXBVKKCiGm4LCGhgWOZKRJU=; b=TCvcriOWmc3cGi8LvsurkQ/1Vd
	YO+xyHL4ZgWguVjnJL4XDZk6gcadSkid7RQUrKLeNvYayteJ2US0WKjLf3GOf9Vady4DMSVYo5Uv/
	RFlc+ftCBrZjaF6lSYk1OaZrBsbyBdD0mDDRZY70/ou56tAz+DegDlz/yLPWNJIbK+BTkEBdNiUb0
	FAigbLx2zrqkSdkC2yA1LNkjpP+k6BdmwDHHG0C0oetnSrBE7Vvdq/xg8NcyMLKl3/U363SjAhI/l
	kvw94SNB2G7qt9+hmQbeeeI/AM3ESzqs3It106PUCxaQR42JG+7Qc1DmhHE3K4iAUFbDEdZOc9Dkv
	JllH0piA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuzI-00000004qJv-0niP;
	Tue, 11 Feb 2025 18:28:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thurB-00000004pCU-3CAq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:19:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71504A40BDB;
	Tue, 11 Feb 2025 18:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17E2C4CEDD;
	Tue, 11 Feb 2025 18:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739297976;
	bh=ZeJSRLFk7KzsTUlyQirGAXBVKKCiGm4LCGhgWOZKRJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O/Osz5JbUrSHd8Om2IbxPFGYYL42La6X+hZMhI8cImporz2QzFoqtyehmGRht+viM
	 sPw0rF//J+UBF2IR3YmhFIDgSIznzMXXoYd3fTdqmJPy3zYr6UbtDfy+g8m7MAE934
	 upZ10ewuGLmO7CT3W28CaiYl5Dm+RyxOyEE8fH7G6qJTXD1z409uGqePU2zzCIkwWJ
	 oow7KqxmXHGhY4mDI6/KLe7XAGTnF6ECpXiF6uBzIMuKOlkOWlsOrVjAFF4TGlhzXf
	 aKJTlOEQnqMEe2RB2/70p8MARoJ7vz8lrxR+rxu+vN+e+rg58M1cMgQER/GQXduqGR
	 8DjomiUPvWf+A==
Date: Tue, 11 Feb 2025 18:19:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: stm32: document stm32mp257f-dk board
Message-ID: <20250211-napping-womankind-3c3146c6b2d6@spud>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
 <20250210-b4-stm32mp2_new_dts-v1-1-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8ZGf21frFMU/x+4E"
Content-Disposition: inline
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-1-e8ef1e666c5e@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_101937_860562_525666CB 
X-CRM114-Status: UNSURE (   8.31  )
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


--8ZGf21frFMU/x+4E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 04:20:55PM +0100, Amelie Delaunay wrote:
> Add new entry for stm32mp257f-dk board.
>=20
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--8ZGf21frFMU/x+4E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uUswAKCRB4tDGHoIJi
0gNGAP4rXS2pU6/TpiaMyh6ngiLT4et79Hj10mAIW2mYBmMPegD/Uz/xYHHM4rFT
xeXShH6AVOss5Xm80BVMmzfIPq1bows=
=9R2h
-----END PGP SIGNATURE-----

--8ZGf21frFMU/x+4E--

