Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42109CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 17:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piPFu+cMpmpbBtwW/KgBv/3Pl9j2EwCCE9vhSTtvT+c=; b=qZidwT47bNJt+PIwlIGzME6XAn
	INfUKdf96pufVIuf7hMgM/onPuOqUXKaU86q4QLpokM1RbcUtrxZq172XYwF071qfRM3oBzaHCXfz
	5ftog9ckNXdD+KurupPtvImIbhq7Oz+e+ytWtnjgsFIHcHjeAtDPtVZY5dW4e9Xet/6mVgvTfGHY+
	F+jXTMnsZ/8TO8Uhyzm3rkIHBaUXCe6OIxz5Q+1Gpav1lVDm5kmSWw6jP0wxL+toBPdkFGTYCYvk3
	TicIdI5s2ee44OHd2QSzE5g++WXSx1OzpD7KcASRuUF9Ie7qxonWF65DSlzObnaUDll5k7J1LT3fX
	2K+YH3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzemY-00000003eYM-1KJM;
	Fri, 19 Sep 2025 17:20:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzemW-00000003eXn-19qk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 17:20:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D043543A63;
	Fri, 19 Sep 2025 17:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B395DC4CEF0;
	Fri, 19 Sep 2025 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758302423;
	bh=piPFu+cMpmpbBtwW/KgBv/3Pl9j2EwCCE9vhSTtvT+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AlnVEepWxHalo5mDInuATYumccjTzTky/qELxnGG3oDJtRmuG0tAZx6+2TY5uaTeR
	 0arw3OcYJX3p7w6obN0kQfqfGEf+L/PGII+JBvFvcgltm37vVFg2nDK/7B1oow+CZx
	 BwWveWIHGZ0fOoBIdhrYr8m1zC6u24Ry5M4GmEUmgQgJzuoeFkxUiML05VCgwYsKQH
	 LaAw2AeKQ/TnJRqX76G7GDJXPEESetpw2DnaeC+wQZILuQ2EseTfTbSOnkOkNAq4Cx
	 a+P1FJk5dMaNN72lKt+yC10+A8N+s3BwCCg3MBBKKgRJzTR36DF/QmKbMbZ3UPxHgF
	 1dUwO+TNAOKng==
Date: Fri, 19 Sep 2025 18:20:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Marc Olberding <molberding@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add Nvidia msx4 board
Message-ID: <20250919-retrace-lego-31dde220b234@spud>
References: <20250918-msx1_devicetree-v1-0-18dc07e02118@nvidia.com>
 <20250918-msx1_devicetree-v1-1-18dc07e02118@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R02dLCybvaecFiaK"
Content-Disposition: inline
In-Reply-To: <20250918-msx1_devicetree-v1-1-18dc07e02118@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_102024_327873_6F80D88B 
X-CRM114-Status: UNSURE (   7.59  )
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


--R02dLCybvaecFiaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--R02dLCybvaecFiaK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaM2Q0wAKCRB4tDGHoIJi
0tVwAQCtT8kAmJaiRiYCHAZ9+okhbpCV4iRU7npKt8xpiaaAGgD9FrWGFrB4qeYy
Lww4rVJvvHOciqSTshRRzKcBT66riwM=
=CCD4
-----END PGP SIGNATURE-----

--R02dLCybvaecFiaK--

