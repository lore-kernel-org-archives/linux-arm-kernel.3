Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE03DCDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 16:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtzma8Eb9XfPXbe2dBVNBlyo14y6UPFgmAl2YrolG6A=; b=lLutqv+wfKRXNHhKBy+/SZY1kw
	qu1TWeaSjlLiL25avjLsJ84z5fthSPio5KUrs+uPlNU138qmgFKiH5+VeW4+K/9FMIY21/aj5K9ho
	+cuetX1EkItxewpRgcGMU4KfotWvWv+wvGlEDPuN+0kt+ZkpuN9WJv8mBBKQFp+yZbwAB2v+krdWd
	EU1VwkFQZHSvbw5XYC3dPNRlP9VT6+W8k012Gci3RPTXFDurE8TyeS+qZwjLTYJqqP1EfBmCJhb7c
	HFnx/Ns35mobcfENfrHwdvuC2r4h03PeqJjbTVV6gNCZrHcDzIRKaWe4jRSE2TFQ/7s7oStrZZECB
	ssfR22pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQcM-0000000879C-26Q8;
	Wed, 24 Jun 2026 16:38:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQcL-0000000878u-1afC;
	Wed, 24 Jun 2026 16:38:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 95199600FC;
	Wed, 24 Jun 2026 16:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D401F000E9;
	Wed, 24 Jun 2026 16:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782319104;
	bh=jtzma8Eb9XfPXbe2dBVNBlyo14y6UPFgmAl2YrolG6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M3+RMsXGxy9MfIN0styqm9nexv+nQcmVqezf5Mq+kMqmlynqSMWHpA8iazkIcp0pr
	 aeq/06oG4bOll5SXL/2oC9FfBZ4UY3iw+nqT41ox5bRL47TVGXctOVlzbJDza0HMa3
	 x9LPeUutiql+nvga5HEbwQs2VPOWiCZceecpy4v6AoNvKhSRp0W2yLdSTmCbFumebP
	 Dsx6HvuJbJSHZC9JwYUy0wfs1bLE67IRxRhHvlVWPE9JSL3zu7iCxrgCBr/HnLwic9
	 12cGMZR13B+PVEwnPEBBYaQdxXG28TjvHgTTbz+AZOtJ/rOBRT7ABYISczq3ZNUcXX
	 uwaa2ReysnKjw==
Date: Wed, 24 Jun 2026 17:38:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Yanan He <grumpycat921013@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Wu <david.wu@rock-chips.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/7] dt-bindings: vendor-prefixes: add alientek
Message-ID: <20260624-delicate-enlarged-3e4660bfcdde@spud>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
 <20260624-rv1126-alientek-dlrv1126-v1-1-5aef608a3f64@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VpyKwcKucZTGoFI6"
Content-Disposition: inline
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-1-5aef608a3f64@gmail.com>
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


--VpyKwcKucZTGoFI6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--VpyKwcKucZTGoFI6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajwH+gAKCRB4tDGHoIJi
0kWYAP4/aniXHpvabONsZUDIHprRVCgKdh+sVH35m94DxiuShAD8Djb6y9Q/yDl9
DzbdhdO2NLTp0CXnWQgslx556IuVlQA=
=Ptp6
-----END PGP SIGNATURE-----

--VpyKwcKucZTGoFI6--

