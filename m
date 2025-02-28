Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A15C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZI9rjd7uFt389AwkuF5r2/izRTAFMFoplFVfmfKAC0=; b=D07dF9Kt8dmECIqoqvWx6YllwS
	9XUm5RknaHHzUoYiuXUP3Pgw4rNWulXpFhNWGPBsYMRcPI/M6+vh4qVJV3wSYCU2aS3yWgyq0IGPn
	JmvS84QTyE/ZhSPkDsThBrV/zFhO/GTokHwqlJNQBmcevixu/95Fm2CWh0z+qidfXIAyaSGacbCEG
	GiGe70QuhboX61TjPJY0VHyOptz6038dtNhV+Qe8q3tb2cywoyVKol6NOC9hcpZxPmSRreUSQiNyt
	Uajx8Qc6znkPyI2sfZhrys7O2LWwBhWsRYxzrSS8FpJ9esimXu6eISM9KP00Xzd1fE7hgEAMM31UO
	0t+/bWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5Vy-0000000CFtJ-1O4M;
	Fri, 28 Feb 2025 18:55:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5Gm-0000000CBmT-0LVq;
	Fri, 28 Feb 2025 18:39:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5BB65C691A;
	Fri, 28 Feb 2025 18:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00130C4CED6;
	Fri, 28 Feb 2025 18:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740767971;
	bh=zZI9rjd7uFt389AwkuF5r2/izRTAFMFoplFVfmfKAC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvpNiSROll1L4yzr7VWtKDBpdU7IF01alBfp/v31DyoYWBZ69PbUkgIbvF9XuuHAi
	 R+ubejEHutBJILnjI+PewG8FaNFZybdFXMQCcGH3QFHkBkAtLtcFsNL2ko9CZWSYTY
	 o64HDFIiyBUHWNPC5sS358ZNYGvHkUr6PL5+conUt2fUXAHE9tuUc/Lv7c77axstu/
	 loVQJ5wxspxtfX8Ije4MpYaA9HfajEynEMeebg+6j6qXHkSCKM70g6W9NXePWgiv2i
	 5Lpvloh1c7r6M+dI0JxiUEeG0UOKLYKrI9vDqoXAy7wSKuojG5GRKkft5mAYmmgqDX
	 hYnGBERcDu2JA==
Date: Fri, 28 Feb 2025 18:39:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: pinctrl: Add pinctrl support for RK3528
Message-ID: <20250228-emote-phonics-4337256dcd01@spud>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
 <20250228064024.3200000-3-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+XM8zBTCiCN/RDO6"
Content-Disposition: inline
In-Reply-To: <20250228064024.3200000-3-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_103932_161098_2AEFE15C 
X-CRM114-Status: UNSURE (   7.69  )
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


--+XM8zBTCiCN/RDO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--+XM8zBTCiCN/RDO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8IC3gAKCRB4tDGHoIJi
0oF6AQD04gkxbT5D/tutvF48f6Ph5soAOs7BZjA42GTVsU5hEwD+PXfXiY8H6ff1
M+6/WjcD4+qAvoHAVXSblGC4qoCm5AM=
=Id+X
-----END PGP SIGNATURE-----

--+XM8zBTCiCN/RDO6--

