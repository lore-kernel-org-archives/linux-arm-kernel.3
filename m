Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCCBCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+1oflaYqWx1oZke1AYLzfl4If0XApi/pCR6vFyP6Jg=; b=1NdKlG0nb0OqOeX9ovDdex3Woo
	NjOVHrC9Ox/MMMuGmmFYtk9HBNUjjGm75aCO5M4zCyfNIH+hV3hFrXm+Xaae5KnobFfnBC9IvfUfh
	11YWs0eGschpVNdOKn1Fy5/UBrHaFjbgtzQrMDicqa9mmXZMs5hmJoCQ+Uuw+crg+qCjEYYXK2CQW
	Aiy3HBJ2vKXq5pMab5NGs0c2vq+rMs5j7yApjSZEFCYBx3pdfowTKloZd718g6VNR+NNf6QKe07P0
	xxJNTlcihovt9IZ0Jx90YS6vq70G1WBOhZWmWSegmh5kTj6Gc0giP54HxeNKSOV28WRPTRdxgQJ5v
	IDY5ZGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxiE-0000000EEL8-2Dzr;
	Wed, 17 Sep 2025 19:21:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxiC-0000000EEKA-297Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:21:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9A5A437BC;
	Wed, 17 Sep 2025 19:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299D8C4CEE7;
	Wed, 17 Sep 2025 19:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758136862;
	bh=y+1oflaYqWx1oZke1AYLzfl4If0XApi/pCR6vFyP6Jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=elVhVFs1jX2+3kDoleBQyuWVNoG1a8y2VSothBaxVMJS9D5ibYWTKz4q+tXzYInKC
	 55z/W1t2Jb1zMwarTWYuGhb5qhN4bQPIP2fPQWNaIv6QZjSXWiKYwYhHo1COtzPgzk
	 CytdkEvA9UTB0LAMsCyFd2kM9DILrBXh7+oxZVYYdXMjnPjxulqV9bAIjA5PdtsJRF
	 bkkJjCor00KOuLH8e2/uPQZpY0GxpDnRPYJl1nal3oObv+zdx67FFeP1WpBM3PT/wP
	 UpkpViIoAvdnhOttHIVvP95NQIWAPk6RdUpHbgraHqkuhSU8sPL+5XIGdSB0VnhKjh
	 vFyfXteQdJhgA==
Date: Wed, 17 Sep 2025 20:20:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com,
	mturquette@baylibre.com, sboyd@kernel.org, alim.akhtar@samsung.com,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, ksk4725@coasia.com,
	smn1196@coasia.com, linux-arm-kernel@axis.com, krzk@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: Re: [PATCH 5/7] dt-bindings: arm: axis: Add ARTPEC-9 alfred board
Message-ID: <20250917-underrate-blurb-cd6a9aee014d@spud>
References: <20250917085005.89819-1-ravi.patel@samsung.com>
 <CGME20250917085045epcas5p2905ed7f307ca892997e14c33ad68f9fa@epcas5p2.samsung.com>
 <20250917085005.89819-6-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+jcr3yw54Dfe8FJr"
Content-Disposition: inline
In-Reply-To: <20250917085005.89819-6-ravi.patel@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_122104_562490_13BA0BA9 
X-CRM114-Status: UNSURE (   6.61  )
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


--+jcr3yw54Dfe8FJr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--+jcr3yw54Dfe8FJr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsKFgAKCRB4tDGHoIJi
0hWoAQCXo+6cPmdH6YWPs9PyzigkwJ60BhAPlINjCbIJTksefwD/VzsJGao/I5xz
PPOC4KGvroyyyWVXBtRiAJbuIIL+nwA=
=76fH
-----END PGP SIGNATURE-----

--+jcr3yw54Dfe8FJr--

