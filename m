Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1E8CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2jINvzcEowHYXUQtyByG0BLnrpPSoNJ9KYOgYddVTI=; b=uY0EbVDi30sHpVTie23ksubrum
	1E9p6F7Oe6+rVtezsS8Oe1ZJMujEYoM81r3CStYr7RXtPkQDsX28II3hVBONotTbIc9GILpz5VgOc
	qnQmNOXi2u7mM7MO1JTjYnFyhXW4hL4p/cSK1fnlXo3pbR6l84I0cpEpeIpMy540o/RIdOTdCQpHg
	VCfFA311cJD738MM3eQplxq0azYoEYnVw5aiEPTGu6KqUV+LPldktQdjnsAWUjKJCAtX8pZ6aJebM
	cPtXNX4/C0xVuSyBAfxnNggm7L9j+4tDXKGeB6+1uM3aWxEl51oW3yDgrpopZQxbKQYGp8pQNjnhP
	A0l/mp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtXE-0000000ET2F-0hUC;
	Mon, 20 Oct 2025 17:19:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtXD-0000000ET1x-1ex3;
	Mon, 20 Oct 2025 17:19:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD4C2620CB;
	Mon, 20 Oct 2025 17:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559C4C4CEF9;
	Mon, 20 Oct 2025 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980742;
	bh=d2jINvzcEowHYXUQtyByG0BLnrpPSoNJ9KYOgYddVTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSfz08NsopoJBlCTowu9oCXd//s4JDWGOFYx3omXLXJefUl1UzZL5Mj0T1IQc2mhg
	 vjerZuHSwJ2gZUmIvMwly4gwcb3GG8PvnLIeOQFv5UMVnBSWDQPQkl7Ceaoy1/zUim
	 EHm/rD/S4Y36etd0uOEnCn7OZDn1ydWG/SzOlX6bnpkc6qmIht7vX8MBqL0csrtdsr
	 rzSnz+qwouug/Z1RNrXtIL9Uj9l1WNPC/Q8uQtDFY0pe3+v2UFcdNTL8g887y9APim
	 Kj0wJCYBA3qdka/oR7GbS4x8E2y+i2znYcmB7Q/42VhGaW+jEYL4Q9VAIiYCvQfFJ9
	 q17inbhmJaWZg==
Date: Mon, 20 Oct 2025 18:18:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, quentin.schulz@cherry.de,
	andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	cn.liweihao@gmail.com, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 1/9] dt-bindings: display: rockchip: dw-hdmi: Add
 compatible for RK3368 HDMI
Message-ID: <20251020-showcase-crayon-660e4f67881a@spud>
References: <20251020082508.3636511-1-heiko@sntech.de>
 <20251020082508.3636511-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7YQcMoFn8RBCI1lI"
Content-Disposition: inline
In-Reply-To: <20251020082508.3636511-2-heiko@sntech.de>
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


--7YQcMoFn8RBCI1lI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--7YQcMoFn8RBCI1lI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZvAAAKCRB4tDGHoIJi
0gdnAP9UKaGnCPV2zaldvnd211nAHuvWh9YTAsetUvI6810yKwEAvc3hLDjMN6Zn
5Mim/845bWOoq9O19ETLpIYckAc7uAE=
=7vaE
-----END PGP SIGNATURE-----

--7YQcMoFn8RBCI1lI--

